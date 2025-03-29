# House Price Index (HPI) Database Project

![image](https://github.com/user-attachments/assets/3e60fec9-9ea0-4c43-810a-39ddc6d7b02c)

![image](https://github.com/user-attachments/assets/49bba3b9-79d3-427a-960e-76db69998902)



## 📌 Overview
The **House Price Index (HPI) Database Project** is designed to analyze trends in housing prices using structured SQL-based data processing. It involves data extraction, transformation, and analysis to track price changes over time on a **monthly** and **quarterly** basis.

## 🎯 Objectives
- **📂 Store and manage** historical HPI data efficiently.
- **📊 Calculate year-over-year (YoY) changes** for both monthly and quarterly data.
- **✅ Ensure data integrity and structure** for effective querying and visualization.
- **📈 Provide insights** into house price trends using analytical tools like Power BI.

## 🛠️ Features
### 🔹 Data Organization
- 📌 Separates raw data into `hpi_monthly` and `hpi_quarterly` tables.
- ⚡ Indexing for faster query performance.
- 🔄 Dynamic column adjustments to accommodate different data formats.

### 🔹 Year-over-Year (YoY) Calculation
- 📈 Uses `LAG()` function to compare prices from the same month/quarter in the previous year.
- 🚀 Handles missing values to prevent calculation errors.
- 🎯 Rounds results to two decimal places for clarity.

### 🔹 Scalability & Performance
- ⚙️ Well-indexed database design.
- ⚡ Structured queries for optimized retrieval.
- 📊 Ready for integration with BI tools for visualization.

## 📋 Database Schema
### Tables:
1. **hpi_monthly** – Stores monthly house price index data.
2. **hpi_quarterly** – Stores quarterly house price index data.
3. **hpi_master_test** – A copy of the raw imported data.

## 📌 SQL Operations Used
- **Database Creation**: `CREATE DATABASE house_db;`
- **Data Import**: `SELECT * FROM hpi_master_test;`
- **Table Creation**: `CREATE TABLE hpi_monthly (...)` and `CREATE TABLE hpi_quarterly (...);`
- **Data Insertion**: `INSERT INTO hpi_monthly (...) SELECT ... FROM hpi_master_test;`
- **YoY Calculation**: Using `LAG()` function and `UPDATE` queries.
- **Data Cleaning**: Handling `NULL` values and rounding calculations.

## 📊 Insights & Future Enhancements
- Incorporate additional economic indicators for deeper analysis.
- Expand to include regional and national housing data.
- Automate data updates using ETL pipelines.

## 📥 Data Source
The original dataset (`hpi_master.csv`) was sourced from [Data.gov](https://data.gov/). The `hpi_master_test` table is a copy of the raw imported data.

This project provides a solid foundation for analyzing and visualizing real estate trends. 🚀

