CREATE TABLE lib_branches(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR (50) NOT NULL
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    branch_id INT REFERENCES lib_branches(branch_id),
    empl_name VARCHAR (50) NOT NULL
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL
);
ALTER TABLE customer DROP COLUMN last_name;

CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR (50),
    country_cust_id INT REFERENCES customer(customer_id),
    country_empl_id INT REFERENCES employee(employee_id)
);

CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR (50) NOT NULL,
    isbn VARCHAR (50) NOT NULL,
    genre VARCHAR (50) NOT NULL
);

CREATE TABLE borrow_records (
    records_id INT PRIMARY KEY,
    borrow_book_id INT REFERENCES book(book_id),
    cust_id INT REFERENCES customer(customer_id),
    title VARCHAR (50),
    count_records INT NOT NULL,
    borrow_date DATE NOT NULL
);
CREATE TABLE book_copies(
    copies_id INT PRIMARY KEY,
    book_copies_id INT REFERENCES book(book_id),
    quantity INT NOT NULL
);

CREATE TABLE author (
    author_id INT PRIMARY KEY,
    name VARCHAR (50) NOT NULL ,
    rate real NOT NULL
);

CREATE TABLE book_author (
    book_id INT REFERENCES book(book_id),
    author_id INT REFERENCES author(author_id),
    CONSTRAINT book_author_pk PRIMARY KEY (book_id, author_id)
);

INSERT INTO lib_branches VALUES
                             (1, 'East'),
                             (2, 'West'),
                             (3, 'South'),
                             (4, 'North');

INSERT INTO employee VALUES
                         (1, 1, 'Mark'),
                         (2, 2, 'Mary'),
                         (3, 3, 'Nick'),
                         (4, 4, 'Sam'),
                         (5, 3, 'Tina'),
                         (6, 1, 'Lucy'),
                         (7, 2, 'Chris');

INSERT INTO customer VALUES
                         (1, 'Megan'),
                         (2, 'Chris'),
                         (3, 'John'),
                         (4, 'Lucy'),
                         (5, 'Sam'),
                         (6, 'John');

INSERT INTO country VALUES
                        (1, 'Ukraine', 1, 1),
                        (2, 'Germany', 2, 2),
                        (3, 'Poland', 3, 3),
                        (4, 'France', 4, 4),
                        (5, 'Italy', 5, 5),
                        (6, 'Spain', 6, 6),
                        (7, 'England', 3, 7),
                        (8, 'Norway', 3, 1),
                        (9, 'Denmark', 1, 2),
                        (10, 'Ireland', 2, 3),
                        (11, 'Austria', 2, 4),
                        (12, 'Albania', 4, 5),
                        (13, 'Latvia', 5, 6),
                        (14, 'USA', 6, 7);


INSERT INTO book VALUES (1, 'The Last Wish', '012555545541','fantasy'),
                    (2, 'Black swan', '4892141525541','business'),
                    (3, 'George and the Big Bang', '4562415654', 'science fiction'),
                    (4, 'Brief History', '45551455151','non-fiction'),
                    (5, 'Gwendy''s Magic Feather', '1515262515215', 'horror'),
                    (6, 'Skin in the game', '4892141525541','business');


INSERT INTO author VALUES (1, 'Andrzej Sapkowski', 4.8),
                       (2, 'Nassim Taleb', 4.7),
                       (3, 'Lucy Hawking', 3.3),
                       (4, 'Stephen Hawking', 4.0),
                       (5, 'Stephen King', 3.7),
                       (6, 'Richard Cheesemar',3.9);

INSERT INTO book_author VALUES
                            (1, 1),
                            (2, 2),
                            (3, 3),
                            (3, 4),
                            (4, 4),
                            (5, 5),
                            (5, 6),
                            (6, 5),
                            (6, 6);

