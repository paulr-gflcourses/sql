SELECT * FROM TableA
INNER JOIN TableB
ON TableA.name = TableB.name;

SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name;

SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name

SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null

SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableA.id IS null
OR TableB.id IS null

SELECT * FROM TableA
CROSS JOIN TableB
