-- 1. DATABASE SETUP (DDL)
CREATE DATABASE student_project_submission_tracker;
USE student_project_submission_tracker;

-- CREATE TABLE Commands (DDL: Create)

-- DEPARTMENT Table
CREATE TABLE department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

-- STUDENT Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_no VARCHAR(15),
    batch VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- FACULTY Table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_no VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- COURSE Table
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    semester INT,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);


-- PROJECT Table
CREATE TABLE Project (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    max_marks INT DEFAULT 100,
    deadline DATE NOT NULL,
    faculty_id INT,
    course_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- SUBMISSION Table (Includes the crucial 'status' column)
CREATE TABLE submission (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    project_id INT,
    submission_date DATE,
    file_link VARCHAR(255),
    status VARCHAR(20) DEFAULT 'Submitted',
    grade INT,
    faculty_comments TEXT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- REVIEW Table
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    submission_id INT,
    marks_awarded INT,
    feedback TEXT,
    review_date DATE,
    FOREIGN KEY (submission_id) REFERENCES submission(submission_id)
);


-- 3. INITIAL DATA (DML: Insert)
INSERT INTO department (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Information Science'),
(3, 'Electronics');


-- 4. TRIGGER IMPLEMENTATION (Triggers)
DELIMITER //

CREATE TRIGGER before_project_delete
BEFORE DELETE ON Project
FOR EACH ROW
BEGIN
    -- Deletes associated submissions when a project is deleted.
    DELETE FROM submission WHERE project_id = OLD.project_id;
END; //

DELIMITER ;


-- 5. STORED PROCEDURE IMPLEMENTATION (Procedures/Functions)
DELIMITER //

CREATE PROCEDURE SP_SubmitProject (
    IN p_student_id INT,
    IN p_project_id INT,
    IN p_submission_date DATE,
    IN p_file_link VARCHAR(255)
)
BEGIN
    DECLARE submission_exists INT DEFAULT 0;

    -- Check if a submission already exists for this student and project
    SELECT COUNT(submission_id) INTO submission_exists
    FROM submission
    WHERE student_id = p_student_id AND project_id = p_project_id;

    IF submission_exists > 0 THEN
        -- If it exists, UPDATE (re-submission logic)
        UPDATE submission
        SET 
            submission_date = p_submission_date,
            file_link = p_file_link,
            status = 'Submitted', 
            grade = NULL, 
            faculty_comments = NULL
        WHERE student_id = p_student_id AND project_id = p_project_id;
        
        SELECT 'RE_SUBMITTED' AS status_result;
    ELSE
        -- If it does not exist, INSERT (new submission logic)
        INSERT INTO submission (student_id, project_id, submission_date, file_link, status)
        VALUES (p_student_id, p_project_id, p_submission_date, p_file_link, 'Submitted');
        
        SELECT 'INSERTED' AS status_result;
    END IF;
END //

DELIMITER ;