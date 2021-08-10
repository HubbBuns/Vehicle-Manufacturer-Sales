USE classicmodels;

SELECT
	p.productLine AS product_category,	#getting product lines
    	SUM(od.quantityOrdered * od.priceEach) AS total_sales	#taking the sum of quantity * price equaling to total sales
FROM products p
JOIN orderdetails od	
	USING (productCode)
JOIN orders o	#joining these tables to get the necessary columns
	USING (orderNumber)
WHERE status = "Shipped" OR status = "Resolved"		#to filter out orders where payment has been released
GROUP BY product_category	#grouping by product lines, ie. Classic Car, Vintage Cars, Motorcycles, etc.
ORDER BY total_sales DESC	#ordering products from greatest to least
