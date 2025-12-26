import 'dotenv/config';
import db from '../utils/db.js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function runMigration() {
    try {
        console.log('🚀 Starting database migration...\n');

        // Read migration file
        const migrationPath = path.join(__dirname, '../migrations/001_add_missing_tables.sql');
        const sql = fs.readFileSync(migrationPath, 'utf8');

        console.log('📄 Migration file: 001_add_missing_tables.sql');
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

        // Confirm before running
        console.log('⚠️  This will modify your database structure.');
        console.log('📝 The migration will:');
        console.log('   • Add new columns to users and products tables');
        console.log('   • Create 6 new tables (product_images, product_desc_updates, etc.)');
        console.log('   • Create indexes for better performance');
        console.log('   • Create triggers for auto-update fields');
        console.log('   • Insert default system config\n');

        // Execute migration
        console.log('⏳ Executing migration...\n');
        
        await db.raw(sql);

        console.log('✅ Migration completed successfully!\n');
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        console.log('📊 New tables added:');
        console.log('   ✓ product_images');
        console.log('   ✓ product_desc_updates');
        console.log('   ✓ product_bans');
        console.log('   ✓ transactions');
        console.log('   ✓ messages');
        console.log('   ✓ system_config');
        console.log('\n💡 Run "node scripts/inspect-db.js" to verify changes\n');

        process.exit(0);
    } catch (error) {
        console.error('\n❌ Migration failed!');
        console.error(`Error: ${error.message}\n`);
        
        if (error.message.includes('already exists')) {
            console.log('💡 Tip: Some tables/columns may already exist. This is normal.');
            console.log('   The migration uses "IF NOT EXISTS" so it\'s safe to run multiple times.\n');
        }
        
        process.exit(1);
    }
}

runMigration();
