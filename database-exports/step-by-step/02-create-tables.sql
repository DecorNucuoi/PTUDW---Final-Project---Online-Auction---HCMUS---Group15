-- ============================================
-- BƯỚC 2: TẠO CÁC TABLES
-- ============================================

-- Table: bids
CREATE TABLE bids (
    id INTEGER NOT NULL DEFAULT nextval('bids_id_seq'::regclass),
    product_id INTEGER,
    bidder_id INTEGER,
    price BIGINT NOT NULL,
    max_price BIGINT,
    status INTEGER DEFAULT 1,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Table: categories
CREATE TABLE categories (
    id INTEGER NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
    name VARCHAR(255) NOT NULL,
    parent_id INTEGER
);

-- Table: messages
CREATE TABLE messages (
    id INTEGER NOT NULL DEFAULT nextval('messages_id_seq'::regclass),
    transaction_id INTEGER,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: product_bans
CREATE TABLE product_bans (
    product_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: product_desc_updates
CREATE TABLE product_desc_updates (
    id INTEGER NOT NULL DEFAULT nextval('product_desc_updates_id_seq'::regclass),
    product_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: product_images
CREATE TABLE product_images (
    id INTEGER NOT NULL DEFAULT nextval('product_images_id_seq'::regclass),
    product_id INTEGER NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    is_thumbnail BOOLEAN DEFAULT false,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: products
CREATE TABLE products (
    id INTEGER NOT NULL DEFAULT nextval('products_id_seq'::regclass),
    name VARCHAR(255) NOT NULL,
    seller_id INTEGER,
    category_id INTEGER,
    description TEXT,
    start_price BIGINT NOT NULL,
    step_price BIGINT NOT NULL,
    buy_now_price BIGINT,
    current_price BIGINT,
    end_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    status INTEGER DEFAULT 1,
    winner_id INTEGER,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
    allow_newbie BOOLEAN DEFAULT true,
    auto_extend BOOLEAN DEFAULT true,
    search_vector TSVECTOR
);

-- Table: questions
CREATE TABLE questions (
    id INTEGER NOT NULL DEFAULT nextval('questions_id_seq'::regclass),
    product_id INTEGER,
    user_id INTEGER,
    question TEXT NOT NULL,
    answer TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Table: ratings
CREATE TABLE ratings (
    id INTEGER NOT NULL DEFAULT nextval('ratings_id_seq'::regclass),
    product_id INTEGER,
    rater_id INTEGER,
    rated_user_id INTEGER,
    score INTEGER,
    comment TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Table: system_config
CREATE TABLE system_config (
    config_key VARCHAR(100) NOT NULL,
    config_value TEXT NOT NULL,
    description TEXT,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_by INTEGER
);

-- Table: transactions
CREATE TABLE transactions (
    id INTEGER NOT NULL DEFAULT nextval('transactions_id_seq'::regclass),
    product_id INTEGER NOT NULL,
    buyer_id INTEGER NOT NULL,
    seller_id INTEGER NOT NULL,
    final_price NUMERIC NOT NULL,
    status INTEGER DEFAULT 0,
    shipping_address TEXT,
    payment_proof TEXT,
    shipping_tracking TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: upgrade_requests
CREATE TABLE upgrade_requests (
    id INTEGER NOT NULL DEFAULT nextval('upgrade_requests_id_seq'::regclass),
    user_id INTEGER,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
    status INTEGER DEFAULT 0
);

-- Table: users
CREATE TABLE users (
    id INTEGER NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    role INTEGER DEFAULT 0,
    address TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
    otp VARCHAR(10),
    otp_expired TIMESTAMP WITHOUT TIME ZONE,
    is_verified BOOLEAN DEFAULT false,
    dob DATE,
    rating_score DOUBLE PRECISION DEFAULT 0,
    rating_count INTEGER DEFAULT 0
);

-- Table: watchlists
CREATE TABLE watchlists (
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL
);
