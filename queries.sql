-- ============================================================
-- CampusConnect Database Queries
-- ============================================================

-- ============================================================
-- Task 4.1 - Query using IN
-- Find students belonging to Computer Science or Mechanical departments.
-- ============================================================

SELECT *
FROM Students
WHERE department IN ('Computer Science', 'Mechanical');



-- ============================================================
-- Task 4.2 - Query using BETWEEN
-- Find courses having available seats between 25 and 40.
-- ============================================================

SELECT *
FROM Courses
WHERE available_seats BETWEEN 25 AND 40;



-- ============================================================
-- Task 4.3 - Query using IS NULL
-- Find enrollments where grades have not yet been assigned.
-- ============================================================

SELECT *
FROM Enrollments
WHERE grade IS NULL;



-- ============================================================
-- Task 4.4 - GROUP BY with HAVING
-- Display departments having more than two students.
-- ============================================================

SELECT department,
       COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 2;



-- ============================================================
-- Task 4.5 - INNER JOIN
-- Display student names along with enrolled course names.
-- ============================================================

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    e.semester,
    e.grade
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;



-- ============================================================
-- Task 4.6 - LEFT JOIN
-- Display all students including those without enrollments.
-- ============================================================

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id;



-- ============================================================
-- Task 4.7 - RIGHT JOIN
-- Display all courses including those with no enrollments.
-- ============================================================

SELECT
    c.course_id,
    c.course_name,
    s.first_name,
    s.last_name
FROM Students s
RIGHT JOIN Enrollments e
ON s.student_id = e.student_id
RIGHT JOIN Courses c
ON c.course_id = e.course_id;



-- ============================================================
-- Task 4.8 - Scalar Subquery
-- Find students admitted in the latest admission year.
-- ============================================================

SELECT *
FROM Students
WHERE admission_year =
(
    SELECT MAX(admission_year)
    FROM Students
);



-- ============================================================
-- Task 4.9 - Correlated Subquery
-- Find students enrolled in more than one course.
-- ============================================================

SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM Students s
WHERE
(
    SELECT COUNT(*)
    FROM Enrollments e
    WHERE e.student_id = s.student_id
) > 1;



-- ============================================================
-- Task 4.10 - EXISTS
-- Display students who have at least one enrollment.
-- ============================================================

SELECT *
FROM Students s
WHERE EXISTS
(
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = s.student_id
);



-- ============================================================
-- Task 4.11 - UNION
-- Display all student and instructor names.
-- ============================================================

SELECT first_name AS Name
FROM Students

UNION

SELECT instructor_name
FROM Instructors;



-- ============================================================
-- Task 4.12 - Window Function (ROW_NUMBER)
-- Rank students within each department.
-- ============================================================

SELECT
    student_id,
    first_name,
    last_name,
    department,
    ROW_NUMBER() OVER
    (
        PARTITION BY department
        ORDER BY first_name
    ) AS Department_Rank
FROM Students;