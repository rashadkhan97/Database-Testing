-- Database Creating
create database Library_Management_System;
-- Using the database
USE Library_Management_System;

-- Creating Tables
CREATE TABLE STUDENTS (
    stud_ID INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender CHAR(1),
    age INT,
    contact_add VARCHAR(255),
    stud_email VARCHAR(255),
    PRIMARY KEY (stud_ID)
);

CREATE TABLE BOOK (
    book_ID INT NOT NULL,
    bk_title VARCHAR(255),
    author VARCHAR(255),
    bk_num INT,
    pub_date DATE NOT NULL,
    PRIMARY KEY (book_ID)
);

CREATE TABLE USERS (
    user_ID INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender CHAR(2),
    age INT,
    contact_add VARCHAR(255),
    user_email VARCHAR(255),
    PRIMARY KEY (user_ID)
);

CREATE TABLE BORROWING (
    borrowing_ID INT NOT NULL AUTO_INCREMENT,
    book_ID INT,
    stud_ID INT,
    data_borrowed DATE NOT NULL,
    data_return DATE NOT NULL,
    PRIMARY KEY (borrowing_ID),
    FOREIGN KEY (book_ID)
        REFERENCES BOOK (book_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (stud_ID)
        REFERENCES STUDENTS (stud_ID)
        ON DELETE CASCADE
);

CREATE TABLE TRANSACTIONS (
    trans_ID INT NOT NULL,
    trans_name VARCHAR(255),
    borrowing_ID INT,
    stud_ID INT,
    trans_date DATE NOT NULL,
    PRIMARY KEY (trans_ID),
    FOREIGN KEY (borrowing_ID)
        REFERENCES BORROWING (borrowing_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (stud_ID)
        REFERENCES STUDENTS (stud_ID)
        ON DELETE CASCADE
);

CREATE TABLE Reports (
    report_ID INT NOT NULL AUTO_INCREMENT,
    trans_ID INT,
    borrowing_ID INT,
    report_date DATE NOT NULL,
    PRIMARY KEY (report_ID),
    FOREIGN KEY (trans_ID)
        REFERENCES TRANSACTIONS (trans_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (borrowing_ID)
        REFERENCES BORROWING (borrowing_ID)
        ON DELETE CASCADE
);


####### Inserting Data for the created tables  #######
-- INSERT statements for STUDENTS table
INSERT INTO STUDENTS (stud_ID, first_name, last_name, gender, age, contact_add, stud_email)
VALUES
    (1, 'John', 'Doe', 'M', 20, '123 Main St', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'F', 22, '456 Elm St', 'jane.smith@example.com'),
    (3, 'Michael', 'Johnson', 'M', 19, '789 Oak Ave', 'michael.johnson@example.com'),
    (4, 'Emily', 'Williams', 'F', 21, '101 Pine Rd', 'emily.williams@example.com'),
    (5, 'David', 'Brown', 'M', 23, '222 Maple Blvd', 'david.brown@example.com'),
    (6, 'Sarah', 'Davis', 'F', 20, '333 Cedar Ln', 'sarah.davis@example.com'),
    (7, 'Christopher', 'Miller', 'M', 22, '444 Birch Rd', 'christopher.miller@example.com'),
    (8, 'Jessica', 'Wilson', 'F', 19, '555 Willow Dr', 'jessica.wilson@example.com'),
    (9, 'Daniel', 'Taylor', 'M', 21, '666 Oak St', 'daniel.taylor@example.com'),
    (10, 'Ashley', 'Anderson', 'F', 23, '777 Pine Ave', 'ashley.anderson@example.com'),
    (11, 'James', 'Thomas', 'M', 20, '888 Elm Rd', 'james.thomas@example.com'),
    (12, 'Amanda', 'Jackson', 'F', 22, '999 Cedar St', 'amanda.jackson@example.com');
    

-- INSERT statements for Book table
INSERT INTO BOOK (book_ID, bk_title, author, bk_num, pub_date)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 12345, '2020-01-15'),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 67890, '2019-08-30'),
    (3, '1984', 'George Orwell', 54321, '2018-03-22'),
    (4, 'Pride and Prejudice', 'Jane Austen', 98765, '2017-11-10'),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 24680, '2016-06-05'),
    (6, 'To Kill a Kingdom', 'Alexandra Christo', 13579, '2021-04-25'),
    (7, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 86420, '2005-12-01'),
    (8, 'The Hobbit', 'J.R.R. Tolkien', 97531, '2015-09-18'),
    (9, 'The Da Vinci Code', 'Dan Brown', 73529, '2003-07-30'),
    (10, 'The Hunger Games', 'Suzanne Collins', 62840, '2014-02-14'),
    (11, 'The Alchemist', 'Paulo Coelho', 28192, '1993-10-15'),
    (12, 'The Lord of the Rings: The Fellowship of the Ring', 'J.R.R. Tolkien', 38462, '2001-05-02');



