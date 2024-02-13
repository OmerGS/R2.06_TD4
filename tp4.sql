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

-- Question 8 (3 Tuples)









----------------------------------------------------

-- Question 9 (1 Tuple)










----------------------------------------------------

-- Question 10 (777)







----------------------------------------------------

-- Question 11 (A350)







----------------------------------------------------

-- Question 12 (2 Tuples)







----------------------------------------------------

-- Question 13 (5 Tuples)







----------------------------------------------------

-- Question 14 (1 Tuple)







----------------------------------------------------

-- Question 14 (1 Tuple)