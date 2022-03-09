/* Consulta que muestre los nombres de los jugadores, el nombre del equipo al que pertenecen y la ciudad de aquellos que han realizado algún tapón en la temporada 2007/2008. */
select Nombre, Nombre_equipo, Procedencia 
  from jugadores
 inner join estadisticas on estadisticas.jugador = jugadores.codigo
 where Tapones_por_partido > 0;

/* Media de rebotes (con 2 decimales) de todas las temporadas por jugador, de las conferencia WEST  */
select jugadores.Nombre, jugadores.Nombre_equipo, round(avg(Rebotes_por_partido), 2) as Media_rebotes
  from jugadores
 inner join equipos on jugadores.Nombre_equipo = equipos.Nombre and 
					   equipos.Conferencia = "West"
 inner join estadisticas on jugadores.codigo = estadisticas.jugador
 group by jugadores.codigo;
 
/* Número de partidos ganados como local de cada equipo por conferencia y media de los puntos metidos en esos partidos */
select equipos.nombre, equipos.Conferencia, count(partidos.codigo) as Numero_Partidos, avg(partidos.puntos_local) as Media_Puntos
  from equipos
 inner join partidos on partidos.equipo_local = equipos.Nombre and 
						partidos.puntos_local > puntos_visitante
 group by equipos.Nombre;
 
/* Nombre del equipo y de los jugadores, que hayan metido más puntos, hayan hecho más asistencias, atrapado más rebotes y hecho más tapones, en el global de todas las temporadas. */
 select jugadores.Nombre, 
		jugadores.Nombre_equipo,
        round(sum(estadisticas.Puntos_por_partido)) as Media_Puntos_por_partido, 
        round(sum(estadisticas.Asistencias_por_partido)) as Media_Asistencias_por_partido, 
        round(sum(estadisticas.Tapones_por_partido)) as Media_Tapones_por_partido,
        round(sum(estadisticas.Rebotes_por_partido)) as Media_Rebotes_por_partido
   from jugadores
  inner join estadisticas on estadisticas.jugador = jugadores.codigo
  group by jugadores.codigo
  order by round(sum(estadisticas.Puntos_por_partido + 
				  estadisticas.Asistencias_por_partido + 
                  estadisticas.Tapones_por_partido + 
                  estadisticas.Rebotes_por_partido)) desc;
  
/*Los dos equipos por temporada, cuyos jugadores hayan metido más puntos por partido de media en las respectivas temporadas.*/
select * from (select jugadores.Nombre_equipo,
	   estadisticas.temporada,
	   avg(estadisticas.Puntos_por_partido) as Media_Puntos_por_partido,
       row_number() over (partition by estadisticas.temporada order by Media_Puntos_por_partido desc) as row_num
  from jugadores 
 inner join estadisticas on estadisticas.jugador = jugadores.codigo
 group by jugadores.Nombre_equipo, estadisticas.temporada
 order by estadisticas.temporada, row_num) ranks where row_num < 3;
