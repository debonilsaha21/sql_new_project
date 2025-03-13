SELECT * FROM walmartsales;
/*Task 8: Identifying Repeat Customers (6 Marks)
Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30 days).*/

SELECT     Customer_ID,    
	COUNT(Invoice_ID) AS Purchase_Count,    
	MIN(date) AS First_Purchase_Date,    
	MAX(date) AS Last_Purchase_Date
FROM     walmartsales
WHERE    date BETWEEN DATE_SUB('2019-03-31', INTERVAL 30 DAY) AND '2019-03-31'
GROUP BY     Customer_ID
HAVING     COUNT(Invoice_ID) > 1
ORDER BY COUNT(Invoice_ID) DESC;