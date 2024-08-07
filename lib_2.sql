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
                         (1, 'Megan', 'Roiz'),
                         (2, 'Chris', 'Wats'),
                         (3, 'John', 'Henry'),
                         (4, 'Lucy', 'White'),
                         (5, 'Sam','Norton'),
                         (6, 'John', 'Snow');

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

-- Створіть SQL-запит, який виводить кількість книг кожного жанру в бібліотеці. Використайте GROUP BY.

-- Створіть SQL-запит, який показує кількість працівників в кожній бібліотечній філії. Використайте GROUP BY.

-- Створіть SQL-запит, який показує користувачів, які позичили більше 5 книг. Використайте HAVING.

-- Створіть SQL-запит, який виводить жанри, для яких у бібліотеці є більше 10 книг. Використайте HAVING.

-- Створіть SQL-запит, який показує бібліотечні філії, де працює більше 5 працівників. Використайте HAVING.

-- Створіть SQL-запит, який виводить повний список імен усіх користувачів та працівників. Використайте UNION.

-- Створіть SQL-запит, який об'єднує список усіх країн, з яких є користувачі, та країн, де працюють працівники.
-- Використайте UNION.

-- Створіть SQL-запит, який виводить імена, які є і серед користувачів, і серед працівників. Використайте INTERSECT.

-- Створіть SQL-запит, який виводить країни, з яких є як користувачі, так і працівники. Використайте INTERSECT.

-- Створіть SQL-запит, який виводить імена користувачів, які не використовуються працівниками. Використайте EXCEPT.

-- Це означає, що ви маєте показати тільки ті імена користувачів, які не зустрічаються серед імен працівників.
-- Створіть SQL-запит, який виводить країни, з яких є користувачі, але не працівники. Використайте EXCEPT.

-- Пов'яжіть таблиці users та borrow_records, використовуючи INNER JOIN на id користувача та user_id запису про позичання.
-- Виведіть імена користувачів (first_name, last_name) та borrow_date.

-- Додайте до попереднього запиту групування по користувачам (first_name, last_name). Виведіть імена користувачів та кількість їхніх записів про позичання.

-- До попереднього запиту додайте сортування за кількістю записів про позичання від більшого до меншого (DESC) і обмежте вивід першими 10 результатами.
-- 2. Виведіть інформацію про всіх користувачів і книги, які вони позичили (якщо позичили).
-- Для цього використайте LEFT JOIN між таблицями users, borrow_records, book_copies та books.

-- Додайте до попереднього запиту умову вибірки лише тих користувачів, які позичили хоча б одну книгу (WHERE books.title IS NOT NULL).

-- Додайте до попереднього запиту агрегатну функцію для підрахунку кількості книг, які позичив кожен користувач.
-- 3. Використайте FULL JOIN для з'єднання таблиць employees та library_branches, виведіть імена співробітників та назву філії, в якій вони працюють.

-- Додайте до попереднього запиту з'єднання з третьою таблицею users, з'єднайте її по country, а потім відфільтруйте результат,
-- щоб показати лише тих користувачів і співробітників, які проживають у США.