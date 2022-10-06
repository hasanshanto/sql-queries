-- github.com/hasanshanto

SELECT c.Company_code, c.Founder, COUNT(DISTINCT lm.Lead_manager_code), 
COUNT(DISTINCT sm.Senior_manager_code), COUNT(DISTINCT m.Manager_code), 
COUNT(DISTINCT e.Employee_code)
FROM Company c
JOIN Lead_Manager lm
ON c.Company_code = lm.Company_code
JOIN Senior_Manager sm
ON lm.Company_code = sm.Company_code
JOIN Manager m
ON sm.Company_code = m.Company_code
JOIN Employee e
ON m.Company_code = e.Company_code
GROUP BY c.Company_code, c.Founder
ORDER BY c.Company_code