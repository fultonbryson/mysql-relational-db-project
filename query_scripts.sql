-- Queries
USE relational_db_schema;

-- Average grade given by professors
SELECT
  g.grades_grade,
  p.professors_id,
  p.professors_name,
  COUNT(g.grades_grade) AS 'average_grade'

FROM grades g
JOIN professors p
ON g.grades_professors_id = p.professors_id

GROUP BY 
  p.professors_id,
  p.professors_name,
  g.grades_grade
  
ORDER BY 
  'average_grade' DESC

LIMIT 1;

-- Highest grades obtained by students
SELECT 
  grades.grades_grade,
  grades.grades_courses_id,
  students.students_id,
  students.students_name,
  courses.courses_id,
  courses.courses_title,
  ASCII (RIGHT (grades.grades_grade, 1)) AS students_grade
  
FROM grades
JOIN students
ON grades.grades_students_id = students.students_id
JOIN courses
ON grades.grades_courses_id = courses.courses_id
ORDER BY students_grade ASC;

-- Group Students by courses
SELECT
  s.students_id,
  s.students_name,
  c.courses_title

FROM grades g
JOIN students s
ON g.grades_students_id = s.students_id
JOIN courses c
ON g.grades_courses_id = c.courses_id

ORDER BY (c.courses_id) DESC;

-- Course summary report (ordered from most-to-least difficult)
SELECT
  c.courses_title,
  FLOOR(AVG(ASCII (RIGHT (g.grades_grade, 1))) + 0.5) average_grade
  
FROM grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id

GROUP BY
  g.grades_courses_id,
  c.courses_title

ORDER BY avg_grade ASC;

-- Student-Professor courses in common
SELECT
  s.students_name,
  COUNT(c.courses_title) AS 'occurence',
  c.courses_title,
  p.professors_name

FROM grades g
JOIN students s
ON g.grades_students_id = s.students_id
JOIN courses c
ON g.grades_courses_id = c.courses_id
JOIN professors p
ON g.grades_professors_id = p.professors_id

GROUP BY
  s.students_name,
  c.courses_title,
  p.professors_name
  
ORDER BY 'occurence' DESC

LIMIT 1;