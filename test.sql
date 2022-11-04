CREATE database library;
USE library;

CREATE TABLE customer 
(
     id INTEGER primary key auto_increment not null,
     first_name VARCHAR(255),
     last_name VARCHAR(255)
);

CREATE TABLE book 
(
     id INTEGER primary key auto_increment not null,
     name VARCHAR(255)
);

CREATE TABLE borrows 
(
     id INTEGER primary key auto_increment not null,
     id_customer INT,
     id_book INT,
     borrow_date DATETIME,
     return_date DATETIME,
     FOREIGN KEY (id_customer) REFERENCES customer(id),
     FOREIGN KEY (id_book) REFERENCES book(id)
);

INSERT INTO customer (first_name,last_name) 
VALUES 
("Jean","Coquetot"), 
("Micheline", "Dax"),
("Robert", "De niro"),
("Hervé","Macheur"), 
("Gerard", "St Brice"),
("Cunégonde", "Mortefeuille"), 
("Hector", "Demarre");

INSERT INTO book (name) 
VALUES ("la reine margot"), 
("H2G2"), 
("LOTR"),
("La vie est belle"), 
("La valse lente des tortues"), 
("Moi christiane F."), 
("SQL pour les nuls"), 
("Il était une fois la vie");

INSERT INTO borrows (id_customer,id_book,borrow_date,return_date) 
VALUES 
(2,3,NOW(),NULL),
(3,2,NOW(),NULL),
(3,4,NOW(),NULL),
(5,2,NOW(),NULL),
(5,1,NOW(),NULL);

UPDATE borrows 
SET return_date = NOW() 
WHERE	id = 1;

SELECT DISTINCT first_name,last_name, book.name as book_name, borrow_date 
FROM borrows NATURAL JOIN book NATURAL JOIN customer;

