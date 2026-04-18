SELECT * FROM branch;
SELECT * FROM member;
SELECT * FROM book;
SELECT * FROM employee;
SELECT * FROM issue_status;
SELECT * FROM return_status;

-- PROJECT TASK HERE NOW 
-- Q1 Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO book(isbn , book_title , category , rental_price , status , author , publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM book;

-- Q2 Update an Existing Member's Address;

UPDATE member
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

-- Q3 : Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issue_status
WHERE issued_id = 'IS121';
SELECT * FROM issue_status;

-- Q4 Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT * FROM issue_status
WHERE issued_emp_id = 'E101';

-- Q5 : List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT
    issued_member_id,
    COUNT(*)
FROM issue_status
GROUP BY 1
HAVING COUNT(*) > 1;

-- CATS TASK HERE 
-- Q6 Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
SELECT * FROM issue_status;
SELECT b.isbn,
count(ist.issued_id), b.book_title
FROM book AS b
JOIN 
issue_status AS ist
ON ist.issued_book_isbn  =  b.isbn
group by 1;

SELECT emp.branch_id
FROM branch as b
JOIN
employee as emp
ON emp.branch_id = emp.branch_id
group by 1;

-- DATA ANALYSIS HERE
-- Q7 . Retrieve All Books in a Specific Category:
SELECT * FROM book
WHERE category = 'History';

-- Q8 Find Total Rental Income by Category:
SELECT 
	b.category,
	count(*) AS How_Many_Time_Byy,
    SUM(b.rental_price) as Total_Earn

FROM book as b
JOIN
issue_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1;

-- Q9 List Members Who Registered in the Last 180 Days:
-- CREATE A NEW DATA FOR MEMBER 
INSERT INTO member(member_id , member_name,member_address,reg_date)
values
('C120','Ayush','Adarsh colony','2026-01-20');
SELECT * FROM member
where reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

-- Q10 List Employees with Their Branch Manager's Name and their branch details:

SELECT 
	e1.*,
    b.manager_id,
    e2.emp_name as manager
FROM employee as e1
JOIN
branch as b
ON e1.branch_id = b.branch_id
JOIN
employee as e2
ON b.manager_id = e2.emp_id;

-- Q11 Create a Table of Books with Rental Price Above a Certain Threshold:
CREATE TABLE expensive_book as
SELECT * FROM book
WHERE rental_price >=7;
SELECT * FROM expensive_book;

-- Q12  Retrieve the List of Books Not Yet Returned
SELECT * FROM issue_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;
