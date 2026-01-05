import sharp from 'sharp';
import fs from 'fs/promises';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * Process uploaded image: resize, compress, generate WebP
 * @param {string} inputPath - Original image path
 * @param {number} productId - Product ID for directory
 * @param {boolean} isThumbnail - Is this the main thumbnail?
 * @returns {Promise<Object>} Processed image info
 */
export async function processProductImage(inputPath, productId, isThumbnail = false) {
    try {
        const productDir = path.join(__dirname, '..', 'static', 'imgs', 'sp', String(productId));
        
        // Create directory if not exists
        await fs.mkdir(productDir, { recursive: true });
        
        const ext = path.extname(inputPath);
        const filename = isThumbnail ? 'main_thumbs' : `img_${Date.now()}`;
        const baseOutputPath = path.join(productDir, filename);
        
        // Get original image metadata
        const metadata = await sharp(inputPath).metadata();
        console.log(`[Image] Processing ${metadata.width}x${metadata.height} ${metadata.format}`);
        
        // Generate multiple sizes
        const results = await Promise.all([
            // Thumbnail (200x200) - for list views
            sharp(inputPath)
                .resize(200, 200, {
                    fit: 'cover',
                    position: 'center'
                })
                .webp({ quality: 80 })
                .toFile(`${baseOutputPath}-thumb.webp`),
            
            // Medium (800x800) - for detail view
            sharp(inputPath)
                .resize(800, 800, {
                    fit: 'inside',
                    withoutEnlargement: true
                })
                .webp({ quality: 85 })
                .toFile(`${baseOutputPath}.webp`),
            
            // Original JPEG (compressed) - fallback
            sharp(inputPath)
                .resize(1200, 1200, {
                    fit: 'inside',
                    withoutEnlargement: true
                })
                .jpeg({ quality: 90 })
                .toFile(`${baseOutputPath}.jpg`)
        ]);
        
        // Delete original uploaded file
        try {
            await fs.unlink(inputPath);
        } catch (err) {
            console.warn('[Image] Could not delete original file:', err.message);
        }
        
        const sizesKB = {
            thumbnail: Math.round(results[0].size / 1024),
            medium: Math.round(results[1].size / 1024),
            original: Math.round(results[2].size / 1024)
        };
        
        console.log(`[Image] Generated: thumb ${sizesKB.thumbnail}KB, medium ${sizesKB.medium}KB, fallback ${sizesKB.original}KB`);
        
        return {
            thumbnail: `/static/imgs/sp/${productId}/${filename}-thumb.webp`,
            medium: `/static/imgs/sp/${productId}/${filename}.webp`,
            original: `/static/imgs/sp/${productId}/${filename}.jpg`,
            sizes: sizesKB
        };
    } catch (error) {
        console.error('[Image] Processing error:', error);
        throw error;
    }
}

/**
 * Batch process multiple images
 * @param {Array} files - Array of uploaded file objects
 * @param {number} productId - Product ID
 * @returns {Promise<Array>} Array of processed image info
 */
export async function processMultipleImages(files, productId) {
    const processedImages = [];
    
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const isThumbnail = i === 0; // First image is thumbnail
        
        try {
            console.log(`[Image] Processing ${i + 1}/${files.length}: ${file.originalname}`);
            const result = await processProductImage(file.path, productId, isThumbnail);
            processedImages.push({
                ...result,
                displayOrder: i,
                isThumbnail
            });
        } catch (error) {
            console.error(`[Image] Failed to process ${file.originalname}:`, error.message);
            // Continue with other images instead of failing completely
        }
    }
    
    return processedImages;
}

/**
 * Clean up product images
 * @param {number} productId - Product ID
 */
export async function deleteProductImages(productId) {
    const productDir = path.join(__dirname, '..', 'static', 'imgs', 'sp', String(productId));
    
    try {
        await fs.rm(productDir, { recursive: true, force: true });
        console.log(`[Image] Deleted images for product ${productId}`);
    } catch (error) {
        console.error(`[Image] Failed to delete images for product ${productId}:`, error.message);
    }
}

/**
 * Get image dimensions without loading full file
 * @param {string} imagePath - Path to image file
 * @returns {Promise<Object>} Image metadata
 */
export async function getImageInfo(imagePath) {
    try {
        const metadata = await sharp(imagePath).metadata();
        return {
            width: metadata.width,
            height: metadata.height,
            format: metadata.format,
            size: metadata.size,
            hasAlpha: metadata.hasAlpha
        };
    } catch (error) {
        console.error('[Image] Failed to get image info:', error);
        return null;
    }
}
