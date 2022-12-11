USE education5;

--1
SELECT * FROM subject;
--2
SELECT * FROM institute;
--3
SELECT stipendia  FROM student GROUP BY stipendia;  
--4
SELECT DISTINCT course FROM student;
--5
SELECT family, name, last_name, birthday FROM student ORDER BY birthday ASC;
--6
SELECT family, course, birthday FROM student ORDER BY birthday DESC;
--7
SELECT lect_id, family, name, last_name FROM lecturer;
--8
SELECT  family, name, last_name,birthday,stipendia FROM student WHERE stipendia > 0 ORDER BY family DESC  
--9
SELECT  family, name, last_name,course FROM student WHERE course=1 ORDER BY family DESC  
--10
SELECT  family, name, last_name,course FROM student WHERE course=1 OR course=2;  
--11
SELECT family, name, last_name, course FROM student WHERE course != 1 AND course != 3;
SELECT family, name, last_name, course FROM student WHERE course NOT IN (1, 3);
--12
SELECT subject.subj_id, subj_name 
FROM exam, nagruzka, knowledge, subject WHERE exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.subj_id = subject.subj_id 
GROUP BY subject.subj_id, subj_name;
--13 
SELECT subj_name, knowledge.hour 
FROM subject, nagruzka, knowledge, exam 
WHERE (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND exam.nagr_id = nagruzka.nagr_id) AND exam.mark = 2 
GROUP BY subj_name, hour; 
--14
SELECT family, town_name, subj_name, mark 
FROM town, parents, student, exam, nagruzka, knowledge, subject  
WHERE town.town_id = parents.town_id AND parents.student_id = student.student_id AND student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id 
AND nagruzka.kvant_id = knowledge.kvant_id AND subject.subj_id = knowledge.subj_id  AND subj_name = 'высшая математика' AND mark > 2 AND town_name = 'Березовский'
--15
SELECT family, name, last_name, subj_name, mark 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id 
ORDER BY subj_name ASC, mark DESC, family ASC;
--16
SELECT family, name, last_name, subj_name, mark 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2 AND subj_name = 'экономика'
GROUP BY family, subj_name, mark, name, last_name
ORDER BY family ASC;
--17
SELECT family, name, last_name, name_medal, town_name
FROM medali, medalist, student, parents, town
WHERE medali.medal_id = medalist.medal_id AND medalist.student_id = student.student_id 
AND student.student_id = parents.student_id AND parents.town_id = town.town_id AND name_medal = 'золотая'
--18
SELECT family, subj_name, exam_date 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2
GROUP BY family, subj_name, exam_date
ORDER BY subj_name, family;
--19
SELECT family, subj_name, exam_date 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2 AND (exam.exam_date = '2003-06-13' OR exam.exam_date = '2003-05-24')
GROUP BY family, subj_name, exam_date
ORDER BY subj_name, family;
--20
SELECT student.family, lecturer.family, exam_date, subj_name, mark 
FROM student, exam, nagruzka, lecturer, knowledge, subject
WHERE student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.lect_id = lecturer.lect_id AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.subj_id = subject.subj_id AND mark = 5
--21
SELECT inst_name
FROM institute, lecturer, nagruzka, exam, knowledge
WHERE institute.inst_id = lecturer.inst_id AND lecturer.lect_id = nagruzka.lect_id AND nagruzka.nagr_id = exam.nagr_id
AND nagruzka.kvant_id = knowledge.kvant_id AND hour > 80 AND mark = 2
GROUP BY inst_name
