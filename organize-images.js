import fs from 'fs';
import path from 'path';

// 1. Cấu hình đường dẫn
// Nơi chứa 80 tấm ảnh gốc (1.jpg -> 80.jpg)
const sourceDir = './raw_images'; 

// Nơi muốn xuất ra (static/imgs/sp)
// Lưu ý: Sửa lại đường dẫn này cho đúng với cấu hình project của bạn (vd: ./public/imgs/sp hoặc ./static/imgs/sp)
const destDir = './static/imgs/sp'; 

// 2. Tạo thư mục đích nếu chưa có
if (!fs.existsSync(destDir)){
    fs.mkdirSync(destDir, { recursive: true });
}

// Tổng số ảnh và số ảnh mỗi folder
const TOTAL_IMAGES = 80;
const IMAGES_PER_PRODUCT = 4;

async function organize() {
    console.log("Bắt đầu sắp xếp ảnh...");

    // Loop qua từng sản phẩm (Tổng cộng 80 / 4 = 20 sản phẩm)
    // ID sản phẩm sẽ chạy từ 1, 2, 3...
    let currentImageIndex = 1; // Biến chạy để lấy ảnh từ 1.jpg đến 80.jpg

    for (let productId = 1; productId <= (TOTAL_IMAGES / IMAGES_PER_PRODUCT); productId++) {
        
        // a. Tạo folder cho sản phẩm: /sp/1, /sp/2...
        const productFolder = path.join(destDir, String(productId));
        if (!fs.existsSync(productFolder)) {
            fs.mkdirSync(productFolder);
        }

        // b. Xử lý 4 tấm ảnh cho sản phẩm này
        for (let j = 0; j < IMAGES_PER_PRODUCT; j++) {
            
            // Tên file gốc cần lấy (ví dụ: 1.jpg, 2.jpg...)
            const srcFile = `${currentImageIndex}.jpg`;
            const srcPath = path.join(sourceDir, srcFile);

            // Tên file mới
            // j = 0 -> main_thumbs.jpg
            // j = 1 -> 1.jpg
            // j = 2 -> 2.jpg
            // j = 3 -> 3.jpg
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

            // Tăng biến đếm để lần sau lấy ảnh tiếp theo
            currentImageIndex++;
        }
    }
    console.log("=== HOÀN TẤT ===");
}

organize();