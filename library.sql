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
('Lhistoire pour les nuls');
INSERT INTO patron (first_name, last_name)
VALUES ('Franck','Michel'),
('Jean','Valjean'),
('Francis','Autant'),
('Machin','Bidule');
-- try some borrows
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1,1,NOW());
-- test if a patron can borrow several book
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1,3,NOW());
-- next shouldn't work because book is already borrowed
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (3,1,NOW());
-- try to give a book back
UPDATE borrow SET return_date = NOW() WHERE id=1; 
-- try for someone else to take the book that was given back
INSERT INTO borrow (id_patron, id_book, borrow_date)
VALUES (1,1,NOW());