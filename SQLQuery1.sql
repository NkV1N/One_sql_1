USE education5;

--2
SELECT knowledge.hour, SIN(knowledge.hour) AS Hours FROM knowledge;
--
SELECT 123.78, FLOOR(123.78);
--
SELECT 123.78, CEILING(123.78);
--
SELECT knowledge.hour, EXP(knowledge.hour) AS Hours FROM knowledge;
--
SELECT knowledge.hour, SQRT(knowledge.hour) AS Hours FROM knowledge;
--
SELECT 310.2679, ROUND(310.2679, 0);
--
SELECT 310.2679, ROUND(310.2679, 3);
--
SELECT knowledge.hour, LOG(knowledge.hour) AS Hours FROM knowledge;
--
SELECT knowledge.hour, LOG10(knowledge.hour) AS Hours FROM knowledge;
--3.1
SELECT student.family, student.name, student.last_name, student.family, LEFT(student.name, 1), LEFT(student.last_name, 1) FROM student 
WHERE LEFT(student.family, 1)='К';
--
SELECT student.family, student.name, student.last_name, student.family + LEFT(student.name, 1) + LEFT(student.last_name, 1) AS FIO FROM student 
WHERE LEFT(student.family, 1)='К';
--
SELECT student.family, student.name, student.last_name, student.family + ' ' + LEFT(student.name, 1)+'.' + LEFT(student.last_name, 1) + '.' AS FIO FROM student 
WHERE LEFT(student.family, 1)='К';
--3.2
SELECT *, CHARINDEX('к',subject.subj_name) AS ind FROM subject;
--3.3
SELECT (REPLICATE('#', LEN('Колясников') * 6 / 2 - LEN("family")) + family + REPLICATE('#', LEN('Колясников') * 6 / 2 - LEN("family")) ) FROM lecturer;
---3.4
SELECT subj_name, REPLACE(subject.subj_name, SUBSTRING(subject.subj_name,1,3),'Колясников') FROM "subject";
--3.5
SELECT subj_name, CHARINDEX('а', subj_name) AS ind FROM subject;
--4
SELECT SYSDATETIME();
SELECT GETDATE();
--
SELECT exam_date, DATENAME(mm,exam.exam_date) AS months, DATENAME(dd,exam.exam_date) AS days, DATENAME(yy,exam.exam_date) AS years FROM exam;
--
SELECT DATEADD(MONTH, 4, CURRENT_TIMESTAMP);
--5
DECLARE @max int
SET @max = (SELECT max(student_id) FROM student)
DECLARE @birthday date
SET @birthday = (SELECT birthday FROM student WHERE student_id = 1)
DECLARE @birthday2 date
SET @birthday2 = (SELECT birthday FROM student WHERE student_id = @max)
SELECT DISTINCT DATEDIFF(month, @birthday, @birthday2) FROM student
--6
SELECT student.stipendia, POWER(student.stipendia,2) FROM student;
--
SELECT knowledge.hour, POWER(knowledge.hour,2) FROM knowledge;
--
SELECT knowledge.hour_pr, POWER(knowledge.hour_pr,2) FROM knowledge;
