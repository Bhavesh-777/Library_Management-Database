USE LibraryDB;

-- 1 Count total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- 2 Count how many books have ISBN values
SELECT COUNT(ISBN) AS BooksWithISBN FROM Books;

-- 3 Total quantity of all books
SELECT SUM(QuantityAvailable) AS TotalQuantity FROM Books;

-- 4 Average quantity of books
SELECT AVG(QuantityAvailable) AS AvgQuantity FROM Books;

-- 5 Rounded average quantity
SELECT ROUND(AVG(QuantityAvailable), 2) AS RoundedAvgQuantity FROM Books;

-- 6 Group by Publisher and count books
SELECT P.PublisherName, COUNT(B.BookID) AS BookCount
FROM Books B
JOIN Publishers P ON B.PublisherID = P.PublisherID
GROUP BY P.PublisherName;

-- 7 Group by Category and sum quantity
SELECT C.CategoryName, SUM(B.QuantityAvailable) AS TotalStock
FROM Books B
JOIN Categories C ON B.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

-- 8 Group by Author, show average quantity
SELECT A.AuthorName, ROUND(AVG(B.QuantityAvailable), 2) AS AvgCopies
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID
GROUP BY A.AuthorName;

-- 9 HAVING: Only show authors with average copies > 5
SELECT A.AuthorName, ROUND(AVG(B.QuantityAvailable), 2) AS AvgCopies
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID
GROUP BY A.AuthorName
HAVING AVG(B.QuantityAvailable) > 5;

-- 10 Count distinct publishers used in Books
SELECT COUNT(DISTINCT PublisherID) AS UniquePublishers FROM Books;
