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
-- Je n'ai pas vu les implement Constraints en cours.


-- Task 7 --
DELETE FROM Enrollments WHERE course_id = 1;  -- Replace 1 with the specific course_id

DELETE FROM Students WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Enrollments);