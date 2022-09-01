/*Alunas: Gabrielly Beatriz Brandão Nogueira
		  Jamilly Emilly da Silva Campelo*/

/*QUESTÃO B*/
use campeonato;

select nome as "Time",
	   estado as "Estado",
       (select count(partidas.id) from times as esse_time
			left join partidas 
            on (time1_id = times.id and time1_gols > time2_gols or time2_id = times.id and time2_gols > time1_gols)
			where esse_time.id = times.id) as "Vitórias",
	   (select count(partidas.id) from times as esse_time
			left join partidas 
            on (time1_id = times.id and time1_gols < time2_gols or time2_id = times.id and time2_gols < time1_gols)
			where esse_time.id = times.id) as "Derrotas",
       (select count(partidas.id) from times as esse_time
			left join partidas 
            on (time1_id = times.id and time1_gols = time2_gols or time2_id = times.id and time2_gols = time1_gols)
			where esse_time.id = times.id) as "Empates"
from times;