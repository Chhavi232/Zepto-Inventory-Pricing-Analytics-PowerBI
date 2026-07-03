# Zepto Inventory and Pricing Analytics Dashboard

## Project Overview

This project presents an interactive Power BI dashboard developed to analyze Zepto's inventory, pricing, discounts, and stock availability. The dashboard converts raw product data into meaningful business insights and provides a clear view of product performance across different categories.

The main objective of this project is to understand inventory distribution, pricing patterns, discount strategies, and stock availability using data cleaning, SQL analysis, and data visualization techniques.

## Dashboard Preview

![Zepto Inventory and Pricing Analytics Dashboard](Zepto_Dashboard.pdf)

## Key Performance Indicators

The dashboard highlights the following key metrics:

* Total Products: 3,731
* Average Selling Price: ₹141.97
* Average Discount: 7.62%
* Total Inventory Value: ₹2.24M
* Out of Stock Products: 12.14%

## Dashboard Features

The dashboard includes interactive filters for:

* Product Category
* Weight Category
* Stock Status

Users can dynamically filter the dashboard and analyze inventory and pricing data based on different business requirements.

## Visualizations

### Inventory Value by Category

A treemap is used to compare the total inventory value across different product categories. Categories such as Cooking Essentials and Munchies contribute significantly to the overall inventory value.

### Top 10 Products by Inventory Value

This visualization identifies products with the highest inventory value and helps understand which products have the largest amount of capital tied up in stock.

### Average Discount Percentage by Category

The bar chart compares average discount percentages across product categories. It helps identify categories receiving higher promotional discounts.

### MRP vs Selling Price by Category

This chart compares the average Maximum Retail Price with the average discounted selling price. It provides a clear view of pricing differences and discount patterns across categories.

### Stock Count by Status

The donut chart represents the proportion of products that are currently in stock and out of stock. The analysis shows that 87.86% of products are available, while 12.14% are out of stock.

### Available Quantity by Category

This visualization compares available inventory quantities across product categories and helps identify categories with higher or lower stock levels.

## Data Cleaning and Preparation

The dataset was cleaned and transformed before analysis. The major data preparation steps included:

* Handling missing and blank values
* Removing invalid records
* Correcting inconsistent data types
* Cleaning product and category fields
* Standardizing pricing columns
* Validating MRP and discounted selling price values
* Preparing stock availability fields
* Creating calculated columns and measures for analysis

## SQL Analysis

SQL was used to explore and analyze the cleaned Zepto dataset. Queries were written to understand:

* Product distribution across categories
* Products with the highest inventory value
* Average discount percentage by category
* Stock availability
* MRP and selling price differences
* Category-wise available quantity
* Out-of-stock product percentage

## Power BI Measures

DAX measures were created to calculate important business metrics, including:

* Total Products
* Average Selling Price
* Average Discount Percentage
* Total Inventory Value
* Out of Stock Percentage

These measures were used to create dynamic KPI cards and interactive visualizations.

## Tools and Technologies

* SQL
* Power BI
* DAX
* Power Query
* Data Cleaning
* Data Visualization
* Data Analysis

## Key Insights

* The dashboard analyzes 3,731 products across multiple categories.
* The average selling price of products is approximately ₹141.97.
* Products receive an average discount of 7.62%.
* The total inventory value is approximately ₹2.24 million.
* Around 12.14% of products are currently out of stock.
* Cooking Essentials and Munchies are among the categories with the highest inventory value.
* Fruits and Vegetables receive a comparatively higher average discount.
* Inventory distribution varies significantly across product categories.

## Project Workflow

1. Collected and explored the Zepto product dataset.
2. Cleaned and transformed the raw data.
3. Performed exploratory analysis using SQL.
4. Imported the processed dataset into Power BI.
5. Created DAX measures for business KPIs.
6. Designed interactive charts and visualizations.
7. Added slicers for category, weight category, and stock status.
8. Developed the final interactive analytics dashboard.

## Business Use Case

The dashboard can help inventory and pricing teams monitor stock availability, identify high-value inventory categories, analyze discount strategies, and compare product pricing. These insights can support better inventory planning and data-driven pricing decisions.

## Author

**Chhavi Mittal**

B.E. Computer Engineering
Thapar Institute of Engineering and Technology

GitHub: Chhavi232

