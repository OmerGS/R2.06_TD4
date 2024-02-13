use bd_r206;
SELECT nomComp
FROM Compagnie
WHERE NO EXISTS
    (   
        SELECT idTypeAvion
        FROM Avion
        WHERE idComp = laComp
        EXCEPT 
        
    )
;
