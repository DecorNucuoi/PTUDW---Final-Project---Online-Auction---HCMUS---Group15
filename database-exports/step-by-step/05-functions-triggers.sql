-- ============================================
-- BƯỚC 5: TẠO FUNCTIONS VÀ TRIGGERS
-- ============================================

-- Function 1: Update product search vector
CREATE OR REPLACE FUNCTION public.update_product_search_vector()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.search_vector := to_tsvector('simple', COALESCE(NEW.name, '') || ' ' || COALESCE(NEW.description, ''));
    RETURN NEW;
END;
$function$;

-- Function 2: Update transaction timestamp
CREATE OR REPLACE FUNCTION public.update_transaction_timestamp()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$function$;

-- Function 3: Update user rating cache
CREATE OR REPLACE FUNCTION public.update_user_rating_cache()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    UPDATE users SET
        rating_score = (
            SELECT COALESCE(SUM(score), 0) 
            FROM ratings 
            WHERE rated_user_id = NEW.rated_user_id
        ),
        rating_count = (
            SELECT COUNT(*) 
            FROM ratings 
            WHERE rated_user_id = NEW.rated_user_id
        )
    WHERE id = NEW.rated_user_id;
    RETURN NEW;
END;
$function$;

-- Trigger 1: Update product search vector on INSERT
CREATE TRIGGER trigger_product_search_update_insert
    BEFORE INSERT
    ON products
    FOR EACH ROW
    EXECUTE FUNCTION update_product_search_vector();

-- Trigger 2: Update product search vector on UPDATE
CREATE TRIGGER trigger_product_search_update_update
    BEFORE UPDATE
    ON products
    FOR EACH ROW
    EXECUTE FUNCTION update_product_search_vector();

-- Trigger 3: Update rating cache on INSERT
CREATE TRIGGER trigger_rating_cache_update_insert
    AFTER INSERT
    ON ratings
    FOR EACH ROW
    EXECUTE FUNCTION update_user_rating_cache();

-- Trigger 4: Update rating cache on UPDATE
CREATE TRIGGER trigger_rating_cache_update_update
    AFTER UPDATE
    ON ratings
    FOR EACH ROW
    EXECUTE FUNCTION update_user_rating_cache();

-- Trigger 5: Update transaction timestamp
CREATE TRIGGER trigger_transaction_timestamp
    BEFORE UPDATE
    ON transactions
    FOR EACH ROW
    EXECUTE FUNCTION update_transaction_timestamp();
