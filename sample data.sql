-- ============================================================
-- Sample Data for CampusConnect Database
-- ============================================================

-- ============================================================
-- STUDENTS (10 Records)
-- ============================================================

INSERT INTO Students (first_name, last_name, email, phone, department, admission_year) VALUES
('Aarav','Sharma','aarav.sharma@email.com','9876543210','Computer Science',2023),
('Diya','Verma','diya.verma@email.com','9876543211','Information Technology',2022),
('Rohan','Singh','rohan.singh@email.com','9876543212','Mechanical',2023),
('Ananya','Gupta','ananya.gupta@email.com','9876543213','Electronics',2021),
('Karan','Mehta','karan.mehta@email.com','9876543214','Civil',2024),
('Sneha','Patel','sneha.patel@email.com','9876543215','Computer Science',2023),
('Rahul','Joshi','rahul.joshi@email.com','9876543216','Mechanical',2022),
('Priya','Kapoor','priya.kapoor@email.com','9876543217','Electronics',2021),
('Arjun','Nair','arjun.nair@email.com','9876543218','Information Technology',2024),
('Meera','Rao','meera.rao@email.com','9876543219','Computer Science',2022);

-- ============================================================
-- INSTRUCTORS (10 Records)
-- ============================================================

INSERT INTO Instructors (instructor_name,email,office,department) VALUES
('Dr. Amit Kumar','amit.kumar@college.edu','A101','Computer Science'),
('Dr. Neha Singh','neha.singh@college.edu','A102','Information Technology'),
('Dr. Raj Patel','raj.patel@college.edu','B201','Mechanical'),
('Dr. Pooja Shah','pooja.shah@college.edu','B202','Electronics'),
('Dr. Vivek Rao','vivek.rao@college.edu','C301','Civil'),
('Dr. Sonia Mehta','sonia.mehta@college.edu','A103','Computer Science'),
('Dr. Rohit Jain','rohit.jain@college.edu','A104','Information Technology'),
('Dr. Kavita Gupta','kavita.gupta@college.edu','B203','Mechanical'),
('Dr. Sanjay Das','sanjay.das@college.edu','C302','Civil'),
('Dr. Ritu Kapoor','ritu.kapoor@college.edu','B204','Electronics');

-- ============================================================
-- COURSES (10 Records)
-- ============================================================

INSERT INTO Courses
(course_name,credits,department,available_seats,instructor_id)
VALUES
('Database Management Systems',4,'Computer Science',40,1),
('Operating Systems',4,'Computer Science',35,6),
('Data Structures',4,'Computer Science',30,1),
('Computer Networks',3,'Information Technology',45,2),
('Software Engineering',3,'Information Technology',50,7),
('Thermodynamics',4,'Mechanical',40,3),
('Machine Design',4,'Mechanical',25,8),
('Digital Electronics',3,'Electronics',30,4),
('Structural Engineering',4,'Civil',20,5),
('Surveying',3,'Civil',35,9);

-- ============================================================
-- ENROLLMENTS (10 Records)
-- ============================================================

INSERT INTO Enrollments
(student_id,course_id,semester,grade)
VALUES
(1,1,'Fall 2026','A'),
(2,4,'Fall 2026','B'),
(3,6,'Fall 2026','A'),
(4,8,'Fall 2026','A'),
(5,9,'Fall 2026','B'),
(6,2,'Spring 2027',NULL),
(7,7,'Spring 2027',NULL),
(8,8,'Spring 2027','A'),
(9,5,'Spring 2027','B'),
(10,3,'Spring 2027',NULL);

-- ============================================================
-- Referential Integrity Demonstration
-- (Execute this separately AFTER the above inserts.)
-- It will fail because student_id = 999 does not exist.
-- This demonstrates insertion-order dependency.
-- ============================================================

/*
INSERT INTO Enrollments
(student_id,course_id,semester,grade)
VALUES
(999,1,'Fall 2026','A');
*/