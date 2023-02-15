-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` AS 'Nome' , `students`.`surname`AS 'Cognome', `degrees`.`name` AS 'Corso'
FROM `students`
LEFT JOIN `degrees`
ON `degrees`.`id` = `students`. `degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name` AS 'Corso', `departments`.`name` AS 'Dipartimento'
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name`AS 'Nome', `teachers`.`surname`AS 'Cognome', `courses`.`name` AS 'Corso'
FROM `courses`
JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `course_teacher`.`teacher_id`
JOIN `teachers`
ON `teachers`.`id`= `courses`.`id`
WHERE `teachers`.`name` = 'Fulvio'
AND `teachers`.`surname` = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`. `name`AS 'Nome', `students`.`surname` AS 'Cognome',
`students`.`enrolment_date` AS "Data d\'iscrizione" , 
`degrees`.`name` AS 'Corso di Laurea'
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id`= `students`.`id`  
ORDER BY `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'Corso di Laurea', `courses`.`name` AS 'Corsi', `teachers`.`name` AS 'Nome Professore',`surname` AS 'Cognome'
FROM `courses`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name` AS 'Nome', `teachers`.`surname` AS 'Cognome', `departments`.`name` AS 'Dipartimento' 
FROM `teachers`
JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami