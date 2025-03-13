SELECT * FROM walmartsales;
/*Task 7: Best Product Line by Customer Type (6 Marks)
Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).*/
WITH sales_cte AS(
	SELECT Customer_type, Product_line, ROUND(Sum(total) ,2) as Sales
	FROM walmartsales
	GROUP BY Customer_type, Product_line),
rank_cte AS (
	SELECT Customer_type, Product_line, Sales,
			RANK() OVER (PARTITION BY Customer_type ORDER BY Sales DESC) as Sales_rank
	FROM Sales_cte)
SELECT * 
FROM rank_cte
WHERE Sales_rank =1;