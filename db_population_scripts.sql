USE relational_db_schema;

-- Generates students
  DELIMITER //
  CREATE PROCEDURE generateStudents()
  BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE (i <=  100) DO
    INSERT INTO students (students_name) VALUES (concat( "Student" ,CAST(i as char(8))));
    SET i = i + 1;
  END WHILE;
  END;
  //



  call generateStudents();


-- Generates Professors
DELIMITER //
CREATE PROCEDURE generateProfessors()
BEGIN
DECLARE i INT DEFAULT 1;
WHILE (i <= 10 ) DO
   INSERT INTO professors (professors_name) VALUES (concat( "Professor" ,CAST(i as char(8))));
	SET i = i + 1;
END WHILE;
END;
//

call generateProfessors();

--Generates Courses
DELIMITER //
CREATE PROCEDURE generateCourses()
BEGIN
-- courses_ students_id Iterator
DECLARE i INT DEFAULT 101;
-- courses_professors_id Iterator
DECLARE p INT DEFAULT 1;
-- courses_students_id Iterator

WHILE (p <= 100 ) DO
   INSERT INTO courses (
       courses_title,
       courses_professors_id,
       courses_students_id
       )
       VALUES (
           concat( "Course" ,CAST(i as char(8))),
           p,
           i
           );
	SET p = p + 1;
    SET i = i + 1;
END WHILE;
END;
//

call generateCourses();

-- Generates Grades
DELIMITER //
CREATE PROCEDURE generateGrades()
BEGIN
-- regular iterator
DECLARE p INT DEFAULT 1;
-- students_id iterator
DECLARE i INT DEFAULT 101;
-- courses_id iterator
DECLARE C INT DEFAULT 51;

WHILE (i <= 200 ) DO
INSERT INTO grades (
	    grades_grade,
	    grades_professors_id,
	    grades_students_id,
	    grades_courses_id
	  )
	  VALUES (
        CONCAT( "Grade " , char((68 - 64 )*rand() + 65)),
        p,
        i,
        c
      );
      
      CASE WHEN (c < 60) THEN
        SET p = p + 1;
	    SET i = i + 1;
	    SET c = c + 1;
	  ELSE
		SET p = p - 9;
	    SET i = i + 1;
	    SET c = c - 9;
	  END CASE;
END WHILE;
END;
//

CALL generateGrades();