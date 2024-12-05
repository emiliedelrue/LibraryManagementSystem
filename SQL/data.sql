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
