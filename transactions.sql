-- ============================================================
-- CampusConnect Database Transactions
-- ============================================================

-- ============================================================
-- Task 6 - Transaction
-- Scenario:
-- Student with student_id = 1 enrolls in course_id = 1.
-- The transaction decreases the available seats and inserts
-- an enrollment record. Both operations succeed together or
-- neither is applied.
-- ============================================================

START TRANSACTION;

-- Reduce available seats by 1
UPDATE Courses
SET available_seats = available_seats - 1
WHERE course_id = 1
AND available_seats > 0;

-- Insert enrollment record
INSERT INTO Enrollments
(student_id, course_id, semester, grade)
VALUES
(1,1,'Fall 2027',NULL);

COMMIT;



-- ============================================================
-- Rollback Example
-- Demonstrates undoing changes
-- ============================================================

START TRANSACTION;

UPDATE Courses
SET available_seats = available_seats - 1
WHERE course_id = 2;

INSERT INTO Enrollments
(student_id, course_id, semester, grade)
VALUES
(2,2,'Fall 2027',NULL);

-- Cancel all changes
ROLLBACK;



-- ============================================================
-- Verify Results
-- ============================================================

SELECT *
FROM Courses;

SELECT *
FROM Enrollments;