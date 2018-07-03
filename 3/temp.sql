14
SELECT p.maker
FROM(
SELECT maker,type,COUNT(type) c 
FROM Product
GROUP BY maker,type
HAVING COUNT(type)>1
) p
GROUP BY p.maker
HAVING COUNT(p.maker)=1



SELECT p.maker, COUNT(p.type)
FROM(
SELECT maker,type,COUNT(model) count_m
FROM Product
GROUP BY maker,type
)p
GROUP BY p.maker



SELECT maker, type 
FROM Product 
WHERE maker IN (

SELECT maker FROM(
SELECT maker,type,COUNT(model) cm FROM Product 
GROUP BY maker, type 
HAVING COUNT(model) > 1
)p

GROUP BY maker
HAVING COUNT(type) = 1
)



Производители, кот производят 1 тип:
SELECT maker FROM(
SELECT maker,type,COUNT(model) cm FROM Product 
GROUP BY maker, type 
)p
GROUP BY maker
HAVING COUNT(maker)=1




25
SELECT maker FROM 
(SELECT model, maker, type FROM Product 
WHERE type='Printer') prod
INNER JOIN(
SELECT model,MAX(speed) max_speed FROM PC 
WHERE ram=(SELECT MIN(ram) FROM PC)
GROUP BY model
)p ON prod.model=p.model
GROUP BY maker



SELECT maker FROM Product
WHERE type='Printer' AND model IN(
SELECT model FROM PC
WHERE speed = (SELECT MAX(speed) FROM (SELECT speed FROM PC WHERE ram=(SELECT MIN(ram) FROM PC)) AS z4)

)





SELECT maker FROM Product
WHERE 
maker IN(SELECT DISTINCT maker FROM Product WHERE type='Printer')
AND
model IN(
SELECT model FROM PC 
WHERE speed=(
SELECT MAX(speed) max_speed FROM (
	SELECT model,speed FROM PC
	WHERE ram=(SELECT MIN(ram) FROM PC)
) p
)
AND ram=(SELECT MIN(ram) FROM PC)
)


