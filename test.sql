use bd_r206;

SELECT COUNT(*)
FROM Compagnie
WHERE estLowCost = 1
;

/*
# COUNT(*)
'2'
*/

SELECT SUM(estLowCost)
FROM Compagnie
;

/*
# SUM(estLowCost)
'2'
*/
