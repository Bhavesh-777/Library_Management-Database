DROP DATABASE IF EXISTS LibraryDB;

CREATE DATABASE LibraryDB;

USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE Categories (
    CategoryID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Publishers (
    PublisherID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE Books (
    BookID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT UNSIGNED,
    CategoryID INT UNSIGNED,
    PublisherID INT UNSIGNED,
    ISBN VARCHAR(20) UNIQUE,
    PublishedYear YEAR,
    QuantityAvailable INT DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
) ENGINE=InnoDB;

-- 6. Members
CREATE TABLE Members (
    MemberID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    MembershipDate timestamp DEFAULT current_timestamp)
    ENGINE=InnoDB;



-- 7. Staff
CREATE TABLE Staff (
    StaffID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    StaffName VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

-- 8. Loans
CREATE TABLE Loans (
    LoanID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    BookID INT UNSIGNED NOT NULL,
    MemberID INT UNSIGNED NOT NULL,
    StaffID INT UNSIGNED,
    LoanDate timestamp default current_timestamp,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
) ENGINE=InnoDB;

