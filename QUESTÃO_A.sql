/*Alunas: Gabrielly Beatriz Brandão Nogueira
		  Jamilly Emilly da Silva Campelo*/

/*QUESTÃO A*/
use campeonato;

select times.nome as "Time 1",
partidas.time1_gols as "Time 1 Gols",
partidas.time2_gols as "Time 2 Gols",
tim.nome as "Time 2" from partidas
	inner join times on times.id = time1_id
	inner join times as tim on tim.id = time2_id;