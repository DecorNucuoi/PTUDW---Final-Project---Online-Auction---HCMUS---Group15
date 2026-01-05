import knex from "knex";

export default knex({
  client: 'pg',
  connection: {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    ssl: { rejectUnauthorized: false }
  },
  pool: {
    min: 5,                      // Keep 5 connections ready (improved from 0)
    max: 30,                     // Scale up to 30 connections (improved from 10)
    acquireTimeoutMillis: 30000, // 30s timeout for acquiring connection
    idleTimeoutMillis: 600000,   // 10 min idle timeout before closing
    createTimeoutMillis: 10000,  // 10s timeout for creating new connection
    reapIntervalMillis: 1000,    // Check for idle connections every 1s
    createRetryIntervalMillis: 200, // Retry interval if connection creation fails
    propagateCreateError: false  // Don't crash on connection errors
  },
  // Query debugging in development
  debug: process.env.NODE_ENV === 'development',
  
  // Connection lifecycle events for monitoring
  log: {
    warn(message) {
      console.warn('[DB Pool Warning]', message);
    },
    error(message) {
      console.error('[DB Pool Error]', message);
    },
    deprecate(message) {
      console.warn('[DB Pool Deprecation]', message);
    }
  }
});
