-- Instructions
use sakila;

    -- How many distinct (different) actors' last names are there?
select * from actor;
select count(distinct last_name) from actor;
-- There are 121 unique last names in the actors list.

    -- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film;
select count(distinct language_id) from film;
-- It seems that there is only one distinct language.

    -- How many movies were released with "PG-13" rating?
select * from film;
select count(rating) from film where rating = "PG-13";
-- There are 223 movies with a PG-13 rating.

    -- Get 10 the longest movies from 2006.
select * from film;
select title, length from film order by length desc limit 10;

    -- How many days has been the company operating (check DATEDIFF() function)?
select * from rental;
select max(datediff(return_date, rental_date)) from rental; -- in the beginning I took the create_date and last_update from the customer table.
-- The operates for 10 days - based on the maximum difference between return and rental date (not sure about this one).

    -- Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *, extract(month from rental_date) as Month, extract(day from rental_date) as Weekday from rental limit 20;

    -- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select * from rental;
select *, case
when dayofweek(rental_date) between 1 and 5
then "workday"
else "weekend"
end as day_type from rental;

-- How many rentals were in the last month of activity?
select * from rental;
select count(distinct extract(month from rental_date)) from rental; -- Checking the unique count of months. It seems that all rental dates are in May. Therefore, last month of activity refers to the all the data (?)/ big questionmark here.
select count(extract(month from rental_date)) from rental;
-- It seems that there have been 16044 rentals. (if my above assumption was accurate)

select * from rental;
select count(distinct extract(month from return_date)) from rental; -- trying to focus on return_date instead
select count(extract(month from return_date)) from rental;
-- If we go by the return_date column then the total amount of 15861 rentals.
