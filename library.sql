CREATE DATABASE library;
USE library;
CREATE TABLE patron (
    id INTEGER primary key auto_increment not null,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);
CREATE TABLE book (
    id INTEGER primary key auto_increment not null,
    name VARCHAR(255)
);
CREATE TABLE borrow (
    id INTEGER primary key auto_increment not null,
    id_patron INTEGER,
    FOREIGN KEY (id_patron) REFERENCES patron(id),
    id_book INTEGER,
    FOREIGN KEY (id_book) REFERENCES book(id),
    borrow_date DATETIME,
    return_date DATETIME
);
-- test case, dummy values
INSERT INTO book (name)
VALUES ('Dune'),
('Lanfeust'),
('Harry Potter'),
('Lhistoire pour les nuls'),
('LOTR'),
('La vie est belle'), 
('La valse lente des tortues'), 
('Moi christiane F.'), 
('SQL pour les nuls'), 
('Il était une fois la vie');
INSERT INTO patron (first_name, last_name)
VALUES ('Franck','Michel'),
('Jean','Valjean'),
('Francis','Autant'),
('Machin','Bidule'),
('Jean','Coquetot'), 
('Micheline', 'Dax'),
('Robert', 'De niro'),
('Hervé','Macheur'), 
('Gerard', 'St Brice'),
('Cunégonde', 'Mortefeuille'), 
('Hector', 'Demarre');
-- try some borrows
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1,1,NOW()),
(2,3,NOW()),
(3,2,NOW()),
(3,4,NOW()),
(5,2,NOW()),
(5,1,NOW());
-- test if a patron can borrow several book
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1, 3, NOW());
-- next shouldn't work because book is already borrowed
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (3, 1, NOW());
-- try to give a book back
UPDATE borrow
SET return_date = NOW()
WHERE id = 1;
-- givin another book back
UPDATE borrow
SET return_date = NOW()
WHERE id = 2;
-- try for someone else to take the book that was given back
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1, 1, NOW());
------ Commands
-- how many books are out?
SELECT COUNT(*)
FROM borrow
WHERE borrow.return_date IS NULL;
-- is there un returned books?
SELECT COUNT(*)>0
FROM borrow
WHERE borrow.return_date IS NULL;
-- list of available books
SELECT book.name as name
, borrow.return_date
FROM book
LEFT JOIN borrow ON book.id=borrow.id_book
WHERE NOT borrow.return_date IS NULL;
VALUES (1,1,NOW());
-- command to see all books borrowed
SELECT DISTINCT first_name,last_name, book.name as book_name, borrow_date 
FROM borrow NATURAL JOIN book NATURAL JOIN patron;
