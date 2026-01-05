import db from '../utils/db.js';
import { processProductImage } from '../utils/image-processor.js';
import fs from 'fs/promises';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function migrateExistingImages() {
    console.log('[Migration] ================================================');
    console.log('[Migration] Starting image migration to WebP...');
    console.log('[Migration] ================================================\n');
    
    try {
        // Get all products with images
        const products = await db('products')
            .select('id')
            .where('status', '>=', 0)
            .orderBy('id', 'asc');
        
        console.log(`[Migration] Found ${products.length} products to process\n`);
        
        let successCount = 0;
        let skipCount = 0;
        let errorCount = 0;
        
        for (let i = 0; i < products.length; i++) {
            const product = products[i];
            const productDir = path.join(__dirname, '..', 'static', 'imgs', 'sp', String(product.id));
            
            console.log(`[${i + 1}/${products.length}] Processing product ${product.id}...`);
            
            try {
                // Check if directory exists
                try {
                    await fs.access(productDir);
                } catch {
                    console.log(`  ⚠️  Directory not found, skipping\n`);
                    skipCount++;
                    continue;
                }
                
                const files = await fs.readdir(productDir);
                const imageFiles = files.filter(f => 
                    /\.(jpg|jpeg|png)$/i.test(f) && !/-thumb|-medium/.test(f)
                );
                
                if (imageFiles.length === 0) {
                    console.log(`  ℹ️  No images found, skipping\n`);
                    skipCount++;
                    continue;
                }
                
                console.log(`  Found ${imageFiles.length} images`);
                
                let processedInProduct = 0;
                for (let j = 0; j < imageFiles.length; j++) {
                    const file = imageFiles[j];
                    const inputPath = path.join(productDir, file);
                    const isThumbnail = file.includes('main_thumbs');
                    
                    // Check if WebP already exists
                    const webpPath = inputPath.replace(/\.(jpg|jpeg|png)$/i, '.webp');
                    try {
                        await fs.access(webpPath);
                        console.log(`    ⏭️  ${file} already processed`);
                        continue;
                    } catch {
                        // WebP doesn't exist, process it
                    }
                    
                    try {
                        // Copy original file first (as backup)
                        const backupPath = inputPath + '.original';
                        await fs.copyFile(inputPath, backupPath);
                        
                        // Process image
                        await processProductImage(inputPath, product.id, isThumbnail);
                        
                        // Remove backup
                        await fs.unlink(backupPath);
                        
                        console.log(`    ✅ Processed ${file}`);
                        processedInProduct++;
                    } catch (error) {
                        console.log(`    ❌ Failed to process ${file}: ${error.message}`);
                        
                        // Restore from backup if exists
                        const backupPath = inputPath + '.original';
                        try {
                            await fs.copyFile(backupPath, inputPath);
                            await fs.unlink(backupPath);
                        } catch {}
                    }
                }
                
                if (processedInProduct > 0) {
                    successCount++;
                    console.log(`  ✓ Product ${product.id} completed (${processedInProduct} images)\n`);
                } else {
                    skipCount++;
                    console.log(`  ⏭️  Product ${product.id} skipped (all images already processed)\n`);
                }
                
            } catch (error) {
                console.error(`  ❌ Error processing product ${product.id}: ${error.message}\n`);
                errorCount++;
            }
        }
        
        console.log('\n[Migration] ================================================');
        console.log('[Migration] Migration Summary:');
        console.log('[Migration] ================================================');
        console.log(`[Migration] ✅ Successfully processed: ${successCount} products`);
        console.log(`[Migration] ⏭️  Skipped: ${skipCount} products`);
        console.log(`[Migration] ❌ Errors: ${errorCount} products`);
        console.log('[Migration] ================================================\n');
        
        console.log('[Migration] ✨ Image migration completed!');
        
    } catch (error) {
        console.error('[Migration] ❌ Fatal error:', error);
    }
    
    process.exit(0);
}

// Run migration
migrateExistingImages();
