-- Lab 2.05
USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- Total films
SELECT count(inventory_id) as Total_films
FROM inventory;

-- How many films have been rented?
SELECT COUNT( distinct inventory_id ) as Films_rented
FROM rental
WHERE return_date IS NULL;

-- How many films are available for rent?
select 4581-183;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) AS min_duration FROM film;
SELECT max(length) AS max_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT avg(length) FROM film;

-- 5. How many distinct (different) actors' last names are there?
SELECT count(distinct last_name) from actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

select datediff(max(rental_date), min(rental_date))
from rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select *, date_format(convert(rental_date,date), '%M') as 'month' 
from rental
limit 20;

select *, dayname(rental_date) as 'weekday'
from rental
limit 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
else 'workday'
end as day_type
from rental;

-- 9. Get release years.
SELECT distinct release_year from film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT *  
from film 
where title like '%ARMAGEDDON%'; 

-- 11. Get all films which title ends with APOLLO.
SELECT *  
from film 
where title like '%APOLLO'; 

-- 12. Get 10 the longest films.
SELECT title, length FROM film 
order by length DESC
LIMIT 10; 

-- 13. How many films include Behind the Scenes content?
SELECT count(*)
FROM film
where special_features like '%behind the scenes%';
