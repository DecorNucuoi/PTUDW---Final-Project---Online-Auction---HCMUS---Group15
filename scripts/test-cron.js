import 'dotenv/config';
import db from '../utils/db.js';
import * as emailService from '../services/email.service.js';

// Test cron job manually
async function testCronJob() {
  try {
    const now = new Date();
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log('🔍 TESTING CRON JOB - AUCTION ENDING');
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log('Time:', now.toISOString());
    console.log('');
    
    // Find all active products where end_time has passed
    const expiredProducts = await db('products')
      .leftJoin('users as winner', 'products.winner_id', 'winner.id')
      .leftJoin('users as seller', 'products.seller_id', 'seller.id')
      .where('products.status', 1)
      .where('products.end_time', '<', now)
      .select(
        'products.id', 
        'products.name', 
        'products.winner_id', 
        'products.seller_id',
        'products.current_price',
        'products.start_price',
        'winner.email as winner_email',
        'winner.full_name as winner_name',
        'seller.email as seller_email',
        'seller.full_name as seller_name'
      );
    
    console.log(`📦 Found ${expiredProducts.length} expired auction(s)\n`);
    
    if (expiredProducts.length === 0) {
      console.log('⚠️  No expired products to process.');
      console.log('\n💡 TIP: To test, manually update a product:');
      console.log('   UPDATE products SET end_time = NOW() - INTERVAL \'1 minute\', status = 1 WHERE id = <product_id>;\n');
    } else {
      for (const product of expiredProducts) {
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        console.log(`📦 Product #${product.id}: ${product.name}`);
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        
        if (product.winner_id) {
          console.log(`✓ Winner: ${product.winner_name} (${product.winner_email})`);
          console.log(`✓ Final Price: ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.current_price)}`);
        } else {
          console.log('✗ No winner (no bids)');
          console.log(`  Start Price: ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.start_price)}`);
        }
        
        console.log(`✓ Seller: ${product.seller_name} (${product.seller_email})`);
        console.log('');
        
        // Update product status to ended
        await db('products')
          .where('id', product.id)
          .update({
            status: 2
          });
        console.log('✓ Status updated to 2 (ENDED)');
        
        // Prepare winner and seller objects
        const winner = product.winner_id ? {
          id: product.winner_id,
          email: product.winner_email,
          full_name: product.winner_name
        } : null;
        
        const seller = {
          id: product.seller_id,
          email: product.seller_email,
          full_name: product.seller_name
        };
        
        // Send emails using email service
        console.log('\n📧 Sending emails...');
        const emailResults = await emailService.processAuctionEnd(product, winner, seller);
        
        if (winner) {
          console.log(`  → Winner email: ${emailResults.winnerEmailSent ? '✓ Sent' : '✗ Failed'}`);
        }
        console.log(`  → Seller email: ${emailResults.sellerEmailSent ? '✓ Sent' : '✗ Failed'}`);
        
        console.log('\n✓ Processed auction #' + product.id);
        console.log('');
      }
    }
    
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log('✅ TEST COMPLETED');
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
    
  } catch (error) {
    console.error('\n❌ ERROR:', error.message);
    console.error(error);
  } finally {
    process.exit(0);
  }
}

testCronJob();
