USE DATABASE SNOWFLAKE_LEARNING_DB

CREATE SCHEMA bronze
use schema bronze

CREATE OR REPLACE FILE FORMAT ff_csv
TYPE=CSV
SKIP_HEADER=1
FIELD_DELIMITER=','
TRIM_SPACE=true;

-- CREATING A STAGE FILE

CREATE OR REPLACE STAGE stg_orders
FILE_FORMAT=ff_csv;

CREATE OR REPLACE STAGE stg_customers
FILE_FORMAT=ff_csv;

-- CREATE TABLE orders_raw

CREATE OR REPLACE TABLE orders_raw(
order_id NUMBER,
customer_id STRING,
product_id STRING,
order_ts TIMESTAMP_NTZ,
order_amount NUMBER(10,2),
order_status STRING
);

CREATE OR REPLACE TABLE customers_raw(
customer_id string,
customer_name STRING,
email STRING,
city STRING,
updated_at TIMESTAMP_NTZ
);

-- COPY INTO to table Bronze layers from Staging

COPY INTO orders_raw from @stg_orders ON_ERROR='Continue'

COPY INTO customers_raw from @stg_customers ON_ERROR='Continue'

select * from customer_raw

select * from orders_raw
select * from customers_raw

SELECT * FROM INFORMATION_SCHEMA.LOAD_HISTORY ORDER BY LAST_LOAD_TIME desc;