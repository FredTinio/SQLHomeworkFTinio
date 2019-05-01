#1.a writing the firt name and the last name from the table actor
SELECT actor.first_name,
actor.last_name FROM actor;

#1.b Modifying the table actor adding a column named 'Actor Name' as actor_name
-- no spaces between names in mysql, the column actor_name is a character column.
-- Insert the first and last name in column actor_name, printing actor_name
ALTER TABLE actor
ADD COLUMN actor_name VARCHAR(200) AFTER last_name;
UPDATE actor SET actor_name = CONCAT(first_name, ' ',last_name);
SELECT actor_name FROM actor;


#2.a Finding the information of Joe
SELECT*FROM actor
WHERE first_name = 'Joe';

#2.b Find all last names that contains the letters "GEN"
SELECT*FROM actor
WHERE last_name LIKE '%GEN%';

#2.c Find all actors whose last name contains the letters "Li"
SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%Li%';

#2.d Using IN display country id, and country columns for
SELECT country_id, country FROM country
WHERE country IN ('Afghanistan','Bangladesh','China');

#3.a Create 'description' column in table actor with data type "BLOB"
ALTER TABLE actor
ADD COLUMN description     VARBINARY(8000) AFTER actor_name;

#description of column that was created
SELECT *FROM actor
WHERE description;

#3.b test then delete description
ALTER TABLE actor
DROP COLUMN description;

#validation to check that is description gone
SELECT*FROM actor;

#4.a List and count last name
SELECT DISTINCT(last_name) as LastName, count(last_name) AS count
FROM actor
GROUP BY last_name
HAVING count > 1;

#4.b List and count last names for those actors with the same name
SELECT DISTINCT(actor_name) as ActorName, count(actor_name) AS samename
FROM actor
GROUP BY actor_name
HAVING samename > 1;

#4.c Change the name in a column to just one entry replace 'Groucho' for 'Harpo' name
SELECT last_name, first_name
FROM actor
WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';
UPDATE actor
SET first_name = 'HARPO'
WHERE last_name = 'WILLIAMS' AND first_name ='GROUCHO';

SELECT last_name, first_name FROM actor
WHERE  last_name = 'WILLIAMS';
