/*
=====================================================================================
DDL Script: Create Library_Schema Tables
=====================================================================================
Script Purpose: 
    This script creates tables in the 'library_schema' schema, dropping existing tables
    if they already exist.
=====================================================================================
*/

-- 1. Authors Table
IF OBJECT_ID('library_schema.Authors', 'U') IS NOT NULL
    DROP TABLE library_schema.Authors;
GO

CREATE TABLE library_schema.Authors (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    author_name NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME NULL
);
GO

-- 2. Books Table
IF OBJECT_ID('library_schema.Books', 'U') IS NOT NULL
    DROP TABLE library_schema.Books;
GO

CREATE TABLE library_schema.Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    book_name NVARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    book_publication NVARCHAR(100) NOT NULL,
    publish_date DATE NOT NULL,
    is_available BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME NULL,
    FOREIGN KEY (author_id) REFERENCES library_schema.Authors(author_id)
);
GO

-- 3. Members Table
IF OBJECT_ID('library_schema.Members', 'U') IS NOT NULL
    DROP TABLE library_schema.Members;
GO

CREATE TABLE library_schema.Members (
    member_id INT PRIMARY KEY IDENTITY(1,1),
    member_name VARCHAR(50) NOT NULL,
    member_email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME NULL
);
GO

-- 4. Borrow Table
IF OBJECT_ID('library_schema.Borrow', 'U') IS NOT NULL
    DROP TABLE library_schema.Borrow;
GO

CREATE TABLE library_schema.Borrow (
    borrow_id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME NULL,
    CHECK (return_date IS NULL OR borrow_date <= return_date),
    FOREIGN KEY (book_id) REFERENCES library_schema.Books(book_id),
    FOREIGN KEY (member_id) REFERENCES library_schema.Members(member_id)
);
GO
