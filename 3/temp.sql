
14
SELECT maker FROM 
(SELECT type, maker, COUNT(type) AS ct  FROM Product
GROUP BY type, maker)

SELECT maker,COUNT(type) FROM Product 
GROUP BY maker
HAVING COUNT(type)>1

Больше 1 модели 1 типа
SELECT type, maker,COUNT(maker) AS mc FROM Product 
GROUP BY type, maker
HAVING COUNT(maker)>1


Только 1 тип у производителя


25
SELECT maker FROM Product
INNER JOIN (
SELECT model,speed FROM PC
WHERE ram=(SELECT MIN(ram) FROM PC)
) comp
ON Product.model=comp.model
WHERE comp.speed=(SELECT MAX(speed) FROM comp)
AND type='Printer'

SELECT maker FROM Product
INNER JOIN (
SELECT model FROM(
SELECT model,speed FROM PC
WHERE ram=(SELECT MIN(ram) FROM PC)) AS comp
WHERE speed=(SELECT MAX(speed) FROM comp)
) AS compfast 
ON Product.model=compfast.model


SELECT model FROM(
SELECT model,speed FROM PC
WHERE ram=(SELECT MIN(ram) FROM PC)
) p
WHERE p.speed=(SELECT MIN(speed) FROM p)


27.
SELECT maker, AVG(PC.hd)
FROM Product
INNER JOIN PC ON Product.model=PC.model
INNER JOIN Printer ON Product.model=Printer.model
GROUP BY maker