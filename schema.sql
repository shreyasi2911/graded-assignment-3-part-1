-- ============================================================
-- CampusConnect Database Schema
-- ============================================================

-- Drop tables if they already exist
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;

-- ============================================================
-- TABLE: Students
-- ============================================================

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50) NOT NULL,
    admission_year YEAR NOT NULL DEFAULT 2026
);

-- ============================================================
-- TABLE: Instructors
-- ============================================================

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    office VARCHAR(30),
    department VARCHAR(50) NOT NULL
);

-- ============================================================
-- TABLE: Courses
-- ============================================================

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    department VARCHAR(50) NOT NULL,
    available_seats INT NOT NULL,
    instructor_id INT NOT NULL,

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- TABLE: Enrollments
-- ============================================================

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    grade CHAR(2),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ============================================================
-- INDEXES
-- ============================================================

-- Index on student email
CREATE INDEX idx_student_email
ON Students(email);

-- Index on course department
CREATE INDEX idx_course_department
ON Courses(department);

-- Composite index on student_id and course_id
CREATE INDEX idx_enrollment_student_course
ON Enrollments(student_id, course_id);