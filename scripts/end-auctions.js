// Script to automatically end auctions and set winners
import db from '../utils/db.js';

async function endExpiredAuctions() {
    try {
        console.log('Checking for expired auctions...');
        
        const now = new Date();
        
        // Find all active products (status=1) where end_time has passed
        const expiredProducts = await db('products')
            .where('status', 1)
            .where('end_time', '<', now)
            .select('id', 'name', 'winner_id', 'current_price');
        
        if (expiredProducts.length === 0) {
            console.log('No expired auctions found.');
            return;
        }
        
        console.log(`Found ${expiredProducts.length} expired auction(s). Processing...`);
        
        for (const product of expiredProducts) {
            await db('products')
                .where('id', product.id)
                .update({
                    status: 2, // Mark as ended
                    updated_at: now
                });
            
            if (product.winner_id) {
                console.log(`✓ Auction #${product.id} ended. Winner: User #${product.winner_id} with price ${product.current_price}`);
            } else {
                console.log(`✓ Auction #${product.id} ended. No bids received.`);
            }
        }
        
        console.log('Auction ending process completed!');
    } catch (error) {
        console.error('Error ending auctions:', error);
    }
}

// Run immediately
endExpiredAuctions().then(() => {
    console.log('Script finished.');
    process.exit(0);
}).catch(err => {
    console.error('Script error:', err);
    process.exit(1);
});
