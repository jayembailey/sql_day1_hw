--1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
select last_name, count(last_name)
from actor
where last_name like 'Wahlberg'
group by last_name;

--2. How many payments were made between $3.99 and $5.99? 
-- Answer: 3230
select amount, count(amount)
from payment
where amount > 3.99 and amount < 5.99
group by amount;

--3. What film does the store have the most of? (search in inventory)
-- Answer: There is no one film. The highest count is 8.
select film_id, count(film_id)
from inventory
group by film_id
order by count desc;

--4. How many customers have the last name ‘William’? 
-- Answer: There are no last names 'William'. There are, however, a 'Williams' and a 'Williamson'.
select last_name, count(last_name)
from customer
where last_name like 'William%'
group by last_name;

--5. What store employee (get the id) sold the most rentals? 
-- Answer: ID #2
select staff_id, count(staff_id)
from payment
group by staff_id
order by count desc;

--6. How many different distinct names are there? 
-- Answer: Since there are a total of 599 names and all of them are distinct,
--	we can conclude that there are 599 distinct names.
select count(distinct first_name) as first_names_distinct,
count(first_name) as first_count,
count(distinct last_name) as last_names_distinct,
count(last_name) as last_count
from customer;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Answer: Film # 508: Lambs Cincinatti
select film_id, count(actor_id)
from film_actor
group by film_id
order by count desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
-- Answer: 13
select store_id,count(distinct customer_id)
from customer 
where last_name like '%es'
group by store_id

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--		with ids between 380 and 430? (use group by and having > 250) 
-- Answer: since 3 rows were fetched  for prices with counts above 250, the answer is 3!
select amount, count(amount)
from payment
where customer_id >= 380 and customer_id <= 430
group by amount
having count(amount) > 250
order by count desc

--10. Within the film table, how many rating categories are there? 
--		And what rating has the most  movies total?
--Answer: 5. PG-13
select * from film;
select rating, count(rating)
from film
group by rating
order by count(rating) desc