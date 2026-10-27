
PRAGMA foreign_keys = ON;

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    course_code TEXT NOT NULL UNIQUE
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE (student_id, course_id)
);

-- Insert students
INSERT INTO students (student_id, name, email) VALUES
(1, 'Michelle Mwikali', 'michelle@example.com'),
(2, 'Brian Otieno', 'brian@example.com'),
(3, 'Grace Wanjiku', 'grace@example.com');

-- Insert courses
INSERT INTO courses (course_id, course_name, course_code) VALUES
(1, 'Database Systems', 'DB101'),
(2, 'Web Development', 'WD102'),
(3, 'Data Science', 'DS103');

-- Insert enrollments
INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 1, 'B+'),
(4, 2, 3, 'A-'),

-- 1. All courses taken by one student (by name)
SELECT s.name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.name = 'Michelle Mwikali';

-- 2. All students enrolled in one course
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Science';

-- 3. Number of students per course
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 4. Students who have no enrollments
SELECT s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 5. Update one enrollment's grade
UPDATE enrollments
SET grade = 'A'
WHERE enrollment_id = 3;
    
(5, 3, 3, 'A');
