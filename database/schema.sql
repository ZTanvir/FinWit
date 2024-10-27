CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(70) NOT NULL,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    mobile_number VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS income_categories(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    name VARCHAR(50),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- CREATE TABLE IF NOT EXISTS incomes(
--     id SERIAL PRIMARY KEY,
--     user_id SERIAL,
--     category_id SERIAL,
--     title VARCHAR(255) NOT NULL,
--     amount NUMERIC(8,5) NOT NULL,
--     date DATE NOT NULL DEFAULT CURRENT_DATE,
--     time TIME NOT NULL DEFAULT CURRENT_TIME,
--     message TEXT NOT NULL,
--     PRIMARY KEY (user_id,category_id),
--     CONSTRAINT fk_users
--         FOREIGN KEY(user_id)
--         REFERENCES users(id)
--         ON DELETE CASCADE
-- );