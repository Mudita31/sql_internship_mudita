# 📚 Library Management Database (SQL Server)

This project demonstrates the design and implementation of a relational database schema for managing a small-scale library system.
It includes key entities such as books, authors, members, and borrow records, with structured relationships and best practices like schema separation, audit trails, and referential integrity.

---

## 🧱 Features

- **Modular Schema Structure**: All tables are created within a custom schema `library_schema` for clear organization.
- **Core Tables**:
  - `Authors`: Stores information about book authors.
  - `Books`: Stores book metadata and availability status.
  - `Members`: Stores library member details.
  - `Borrow`: Tracks which member has borrowed which book and when.
- **Audit Columns**: Every table includes `created_at` and `updated_at` fields to support change tracking.
- **Referential Integrity**: Foreign key constraints ensure consistent relationships between entities.
- **Re-runnable DDL**: Safe table dropping using `IF OBJECT_ID()` makes the script re-executable without manual cleanup.
- **Data Validity Checks**: Includes `CHECK` constraint to ensure borrow and return dates are logically correct.

---

## 🗃️ Technologies Used

- **SQL Server (T-SQL)**
- `CREATE SCHEMA`, `FOREIGN KEY`, `CHECK`, `IDENTITY`, `DATETIME`
- Clean, documented, and maintainable DDL practices

---

## 🚀 Getting Started

1. Open SQL Server Management Studio (SSMS).
2. Run the `Create_Database_And_Schema.sql` script to:
   - Drop the existing `Library` database (if it exists)
   - Recreate the database and `library_schema`
3. Run the `Create_Tables.sql` script to:
   - Create all four main tables inside the `library_schema`
   - Add necessary constraints and audit columns
4. Run the `Insert_Data.sql` script to:
   - Insert seed data for Authors, Books, Members, and Borrow records
5. Run the `Library_Operations.sql` script to:
   - Practice and demonstrate basic SQL operations like `UPDATE`, `DELETE`, and `SELECT` with `WHERE`

---

## ⚙️ Sample Queries (`Library_Operations.sql`)

```sql
-- Update a return date
UPDATE library_schema.Borrow
SET return_date = '2024-06-26'
WHERE borrow_id = 1;

-- Delete a borrow record
DELETE FROM library_schema.Borrow
WHERE borrow_id = 3;

-- View all currently borrowed books (not yet returned)
SELECT * FROM library_schema.Borrow
WHERE return_date IS NULL;

-- List books published after 2000
SELECT * FROM library_schema.Books
WHERE publish_date > '2000-01-01';

-- Get members who joined in June 2024
SELECT * FROM library_schema.Members
WHERE MONTH(join_date) = 6 AND YEAR(join_date) = 2024;
