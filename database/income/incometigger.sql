CREATE OR REPLACE FUNCTION insert_income_transaction() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO incomes_transactions(income_id,title,type,amount)
    VALUES (NEW.id,NEW.title,'income',NEW.amount);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER income_transactions
    AFTER INSERT
    ON incomes
    FOR EACH ROW
    EXECUTE PROCEDURE insert_income_transaction();