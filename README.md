# House Price Index (HPI) Database Project

## Overview
This project involves creating and managing a structured database for analyzing house price trends. The database processes and organizes monthly and quarterly house price index (HPI) data, calculates year-over-year (YoY) changes, and ensures efficient storage and retrieval.

## Database Structure

### 1. **Database Creation**
- `house_db` is the primary database used to store all HPI-related data.
- The raw data is imported into `hpi_master_test` for processing.

### 2. **Tables Created**
#### `hpi_monthly`
Stores monthly house price index data.

#### `hpi_quarterly`
Stores quarterly house price index data.

## Data Processing

### 1. **Data Import and Transformation**
- The `hpi_master_test` table is used as the source.
- Monthly and quarterly records are separated into `hpi_monthly` and `hpi_quarterly` tables, respectively.
- The `level` column is adjusted based on the maximum length found in the dataset.

### 2. **Calculating Year-over-Year (YoY) Change**
- A new column `yoy_change` is added to both tables.
- The `LAG()` function is used to calculate YoY changes:
  - **Monthly**: Compares the current month's `index_nsa` to the value from 12 months ago.
  - **Quarterly**: Compares the current quarter's `index_nsa` to the value from 4 quarters ago.
- Any `NULL` values in `yoy_change` are updated to `0`.
- Values are rounded to two decimal places for better readability.

## Key SQL Operations
- **Checking Data Integrity**: Queries check for duplicate records before updating YoY changes.
- **Indexing**: Ensures efficient searches by indexing `place_name`, `yr`, and `period`.
- **Updating Records**: Safe updates are handled using `SET SQL_SAFE_UPDATES`.

## Usage
This database can be used for:
- Tracking house price trends over time.
- Comparing price changes between different locations.
- Visualizing YoY trends in Power BI or other BI tools.

