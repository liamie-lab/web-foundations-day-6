
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
(5, 3, 3, 'A');
