INSERT INTO dim_customer (customer_id, gender, age)
SELECT customer_id, gender, age
FROM dim_customer_import;
SELECT TOP 10 * FROM dim_customer;

--Create Loyalty Members
UPDATE dim_customer
SET loyalty_member =
CASE 
    WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'Yes'
    ELSE 'No'
END;

--Create Customer Segments
UPDATE dim_customer
SET customer_segment =
CASE
    WHEN age < 25 THEN 'Young'
    WHEN age BETWEEN 25 AND 40 THEN 'Adult'
    WHEN age BETWEEN 41 AND 60 THEN 'Middle Age'
    ELSE 'Senior'
END;

SELECT TOP 10 * FROM dim_customer;

DROP TABLE dim_customer_import;

INSERT INTO dim_product (Product_id, Product_Category, Price_per_Unit)
SELECT Product_id, Product_Category, Price_per_Unit
FROM dim_product_import ;

DROP TABLE dim_product_import ;

SELECT TOP 10 * FROM dim_product;

INSERT INTO dim_date (date_id, full_date,month, year)
SELECT date_id, full_date, month, year
FROM dim_date_import;

DROP TABLE dim_date_import;

INSERT INTO fact_sales 
SELECT * FROM fact_sales_import;

DROP TABLE fact_sales_import;

SELECT TOP 10 * FROM dim_date;
SELECT TOP 10 * FROM dim_product;
SELECT TOP 10 * FROM fact_sales;

UPDATE dim_date
SET quarter = DATEPART(QUARTER, full_date);

SELECT TOP 10 * 
FROM dim_date;

SELECT TOP 20 *
FROM dim_customer

SELECT TOP 10 *
FROM fact_sales;