-- github.com/hasanshanto

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%[aeiou]';