-- INSERT statements for USERS table
INSERT INTO USERS (user_ID, first_name, last_name, gender, age, contact_add, user_email)
VALUES
    (1, 'Robert', 'Johnson', 'M', 28, '123 Oak St', 'robert.johnson@example.com'),
    (2, 'Emily', 'Smith', 'F', 25, '456 Maple Ave', 'emily.smith@example.com'),
    (3, 'Michael', 'Brown', 'M', 30, '789 Elm Rd', 'michael.brown@example.com'),
    (4, 'Sophia', 'Davis', 'F', 22, '101 Pine St', 'sophia.davis@example.com'),
    (5, 'William', 'Anderson', 'M', 26, '222 Birch Dr', 'william.anderson@example.com'),
    (6, 'Olivia', 'Miller', 'F', 24, '333 Cedar Ln', 'olivia.miller@example.com'),
    (7, 'James', 'Wilson', 'M', 29, '444 Willow Rd', 'james.wilson@example.com'),
    (8, 'Emma', 'Taylor', 'F', 27, '555 Oak Ave', 'emma.taylor@example.com'),
    (9, 'Alexander', 'Martinez', 'M', 23, '666 Maple Blvd', 'alexander.martinez@example.com'),
    (10, 'Ava', 'Lee', 'F', 21, '777 Elm St', 'ava.lee@example.com'),
    (11, 'Daniel', 'Garcia', 'M', 31, '888 Pine Rd', 'daniel.garcia@example.com'),
    (12, 'Isabella', 'Lopez', 'F', 33, '999 Cedar Ave', 'isabella.lopez@example.com');


-- INSERT statements for BORROWING table
INSERT INTO BORROWING (book_ID, stud_ID, data_borrowed, data_return)
VALUES
    (1, 3, '2023-07-01', '2023-07-15'),
    (2, 5, '2023-07-02', '2023-07-16'),
    (3, 8, '2023-07-03', '2023-07-17'),
    (4, 2, '2023-07-04', '2023-07-18'),
    (5, 10, '2023-07-05', '2023-07-19'),
    (6, 1, '2023-07-06', '2023-07-20'),
    (7, 6, '2023-07-07', '2023-07-21'),
    (8, 4, '2023-07-08', '2023-07-22'),
    (9, 9, '2023-07-09', '2023-07-23'),
    (10, 7, '2023-07-10', '2023-07-24'),
    (11, 12, '2023-07-11', '2023-07-25'),
    (12, 11, '2023-07-12', '2023-07-26');
    

-- INSERT statements for TRANSACTIONS table
INSERT INTO TRANSACTIONS (trans_ID, trans_name, borrowing_ID, stud_ID, trans_date)
VALUES
    (1, 'Fine Payment', 3, 8, '2023-07-15'),
    (2, 'Book Return', 1, 3, '2023-07-15'),
    (3, 'Fine Payment', 9, 7, '2023-07-22'),
    (4, 'Book Return', 2, 5, '2023-07-16'),
    (5, 'Book Return', 4, 2, '2023-07-18'),
    (6, 'Fine Payment', 11, 12, '2023-07-25'),
    (7, 'Fine Payment', 5, 10, '2023-07-19'),
    (8, 'Book Return', 6, 1, '2023-07-20'),
    (9, 'Book Return', 8, 4, '2023-07-22'),
    (10, 'Fine Payment', 10, 7, '2023-07-24'),
    (11, 'Fine Payment', 7, 6, '2023-07-21'),
    (12, 'Book Return', 3, 8, '2023-07-17');
    

-- INSERT statements for Reports table
INSERT INTO Reports (trans_ID, borrowing_ID, report_date)
VALUES
    (1, 3, '2023-07-15'),
    (2, 1, '2023-07-15'),
    (3, 9, '2023-07-22'),
    (4, 2, '2023-07-16'),
    (5, 4, '2023-07-18'),
    (6, 11, '2023-07-25'),
    (7, 5, '2023-07-19'),
    (8, 6, '2023-07-20'),
    (9, 8, '2023-07-22'),
    (10, 10, '2023-07-24'),
    (11, 7, '2023-07-21'),
    (12, 3, '2023-07-17');


-- Checking all the tables have filed with inserted values or not 
select * from Students;
select * from book;
select * from users;
select * from borrowing;
select * from transactions;
select * from reports;

-- Query using AS (alias) and ORDER BY
SELECT stud_ID AS student_id, first_name AS name, age AS student_age
FROM STUDENTS
ORDER BY student_age DESC;

-- Query using GROUP BY and aggregate function (COUNT)
SELECT gender, COUNT(*) AS count_of_students
FROM STUDENTS
GROUP BY gender;

-- Query using JOIN (INNER JOIN)
SELECT s.first_name, b.bk_title
FROM BORROWING bor
INNER JOIN STUDENTS s ON bor.stud_ID = s.stud_ID
INNER JOIN BOOK b ON bor.book_ID = b.book_ID;

-- Query using WHERE and ORDER BY
SELECT bk_title, author, pub_date
FROM BOOK
WHERE pub_date >= '2022-01-01'
ORDER BY pub_date DESC;

-- Query using GROUP BY, aggregate function (SUM), and HAVING
SELECT stud_ID, COUNT(*) AS num_of_borrowings, SUM(1) AS total_books_borrowed
FROM BORROWING
GROUP BY stud_ID
HAVING total_books_borrowed > 10;

-- Query using LEFT JOIN and IS NULL to find students who have not borrowed any books
SELECT s.stud_ID, s.first_name, s.last_name
FROM STUDENTS s
LEFT JOIN BORROWING b ON s.stud_ID = b.stud_ID
WHERE b.borrowing_ID IS NULL;

-- Query using functions (UPPER) and ORDER BY
SELECT UPPER(first_name) AS capitalized_name
FROM STUDENTS
ORDER BY first_name;

-- Query using JOIN (LEFT JOIN), functions (CONCAT), and WHERE
SELECT CONCAT(u.first_name, ' ', u.last_name) AS user_fullname, t.trans_name
FROM TRANSACTIONS t
LEFT JOIN USERS u ON t.trans_ID = u.user_ID
WHERE u.age < 30;

-- Query to get the list of books currently borrowed along with their borrowers' information
SELECT b.bk_title AS book_title, b.author, s.first_name AS borrower_firstname, s.last_name AS borrower_lastname
FROM BOOK b
JOIN BORROWING bor ON b.book_ID = bor.book_ID
JOIN STUDENTS s ON bor.stud_ID = s.stud_ID;

-- Query to calculate the total number of books borrowed by each student and display the results in descending order
SELECT s.stud_ID, s.first_name, s.last_name, COUNT(bor.book_ID) AS total_books_borrowed
FROM STUDENTS s
LEFT JOIN BORROWING bor ON s.stud_ID = bor.stud_ID
GROUP BY s.stud_ID, s.first_name, s.last_name
ORDER BY total_books_borrowed DESC;

-- Query to find out the top 5 most popular books (most borrowed) along with the number of times each book has been borrowed
SELECT b.bk_title AS book_title, b.author, COUNT(bor.book_ID) AS borrow_count
FROM BOOK b
LEFT JOIN BORROWING bor ON b.book_ID = bor.book_ID
GROUP BY b.bk_title, b.author
ORDER BY borrow_count DESC
LIMIT 5;

-- Query to get the list of students who have overdue books (books not returned on time):
SELECT s.stud_ID, s.first_name, s.last_name
FROM STUDENTS s
JOIN BORROWING bor ON s.stud_ID = bor.stud_ID
WHERE bor.data_return < CURDATE();

-- Query to find out the users who haven't borrowed any books
SELECT u.user_ID, u.first_name, u.last_name
FROM USERS u
LEFT JOIN TRANSACTIONS t ON u.user_ID = t.trans_ID
WHERE t.borrowing_ID IS NULL;













