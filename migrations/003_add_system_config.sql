-- Migration: Add system_config table
-- Date: 2025-12-20
-- Purpose: Store system-wide configuration parameters that admin can adjust

CREATE TABLE IF NOT EXISTS system_config (
    id SERIAL PRIMARY KEY,
    config_key VARCHAR(100) UNIQUE NOT NULL,
    config_value TEXT NOT NULL,
    description TEXT,
    data_type VARCHAR(20) DEFAULT 'string', -- 'string', 'number', 'boolean'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default configuration values
INSERT INTO system_config (config_key, config_value, description, data_type) VALUES
('rating_threshold_percent', '80', 'Minimum rating percentage required for bidders to participate (default: 80%)', 'number'),
('auto_extend_threshold_minutes', '5', 'Time threshold in minutes before auction end to trigger auto-extend (default: 5 minutes)', 'number'),
('auto_extend_duration_minutes', '10', 'Duration in minutes to extend auction when bid is placed near end (default: 10 minutes)', 'number'),
('max_bid_retries', '3', 'Maximum number of bid retries allowed per user per product', 'number'),
('session_timeout_hours', '24', 'User session timeout in hours', 'number'),
('max_upload_images', '10', 'Maximum number of images per product', 'number'),
('min_upload_images', '4', 'Minimum number of images required per product', 'number');

-- Trigger to auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION update_system_config_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_system_config_timestamp
BEFORE UPDATE ON system_config
FOR EACH ROW
EXECUTE FUNCTION update_system_config_timestamp();

-- Add index for faster lookups
CREATE INDEX IF NOT EXISTS idx_system_config_key ON system_config(config_key);

-- Comments for documentation
COMMENT ON TABLE system_config IS 'System-wide configuration parameters adjustable by administrators';
COMMENT ON COLUMN system_config.config_key IS 'Unique identifier for the configuration parameter';
COMMENT ON COLUMN system_config.config_value IS 'Value stored as text, will be parsed according to data_type';
COMMENT ON COLUMN system_config.data_type IS 'Data type for proper parsing: string, number, boolean';
