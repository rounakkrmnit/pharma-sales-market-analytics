-- Active: 1788859090387@@127.0.0.1@3306@pharma_analytics
-- Pharma sales & Market Analysis
USE pharma_analytics;

-- 1. Annual Sales Performance

SELECT
    Year,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY Year
ORDER BY Year;

-- 2. Year-over-Year Sales Growth

WITH yearly_sales AS (
    SELECT
        Year,
        SUM(Sales) AS Net_Sales
    FROM pharma_sales
    GROUP BY Year
)

SELECT
    Year,
    ROUND(Net_Sales, 2) AS Net_Sales,
    ROUND(
        (Net_Sales - LAG(Net_Sales) OVER (ORDER BY Year))
        / LAG(Net_Sales) OVER (ORDER BY Year) * 100,
        2
    ) AS YoY_Growth_Percent
FROM yearly_sales
ORDER BY Year;

-- 3. Product-Class Performance

SELECT
    `Product Class`,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY `Product Class`
ORDER BY Net_Sales DESC;

-- 4. Channel Performance

SELECT
    Channel,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY Channel
ORDER BY Net_Sales DESC;

-- 5. Top 10 Products by Net Sales

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY `Product Name`
ORDER BY Net_Sales DESC
LIMIT 10;

-- 6. Country / Market Performance

SELECT
    Country,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY Country
ORDER BY Net_Sales DESC;

-- 7. Top 10 Customers by Net Sales

SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY `Customer Name`
ORDER BY Net_Sales DESC
LIMIT 10;

-- 8. Sales-Team Performance

SELECT
    `Sales Team`,
    ROUND(SUM(Sales), 2) AS Net_Sales,
    ROUND(SUM(Quantity), 2) AS Total_Quantity,
    COUNT(*) AS Transactions
FROM pharma_sales
GROUP BY `Sales Team`
ORDER BY Net_Sales DESC;

-- 9. Return / Negative Transaction Analysis

SELECT
    Year,
    COUNT(*) AS Return_Transactions,
    ROUND(ABS(SUM(Sales)), 2) AS Return_Value
FROM pharma_sales
WHERE Quantity < 0
GROUP BY Year
ORDER BY Year;

-- 10. Sales Representative Ranking

WITH rep_sales AS (
    SELECT
        `Name of Sales Rep`,
        SUM(Sales) AS Net_Sales
    FROM pharma_sales
    GROUP BY `Name of Sales Rep`
)

SELECT
    `Name of Sales Rep`,
    ROUND(Net_Sales, 2) AS Net_Sales,
    RANK() OVER (ORDER BY Net_Sales DESC) AS Sales_Rank
FROM rep_sales
ORDER BY Sales_Rank;