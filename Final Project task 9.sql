SELECT * FROM walmartsales;
/*Task 9: Finding Top 5 Customers by Sales Volume (6 Marks)
Walmart wants to reward its top 5 customers who have generated the most sales Revenue.*/

WITH Sales_cte AS (
	SELECT Customer_ID, ROUND(Sum(Total),2) AS Sales
	FROM walmartsales
	GROUP BY Customer_ID),
rank_cte AS(
	SELECT Customer_ID, Sales,
			RANK() OVER (ORDER BY Sales DESC) as Sales_rank
	FROM Sales_cte)
SELECT * 
FROM rank_cte
WHERE Sales_rank<=5;