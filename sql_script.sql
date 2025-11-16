CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE sales_data(
Order_ID VARCHAR(20),
Oreder_date DATE,
Ship_date DATE,
Year INT,
Month VARCHAR(20),
Customer_ID VARCHAR(20),
    Segment VARCHAR(30),
    Country VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(30),
    Category VARCHAR(30),
    Sub_Category VARCHAR(30),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    Profit_Margin FLOAT,
    Delivery_Days INT
);

-- ---------------------------------------------------------------------
-- SQL Script: Sales Data Analysis
-- Dataset Source: Cleaned_Sales.csv (loaded via Python to MySQL)
-- Table Name: sales_data
-- Description:
--     This script contains SQL queries used to analyze cleaned
--     e-commerce sales data after ETL processing.
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- OVERALL METRICS
-- ---------------------------------------------------------------------

DESCRIBE  sales_data;
-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM sales_data;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM sales_data;

-- Average Profit Margin
SELECT AVG(`profit margin(%)`) 
FROM sales_data;


-- ---------------------------------------------------------------------
-- CATEGORY & SEGMENT INSIGHTS
-- ---------------------------------------------------------------------

-- Total Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Total Profit by Sub-Category
SELECT `Sub-Category`, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


-- Profit Margin by Segment
SELECT Segment, AVG(`profit margin(%)`) AS Avg_Profit_Margin
FROM sales_data
GROUP BY Segment;


-- ---------------------------------------------------------------------
-- GEOGRAPHICAL INSIGHTS
-- ---------------------------------------------------------------------

-- Top 10 Cities by Sales
SELECT City, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ---------------------------------------------------------------------
-- TIME-BASED ANALYSIS
-- ---------------------------------------------------------------------

-- Monthly Sales Trend
SELECT Year, Month, SUM(Sales) AS Monthly_Sales
FROM sales_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- Yearly Sales Comparison
SELECT Year, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Year
ORDER BY Year;

-- Average Delivery Days Per Year
SELECT year, AVG(`Delivery days`) AS Avg_Delivery_Days
FROM sales_data
GROUP BY year
ORDER BY year;


-- ---------------------------------------------------------------------
-- DELIVERY PERFORMANCE
-- ---------------------------------------------------------------------

-- Impact of Delivery Days on Profit
SELECT `Delivery days`, AVG(Profit) AS Avg_Profit
FROM sales_data
GROUP BY `Delivery days`
ORDER BY `Delivery days`;


-- Fastest vs Slowest Delivery Regions
SELECT Region, AVG(`Delivery days`) AS Avg_Delivery_Time
FROM sales_data
GROUP BY Region
ORDER BY Avg_Delivery_Time;






