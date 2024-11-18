CREATE OR REPLACE FUNCTION insert_expense_transaction() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO expenses_transactions(expense_id,title,type,amount)
    VALUES (NEW.id,NEW.title,'expense',NEW.amount);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER expense_transactions
    AFTER INSERT
    ON expenses
    FOR EACH ROW
    EXECUTE PROCEDURE insert_expense_transaction();