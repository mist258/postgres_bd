CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_pame TEXT NOT NULL,
    price DECIMAL NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE supliers(
    suplier_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    contact_name TEXT NOT NULL
);


CREATE TABLE product_supliers(
    prod_supliers_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    suplier_id INT REFERENCES supliers(suplier_id),
    suplier_date DATE NOT NULL
);

INSERT INTO products VALUES
                         (1, 'tomatoes', 23),
                         (2, 'cherry', 25),
                         (3, 'onion', 8),
                         (4, 'garlic', 5),
                         (5, 'pear', 17),
                         (6, 'apple', 30),
                         (7, 'salmon', 963),
                         (8, 'caviar', 550),
                         (9, 'shrimps', 600);

INSERT INTO customers VALUES
                          (1, 'Nick', 'nick.post@gmail.com'),
                          (2, 'Megan', 'megan.post@com'),
                          (3, 'Ron', 'ron.post@com'),
                          (4, 'Bob', 'bob.post@gmail.com'),
                          (5, 'Lilly', 'lily.post@gmail.com'),
                          (6, 'Max', 'max.post@gmail.com'),
                          (7, 'Mary', 'mary.post@gmail.com'),
                          (8, 'Tina', 'tina.post@com'),
                          (9, 'Mika', 'mika.post@com');

INSERT INTO orders VALUES
                       (1, 2, 9, '2023-08-06', 8),
                       (2, 1, 8, '2024-01-02', 10),
                       (3, 4, 7, '2024-07-29', 78),
                       (4, 3, 6, '2023-10-30', 1),
                       (5, 5, 5, '2023-12-10', 45),
                       (6, 6, 4, '2024-05-19', 3),
                       (7, 9, 3, '2024-06-10', 85),
                       (8, 7, 2, '2024-03-28', 1),
                       (9, 8, 1, '2023-09-15', 15);

INSERT INTO supliers  VALUES
                          (1, 'Vlad Ushakov', 'Vlad'),
                          (2, 'Mike Kerry', 'Mike'),
                          (3, 'Chris Braun', 'Chris');

INSERT INTO product_supliers VALUES
                                 (1, 1, 1, '2024-01-02'),
                                 (2, 2, 2, '2024-02-12'),
                                 (3, 3, 3, '2023-12-02'),
                                 (4, 4, 1, '2023-08-22'),
                                 (5, 5, 2, '2023-07-30'),
                                 (6, 6, 3, '2024-02-09'),
                                 (7, 7, 1, '2023-04-09'),
                                 (8, 8, 3, '2023-08-11'),
                                 (9, 9, 2, '2024-04-26');

-- Поверніть список всіх продуктів
SELECT product_pame FROM products;

-- Поверніть всі продукти, які коштують від 10 до 100
SELECT products.product_pame FROM products WHERE price BETWEEN 10 AND 100;

-- Поверніть всі продукти дорожче за 500
SELECT products.product_pame FROM products WHERE price > 500;

-- Поверніть інформацію про найдорожчий продукт
SELECT * FROM products  ORDER BY price DESC LIMIT 1;

SELECT products.product_pame, products.price, products.product_id
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- Поверніть середню ціну всіх товарів
SELECT AVG(products.price) FROM products;

-- Поверніть список всіх користувачів, у яких пошта закінчується на "@gmail.com"
SELECT customer_name, email FROM customers WHERE customers.email LIKE '%@gmail.com';

-- Поверніть загальну кількість замовлень
SELECT SUM(orders.quantity) FROM orders;

-- Поверніть суму всіх замовлень юзера з айді 1 (Не забувайте враховувати поле quantity)

-- Поверніть всі замовлення, де кількість товарів більша за 1

-- Поверніть всіх постачальників в кого людина для звʼязку - "Vlad Ushakov"

-- Поверніть кількість замовлень, яку зробив юзер з конкретним айді

-- Виведіть всі замовлення, які були створені після 1 січня 24 року
