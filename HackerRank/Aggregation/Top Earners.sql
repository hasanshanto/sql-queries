-- github.com/hasanshanto

SELECT (MONTHS * SALARY) AS TOTAL_EARNING, COUNT(MONTHS * SALARY)
FROM EMPLOYEE
GROUP BY TOTAL_EARNING
ORDER BY (MONTHS * SALARY) DESC
LIMIT 1;