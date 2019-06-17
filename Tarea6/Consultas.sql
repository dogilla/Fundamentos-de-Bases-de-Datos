--A
SELECT nombre, ciudad
FROM T6.dbo.Nombres N JOIN T6.dbo.Direccion D ON N.curp = D.curp
WHERE D.curp IN (
    SELECT curp
    FROM T6.dbo.Trabajar T
    WHERE T.rfc = 
        (SELECT rfc 
        FROM T6.dbo.Empresa
        WHERE razon_social LIKE 'Pemex'))

--B
SELECT nombre, paterno, materno
FROM T6.dbo.Nombres
WHERE curp IN (
    SELECT curp
    FROM T6.dbo.Direccion D JOIN T6.dbo.DireccionE A ON D.calle = A.calle AND D.cp = A.cp AND D.numero = A.numero)


--C
SELECT salario 
FROM T6.dbo.Trabajar T JOIN T6.dbo.Dirigir D ON T.curp = D.curp



--F
SELECT razon_social, promedio
FROM T6.dbo.Empresa E JOIN (
    SELECT rfc, AVG(salario) promedio
    FROM T6.dbo.Trabajar
    GROUP BY rfc) N ON N.rfc = E.rfc

--G
SELECT C.curp 
FROM T6.dbo.Trabajar C JOIN (
    SELECT curp, rfc, A.numProy
    FROM T6.dbo.Controlar A JOIN T6.dbo.Coloborar B ON A.numProy = B.numProy) D ON C.curp = d.curp AND C.rfc != D.rfc


--H
SELECT razon_social, num_salarios
FROM T6.dbo.Empresa E JOIN (
    SELECT rfc, COUNT(salario) num_salarios
    FROM T6.dbo.Trabajar
    GROUP BY rfc) N ON N.rfc = E.rfc
--I
SELECT nombre, paterno, materno, numHor numerodeHoras
FROM T6.dbo.Nombres JOIN (
SELECT numHor, curp
FROM T6.dbo.Coloborar N JOIN(
    SELECT numProy, COUNT(S.curp) n_empleados
    FROM T6.dbo.Empleado E JOIN (
        SELECT curp, numHor, numProy
        FROM T6.dbo.Coloborar
        WHERE numHor > 20) S ON S.curp = E.curp
    GROUP BY numProy
    HAVING COUNT(e.curp) > 2) A ON A.numProy = N.numProy) B ON B.curp = Nombres.curp
WHERE numHor > 20

--J
SELECT razon_social, num_empleados
FROM T6.dbo.Empresa E JOIN ( 
    SELECT rfc, COUNT(curp) num_empleados
    FROM T6.dbo.Trabajar
    GROUP BY rfc) A ON A.rfc = E.rfc

--K
SELECT razon_social, sal_max
FROM T6.dbo.Empresa E JOIN (
    SELECT rfc, MAX(salario) sal_max
    FROM T6.dbo.Trabajar
    GROUP BY rfc) S ON S.rfc = E.rfc

--L
SELECT A.curp, nombre, paterno, materno
FROM T6.dbo.Nombres N JOIN (
    SELECT curp 
    FROM T6.dbo.Trabajar T JOIN (
        SELECT rfc, AVG(salario) sal_prom
        FROM T6.dbo.Trabajar
        GROUP BY rfc) P ON P.rfc = T.rfc
WHERE salario > sal_prom) A ON A.curp = N.curp

--M
SELECT razon_social, E.rfc 
FROM T6.dbo.Empresa E JOIN (
SELECT T.rfc, MIN(num_empl) min_num_empl
FROM T6.dbo.Trabajar T JOIN(
    SELECT rfc, COUNT(curp) num_empl
    FROM T6.dbo.Trabajar
    GROUP BY rfc) R ON R.rfc = T.rfc
GROUP BY T.rfc) A ON A.rfc = E.rfc

--O
SELECT razon_social
FROM T6.dbo.Empresa E JOIN ( 
    SELECT rfc, T.curp, ciudad
    FROM T6.dbo.Trabajar T JOIN T6.dbo.Direccion D ON T.curp = D.curp
    WHERE ciudad = 'Tejar') A ON E.rfc = A.rfc
--P
SELECT curp
FROM T6.dbo.Proyecto E JOIN( 
SELECT curp, numProy, cfecha_fin
FROM T6.dbo.Coloborar) C ON E.numProy = c.numProy
WHERE cfecha_fin < fecha_fin

--Q
SELECT nombre, paterno
FROM T6.dbo.Nombres
WHERE Nombres.curp IN( 
    SELECT curp
    FROM T6.dbo.Coloborar
    WHERE numProy IS NULL)
--R
SELECT *
FROM T6.dbo.Empresa
WHERE Empresa.rfc IN(  
SELECT rfc
FROM T6.dbo.Trabajar 
WHERE Trabajar.curp IN(
    SELECT curp
    FROM T6.dbo.Direccion
    WHERE Direccion.ciudad IN (
        SELECT ciudad
        FROM T6.dbo.Direccion
        GROUP BY ciudad
        HAVING COUNT(curp) > 2)))

















