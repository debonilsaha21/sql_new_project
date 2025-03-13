use walmart_stores;
select * from walmartsales;
/*Task 2: Finding the Most Profitable Product Line for Each Branch
Walmart needs to determine which product line contributes the highest profit to each branch.The profit margin
should be calculated based on the difference between the gross income and cost of goods sold.*/
WITH ProductProfit AS (
    SELECT 
        Branch, 
        product_line, 
        round(SUM(gross_income),2) AS Total_Profit
    FROM walmartsales
    GROUP BY Branch, product_line
),
RankedProducts AS (
    SELECT 
        Branch,
        product_line,
        Total_Profit,
        RANK() OVER (PARTITION BY Branch ORDER BY Total_Profit DESC) AS prod_rank
    FROM ProductProfit
)
SELECT Branch, product_line, Total_Profit
FROM RankedProducts
WHERE prod_rank = 1;