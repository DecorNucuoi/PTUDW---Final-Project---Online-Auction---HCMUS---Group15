import 'dotenv/config';
import db from './utils/db.js';
import fs from 'fs';
import path from 'path';

async function runMigration() {
    try {
        const sqlPath = path.join(process.cwd(), 'migrations', '001_add_missing_tables.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        // Split by command or just run full block? 
        // Knex.raw might handle multiple statements if configured, but let's try.
        // Postgres driver usually allows multiple statements.

        console.log('Running migration...');
        await db.raw(sql);
        console.log('Migration completed successfully!');

    } catch (err) {
        console.error('Migration failed:', err);
    } finally {
        await db.destroy();
        process.exit();
    }
}

runMigration();
