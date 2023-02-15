-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `date_of_birth` 
FROM `students`
WHERE `date_of_birth` >= '1990-01-01'
AND `date_of_birth`<= '1990-31-01';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name` AS 'Corsi' , `cfu` AS 'Crediti'
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`,`date_of_birth`
FROM `students`
WHERE `date_of_birth` <= DATE_SUB(CURDATE(), INTERVAL 30 YEAR);

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name` AS 'Corso', `period` AS 'Semestre', `year` AS 'Anno'
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `hour`>= '14:00:00'
AND `date` = '2020-06-20'  
ORDER BY `exams`.`hour`  ASC

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name` AS 'Corso di Laurea'
FROM `degrees`
WHERE `name` LIKE '%magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`name`) AS 'Numero di Dipartimenti' 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS 'Numero insegnanti'
FROM `teachers`
WHERE `phone` IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) as 'Anno', COUNT(*) as 'Numero di Iscritti' 
FROM `students` 
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address` AS "Indirizzo d'ufficio", COUNT(*) AS 'Insegnanti nello stesso Edificio'
FROM `teachers` 
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS 'Media dei voti',  `exam_id` AS "Appello d'esame"
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `name` AS 'Corsi di Laurea', COUNT(`department_id`) AS 'Dipartimento'
FROM `degrees` 
GROUP BY `name`;