INSERT INTO borrow_records VALUES
                               (1, 1, 1, 'The Last Wish', 2, '2024-05-03'),
                               (2, 2, 2, 'Black swan', 6, '2024-07-09'),
                               (3, 3, 3, 'George and the Big Bang', 3, '2024-01-23'),
                               (4, 4, 4, 'Brief History', 1, '2024-01-01'),
                               (5, 2, 5, 'Black swan', 0, '2024-12-14'),
                               (6, 6, 6, 'Skin in the game', 4, '2024-10-30'),
                               (7, 6, 3, 'Skin in the game', 5, '2024-05-03'),
                               (8, 1, 1, 'The Last Wish', 2, '2024-07-27'),
                               (9, 2, 2, 'Black swan', 3, '2024-03-02'),
                               (10, 3, 4, 'George and the Big Bang', 1, '2024-02-16'),
                               (11, 3, 5, 'George and the Big Bang', 0, '2024-04-18'),
                               (12, 5, 6, 'Gwendy''s Magic Feather',4, '2024-06-07'),
                               (13, 1, 1, 'The Last Wish', 3, '2024-08-01');

INSERT INTO book_copies VALUES
                            (1, 1, 1),
                            (2, 2, 2),
                            (3, 3, 3),
                            (4, 4, 4),
                            (5, 5, 5),
                            (6, 6, 6),
                            (7, 1, 1),
                            (8, 2, 2),
                            (9, 3, 3),
                            (10, 4, 4),
                            (11, 6, 5);

-- Створіть SQL-запит, який виводить кількість книг, які були позичені кожним користувачем. Використайте GROUP BY.
SELECT borrow_records.count_records, COUNT(*) AS quantity FROM borrow_records GROUP BY count_records;

-- Створіть SQL-запит, який виводить кількість книг кожного жанру в бібліотеці. Використайте GROUP BY.
SELECT book.genre, COUNT(book.genre) AS quantity FROM book GROUP BY genre;

-- Створіть SQL-запит, який показує кількість працівників в кожній бібліотечній філії. Використайте GROUP BY.
SELECT employee.empl_name, branch_id, COUNT(employee.empl_name) AS QUANTITY FROM employee GROUP BY employee.empl_name, branch_id;

--Створіть SQL-запит, який показує користувачів, які позичили більше 5 книг. Використайте HAVING.
SELECT cust_id, title, SUM(count_records) AS quantity FROM borrow_records GROUP BY cust_id, title HAVING SUM(count_records) > 5;

-- Створіть SQL-запит, який виводить жанри, для яких у бібліотеці є більше 10 книг. Використайте HAVING.
SELECT book.genre, COUNT(book.genre) AS quantity_genry FROM book  GROUP BY book.genre HAVING COUNT(genre) > 10;

-- Створіть SQL-запит, який показує бібліотечні філії, де працює більше 5 працівників. Використайте HAVING.
SELECT branch_id, COUNT(branch_id) AS quantity_empl FROM employee GROUP BY branch_id HAVING COUNT(branch_id) > 5;

-- Створіть SQL-запит, який виводить повний список імен усіх користувачів та працівників. Використайте UNION.
SELECT customer.first_name FROM customer
UNION ALL
SELECT employee.empl_name FROM employee;

-- Створіть SQL-запит, який об'єднує список усіх країн, з яких є користувачі, та країн, де працюють працівники.
-- Використайте UNION.
SELECT country_name, first_name FROM country JOIN customer c on c.customer_id = country.country_cust_id
UNION ALL
SELECT country_name, empl_name FROM country JOIN employee e on e.employee_id = country.country_empl_id;

-- Створіть SQL-запит, який виводить імена, які є і серед користувачів, і серед працівників. Використайте INTERSECT.
SELECT customer.first_name FROM customer
INTERSECT
SELECT employee.empl_name FROM employee;

-- Створіть SQL-запит, який виводить країни, з яких є як користувачі, так і працівники. Використайте INTERSECT.
SELECT country.country_name FROM country JOIN customer c on c.customer_id = country.country_cust_id
INTERSECT
SELECT country.country_name FROM country JOIN employee e on e.employee_id = country.country_empl_id;

-- Створіть SQL-запит, який виводить імена користувачів, які не використовуються працівниками. Використайте EXCEPT.
SELECT customer.first_name FROM customer
EXCEPT
SELECT employee.empl_name FROM employee;

-- Створіть SQL-запит, який виводить країни, з яких є користувачі, але не працівники. Використайте EXCEPT.
SELECT country_name, customer_id FROM country JOIN customer c on c.customer_id = country.country_cust_id
EXCEPT
SELECT country_name, employee_id FROM employee JOIN country c on employee.employee_id = c.country_empl_id;

-- Пов'яжіть таблиці users та borrow_records, використовуючи INNER JOIN на id користувача та user_id запису про позичання.
-- Виведіть імена користувачів (first_name, last_name) та borrow_date.
SELECT first_name, borrow_date FROM customer INNER JOIN borrow_records br on customer.customer_id = br.cust_id;

-- Додайте до попереднього запиту групування по користувачам (first_name, last_name). Виведіть імена користувачів та кількість їхніх записів про позичання.
SELECT first_name, count_records FROM customer
    JOIN borrow_records br on customer.customer_id = br.cust_id GROUP BY first_name, count_records;

-- До попереднього запиту додайте сортування за кількістю записів про позичання від більшого до меншого (DESC) і обмежте вивід першими 10 результатами.
SELECT first_name, count_records FROM customer
    JOIN borrow_records br on customer.customer_id = br.cust_id GROUP BY first_name, count_records ORDER BY count_records DESC LIMIT 10;

-- 2. Виведіть інформацію про всіх користувачів і книги, які вони позичили (якщо позичили).
-- Для цього використайте LEFT JOIN між таблицями users, borrow_records, book_copies та books.
SELECT * FROM customer LEFT JOIN borrow_records br on customer.customer_id = br.cust_id
LEFT JOIN book b on b.book_id = br.borrow_book_id
FULL JOIN book_copies bc on b.book_id = bc.book_copies_id;

-- Додайте до попереднього запиту умову вибірки лише тих користувачів, які позичили хоча б одну книгу (WHERE books.title IS NOT NULL).
SELECT * FROM customer LEFT JOIN borrow_records br on customer.customer_id = br.cust_id
LEFT JOIN book b on b.book_id = br.borrow_book_id
FULL JOIN book_copies bc on b.book_id = bc.book_copies_id
WHERE borrow_book_id IS NOT NULL;

-- Додайте до попереднього запиту агрегатну функцію для підрахунку кількості книг, які позичив кожен користувач.
SELECT customer.customer_id, customer.first_name, COUNT(br.borrow_book_id) AS number_of_books
FROM customer
LEFT JOIN borrow_records br ON customer.customer_id = br.cust_id
LEFT JOIN book b ON b.book_id = br.borrow_book_id
LEFT JOIN book_copies bc ON b.book_id = bc.book_copies_id
WHERE br.borrow_book_id IS NOT NULL
GROUP BY customer.customer_id, customer.first_name;

-- Використайте FULL JOIN для з'єднання таблиць employees та library_branches, виведіть імена співробітників та назву філії, в якій вони працюють.
SELECT empl_name, branch_name FROM employee FULL JOIN lib_branches lb on lb.branch_id = employee.branch_id;

-- Додайте до попереднього запиту з'єднання з третьою таблицею users, з'єднайте її по country, а потім відфільтруйте результат,
-- щоб показати лише тих користувачів і співробітників, які проживають у США.
SELECT employee.empl_name, u.first_name, count.country_name
FROM employee
FULL JOIN country count ON employee.employee_id = count.country_empl_id
FULL JOIN customer u ON u.customer_id = count.country_cust_id
WHERE count.country_name = 'USA';