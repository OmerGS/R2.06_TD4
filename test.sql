use bd_r206;

SELECT unPilote
FROM Qualification
GROUP BY unPilote
HAVING COUNT(
        MAX(unTypeAvion)
        FROM Qualification
    )
;