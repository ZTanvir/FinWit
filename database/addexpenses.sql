-- user_id,income_category_id,title,amount
INSERT INTO expenses
    (user_id,expense_category_id,title,amount,message)
VALUES
    (
        (SELECT id FROM users WHERE username='altaf'),
        (SELECT id FROM expense_categories WHERE name='travel'),
        'Mount Fuji',
        100,
        'One of the highest mountain in japan.'
    );