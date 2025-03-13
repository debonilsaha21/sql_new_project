SELECT * FROM walmartsales;
/*Task 6: Monthly Sales Distribution by Gender (6 Marks)
Walmart wants to understand the sales distribution between male and female customers on a monthly basis.*/
With men_sales_cte AS(
	SELECT DATE_FORMAT(Date, '%Y-%m') AS Month,
			ROUND(sum(total),2) AS Men_sales
	FROM Walmartsales
	WHERE gender="Male"
	GROUP BY Gender, Month),
Female_sales_cte AS(
	SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, 
			ROUND(sum(total),2) AS female_sales
	FROM Walmartsales
	WHERE gender="Female"
	GROUP BY Gender, Month)
SELECT m.Month, m.Men_sales, f.Female_Sales
FROM men_sales_cte as m
JOIN female_Sales_cte as f
ON m.Month=f.Month
ORDER BY m.Month;

