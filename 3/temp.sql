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



29

SELECT u.point, u.date, Income_o.Inc, Outcome_o.out FROM
(SELECT point, date FROM Income_o
UNION 
SELECT point, date FROM Outcome_o) u
LEFT JOIN Income_o ON u.date=Income_o.date
LEFT JOIN Outcome_o ON u.date=Outcome_o.date

SELECT i.point, i.date, i.inc, Outcome_o.out FROM Income_o AS i
LEFT JOIN Outcome_o ON i.date=Outcome_o.date
UNION
SELECT o.point, o.date, Income_o.inc, o.out FROM Outcome_o AS o
LEFT JOIN Income_o ON o.date=Income_o.date


SELECT i.point, i.date, i.inc, o.out FROM Income_o AS i
LEFT JOIN Outcome_o AS o ON i.date=o.date
UNION
SELECT o.point, o.date, i.inc, o.out FROM Outcome_o AS o
LEFT JOIN Income_o AS i ON o.date=i.date




SELECT i.point, i.date, i.inc, o.out FROM Income_o AS i
INNER JOIN Outcome_o AS o ON i.date=o.date
UNION
SELECT o.point, o.date, i.inc, o.out FROM Outcome_o AS o
INNER JOIN Income_o AS i ON o.date=i.date


SELECT i.point, i.date, i.inc, o.out FROM Income_o AS i
LEFT JOIN Outcome_o AS o ON i.date=o.date
UNION
SELECT o.point, o.date, i.inc, o.out FROM Outcome_o AS o
RIGHT JOIN Income_o AS i ON o.date=i.date



30.
SELECT u.point, u.date, sum(o.out) Outcome, sum(i.inc) Income FROM
(SELECT point, date FROM Income
UNION
SELECT point, date FROM Outcome) u
LEFT JOIN Income AS i ON u.date=i.date AND u.point=i.point
LEFT JOIN Outcome AS o ON u.date=o.date AND u.point=o.point
GROUP BY u.point, u.date


SELECT u.point, u.date, sum(o.out) Outcome, sum(i.inc) Income FROM
(SELECT point, date FROM Income
UNION
SELECT point, date FROM Outcome) u
LEFT JOIN (SELECT DISTINCT point, date, inc FROM Income) i
ON u.date=i.date AND u.point=i.point
LEFT JOIN (SELECT DISTINCT point, date, out FROM Outcome) o
ON u.date=o.date AND u.point=o.point
GROUP BY u.point, u.date



SELECT * FROM Income AS i
FULL JOIN Outcome AS o
ON i.point=o.point AND i.date=o.date
ORDER BY i.point, o.point, i.date, o.date


