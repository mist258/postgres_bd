CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR (50) NOT NULL ,
    isbn VARCHAR (50) NOT NULL
);

CREATE TABLE author (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR (50) NOT NULL ,
    rate real NOT NULL
);

-- зв'язок між таб. book та author (many to many)
CREATE TABLE book_author (
    book_id SERIAL REFERENCES book(book_id),
    author_id SERIAL REFERENCES author(author_id),

    CONSTRAINT book_author_pk PRIMARY KEY (book_id, author_id)
);

INSERT INTO book VALUES (1, 'The Last Wish', '012555545541'),
                    (2, 'Black swan', '4892141525541'),
                    (3, 'George and the Big Bang', '4562415654'),
                    (4, 'Brief History', '45551455151'),
                    (5, 'Gwendy''s Magic Feather', '1515262515215'),
                    (6, 'Gwendy''s Button Box', '41145152515411');

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


CREATE TABLE employee (
    employee_id int PRIMARY KEY,
    empl_name VARCHAR (50) NOT NULL
);

CREATE TABLE customer (
    customer_id int PRIMARY KEY,
    cust_name VARCHAR (50) NOT NULL ,
    email VARCHAR (50) UNIQUE NOT NULL,
    fk_cust_empl_id int REFERENCES employee (employee_id) NOT NULL
);
INSERT INTO employee VALUES
                         (1, 'Mark'),
                         (2, 'Mary'),
                         (3, 'Nick');

INSERT INTO customer VALUES
                         (1, 'Megan', 'megan.lib@gmail.com', 1),
                         (2, 'Chris', 'chris.lib@gmail.com', 1),
                         (3, 'John', 'john.lib@gmail.com', 2),
                         (4, 'Lucy', 'lucy.lib@gmail.com', 2),
                         (5, 'Sam', 'sam.lib@gmail.com', 3),
                         (6, 'Kelli', 'kelli.lib@gmail.com', 3);

-- зв'язок між таб. customer та book (one to many)
CREATE TABLE info_customer_book
(
    customer_id SERIAL REFERENCES customer (customer_id),
    book_id     SERIAL REFERENCES book (book_id),

    CONSTRAINT info_customer_book_PK PRIMARY KEY (book_id, customer_id)
);

INSERT INTO info_customer_book VALUES
                                   (1, 2),
                                   (1, 1),
                                   (2, 7),
                                   (3, 4),
                                   (4, 5),
                                   (5, 6),
                                   (5, 3),
                                   (6, 8);
