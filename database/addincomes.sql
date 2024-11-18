-- user_id,income_category_id,title,amount
INSERT INTO incomes
    (user_id,income_category_id,title,amount,message)
VALUES
    (
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM income_categories WHERE name='food'),
        'Food day',
        1000,
        'It was enjoyable and expensive :)'
    );