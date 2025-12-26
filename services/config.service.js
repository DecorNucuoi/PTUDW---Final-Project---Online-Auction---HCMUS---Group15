// services/config.service.js
import db from '../utils/db.js';

/**
 * System Configuration Service
 * Manages system-wide configuration parameters
 */

// ============================================
// GET CONFIGURATION VALUES
// ============================================

/**
 * Get all system configurations
 * @returns {Promise<Array>} All config entries
 */
export async function getAll() {
    return await db('system_config')
        .select('*')
        .orderBy('config_key', 'asc');
}

/**
 * Get a specific config value by key
 * @param {string} key - Config key
 * @returns {Promise<any>} Parsed config value
 */
export async function get(key) {
    const config = await db('system_config')
        .where('config_key', key)
        .first();
    
    if (!config) return null;
    
    // Parse value based on data_type
    return parseConfigValue(config.config_value, config.data_type);
}

/**
 * Get multiple config values by keys
 * @param {Array<string>} keys - Array of config keys
 * @returns {Promise<Object>} Object with key-value pairs
 */
export async function getMultiple(keys) {
    const configs = await db('system_config')
        .whereIn('config_key', keys);
    
    const result = {};
    configs.forEach(config => {
        result[config.config_key] = parseConfigValue(config.config_value, config.data_type);
    });
    
    return result;
}

/**
 * Get all configs as key-value object
 * @returns {Promise<Object>} Object with all configs
 */
export async function getAllAsObject() {
    const configs = await db('system_config').select('*');
    
    const result = {};
    configs.forEach(config => {
        result[config.config_key] = {
            value: parseConfigValue(config.config_value, config.data_type),
            description: config.description,
            data_type: config.data_type
        };
    });
    
    return result;
}

// ============================================
// UPDATE CONFIGURATION
// ============================================

/**
 * Update a configuration value
 * @param {string} key - Config key
 * @param {any} value - New value
 * @returns {Promise<number>} Number of rows updated
 */
export async function update(key, value) {
    // Convert value to string for storage
    const stringValue = String(value);
    
    return await db('system_config')
        .where('config_key', key)
        .update({
            config_value: stringValue,
            updated_at: new Date()
        });
}

/**
 * Update multiple configurations at once
 * @param {Object} updates - Object with key-value pairs to update
 * @returns {Promise<number>} Total number of rows updated
 */
export async function updateMultiple(updates) {
    let totalUpdated = 0;
    
    for (const [key, value] of Object.entries(updates)) {
        const updated = await update(key, value);
        totalUpdated += updated;
    }
    
    return totalUpdated;
}

// ============================================
// HELPER FUNCTIONS
// ============================================

/**
 * Parse config value based on data type
 * @param {string} value - String value from database
 * @param {string} dataType - Data type (string, number, boolean)
 * @returns {any} Parsed value
 */
function parseConfigValue(value, dataType) {
    switch (dataType) {
        case 'number':
            return parseFloat(value);
        case 'boolean':
            return value.toLowerCase() === 'true';
        case 'string':
        default:
            return value;
    }
}

// ============================================
// SPECIFIC CONFIG GETTERS (Convenience)
// ============================================

/**
 * Get rating threshold percentage
 * @returns {Promise<number>} Rating threshold (default: 80)
 */
export async function getRatingThreshold() {
    const value = await get('rating_threshold_percent');
    return value !== null ? value : 80;
}

/**
 * Get auto-extend threshold in minutes
 * @returns {Promise<number>} Threshold minutes (default: 5)
 */
export async function getAutoExtendThreshold() {
    const value = await get('auto_extend_threshold_minutes');
    return value !== null ? value : 5;
}

/**
 * Get auto-extend duration in minutes
 * @returns {Promise<number>} Duration minutes (default: 10)
 */
export async function getAutoExtendDuration() {
    const value = await get('auto_extend_duration_minutes');
    return value !== null ? value : 10;
}

/**
 * Get minimum required images for product upload
 * @returns {Promise<number>} Minimum images (default: 4)
 */
export async function getMinUploadImages() {
    const value = await get('min_upload_images');
    return value !== null ? value : 4;
}

/**
 * Get maximum allowed images for product upload
 * @returns {Promise<number>} Maximum images (default: 10)
 */
export async function getMaxUploadImages() {
    const value = await get('max_upload_images');
    return value !== null ? value : 10;
}
