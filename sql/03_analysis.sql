SELECT TOP 10 * 
FROM retail_sales;

SELECT SUM(total_amount) AS total_sales
FROM retail_sales;

SELECT product_category,
       SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY product_category
ORDER BY revenue DESC;

SELECT gender,
       SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY gender;

USE [RetailDW]; -- Replace with your actual DB name
GO
SELECT TOP 10 * FROM fact_sales;
SELECT TOP 10 * FROM dim_customer;

SELECT DB_NAME() AS [True_Current_Database];
