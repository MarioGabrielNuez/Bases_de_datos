SELECT * FROM JUGADORES WHERE CODIGO NOT IN(SELECT JUGADOR FROM ESTADISTICAS);
SELECT * FROM JUGADORES WHERE CODIGO IN(SELECT CODIGO FROM JUGADORES WHERE PROCEDENCIA = "spain" AND PESO > 180);

SELECT CODIGO, NOMBRE, PROCEDENCIA, ROUND(AVG(PUNTOS_POR_PARTIDO), 2) 
  FROM JUGADORES INNER JOIN ESTADISTICAS ON CODIGO = JUGADOR WHERE PUNTOS_POR_PARTIDO >= 5 GROUP BY PROCEDENCIA;
  
SELECT CODIGO, NOMBRE, PUNTOS_POR_PARTIDO 
  FROM JUGADORES LEFT JOIN ESTADISTICAS ON CODIGO = JUGADOR ORDER BY PUNTOS_POR_PARTIDO ASC;
  
SELECT CODIGO, NOMBRE, PUNTOS_POR_PARTIDO 
  FROM JUGADORES RIGHT JOIN ESTADISTICAS ON CODIGO = JUGADOR ORDER BY PUNTOS_POR_PARTIDO ASC;
  
SELECT COUNT(CODIGO) FROM JUGADORES NATURAL JOIN ESTADISTICAS;
SELECT COUNT(CODIGO) FROM JUGADORES FULL JOIN ESTADISTICAS;

SELECT CODIGO, NOMBRE, PUNTOS_POR_PARTIDO FROM JUGADORES NATURAL JOIN ESTADISTICAS;
SELECT CODIGO, NOMBRE, PUNTOS_POR_PARTIDO  FROM JUGADORES FULL JOIN ESTADISTICAS;