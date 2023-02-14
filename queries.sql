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
WHERE YEAR(`date_of_birth`) <=  1991  
ORDER BY `students`.`date_of_birth`  ASC

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name` AS 'Corso', `period` AS 'Semestre', `year` AS 'Anno'
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)


-- 6. Selezionare tutti i corsi di laurea magistrale (38)


-- 7. Da quanti dipartimenti è composta l'università? (12)


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio


-- 3. Calcolare la media dei voti di ogni appello d'esame


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento