-- Library Managemnet System Project 

-- Create Database
CREATE DATABASE library;

-- USE DATABASE
USE library;	

-- CREATE TABLE CALLED branch
CREATE TABLE branch
	(
    branch_id VARCHAR(10) PRIMARY KEY,	
    manager_id	VARCHAR(10),
    branch_address VARCHAR(50),
    contact_no VARCHAR(20)
    );
	ALTER TABLE branch
	MODIFY COLUMN contact_no VARCHAR(20);

-- CREATE TABLE FOR employee
CREATE TABLE employee
	(
    emp_id	VARCHAR(10)PRIMARY KEY,
    emp_name VARCHAR(20),
    position VARCHAR(15),
    salary FLOAT,
    branch_id VARCHAR(10) -- FK 
    );
    
-- CREATE TABLE FOR book
CREATE TABLE book
	(
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(15),
    rental_price FLOAT,	
    status VARCHAR(15),
    author VARCHAR(35),
    publisher VARCHAR(55)
    );
    ALTER TABLE book
    MODIFY COLUMN category VARCHAR(100);
    
-- CREATE TABLE FOR member 
CREATE TABLE member
	(
    member_id VARCHAR(20) PRIMARY KEY,
    member_name	VARCHAR(20),
    member_address VARCHAR(50),
    reg_date VARCHAR(20)
    );

-- CREATE TABLE FOR issue_status
CREATE TABLE issue_status
		(
        issued_id VARCHAR(15) PRIMARY KEY,	
        issued_member_id VARCHAR(20),	-- FK
        issued_book_name VARCHAR(55),
        issued_date	VARCHAR(20),
        issued_book_isbn VARCHAR(20), -- FK
        issued_emp_id VARCHAR(15) -- FK
        );
        
-- CREATE TABLE FOR return_status
CREATE TABLE return_status
	(
    return_id VARCHAR(15) PRIMARY KEY,
    issued_id VARCHAR(15), -- FK
    return_book_name VARCHAR(55),	
    return_date Date,
    return_book_isbn VARCHAR(25) -- FK
    );
    
-- CREATE A FOREGIN KEY
ALTER TABLE issue_status
ADD CONSTRAINT fk_member 
FOREIGN KEY (issued_member_id)
REFERENCES member(member_id);

ALTER TABLE issue_status
ADD CONSTRAINT fk_book
FOREIGN KEY (issued_book_isbn)
REFERENCES book(isbn);

ALTER TABLE issue_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE employee 
ADD CONSTRAINT fk_branch 
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status 
ADD CONSTRAINT fk_issued_id
FOREIGN KEY (issued_id)
REFERENCES issue_status(issued_id);







