/**
 * Image Cleanup Utility
 * Scans for orphaned product images and provides cleanup options
 */

import fs from 'fs/promises';
import path from 'path';
import knex from 'knex';
import dotenv from 'dotenv';

dotenv.config();

// Create isolated DB connection for scripts
const db = knex({
    client: 'pg',
    connection: {
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME,
        ssl: { rejectUnauthorized: false }
    },
    pool: {
        min: 0,
        max: 2,
        acquireTimeoutMillis: 10000,
        idleTimeoutMillis: 30000
    }
});

const PRODUCT_IMAGES_DIR = './static/imgs/sp';

/**
 * Scan all product directories and check if they have corresponding products in DB
 */
async function scanOrphanedImages() {
    console.log('🔍 Scanning for orphaned product images...\n');
    
    try {
        // Get all product IDs from database
        const activeProducts = await db('products')
            .select('id')
            .whereIn('status', [0, 1, 2]); // Active, bidding, ended
        
        const activeProductIds = new Set(activeProducts.map(p => p.id.toString()));
        console.log(`✅ Found ${activeProductIds.size} active products in database\n`);
        
        // Get all directories in sp/
        const entries = await fs.readdir(PRODUCT_IMAGES_DIR, { withFileTypes: true });
        const productDirs = entries.filter(e => e.isDirectory());
        
        console.log(`📁 Found ${productDirs.length} product directories on disk\n`);
        
        // Find orphaned directories
        const orphanedDirs = [];
        const activeDirs = [];
        let totalOrphanedSize = 0;
        
        for (const dir of productDirs) {
            const productId = dir.name;
            const dirPath = path.join(PRODUCT_IMAGES_DIR, productId);
            
            if (!activeProductIds.has(productId)) {
                // Calculate directory size
                const size = await getDirectorySize(dirPath);
                totalOrphanedSize += size;
                
                orphanedDirs.push({
                    id: productId,
                    path: dirPath,
                    size: size,
                    sizeFormatted: formatBytes(size)
                });
            } else {
                activeDirs.push(productId);
            }
        }
        
        // Print results
        console.log('=' .repeat(60));
        console.log('📊 SCAN RESULTS');
        console.log('=' .repeat(60));
        console.log(`✅ Active products with images: ${activeDirs.length}`);
        console.log(`❌ Orphaned directories (no product): ${orphanedDirs.length}`);
        console.log(`💾 Total orphaned size: ${formatBytes(totalOrphanedSize)}`);
        console.log('=' .repeat(60));
        
        if (orphanedDirs.length > 0) {
            console.log('\n🗑️  ORPHANED DIRECTORIES:\n');
            orphanedDirs.slice(0, 20).forEach(dir => {
                console.log(`  • Product ID ${dir.id} → ${dir.sizeFormatted}`);
            });
            
            if (orphanedDirs.length > 20) {
                console.log(`  ... and ${orphanedDirs.length - 20} more`);
            }
        }
        
        return {
            activeProducts: activeProductIds.size,
            activeDirs: activeDirs.length,
            orphanedDirs: orphanedDirs,
            totalOrphanedSize: totalOrphanedSize
        };
        
    } catch (error) {
        console.error('❌ Error scanning images:', error);
        throw error;
    }
}

/**
 * Get total size of a directory (recursive)
 */
async function getDirectorySize(dirPath) {
    let totalSize = 0;
    
    try {
        const entries = await fs.readdir(dirPath, { withFileTypes: true });
        
        for (const entry of entries) {
            const entryPath = path.join(dirPath, entry.name);
            
            if (entry.isDirectory()) {
                totalSize += await getDirectorySize(entryPath);
            } else {
                const stats = await fs.stat(entryPath);
                totalSize += stats.size;
            }
        }
    } catch (error) {
        console.error(`Error reading ${dirPath}:`, error.message);
    }
    
    return totalSize;
}

/**
 * Format bytes to human readable
 */
function formatBytes(bytes) {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
}

/**
 * Delete orphaned images (DANGEROUS - use with caution)
 */
