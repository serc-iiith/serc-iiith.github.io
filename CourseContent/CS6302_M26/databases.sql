--Install mysql from here for Windows/Ubuntoo - https://dev.mysql.com/downloads/mysql/ (Choose sakila and world db copies)
--Install mysql workbench from here for Windows/Ubuntoo - https://dev.mysql.com/downloads/workbench/
-- 

--Create database
CREATE DATABASE Campus;

--Drop database
DROP DATABASE Campus;

--Create a Table
CREATE TABLE Students (
    StudentID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

--Drop a Table, deletes the entire table
DROP TABLE Students;

--Truncate deletes the data inside a table, but not the table itself.
TRUNCATE TABLE Students;

--Alter to drop a column from existing table
ALTER TABLE Students
DROP COLUMN City;

--Alter the column definition of  a column from existing table
ALTER TABLE Students
MODIFY COLUMN LastName varchar(500);

--Constraints using NOT NULL
CREATE TABLE Students (
    RollNumber int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

--Constraints by altering the table with NOT NULL
ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;

--Constraints by using UNIQUE keyword
CREATE TABLE Students (
    RollNumber int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

--Constraints by using PRIMARY KEY
CREATE TABLE Student (
   ID_Student int NOT NULL  
   RollNumber int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID_Student)
);

--Foreign Key Constraint 

CREATE TABLE Subject (
    SubjectID int NOT NULL,
    SubjectName varchar(255) NOT NULL,
    RollNumber int,
    PRIMARY KEY (SubjectID),
    CONSTRAINT FK_ID_Student FOREIGN KEY (ID_Student)
    REFERENCES Student(ID_Student)
);

--Constraint using CHECK

CREATE TABLE Student (
    ID_Student int NOT NULL,
   RollNumber int NOT NULL,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255),
    Age int,
    CHECK (Age>=16)
);

--Insertion
INSERT INTO Student (ID_Student, RollNumber, FirstName, LastName, Age)
VALUES ('1245', '20162153', 'Sai Anirudh', 'Karre',  '35');

--Selection of data from table
SELECT * FROM Students;


--Filtering the single value data
SELECT * FROM Students WHERE RollNumber='20162153';

--Filtering multi-value data
SELECT * FROM Student WHERE RollNumber in ('20162153','201350856');

--Sort the data based on a column in descending 
SELECT * FROM Student ORDER BY RollNumber DESC;

--Sort the data based on a column in ascending 
SELECT * FROM Student ORDER BY RollNumber ASC;

--Pattern search using filter on a table with multiple condition using AND
SELECT *
FROM Student WHERE FirstName = 'Sai' AND RollNumber LIKE '2016%';

--Pattern search using filter on a table with multiple condition using OR
SELECT *
FROM Student
WHERE FirstName = 'Sai' OR Age = '21';

--Filter using NOT - different variants and wildcard
SELECT * FROM Student WHERE NOT LastName = 'Anirudh';
SELECT * FROM Student WHERE FirstName NOT LIKE 'Sai%';
SELECT * FROM Student WHERE RollNumber NOT BETWEEN 20162153 AND 20162169;
SELECT * FROM Student WHERE RollNumber NOT IN ('20162153', '20162169');
SELECT * FROM Student WHERE  NOT Age > 17;

--Updating data using a Filter
UPDATE Student
SET Age = '23', City= 'Hyderabad'
WHERE RollNumber = 20162153;

--deletion of data for specific filter
DELETE FROM Student WHERE RollNumber='20162153';

--Aggregate function MIN(), MAX(), COUNT(), SUM(), AVG()
SELECT MIN(Marks) FROM Subjects WHERE RollNumber='20162153';
SELECT MAX(Marks) FROM Subjects WHERE RollNumber='20162153';
SELECT SUM(Marks) FROM Subjects WHERE RollNumber='20162153' AND Semester='2';
SELECT AVG(Marks) FROM Subjects WHERE RollNumber='20162153' AND Semester in ('1','2','3');
SELECT COUNT(RollNumber) from Subjects where Marks > 80 and SubjectName='ISS' and Semester=2;

--Group by & Having to be used with Aggregate Function for summary
SELECT COUNT(RollNumber), SubjectName
FROM Subjects
GROUP BY Marks
HAVING COUNT(RollNumber) > 5;

--Column Alias
SELECT RollNumber AS ID FROM Student;

--JOIN - inner
SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
INNER JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber

--JOIN - left
SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
LEFT JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber

SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
LEFT OUTER JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber

--JOIN - left
SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
RIGHT JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber

SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
RIGHT OUTER JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber

--JOIN - full
SELECT St.RollNumber, Sb.SubjectName, Sb.Semester
FROM Student as St
FULL OUTER JOIN Subjects as Sb ON St.RollNumber=Sb.RollNumber



