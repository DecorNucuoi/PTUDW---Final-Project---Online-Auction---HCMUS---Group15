/**
 * Query Product IDs from Database
 * Simple script to list all active product IDs
 */

import db from '../utils/db.js';

async function queryProductIds() {
    console.log('🗄️  QUERYING DATABASE\n');
    
    try {
        // Get all products with status 0 (draft), 1 (active), or 2 (ended)
        const products = await db('products')
            .whereIn('status', [0, 1, 2])
            .select('id', 'product_name', 'status')
            .orderBy('id');
        
        console.log(`📊 Found ${products.length} active products in database:\n`);
        
        const statusMap = {
            0: 'Draft',
            1: 'Active',
            2: 'Ended'
        };
        
        console.log('┌──────────┬─────────────────────────────────────────────┬──────────┐');
        console.log('│    ID    │               Product Name                 │  Status  │');
        console.log('├──────────┼─────────────────────────────────────────────┼──────────┤');
        
        for (const product of products) {
            const id = product.id.toString().padStart(8);
            const name = (product.product_name || 'Untitled').substring(0, 43).padEnd(43);
            const status = statusMap[product.status].padEnd(8);
            console.log(`│ ${id} │ ${name} │ ${status} │`);
        }
        
        console.log('└──────────┴─────────────────────────────────────────────┴──────────┘');
        
        // Extract just the IDs
        const productIds = products.map(p => p.id);
        console.log('\n📝 Product IDs:', productIds.join(', '));
        
        console.log('\n✅ Done!');
        
    } catch (error) {
        console.error('❌ Error:', error.message);
    } finally {
        await db.destroy();
        process.exit(0);
    }
}

queryProductIds();
