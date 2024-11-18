-- user_id,income_category_id,title,amount
INSERT INTO savings
    (user_id,saving_category_id,title,amount,message)
VALUES
    (
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM saving_categories WHERE name='house'),
        'house beside bay area',
        100000,
        'A place where we can lay our head when necessary'
    );