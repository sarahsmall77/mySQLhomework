USE sakila;
# 1a. Display the first and last names of all actors from the table `actor`.
SELECT * from actor;
SELECT first_name, last_name from actor;

# 1b. Display the first and last name of each actor in a single column in upper case letters.
#Name the column `Actor Name`.	
ALTER TABLE actor
ADD COLUMN Actor_Name VARCHAR(75) NOT NULL;
#this adds column but does not populate it. add "not null"? but can't create duplicate column, so delete and redo?
#SELECT first_name, last_name, Actor_Name from actor;
-- Turn off safe updates?
#SET SQL_SAFE_UPDATES = 0; ####this wasn't the problem#####
#column added, now how to populate? 
UPDATE actor
SET Actor_Name = CONCAT(first_name, ' ', last_name);
SELECT * from actor;
#try again
#INSERT INTO actor(Actor_Name)
#VALUES (first_name + last_name);
#one more try...this works for tables, maybe it will work for columns?
#INSERT INTO Actor_Name
#SELECT * FROM actor(first_name, last_name);
#not working either, lets try updating column with first name, then last name
#ALTER TABLE actor
#SET Actor_Name = first_name
#dammit, I just needed to use "concat" for a double value

#2a. You need to find the ID number, first name, and last name of an actor, 
#of whom you know only the first name, "Joe." What is one query would you use to #obtain this information?
#this sounds like a WHERE stmt needed
SELECT * FROM actor WHERE first_name='Joe'

#2b. Find all actors whose last name contain the letters `GEN`:
# this needs a "where" with a "like"
SELECT last_name
FROM actor
WHERE last_name LIKE 'GEN%'; 
#this gave me a blank last name column....hmmmmm

SELECT * FROM actor WHERE last_name LIKE 'GEN%';
#this works but gives all null values

SELECT * FROM actor WHERE last_name LIKE '%GEN%';
#aaannnndddd....success!!

#2c. Find all actors whose last names contain the letters `LI`. This time, order the rows by last name and first name, in that order:
#this adds the "ORDER BY" function
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name, first_name;
#not sure this ordered correctly, so breaking it up to test
SELECT * FROM actor WHERE last_name LIKE '%GEN%';
#yep, without order by it looks the same...
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY (last_name, first_name);
#that still gives errors, try order by last name only
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name;
#still looks the same....back to the documentation
#wait, does the order by change if "first_name" used (i.e. last name is alphabetical)?
#SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY first_name;
#oh wait, it was ordering alphabetically by last name!

#2d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China:
#use subqueries?...and switch to the'country' table
SELECT * from country;
#just to display country table
SELECT country_id
FROM country
WHERE country = 'Afghanistan';
#this just gives a country_id column, where does the "IN" add the country column?





