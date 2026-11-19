CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE Marks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

INSERT INTO Students (name, department)
VALUES ('Anjali', 'CSE'),
       ('Rahul', 'ECE'),
       ('Priya', 'CSE');

INSERT INTO Marks (student_id, subject, marks)
VALUES (1, 'Java', 85),
       (1, 'SQL', 90),
       (2, 'Java', 70),
       (2, 'SQL', 75),
       (3, 'Java', 95),
       (3, 'SQL', 88);

SELECT * FROM Students;
SELECT * FROM Marks;

SELECT s.name, m.subject, m.marks
FROM Students s
JOIN Marks m ON s.id = m.student_id;

SELECT s.name, AVG(m.marks) AS average_marks
FROM Students s
JOIN Marks m ON s.id = m.student_id
GROUP BY s.id, s.name;

SELECT s.name, SUM(m.marks) AS total_marks
FROM Students s
JOIN Marks m ON s.id = m.student_id
GROUP BY s.id, s.name;