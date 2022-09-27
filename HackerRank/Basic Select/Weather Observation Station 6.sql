-- github.com/hasanshanto
-- I dont know why MySQL doesnot work with [] wildcard. This SQL Query is done using MS SQL Server

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[aeiou]%';