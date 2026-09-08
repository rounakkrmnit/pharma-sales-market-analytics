# Pharma Sales & Market Analytics

## Overview

An end-to-end pharmaceutical sales analytics project analyzing **254K+ transactions** to evaluate sales trends, product performance, channel performance, market contribution, and returns.

## Objectives

- Analyze pharmaceutical sales performance across multiple years
- Identify year-over-year sales growth and decline
- Evaluate product-class and product-level performance
- Compare Pharmacy and Hospital channels
- Analyze market and customer performance
- Evaluate sales-team and sales-representative performance
- Analyze transaction returns and return-rate trends
- Build interactive dashboards for business insights

## Tools & Technologies

- Python
- Pandas
- NumPy
- SQL
- MySQL
- Microsoft Excel
- Tableau
- Matplotlib
- Plotly
- Scikit-learn

## Dataset

The dataset contains pharmaceutical wholesale-retail transaction data with information including:

- Distributor
- Customer
- City
- Country
- Channel
- Sub-channel
- Product
- Product Class
- Quantity
- Price
- Sales
- Month
- Year
- Sales Representative
- Manager
- Sales Team

## Data Preparation

The dataset was prepared using Python and Pandas.

Key data-quality steps included:

- Checked for missing values
- Identified and removed **4 duplicate records**
- Validated sales values using `Quantity × Price`
- Identified **2,633 negative transactions** as return/reversal transactions
- Retained valid negative transactions for net-sales analysis

Final dataset size: **254,078 transactions**

## Key Insights

### Sales Performance

- Net sales totaled approximately **$11.80B**
- Sales increased by **29.81% YoY in 2018**
- Sales declined by **16.42% in 2019**
- Sales declined by **9.26% in 2020**

### Channel Performance

- Pharmacy generated approximately **52.7%** of total net sales
- Hospital generated approximately **47.3%**

### Product Performance

- **Analgesics** was the highest-performing product class by net sales.
- Product-level analysis identified the top-performing pharmaceutical products.

### Returns

- Identified **2,633 negative transactions** representing returns/reversals.
- Return-rate analysis showed an increase from **0.62% to 1.82%** between 2018 and 2020.

## SQL Analysis

The project includes 10 SQL analyses covering:

1. Annual sales performance
2. Year-over-year sales growth
3. Product-class performance
4. Channel performance
5. Top 10 products
6. Country/market performance
7. Top 10 customers
8. Sales-team performance
9. Return analysis
10. Sales-representative ranking

SQL techniques used include:

- Aggregations
- `GROUP BY`
- `ORDER BY`
- CTEs
- `LAG()`
- `RANK()`
- Filtering
- Window functions

## Dashboard

An interactive Tableau dashboard was developed to analyze:

- Sales performance
- Year-over-year trends
- Product-class performance
- Channel performance
- Returns
- Market performance

**Tableau Dashboard:** Add Tableau Public link here

## Project Structure

```text
pharma-sales-market-analytics/
│
├── data/
│   └── pharma_sales_cleaned.csv
│
├── notebooks/
│   └── pharma_analysis.ipynb
│
├── sql/
│   └── pharma_analysis.sql
│
├── .gitignore
├── requirements.txt
└── README.md