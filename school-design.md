
# School Database Design

## 1. Tables

### Students
The students table stores each student's ID, name, and email. The student ID is the primary key, and each email must be unique.

### Courses
The courses table stores course IDs, course names, and course codes. The course ID is the primary key, and each course code must be unique.

### Enrollments
The enrollments table connects students to courses and stores their grades. It has its own primary key and foreign keys referencing the students and courses tables. A unique constraint on student_id and course_id prevents duplicate enrolments in the same course.

## 2. Relationships

Students and enrollments have a one-to-many relationship because one student can have multiple enrollments.

Courses and enrollments also have a one-to-many relationship because one course can have multiple enrollments.

Students and courses have a many-to-many relationship because students can take several courses, and each course can have several students. The enrollments table acts as the join table that resolves this many-to-many relationship and stores each student's grade.

## 3. Index

I would add an index on enrollments(course_id) to speed up searches for students enrolled in a particular course and queries that count enrollments per course.

## 4. SQL or NoSQL?

I would choose SQL for this school system because the data is structured and has clear relationships between students, courses, and enrollments. SQL supports primary keys, foreign keys, unique constraints, and joins, which help maintain data integrity. SQLite is suitable for this small system because it is lightweight and does not require a separate database server.
