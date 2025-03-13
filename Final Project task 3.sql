select * from walmartsales;
/*Task 3: Analyzing Customer Segmentation Based on Spending (6 Marks)
Walmart wants to segment customers based on their average spending behavior. Classify customers into three
tiers: High, Medium, and Low spenders based on their total purchase amounts.*/

WITH spending_cte AS(
	SELECT customer_id, Round(SUM(Total),4) as total_spending
	FROM walmartsales
	GROUP BY customer_id
	ORDER BY total_spending DESC),
Percentile_cte AS (
    SELECT customer_id, total_spending,
        NTILE(3) OVER (ORDER BY Total_Spending DESC) AS Spending_Tier
    FROM spending_cte)
SELECT customer_id, total_spending,
	CASE
		WHEN spending_tier =1 THEN "High"
        WHEN spending_tier =2 THEN "Medium"
        ELSE "Low"
	END AS Customer_Class
FROM percentile_cte;