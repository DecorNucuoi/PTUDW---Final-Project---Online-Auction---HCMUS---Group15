import 'dotenv/config';
import db from './db.js';

async function createTable() {
    try {
        const exists = await db.schema.hasTable('chats');
        if (!exists) {
            await db.schema.createTable('chats', function (table) {
                table.increments('id');
                table.integer('sender_id').notNullable();
                table.integer('receiver_id').notNullable();
                table.text('message').notNullable();
                table.timestamp('created_at').defaultTo(db.fn.now());
                // Foreign keys usually optional in loose projects but good to have
                // Removing strict foreign keys to avoid issues if users deleted
            });
            console.log('Chats table created successfully');
        } else {
            console.log('Chats table already exists');
        }
    } catch (err) {
        console.error('Error creating chats table:', err);
    } finally {
        process.exit();
    }
}

createTable();
