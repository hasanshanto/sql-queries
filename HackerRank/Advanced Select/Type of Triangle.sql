-- github.com/hasanshanto

SELECT 
CASE 
WHEN (A + B <= C) OR (B + C <= A) OR (A + C <= B) THEN 'Not A Triangle'
WHEN (A = B AND A = C) THEN 'Equilateral'
WHEN (A = B AND A != C) OR (A = C AND A != B) OR (B = C AND A != B) THEN 'Isosceles'
ELSE 'Scalene'

END
FROM TRIANGLES