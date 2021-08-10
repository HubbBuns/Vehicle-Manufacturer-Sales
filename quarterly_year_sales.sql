USE classicmodels;

SELECT 
	YEAR(paymentDate) AS year,	#getting the year
    	ROUND(AVG(amount), 0) AS total_sales, #getting the average amount of sales, rounded to a whole number
    	CASE 	#Using the case statement to get sales between certain months for each quarter, ie. Jan-Mar = Q1
		WHEN MONTH(paymentDate) BETWEEN "01" AND "03" THEN "Q1"
		WHEN MONTH(paymentDate) BETWEEN "04" AND "06" THEN "Q2"
		WHEN MONTH(paymentDate) BETWEEN "07" AND "9" THEN "Q3"
		ELSE "Q4"
	END AS quarterly_sales
FROM payments 
GROUP BY year, quarterly_sales	#Grouping to get each quarter, in each year
ORDER BY year 


