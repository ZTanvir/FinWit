-- user_id,income_category_id,title,amount
INSERT INTO incomes
    (user_id,income_category_id,title,amount,message)
VALUES
    (
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM income_categories WHERE name='salary'),
        'First month',
        2500,
        'Form abcd bank :)'
    ),(
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM income_categories WHERE name='profit'),
        'navana',
        2400,
        '2.1% share profit :)'
),(
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM income_categories WHERE name='profit'),
        'Coinbase',
        2488,
        'Dog coin'
);