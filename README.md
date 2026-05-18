# 📚 Library Management System using SQL

![SQL](https://img.shields.io/badge/Database-MySQL-blue?style=flat-square&logo=mysql)
![Level](https://img.shields.io/badge/Level-Intermediate-orange?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![Tasks](https://img.shields.io/badge/Queries-12%20Analytical%20Tasks-purple?style=flat-square)

## Project Overview

**Project Title:** Library Management System  
**Level:** Intermediate  
**Database:** `library_db`  
**Tool:** MySQL Workbench  

This project demonstrates the implementation of a Library Management System using SQL. It includes database design, table relationships, CRUD operations, and advanced SQL queries for real-world data analysis and business reporting.

The purpose of this project is to showcase practical SQL skills in relational database design, data management, and analytical query writing — skills directly applicable to Data Analyst and SQL Developer roles.

---

## Objectives

- Design and create a normalized relational database for library management.
- Create 6 tables for branches, employees, members, books, issued books, and returned books.
- Implement CRUD operations on records with proper constraints.
- Use multi-table JOINs (including self-JOIN) to connect related data.
- Generate business reports using aggregate functions.
- Use CTAS (`CREATE TABLE AS SELECT`) for summary tables.
- Answer real business questions through SQL data analysis.

---

## Project Structure

```text
Library-Management-System-using-SQL/
│
├── create_table.sql        # DDL — creates all tables with PK/FK constraints
├── insert_queries.sql      # DML — inserts sample data into all tables
├── project_task.sql        # 12 analytical queries and business tasks
│
├── books.csv               # Sample books dataset
├── branch.csv              # Branch records
├── employees.csv           # Employee data
├── members.csv             # Member registration data
├── issued_status.csv       # Book issue transaction records
├── return_status.csv       # Book return records
│
├── schema-diagram.png      # Entity-relationship diagram
└── README.md
```

---

## Database Schema

![Database Schema](https://github.com/user-attachments/assets/7dddeb60-8563-4229-95c9-e8496ca95741)

**6 Tables — Relationships at a glance:**

| Table | Connected To | Relationship |
|-------|-------------|--------------|
| `branch` | `employee` | One branch → many employees |
| `employee` | `branch`, `issue_status` | Employee issues books |
| `member` | `issue_status` | Member borrows books |
| `book` | `issue_status` | Book gets issued |
| `issue_status` | `return_status` | Issue record → return record |
| `return_status` | `issue_status` | Tracks returned books |

---

## CRUD Operations

### Create
- Inserted new book record: `'To Kill a Mockingbird'` by Harper Lee into the `book` table.

### Read
- Retrieved all books issued by a specific employee (`emp_id = 'E101'`).
- Listed members who issued more than one book using `GROUP BY` + `HAVING`.

### Update
- Updated member address for `member_id = 'C103'` in the `member` table.

### Delete
- Deleted issued status record `issued_id = 'IS121'` from the `issue_status` table.

---

## Tasks Performed

| # | Task | Key SQL Used |
|---|------|-------------|
| 1 | Create a new book record | `INSERT INTO book` |
| 2 | Update an existing member's address | `UPDATE ... SET` |
| 3 | Delete a record from Issued Status | `DELETE WHERE issued_id` |
| 4 | Retrieve all books issued by a specific employee | `SELECT ... WHERE emp_id` |
| 5 | List members who issued more than one book | `GROUP BY`, `HAVING COUNT(*) > 1` |
| 6 | Create summary tables using CTAS | `CREATE TABLE AS SELECT`, `JOIN` |
| 7 | Retrieve all books in a specific category | `WHERE category = 'History'` |
| 8 | Find total rental income by category | `SUM()`, `JOIN`, `GROUP BY` |
| 9 | List members registered in the last 180 days | `CURRENT_DATE - INTERVAL 180 DAY` |
| 10 | List employees with their branch manager's name | **Self-JOIN** on `employee` table |
| 11 | Create a table of books above rental threshold | `CREATE TABLE AS SELECT WHERE rental_price >= 7` |
| 12 | Retrieve list of books not yet returned | `LEFT JOIN` + `WHERE return_id IS NULL` |

---

## Key SQL Queries

```sql
-- Self-JOIN: Each employee with their branch manager's name
SELECT e1.*, e2.emp_name AS manager
FROM employee AS e1
JOIN branch AS b ON e1.branch_id = b.branch_id
JOIN employee AS e2 ON b.manager_id = e2.emp_id;
```

```sql
-- LEFT JOIN NULL: Books that have never been returned (overdue tracking)
SELECT * FROM issue_status AS ist
LEFT JOIN return_status AS rs ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;
```

```sql
-- Aggregate report: Total rental income and issue count by book category
SELECT b.category,
       COUNT(*) AS times_issued,
       SUM(b.rental_price) AS total_rental_income
FROM book AS b
JOIN issue_status AS ist ON ist.issued_book_isbn = b.isbn
GROUP BY b.category;
```

```sql
-- Date filter: Members who registered in the last 180 days
SELECT * FROM member
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;
```

---

## Reports and Analysis

- **Rental income report** — total earnings broken down by book category
- **Overdue book tracking** — full list of books not yet returned using NULL detection
- **Member activity report** — members who have issued multiple books
- **Employee-manager hierarchy** — each employee with their branch manager via self-join
- **New member trends** — registrations in the last 180 days
- **Premium book inventory** — CTAS table for books above rental price threshold

---

## SQL Concepts Used

`CREATE DATABASE` · `CREATE TABLE` · `ALTER TABLE` · `PRIMARY KEY` · `FOREIGN KEY` ·
`INSERT` · `UPDATE` · `DELETE` · `SELECT` · `WHERE` · `JOIN` · `Self-JOIN` · `LEFT JOIN` ·
`GROUP BY` · `HAVING` · `ORDER BY` · `SUM()` · `COUNT()` · `CTAS` · `Date Functions` · `NULL Handling`

---

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/ayushjayswar/Library-Management-System-using-SQL.git
   ```

2. Open **MySQL Workbench** or any MySQL client.

3. Run files in this order:
   ```
   1. create_table.sql     → sets up the database schema
   2. insert_queries.sql   → loads all sample data
   3. project_task.sql     → runs all 12 analytical queries
   ```

---

## Author

**Ayush Jayswar**  
MCA (AI/ML) · LNCT University, Bhopal  
📧 Ayushjayswra@gmail.com  
🔗 [GitHub](https://github.com/ayushjayswar)  

> This project demonstrates practical SQL skills required for database management and data analysis roles — including schema design, CRUD, multi-table JOINs, aggregate reporting, and business intelligence queries.
