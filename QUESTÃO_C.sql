/*Alunas: Gabrielly Beatriz Brandão Nogueira
		  Jamilly Emilly da Silva Campelo*/

/*ITEM C*/
use campeonato;

select nome as "time",
	   estado,
	   (select count(partidas.id) as vitorias from times as esse_time
			left join partidas on (time1_id = times.id and time1_gols > time2_gols or time2_id = times.id and time2_gols > time1_gols)
			where esse_time.id = times.id) as vitorias,
            
	   (select count(partidas.id) as derrotas from times as esse_time
			left join partidas on (time1_id = times.id and time1_gols < time2_gols or time2_id = times.id and time2_gols < time1_gols)
			where esse_time.id = times.id) as derrotas,
            
	   (select count(partidas.id) as empates from times as esse_time
			left join partidas on (time1_id = times.id and time1_gols = time2_gols or time2_id = times.id and time2_gols = time1_gols)
			where esse_time.id = times.id) as empates,
            
	   (select coalesce(sum(gols), 0) as gols_marcados from 
			(select sum(time1_gols) as gols from partidas
				where time1_id = times.id
			union
			select sum(time2_gols) as gols from partidas
				where time2_id = times.id) as tabela_temporaria) as saldo_de_gols,
            
	   (select (vitorias.vit*3 + empates.emp*1) as pontos from 
			(select count(partidas.id) as vit from times as esse_time
				left join partidas on (time1_id = times.id and time1_gols > time2_gols or time2_id = times.id and time2_gols > time1_gols)
				where esse_time.id = times.id) as vitorias,
                
			(select count(partidas.id) as emp from times as esse_time
			    left join partidas on (time1_id = times.id and time1_gols = time2_gols or time2_id = times.id and time2_gols = time1_gols)
				where esse_time.id = times.id) as empates) as pontos
                
from times
order by pontos desc, vitorias desc, saldo_de_gols desc;