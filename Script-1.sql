--
select
	*
from
	language l
inner join film f on
	l.language_id = f.language_id
order by 
	f.title asc;
--

select
	*
from
	language;
--
select
f.title,
f.description,
f.release_year,
l.name
from
	language l
inner join film f on
	l.language_id = f.language_id;
--
select
	*
from
	film_actor f;
