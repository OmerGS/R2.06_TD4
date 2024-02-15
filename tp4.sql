/*
Groupe 1B1
GUNES Omer
TD/TP4 
*/


----------------------------------------------------
-- PARTIE 1
----------------------------------------------------
-- Question 1

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT idTypeAvion
        FROM TypeAvion
        MINUS
        SELECT unTypeAvion
        FROM Qualification
        WHERE unPilote = idPilote
    )
;

/*
# nomPilote
'Fleurquin'
*/

----------------------------------------------------

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT leTypeAvion
        FROM Avion
        WHERE compAv = compPil
        EXCEPT
        SELECT unTypeAvion
        FROM Qualification
        WHERE unPilote = idPilote
    )
AND compPil IS NOT NULL
;

/*
# nomPilote
'Fleurquin'
'Naert'
'Kamp'
'Godin'
*/

----------------------------------------------------

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT leTypeAvion
        FROM Avion
        WHERE compAv = compPil
        EXCEPT
        SELECT unTypeAvion
        FROM Qualification
        WHERE unPilote = idPilote
    )
    AND NOT EXISTS
    (
        SELECT unTypeAvion
        FROM Qualification
        WHERE unPilote = idPilote
        EXCEPT
        SELECT leTypeAvion
        FROM Avion
        WHERE compAv = compPil
    )
AND compPil IS NOT NULL;

/*
# nomPilote
'Fleurquin'
'Kamp'
'Godin'
*/


----------------------------------------------------
-- PARTIE 2
----------------------------------------------------

-- Question 2 (1 Tuple)

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT idComp
        FROM Compagnie
        EXCEPT
        SELECT laComp
        FROM ATravaillePour
        WHERE lePilote = idPilote
    )
;

/*
1 Tuples

# nomPilote
'Fleurquin'
*/

----------------------------------------------------

-- Question 3 (3 Tuples)

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT idComp
        FROM Compagnie
        WHERE estLowCost = 1
        EXCEPT
        SELECT laComp
        FROM ATravaillePour
        WHERE lePilote = idPilote
    )
;

/*
3 Tuples

# nomPilote
'Ridard'
'Naert'
'Fleurquin'
*/

----------------------------------------------------

-- Question 4 (1 Tuples)

SELECT nomPilote
FROM Pilote
WHERE NOT EXISTS
    (
        SELECT idComp
        FROM Compagnie
        WHERE estLowCost = 0
        EXCEPT
        SELECT laComp
        FROM ATravaillePour
        WHERE lePilote = idPilote
    )
;

/*
1 Tuple

# nomPilote
'Fleurquin'
*/

----------------------------------------------------

-- Question 5 (1 Tuples)

SELECT nomComp
FROM Compagnie
WHERE NOT EXISTS
    (
        SELECT idTypeAvion
        FROM TypeAvion
        WHERE idTypeAvion LIKE 'A%'
        EXCEPT
        SELECT leTypeAvion
        FROM Avion
        WHERE compAv = idComp
    )
;

/*
1 Tuple

# nomComp
'Air France'
*/


----------------------------------------------------

-- Question 6 (0 Tuple)

SELECT nomComp
FROM Compagnie
WHERE NOT EXISTS
    (
        SELECT leTypeAvion
        FROM Avion
        EXCEPT
        SELECT leTypeAvion
        FROM Avion
        WHERE leTypeAvion IN ('A320', 'A350')
    )
;

/*
0 Tuple
*/

----------------------------------------------------

-- Question 7 (2)

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

----------------------------------------------------

-- Question 8 (3 Avions)

SELECT COUNT(idAvion)
FROM Avion, Compagnie
WHERE idComp = compAv
AND nomComp = "Air France";

/*
# COUNT(idAvion)
'3'
*/







----------------------------------------------------

-- Question 9 (1 Tuple)


SELECT COUNT(DISTINCT leTypeAvion)
FROM Avion, Compagnie
JOIN idComp = compAv
AND nomComp = "Ryanair";

/*
# COUNT(DISTINCT leTypeAvion)
'1'
*/



----------------------------------------------------

-- Question 10 ('777')


SELECT SUM(nbPassagers)
FROM Compagnie, Avion, TypeAvion
WHERE idComp = compAv
AND 






----------------------------------------------------

-- Question 11 (A350)

SELECT idTypeAvion
FROM TypeAvion
WHERE nbPassagers = 
    (
        SELECT MAX(nbPassagers)
        FROM TypeAvion
    )
AND idTypeAvion IS NOT NULL
;


/*
# idTypeAvion
'A350'
*/



----------------------------------------------------

-- Question 12 (2 Tuples)

SELECT nomComp
FROM Compagnie, Avion, TypeAvion
WHERE idComp = compAv AND leTypeAvion = idTypeAvion
AND nbPassagers = 
    (
        SELECT MAX(nbPassagers)
        FROM TypeAvion
    )
;

/*
2 Tuples

# nomComp
'Air France'
'American Airlines'
*/

----------------------------------------------------

-- Question 13 (5 Tuples)


SELECT unPilote
FROM Qualification
GROUP BY unPilote
HAVING COUNT(unTypeAvion) >= 2;

/*
5 Tuples
# unPilote
'1'
'2'
'4'
'5'
'7'
*/


----------------------------------------------------

-- Question 14 (1 Tuple)

SELECT unPilote
FROM Qualification
GROUP BY unPilote
HAVING COUNT(
        SELECT MAX(unTypeAvion)
        FROM Qualification
    )
;






----------------------------------------------------

-- Question 15 (1 Tuple = ('6'))









----------------------------------------------------

-- Question 16 (5 Tuple)







----------------------------------------------------

-- Question 17 (1 Tuple ('1'))







----------------------------------------------------