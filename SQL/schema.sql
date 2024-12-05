CREATE DATABASE administration;
USE administration;

-- Task 1 --
CREATE TABLE Students (
	student_id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	gender VARCHAR(10)
);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY,
	course_name VARCHAR(50),
	credits INT,
	capacity INT
);

CREATE TABLE Enrollments (
	enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
	student_id INT,
	course_id INT,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
	FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Task 2 --
INSERT INTO Students (student_id, name, age, gender) VALUES
(1, 'Priya', 22, 'Female'),
(2, 'Camille', 22, 'Male'),
(3, 'Charlie', 21, 'Male'),
(4, 'Jules', 23, 'Male'),
(5, 'Oceane', 20, 'Female');


INSERT INTO Courses (course_id, course_name, credits, capacity) VALUES
(1, 'Math', 3, 30),
(2, 'History', 4, 25),
(3, 'French', 5, 20),
(4, 'P.E.', 3, 35);


INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1), (1, 3), (1, 4), (2, 1), (2, 2), (3, 2), (3, 4), (4, 3), (4, 4), (5, 2), (5,4);

-- Task 3, 4, 5 --
-- Query 1 --
SELECT s.name AS student_name, c.course_name, c.credits
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Query 2 --
SELECT name
FROM Students
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Enrollments);

-- Query 3 --
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Query 4 --
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > c.capacity / 2;

-- Query 5 --
SELECT s.name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.name
HAVING COUNT(e.course_id) = (SELECT MAX(course_count) FROM (
	SELECT COUNT(course_id) AS course_count
	FROM Enrollments
	GROUP BY student_id) AS subquery);
	
-- Query 6 --
SELECT s.name, SUM(c.credits) AS total_credits
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.name;

-- Query 7 --
SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- Task 6 --



-- Task 7 --
DELETE FROM Enrollments WHERE course_id = 1;  -- Replace 1 with the specific course_id

DELETE FROM Students WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Enrollments);
