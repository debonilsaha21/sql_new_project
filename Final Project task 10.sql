SELECT * FROM walmartsales;
/*Task 10: Analyzing Sales Trends by Day of the Week (6 Marks)
Walmart wants to analyze the sales patterns to determine which day of the week brings the highest sales.*/

SELECT ROUND(SUM(total),2) as Sales, 
		DAYNAME(Date) AS Weekday
FROM walmartsales
GROUP BY Weekday
ORDER BY Sales DESC
LIMIT 1;