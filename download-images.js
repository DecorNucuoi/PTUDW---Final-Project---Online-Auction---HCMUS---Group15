import fs from 'fs';
import path from 'path';
import axios from 'axios';
import { fileURLToPath } from 'url';

// Cấu hình thư mục lưu ảnh
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const outputDir = path.join(__dirname, 'static', 'imgs', 'sp');

// Tạo thư mục nếu chưa có
if (!fs.existsSync(outputDir)){
    fs.mkdirSync(outputDir, { recursive: true });
}

// Số lượng ảnh cần tải
const TOTAL_IMAGES = 80;

const downloadImage = async (index) => {
    // Dùng loremflickr để lấy ảnh chủ đề 'technics' (công nghệ/sản phẩm)
    // Mỗi lần gọi nó sẽ random ra 1 ảnh khác nhau
    const url = `https://loremflickr.com/640/480/technics,fashion,watch?random=${index}`;
    const filePath = path.join(outputDir, `${index}.jpg`);

    const writer = fs.createWriteStream(filePath);

    try {
        const response = await axios({
            url,
            method: 'GET',
            responseType: 'stream'
        });

        response.data.pipe(writer);

        return new Promise((resolve, reject) => {
            writer.on('finish', resolve);
            writer.on('error', reject);
        });
    } catch (error) {
        console.error(`Lỗi tải ảnh số ${index}:`, error.message);
    }
};

async function main() {
    console.log(`Đang bắt đầu tải ${TOTAL_IMAGES} ảnh vào thư mục: ${outputDir}`);
    
    for (let i = 1; i <= TOTAL_IMAGES; i++) {
        await downloadImage(i);
        console.log(`-> Đã tải xong: ${i}.jpg`);
    }
    
    console.log("=== HOÀN TẤT! ===");
}

main();