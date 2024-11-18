CREATE OR REPLACE FUNCTION insert_saving_transaction() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO savings_transactions(saving_id,title,type,amount)
    VALUES (NEW.id,NEW.title,'saving',NEW.amount);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER saving_transactions
    AFTER INSERT
    ON savings
    FOR EACH ROW
    EXECUTE PROCEDURE insert_saving_transaction();