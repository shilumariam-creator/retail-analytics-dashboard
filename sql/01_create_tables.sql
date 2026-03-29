--Customer Dimension
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    customer_segment VARCHAR(50),
    loyalty_member VARCHAR(10)
);
--Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_category VARCHAR(50),
    price_per_unit FLOAT
);
--Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT,
    quarter INT
);

--Fact table
CREATE TABLE fact_sales (
    transaction_id INT PRIMARY KEY,
    date_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount FLOAT,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

--Quick Test
SELECT * FROM dim_customer