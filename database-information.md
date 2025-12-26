erDiagram
    %% ============================================
    %% USER MANAGEMENT
    %% ============================================

    users {
        int id PK
        string email UK
        string password
        string full_name
        text address
        date dob
        int role
        boolean is_verified
        string otp
        timestamp otp_expired
        float rating_score
        int rating_count
        timestamp created_at
    }

    upgrade_requests {
        int id PK
        int user_id FK
        int status
        timestamp created_at
    }

    %% ============================================
    %% CATEGORY & PRODUCT
    %% ============================================

    categories {
        int id PK
        string name
        int parent_id FK
    }

    products {
        int id PK
        string name
        text description
        bigint start_price
        bigint step_price
        bigint current_price
        bigint buy_now_price
        int category_id FK
        int seller_id FK
        int winner_id FK
        timestamp end_time
        int status
        boolean auto_extend
        boolean allow_newbie
        timestamp created_at
    }

    product_images {
        int id PK
        int product_id FK
        string image_url
        boolean is_thumbnail
        int display_order
        timestamp created_at
    }

    product_desc_updates {
        int id PK
        int product_id FK
        text content
        timestamp created_at
    }

    watchlists {
        int user_id PK, FK
        int product_id PK, FK
        timestamp created_at
    }

    %% ============================================
    %% BIDDING
    %% ============================================

    bids {
        int id PK
        int product_id FK
        int bidder_id FK
        bigint price
        bigint max_price
        int status
        timestamp created_at
    }

    product_bans {
        int product_id PK, FK
        int user_id PK, FK
        timestamp created_at
    }

    %% ============================================
    %% Q&A
    %% ============================================

    questions {
        int id PK
        int product_id FK
        int user_id FK
        text question
        text answer
        timestamp created_at
        timestamp answered_at
    }

    %% ============================================
    %% TRANSACTION & CHAT
    %% ============================================

    transactions {
        int id PK
        int product_id FK
        int buyer_id FK
        int seller_id FK
        bigint final_price
        int status
        text shipping_address
        text payment_proof
        text shipping_tracking
        timestamp created_at
        timestamp updated_at
    }

    chats {
        int id PK
        int transaction_id FK
        int buyer_id FK
        int seller_id FK
        timestamp created_at
        timestamp updated_at
    }

    messages {
        int id PK
        int transaction_id FK
        int sender_id FK
        int receiver_id FK
        text message
        timestamp created_at
    }

    %% ============================================
    %% RATING & CONFIG
    %% ============================================

    ratings {
        int id PK
        int product_id FK
        int rater_id FK
        int rated_user_id FK
        int score
        text comment
        timestamp created_at
    }

    system_config {
        string config_key PK
        string config_value
        text description
        timestamp updated_at
        int updated_by FK
    }

    %% ============================================
    %% RELATIONSHIPS
    %% ============================================

    users ||--o{ upgrade_requests : submits
    users ||--o{ products : sells
    users ||--o{ products : wins
    users ||--o{ bids : places
    users ||--o{ watchlists : saves
    users ||--o{ questions : asks
    users ||--o{ product_bans : banned
    users ||--o{ transactions : buys
    users ||--o{ transactions : sells
    users ||--o{ messages : sends
    users ||--o{ messages : receives
    users ||--o{ chats : buyer
    users ||--o{ chats : seller
    users ||--o{ ratings : gives
    users ||--o{ ratings : receives
    users ||--o{ system_config : updates

    categories ||--o{ categories : parent
    categories ||--o{ products : contains

    products ||--o{ product_images : has
    products ||--o{ product_desc_updates : updates
    products ||--o{ bids : receives
    products ||--o{ watchlists : watched
    products ||--o{ questions : asked
    products ||--o{ product_bans : bans
    products ||--|| transactions : completes
    products ||--o{ ratings : rated

    transactions ||--|| chats : has
    transactions ||--o{ messages : contains
    transactions ||--o{ ratings : produces
