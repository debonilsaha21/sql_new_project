use walmart_stores;
select * from walmartsales;
/*Task 1: Identifying the Top Branch by Sales Growth Rate (6 Marks)
Walmart wants to identify which branch has exhibited the highest sales growth over time. Analyze the total sales
for each branch and compare the growth rate across months to find the top performer.*/
WITH MonthlySales AS (
    SELECT Branch, DATE_FORMAT(Date, '%Y-%m') AS Month,
         ROUND(SUM(Total),2) AS Sale_by_month
    FROM walmartsales
    GROUP BY Branch, Month
    ORDER BY Month, Branch),
prev_sale AS(
	SELECT Branch, Month, Sale_by_month,
		LAG(Sale_by_month) OVER (PARTITION BY Branch ORDER BY Month) AS Previous_Sales
    FROM monthlysales),
growth_rate AS(
	SELECT Branch, Month, Sale_by_month, Previous_sales,
		ROUND(((Sale_by_month - Previous_sales) 
         / Previous_sales) * 100,2) AS mon_Growth_Rate
    FROM prev_sale)
SELECT Branch, ROUND(AVG(mon_growth_rate),2) as Average_growth_rate
FROM growth_rate
WHERE mon_growth_rate is NOT NULL
GROUP BY Branch
ORDER BY Average_growth_rate DESC
LIMIT 1;		
		


