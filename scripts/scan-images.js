/**
 * Quick Image Scanner
 * Scans product image directories without database access
 */

import fs from 'fs/promises';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const PRODUCT_IMAGES_DIR = path.join(__dirname, '../static/imgs/sp');

/**
 * Get directory size recursively
 */
async function getDirectorySize(dirPath) {
    let totalSize = 0;
    
    try {
        const entries = await fs.readdir(dirPath, { withFileTypes: true });
        
        for (const entry of entries) {
            const fullPath = path.join(dirPath, entry.name);
            
            if (entry.isDirectory()) {
                totalSize += await getDirectorySize(fullPath);
            } else {
                const stats = await fs.stat(fullPath);
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
    
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
}

/**
 * Scan all product image directories
 */
async function scanImageDirectories() {
    console.log('🖼️  PRODUCT IMAGE SCANNER\n');
    console.log('📁 Scanning:', PRODUCT_IMAGES_DIR);
    console.log('─'.repeat(80));
    
    try {
        // Check if directory exists
        try {
            await fs.access(PRODUCT_IMAGES_DIR);
        } catch {
            console.log('❌ Directory does not exist:', PRODUCT_IMAGES_DIR);
            return;
        }
        
        // Read all directories
        const entries = await fs.readdir(PRODUCT_IMAGES_DIR, { withFileTypes: true });
        const directories = entries.filter(e => e.isDirectory());
        
        console.log(`\n📊 Found ${directories.length} product image directories\n`);
        
        let totalSize = 0;
        const dirDetails = [];
        
        // Scan each directory
        for (const dir of directories) {
            const productId = dir.name;
            const dirPath = path.join(PRODUCT_IMAGES_DIR, productId);
            
            try {
                const size = await getDirectorySize(dirPath);
                const files = await fs.readdir(dirPath);
                
                totalSize += size;
                dirDetails.push({
                    id: productId,
                    files: files.length,
                    size: size,
                    sizeFormatted: formatBytes(size)
                });
            } catch (error) {
                console.error(`Error scanning ${productId}:`, error.message);
            }
        }
        
        // Sort by size (largest first)
        dirDetails.sort((a, b) => b.size - a.size);
        
        // Print table
        console.log('┌─────────────┬────────────┬──────────────┐');
        console.log('│  Product ID │   Files    │     Size     │');
        console.log('├─────────────┼────────────┼──────────────┤');
        
        for (const dir of dirDetails) {
            const id = dir.id.padEnd(11);
            const files = dir.files.toString().padStart(10);
            const size = dir.sizeFormatted.padStart(12);
            console.log(`│  ${id} │ ${files} │ ${size} │`);
        }
        
        console.log('└─────────────┴────────────┴──────────────┘');
        
        // Print summary
        console.log('\n📊 SUMMARY:');
        console.log(`   Total directories: ${directories.length}`);
        console.log(`   Total disk space:  ${formatBytes(totalSize)}`);
        console.log(`   Average per dir:   ${formatBytes(totalSize / directories.length)}`);
        
        // Identify potential issues
        console.log('\n🔍 ANALYSIS:');
        
        const emptyDirs = dirDetails.filter(d => d.files === 0);
        if (emptyDirs.length > 0) {
            console.log(`   ⚠️  ${emptyDirs.length} empty directories found`);
        }
        
        const largeDirs = dirDetails.filter(d => d.size > 10 * 1024 * 1024); // > 10MB
        if (largeDirs.length > 0) {
            console.log(`   📦 ${largeDirs.length} directories larger than 10MB`);
        }
        
        const smallDirs = dirDetails.filter(d => d.size < 100 * 1024); // < 100KB
        if (smallDirs.length > 0) {
            console.log(`   📄 ${smallDirs.length} directories smaller than 100KB`);
        }
        
        console.log('\n💡 TIP:');
        console.log('   To clean up orphaned images (products not in database):');
        console.log('   1. Stop the server (Ctrl+C)');
        console.log('   2. Run: node scripts/cleanup-images.js');
        console.log('   3. Run: node scripts/cleanup-images.js --delete (to actually delete)');
        
    } catch (error) {
        console.error('❌ Error:', error.message);
    }
}

// Run scanner
scanImageDirectories();
