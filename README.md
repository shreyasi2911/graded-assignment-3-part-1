# CampusConnect Database Management System

## Student Database Project

### Database Engine
**MySQL Workbench 8.0**

---

# Project Overview

CampusConnect is a relational database designed to manage student records, course information, instructors, and enrollments. The database enforces referential integrity using foreign keys and follows Third Normal Form (3NF) to reduce redundancy and improve consistency.

---

# Database Schema

The project contains four tables:

1. Students
2. Instructors
3. Courses
4. Enrollments

Relationships:

- One instructor can teach many courses.
- One student can enroll in many courses.
- One course can have many students.
- Enrollments acts as the bridge table between Students and Courses.

---

# Normalization Write-up

## Unnormalized Form (UNF)

Initially, all information could be stored in a single table.

Example:

| Student | Department | Course 1 | Course 2 | Instructor | Grade |
|----------|------------|----------|----------|------------|-------|
| Aarav | Computer Science | DBMS | OS | Dr. Amit | A |

This design has several problems:

- Repeating groups of courses.
- Duplicate instructor information.
- Data redundancy.
- Update anomalies.
- Deletion anomalies.
- Insertion anomalies.

---

## First Normal Form (1NF)

The schema satisfies First Normal Form because:

- Every table has a primary key.
- Every column stores only atomic values.
- No repeating groups exist.
- Each row is unique.

Example:

Instead of storing multiple courses inside one row, each enrollment is stored as a separate record in the Enrollments table.

---

## Second Normal Form (2NF)

Second Normal Form removes partial dependency.

In this database:

- Students stores only student information.
- Courses stores only course information.
- Instructors stores only instructor information.
- Enrollments stores only enrollment information.

No non-key attribute depends on only part of a composite key.

Student details depend only on student_id.

Course details depend only on course_id.

Instructor details depend only on instructor_id.

---

## Third Normal Form (3NF)

Third Normal Form removes transitive dependency.

For example,

Instructor email is stored only in the Instructors table rather than inside Courses.

Department information belongs only to Students and Courses where appropriate.

No non-key attribute depends on another non-key attribute.

Therefore, the database satisfies Third Normal Form.

---

# Sample Data

The project contains:

- 10 Students
- 10 Instructors
- 10 Courses
- 10 Enrollments

The sample data demonstrates:

- Foreign key relationships
- NULL values
- Aggregate queries
- Window functions
- Join operations

---

# Query Features

The SQL queries demonstrate the following concepts:

- IN
- BETWEEN
- IS NULL
- GROUP BY with HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Scalar Subquery
- Correlated Subquery
- EXISTS
- UNION
- ROW_NUMBER()

---

# Indexing Justification

## Index 1

```sql
CREATE INDEX idx_student_email
ON Students(email);
```

Reason:

The email column is frequently searched when retrieving a student record.

This index speeds up lookup operations performed using the email field.

---

## Index 2

```sql
CREATE INDEX idx_course_department
ON Courses(department);
```

Reason:

Many queries filter courses by department.

This index reduces search time for department-based queries.

---

## Composite Index

```sql
CREATE INDEX idx_enrollment_student_course
ON Enrollments(student_id, course_id);
```

Reason:

Many join operations use both student_id and course_id together.

The composite index speeds up joins and enrollment lookups.

---

## Column Not Indexed

The grade column was intentionally not indexed.

Reason:

- Very low cardinality.
- Frequently updated.
- Rarely used for searching.

Creating an index would increase storage and slow insert/update operations while providing little performance benefit.

---

# Transactions

The project includes a transaction that:

1. Decreases available seats.
2. Inserts an enrollment.
3. Commits both operations together.

If an error occurs, the transaction is rolled back to maintain database consistency.

---

# Concurrency and Isolation Level

## Scenario

Suppose there is only one seat remaining in the Database Management Systems course.

Student A and Student B attempt to enroll at the same time.

Without proper transaction isolation:

- Both users read available_seats = 1.
- Both transactions decrease the value.
- Both enrollments succeed.
- The course becomes overbooked.

This is known as a Lost Update problem.

---

## Recommended Isolation Level

Serializable

Reason:

Serializable isolation executes transactions as if they occur one after another.

It prevents:

- Dirty Reads
- Non-repeatable Reads
- Phantom Reads
- Lost Updates

Although Serializable has the highest locking overhead, it provides the strongest consistency for course enrollment.

---

# Referential Integrity

The schema enforces referential integrity using foreign keys.

Examples:

- A course cannot reference a non-existent instructor.
- An enrollment cannot reference a non-existent student.
- An enrollment cannot reference a non-existent course.

Attempting to insert such records results in a foreign key constraint error.

---

# Files Included

schema.sql

Creates all database tables and indexes.

sample_data.sql

Inserts sample records into every table.

queries.sql

Contains all required SQL queries.

transactions.sql

Demonstrates transaction management using COMMIT and ROLLBACK.

README.md

Provides documentation for schema design, normalization, indexing, and concurrency.

---

# Conclusion

The CampusConnect database is a fully normalized relational database that satisfies Third Normal Form (3NF). It maintains data integrity using primary keys, foreign keys, and constraints. The project demonstrates SQL querying techniques, indexing strategies, and transaction management while following good database design principles.
