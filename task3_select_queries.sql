USE LibraryDB;

-- 1️ SELECT all columns from Books

SELECT * FROM Books;

-- 2️ SELECT specific columns from Members

SELECT FullName, Email FROM Members;

-- 3 WHERE: Get all books published after 2010

SELECT TITLE, PUBLISHEDYEAR FROM BOOKS
where PUBLISHEDYEAR > 2010;

-- 4 WHERE + AND: Books by 'Chetan Bhagat' and published after 2010

SELECT B.TITLE, A.AUTHORNAME, B.PUBLISHEDYEAR FROM Authors AS A
LEFT JOIN BOOKS AS B ON A.AuthorID = B.AuthorID
WHERE A.AUTHORNAME = 'CHETAN BHAGAT' AND PUBLISHEDYEAR > 2010;

-- 5️ WHERE + OR: Members with NULL email or name containing 'Singh'

SELECT * FROM Members
WHERE Email IS NULL OR FullName LIKE '%Singh%';

-- 6 LIKE: Find books with 'Harry' in the title

SELECT TITLE FROM BOOKS 
WHERE TITLE LIKE '%HARRY%';

-- 7 BETWEEN: Books published between 1990 and 2010

SELECT TITLE, PUBLISHEDYEAR FROM BOOKS
WHERE PUBLISHEDYEAR between 1910 AND 2010;

-- 8 ORDER BY: Show books sorted by title

SELECT TITLE, PUBLISHEDYEAR FROM BOOKS
ORDER BY TITLE ASC;

-- 9 ORDER BY DESC: Books sorted by newest first

SELECT TITLE, PUBLISHEDYEAR FROM BOOKS
ORDER BY PUBLISHEDYEAR DESC; 

-- 10 LIMIT: Show only first 3 books

SELECT * FROM Books
LIMIT 3;

-- 1️1 DISTINCT: Show unique publisher IDs used in books

SELECT DISTINCT PUBLISHERID FROM BOOKS;

-- 1️2 Aliasing: Show book titles with their authors using aliases

SELECT B.TITLE AS TITLE_NAME, A.AUTHORNAME AS AUTHOR FROM BOOKS AS B
LEFT JOIN AUTHORS AS A ON 
B.AUTHORID = A.AUTHORID;



