USE LibraryDB;

-- 1️ INSERT INTO Authors

INSERT INTO Authors (AuthorName, Country)
VALUES 
  ('Chetan Bhagat', 'India'),
  ('J.K. Rowling', 'UK'),
  ('George R.R. Martin', NULL),  -- country is unknown
  ('Arundhati Roy', 'India'),
  ('Yogesh Dcruz', 'India'),
  ('Ajinkya Oberoy','Paris'),
  ('Yogesh Londhe','Jarmay');
  
 -- 2️ INSERT INTO Members (With Partial Values & NULLs)
 
INSERT INTO Members (FullName, Email)
VALUES 
  ('Ravi Kumar', 'ravi.k@example.com'),
  ('Sneha Singh', NULL),   -- no email given
  ('Amit Das', 'amit.das@example.com'),
  ('Arjun Roy','arjunroy12@gmail.com');
  
  -- 3️ UPDATE: Fill missing email for Sneha
-- NOTE:
-- Initially faced ERROR 1175: "You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column."
-- This happened because the WHERE clause used a non-unique column (e.g., FullName), which may match multiple records.
-- FIX: Use the PRIMARY KEY (e.g., MemberID) in the WHERE clause to safely update one specific record.
-- Example: -- UPDATE Members SET Email = 'sneha.singh@example.com' WHERE MemberID = 2;

UPDATE Members
SET Email = 'sneha.singh@example.com'
WHERE MemberID = 2;

-- 4️ DELETE: Remove an author with no country (null)

DELETE FROM Authors
WHERE authorid = 3;
  
    -- 5️ INSERT Categories
    
  INSERT INTO Categories (CategoryName)
VALUES
  ('Romance'),
  ('Fantasy'),
  ('Political Fiction'),
  ('Thriller');

 -- 6 INSERT Publishers
 
INSERT INTO Publishers (PublisherName, ContactEmail)
VALUES
  ('Rupa Publications', 'contact@rupa.com'),
  ('Bloomsbury', 'info@bloomsbury.com'),
  ('Penguin Random House', 'support@penguin.com'),
  ('HarperCollins', 'connect@harpercollins.com');
  
  -- 7 INSERT Books (With Foreign Keys)
INSERT INTO Books (Title, AuthorID, CategoryID, PublisherID, ISBN, PublishedYear, QuantityAvailable)
VALUES 
  ('Half Girlfriend', 1, 1, 1, '978-93-86228-23-1', 2014, 10),
  ('Harry Potter', 2, 2, 2, '978-0-7475-3269-9', 1997, 5);
  
  select * from Books;
  
  -- 8 update books Stock
  
  UPDATE BOOKS 
  SET QuantityAvailable = QuantityAvailable + 2
  WHERE AuthorID = 1;
  
  