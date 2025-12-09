import fs from 'fs';
import path from 'path';

const sourceDir = './raw_images'; 

const destDir = './static/imgs/sp'; 

if (!fs.existsSync(destDir)){
    fs.mkdirSync(destDir, { recursive: true });
}

const TOTAL_IMAGES = 80;
const IMAGES_PER_PRODUCT = 4;

async function organize() {
    console.log("Bắt đầu sắp xếp ảnh...");

    let currentImageIndex = 1;

    for (let productId = 1; productId <= (TOTAL_IMAGES / IMAGES_PER_PRODUCT); productId++) {
        
        const productFolder = path.join(destDir, String(productId));
        if (!fs.existsSync(productFolder)) {
            fs.mkdirSync(productFolder);
        }

        for (let j = 0; j < IMAGES_PER_PRODUCT; j++) {
            
            const srcFile = `${currentImageIndex}.jpg`;
            const srcPath = path.join(sourceDir, srcFile);

            let newFileName = '';
            if (j === 0) {
                newFileName = 'main_thumbs.jpg';
            } else {
                newFileName = `${j}.jpg`; 
            }

            const destPath = path.join(productFolder, newFileName);

            // c. Copy file
            try {
                if (fs.existsSync(srcPath)) {
                    fs.copyFileSync(srcPath, destPath);
                    console.log(`✅ [Product ${productId}] Moved ${srcFile} -> ${newFileName}`);
                } else {
                    console.error(`❌ Không tìm thấy file gốc: ${srcFile}`);
                }
            } catch (err) {
                console.error(`Lỗi khi copy file ${srcFile}:`, err);
            }

            currentImageIndex++;
        }
    }
    console.log("=== HOÀN TẤT ===");
}

organize();