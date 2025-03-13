select * from walmartsales;
/*Task 4: Detecting Anomalies in Sales Transactions (6 Marks)
Walmart suspects that some transactions have unusually high or low sales compared to the average for the
product line. Identify these anomalies.*/

WITH ProductStats AS (
    SELECT product_line, AVG(Total) AS Avg_Sales, STDDEV(Total) AS Std_Dev
    FROM walmartsales
    GROUP BY product_line    
),
Anomalies AS (
    SELECT w.Invoice_ID, w.Branch, w.product_line, w.Total, p.Avg_Sales, p.Std_Dev,
        (w.Total - p.Avg_Sales) / p.Std_Dev AS Z_Score
    FROM walmartsales AS w
    JOIN ProductStats  AS p 
        ON w.product_line = p.product_line    
)
SELECT *
FROM Anomalies
WHERE ABS(Z_Score) > 3
ORDER BY Z_Score DESC;      
       
        
       
        
    
        
        
    
