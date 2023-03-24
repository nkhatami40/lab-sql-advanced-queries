USE sakila;

#2-For each film, list actor that has acted in more films.
#finding the number of films in which each actor has acted. 
SELECT distinct actor_id,
    Count(*) over(partition by actor_id) as "count"
from film_actor;
 
#Now, we have to choose the actor who has the MAX count for each film.
WiTH total AS(
WITH count_id AS(
SELECT distinct actor_id, film_id,
    Count(*) over(partition by actor_id) as "count"
from film_actor)
SELECT title, actor_id, count
FROM film f
JOIN count_id
ON f.film_id = count_id.film_id)
SELECT title, count, actor_id, RANK() OVER (PARTITION BY title ORDER BY count DESC) AS rank_id
FROM total;

#For each movie, it shows the actor_id with the first rank for the number of times that has appeared in the movies (count). I tried a lot but didn't know how to show only the maximum count. 



