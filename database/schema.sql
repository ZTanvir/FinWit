CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(70) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mobile_number VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS income_categories(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS incomes( 
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    income_category_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    message TEXT NOT NULL,
    CONSTRAINT fk_users
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY(income_category_id)
        REFERENCES income_categories(id)
        ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS expense_categories(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS expenses(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    expense_category_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    message TEXT NOT NULL,
    CONSTRAINT fk_users
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY(expense_category_id)
        REFERENCES expense_categories(id)
        ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS saving_categories(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS savings(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    saving_category_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    message TEXT NOT NULL,
    CONSTRAINT fk_users
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY(saving_category_id)
        REFERENCES saving_categories(id)
        ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS incomes_transactions(
    id SERIAL PRIMARY KEY,
    income_id int NOT NULL,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(20) NOT NULL,
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    CONSTRAINT fk_income_id
        FOREIGN KEY(income_id)
        REFERENCES incomes(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS expenses_transactions(
    id SERIAL PRIMARY KEY,
    expense_id int NOT NULL,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(20) NOT NULL, 
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    CONSTRAINT fk_expense_id
        FOREIGN KEY(expense_id)
        REFERENCES expenses(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS savings_transactions(
    id SERIAL PRIMARY KEY,
    saving_id int NOT NULL,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(20) NOT NULL, 
    amount BIGINT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    time TIME NOT NULL DEFAULT CURRENT_TIME,
    CONSTRAINT fk_saving_id
        FOREIGN KEY(saving_id)
        REFERENCES savings(id)
        ON DELETE CASCADE
);