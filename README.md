# SQL Data Analytics Project

## Overview

This project demonstrates end-to-end SQL Data Analytics using a modern Data Warehouse. The objective is to explore business data, identify trends, measure performance, and generate actionable insights that support data-driven decision-making.

The project follows a structured analytics workflow, starting with database exploration and progressing through advanced analytical techniques such as ranking analysis, trend analysis, segmentation, cumulative analysis, and business reporting.

---

## Project Objectives

* Explore and understand the available business data.
* Analyze customer behavior and purchasing patterns.
* Evaluate product performance and category trends.
* Identify top-performing and underperforming entities.
* Generate business reports using SQL.
* Transform raw data into actionable insights.

---

## Data Source

The datasets used in this project were generated from the Gold Layer of the SQL Data Warehouse project.

The Data Warehouse project integrates ERP and CRM source systems, performs data cleansing and transformation through Bronze and Silver layers, and provides business-ready dimensional models in the Gold layer.

Analytics in this repository are performed on:

* gold.dim_customers
* gold.dim_products
* gold.fact_sales

These datasets serve as the foundation for all exploratory and advanced analytics performed in this project.

---

## Analytics Workflow

### Exploratory Data Analysis (EDA)

1. Database Exploration
2. Dimensions Exploration
3. Date Range Exploration
4. Measures Exploration
5. Magnitude Analysis
6. Ranking Analysis

### Advanced Analytics

7. Change-Over-Time Analysis
8. Cumulative Analysis
9. Performance Analysis
10. Data Segmentation
11. Part-to-Whole Analysis

### Reporting

12. Customer Report
13. Product Report

---

## Technology Stack

* SQL Server
* SQL Queries
* SQL Server Management Studio (SSMS)
* Git & GitHub

---

## Repository Structure

## Project Structure

```text
sql-data-analytics-project/
│
├── scripts/
│   ├── 00_init_database.sql              # Database setup and data loading
│   ├── 01_database_exploration.sql       # Database exploration
│   ├── 02_dimensions_exploration.sql     # Dimension tables exploration
│   ├── 03_date_range_exploration.sql     # Date range analysis
│   ├── 04_measures_exploration.sql       # Business metrics analysis
│   ├── 05_magnitude_analysis.sql         # Magnitude analysis
│   ├── 06_ranking_analysis.sql           # Ranking analysis
│   ├── 07_change_over_time_analysis.sql  # Trend analysis over time
│   ├── 08_cumulative_analysis.sql        # Running totals and moving averages
│   ├── 09_performance_analysis.sql       # Year-over-Year performance analysis
│   ├── 10_part_to_whole_analysis.sql     # Contribution analysis
│   ├── 11_data_segmentation.sql          # Customer and product segmentation
│   ├── 12_report_customers.sql           # Customer report
│   └── 13_report_products.sql            # Product report
│
├── Project_roadmap.jpeg                  # Analytics workflow roadmap
├── README.md                             # Project documentation
└── LICENSE                               # MIT License
```


```

---

## Key Skills Demonstrated

* SQL Query Writing
* Exploratory Data Analysis (EDA)
* Business Analytics
* Customer Analytics
* Product Analytics
* Sales Analytics
* Trend Analysis
* Performance Analysis
* Data Segmentation
* Reporting and Insights Generation

---

## Business Questions Answered

* Who are the most valuable customers?
* Which products generate the highest revenue?
* How do sales change over time?
* Which categories contribute most to overall performance?
* What customer segments drive business growth?
* What are the top and bottom-performing products?

---

## Learning Outcomes

Through this project, I strengthened my understanding of:

* Data Exploration Techniques
* Analytical SQL Functions
* Window Functions
* Ranking Functions
* Aggregations and Grouping
* Business Reporting
* Data-Driven Decision Making

---

## Acknowledgements

Special thanks to **Baraa Khatib Salkini (Data With Baraa)** for providing high-quality SQL, Data Analytics, and Data Engineering learning resources on YouTube. His tutorials and project walkthroughs significantly contributed to my understanding of real-world analytics workflows and best practices.
