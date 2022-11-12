I. Creamos la DB para el segundo desafio

CREATE DATABASE desafio_Luis_Urbaneja_258;

II. Conectar a la DB

\c desafio_Luis_Urbaneja_258;

III. Creamos la tabla para posterior ingresar los datos en ella

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);

IV. Insertamos los datos para registrarlos en la tabla ya creada

INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2022', 'Pagina' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2022', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2022', 'Pagina' );

RESPUESTAS

1. ¿Cuantos registros hay?

SELECT COUNT(*) FROM INSCRITOS;

2. ¿Cuantos inscritos hay en total? 

SELECT SUM(cantidad) FROM INSCRITOS;

3. ¿Cual o cuales son los registros de mayor antiguedad? 

SELECT * FROM INSCRITOS WHERE fecha = (SELECT MIN(FECHA) FROM INSCRITOS);

4. ¿Cuantos inscritos hay por dia? (entendiendo un dia como una fecha distinta de ahora en adelante)

SELECT fecha, SUM(cantidad) as total_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY total_por_dia;

5. ¿Cuantos inscritos hay por fuente?

SELECT fuente, SUM(cantidad) as total_por_fuente FROM INSCRITOS GROUP BY fuente ORDER BY total_por_fuente;

6. ¿Que di­a se inscribieron la mayor cantidad de personas y cuantas personas se inscribieron en ese dia?

SELECT fecha, SUM(cantidad) AS suma_total_del_dia FROM INSCRITOS GROUP BY fecha ORDER BY suma_total_del_dia DESC LIMIT 1;

7. ¿Que di­as se inscribieron la mayor cantidad de personas utilizando el blog y cuantas personas fueron?

SELECT * FROM INSCRITOS WHERE cantidad = (SELECT MAX(cantidad) FROM INSCRITOS WHERE fuente = 'Blog' LIMIT 1);

8. ¿Cuantas personas en promedio se inscriben en un di­a?

SELECT fecha, ROUND(AVG(cantidad)) as promedio_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY fecha;

9. ¿Que dias se inscribieron mas de 50 personas?

SELECT fecha, SUM(CANTIDAD) FROM INSCRITOS GROUP BY fecha HAVING SUM(CANTIDAD) > 50 ORDER BY fecha;

10. ¿Cuantas personas se registraron en promedio cada di­a a partir del tercer di­a?

SELECT fecha, ROUND(AVG(cantidad)) as promedio_por_dia FROM INSCRITOS WHERE fecha >= '01/03/2021' GROUP BY fecha ORDER BY fecha;