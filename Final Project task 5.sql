select * from walmartsales;
/*Task 5: Most Popular Payment Method by City (6 Marks)
Walmart needs to determine the most popular payment method in each city to tailor marketing strategies.*/
WITH payment_frequency_cte AS (
	SELECT City, Payment, count(invoice_id) as frequency_method
	FROM walmartsales
	GROUP BY city, Payment),
frequency_rank_cte AS (
	SELECT City, Payment, frequency_method,
			RANK() OVER(PARTITION BY City ORDER BY frequency_method DESC) as pay_rank
	FROM payment_frequency_cte)
SELECT City, Payment, pay_rank
FROM frequency_rank_cte
WHERE pay_rank =1;    
    
;