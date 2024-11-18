INSERT INTO 
    saving_categories(user_id,name)
VALUES
    ((SELECT id FROM users WHERE username = 'altaf'),'house')