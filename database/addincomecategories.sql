INSERT INTO 
    income_categories(user_id,name)
VALUES
    ((SELECT id FROM users WHERE username = 'altaf'),'food')