async function deleteOrphanedImages(dryRun = true) {
    const scanResults = await scanOrphanedImages();
    
    if (scanResults.orphanedDirs.length === 0) {
        console.log('\n✅ No orphaned images to delete!');
        return;
    }
    
    console.log('\n' + '=' .repeat(60));
    
    if (dryRun) {
        console.log('🔒 DRY RUN MODE - No files will be deleted');
        console.log('=' .repeat(60));
        console.log(`\nWould delete ${scanResults.orphanedDirs.length} directories`);
        console.log(`Would free up: ${formatBytes(scanResults.totalOrphanedSize)}`);
        console.log('\n⚠️  To actually delete, run: node scripts/cleanup-images.js --delete');
    } else {
        console.log('🔥 DELETE MODE - Files will be permanently deleted!');
        console.log('=' .repeat(60));
        console.log(`\nDeleting ${scanResults.orphanedDirs.length} directories...`);
        
        let deletedCount = 0;
        for (const dir of scanResults.orphanedDirs) {
            try {
                await fs.rm(dir.path, { recursive: true, force: true });
                deletedCount++;
                console.log(`  ✓ Deleted: ${dir.id} (${dir.sizeFormatted})`);
            } catch (error) {
                console.error(`  ✗ Failed to delete ${dir.id}:`, error.message);
            }
        }
        
        console.log(`\n✅ Deleted ${deletedCount}/${scanResults.orphanedDirs.length} directories`);
        console.log(`💾 Freed up: ${formatBytes(scanResults.totalOrphanedSize)}`);
    }
}

/**
 * Find products with missing images
 */
async function findProductsWithMissingImages() {
    console.log('🔍 Checking for products with missing images...\n');
    
    try {
        const activeProducts = await db('products')
            .select('id', 'name', 'status')
            .whereIn('status', [0, 1, 2]);
        
        const missingImages = [];
        
        for (const product of activeProducts) {
            const productDir = path.join(PRODUCT_IMAGES_DIR, product.id.toString());
            
            try {
                await fs.access(productDir);
                // Directory exists, check for images
                const files = await fs.readdir(productDir);
                const imageFiles = files.filter(f => /\.(jpg|jpeg|png|webp)$/i.test(f));
                
                if (imageFiles.length === 0) {
                    missingImages.push({
                        id: product.id,
                        name: product.name,
                        status: product.status,
                        reason: 'No image files in directory'
                    });
                }
            } catch (error) {
                // Directory doesn't exist
                missingImages.push({
                    id: product.id,
                    name: product.name,
                    status: product.status,
                    reason: 'Directory not found'
                });
            }
        }
        
        console.log('=' .repeat(60));
        console.log(`⚠️  Found ${missingImages.length} products with missing images`);
        console.log('=' .repeat(60));
        
        if (missingImages.length > 0) {
            console.log('\n📋 PRODUCTS WITH MISSING IMAGES:\n');
            missingImages.forEach(p => {
                console.log(`  • ID ${p.id}: ${p.name}`);
                console.log(`    Reason: ${p.reason}\n`);
            });
        }
        
        return missingImages;
        
    } catch (error) {
        console.error('❌ Error:', error);
        throw error;
    }
}

/**
 * Main execution
 */
async function main() {
    const args = process.argv.slice(2);
    const command = args[0];
    
    console.log('🖼️  IMAGE CLEANUP UTILITY\n');
    
    try {
        if (command === '--delete') {
            await deleteOrphanedImages(false);
        } else if (command === '--missing') {
            await findProductsWithMissingImages();
        } else {
            // Default: scan only (dry run)
            await deleteOrphanedImages(true);
            console.log('\n📝 OTHER COMMANDS:');
            console.log('  node scripts/cleanup-images.js --delete   # Actually delete orphaned images');
            console.log('  node scripts/cleanup-images.js --missing  # Find products with missing images');
        }
        
        console.log('\n✅ Done!');
        await db.destroy();
        process.exit(0);
        
    } catch (error) {
        console.error('\n❌ Fatal error:', error);
        await db.destroy();
        process.exit(1);
    }
}

main();
