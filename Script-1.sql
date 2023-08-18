
select
	count (*)
from
	actor a
inner join film_actor fa on
	a.actor_id = fa.actor_id
inner join film f on
	fa.film_id = f.film_id
where
	f.title = 'Autumn Crow';

-- esse código conta a qtd de atores no filme descrito.
-- tem que fazer o inner join duas vezes quando tem uma tabela intermediária no caminho
-- no exemplo, vai de actor para film_actor e de film_actor para film.

------

select
	distinct c.category_id, c.name 
from
	film f
inner join film_category fc on
	f.film_id  = fc.film_id
inner join category c on
	fc.category_id  = c.category_id
where f.length = 60;

/* Mostra as categorias e o nome delas nos filmes que tem duração = 60 minutos.
 */

------

select
	f.title as "Título", concat(a.first_name,' ', a.last_name) as "Nome Completo"
from
	actor a
inner join film_actor fa on
	a.actor_id = fa.actor_id
inner join film f on
	fa.film_id = f.film_id
where
	f.title = 'Banger Pinocchio';

/* esse código mostra o título do filme e o primeiro e último nome dos atores nesse filme em específico
 tem que fazer o inner join duas vezes quando tem uma tabela intermediária no caminho
 no exemplo, vai de actor para film_actor e de film_actor para film.
 
 concat -- concatena os objetos, duas ou mais colunas
 as -- renomeia a tabela, colocar o nome entre aspas duplas. */
	
