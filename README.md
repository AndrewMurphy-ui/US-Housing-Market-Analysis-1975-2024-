# House Price Index (HPI) Database Project

![image](https://github.com/user-attachments/assets/3e60fec9-9ea0-4c43-810a-39ddc6d7b02c)

![image](https://github.com/user-attachments/assets/49bba3b9-79d3-427a-960e-76db69998902)


📌 Overview
The House Price Index (HPI) Database Project is a SQL-based initiative designed to analyze housing price trends over time. It processes historical data to calculate year-over-year (YoY) changes on a monthly and quarterly basis, with insights visualized using Power BI dashboards. This project provides a foundation for understanding real estate market dynamics through structured data management and analytical tools.


🎯 Objectives
📂 Store and manage historical HPI data efficiently.
📊 Calculate year-over-year (YoY) changes for monthly and quarterly data.
✅ Ensure data integrity and structure for effective querying and visualization.
📈 Provide actionable insights into house price trends using Power BI.
🛠️ Features

🔹 Data Organization
Separates raw data into hpi_monthly and hpi_quarterly tables for streamlined analysis.
Implements indexing to enhance query performance.
Supports dynamic column adjustments to handle varying data formats.

🔹 Year-over-Year (YoY) Calculation
Uses the LAG() function to compare prices from the same month/quarter in the previous year.
Handles missing values to ensure accurate calculations.
Rounds results to two decimal places for clarity.

🔹 Scalability & Performance
Features a well-indexed database design for efficient data retrieval.
Includes structured queries optimized for performance.
Designed for seamless integration with BI tools like Power BI for visualization.

📋 Database Schema
Tables
hpi_monthly: Stores monthly house price index data.
hpi_quarterly: Stores quarterly house price index data.
hpi_master_test: A copy of the raw imported data for reference.
SQL Operations Used
Database Creation: CREATE DATABASE house_db;
Data Import: SELECT * FROM hpi_master_test;
Table Creation: CREATE TABLE hpi_monthly (...); and CREATE TABLE hpi_quarterly (...);
Data Insertion: INSERT INTO hpi_monthly (...) SELECT ... FROM hpi_master_test;
YoY Calculation: Utilizes LAG() function and UPDATE queries.
Data Cleaning: Handles NULL values and rounds calculations for consistency.

📊 Insights from Power BI Visualizations


🔍 Yearly YoY Change Analysis (Akron, OH)
This dashboard provides a yearly perspective on house price trends in Akron, OH, focusing on YoY changes and long-term patterns.

Historical Volatility: Akron, OH, shows significant fluctuations, with a peak YoY change of 133.49% in 1994 and a low of -24.59% in 1997, reflecting local market sensitivity to economic conditions.
Long-Term Cooling: The "Trends in Yearly YoY (%) Change" chart indicates a consistent decline in YoY growth since the 1980s, stabilizing at 10.23% in recent years, suggesting a slower but more balanced growth trajectory.
Localized Recovery Patterns: A -14.89% YoY drop in 1991 was followed by a rebound to 5.66% in 1992, highlighting resilience in Akron’s housing market.
Seasonal Adjustments Matter: Not Seasonally Adjusted (49.77%) and Seasonally Adjusted (95.02%) YoY changes differ significantly, emphasizing the need for seasonal adjustments.
Economic Impact: Dips around the early 1990s and 2008 align with economic recessions, with Akron experiencing sharper local impacts.

🔍 Monthly YoY Change Analysis (East North Central Division)
This dashboard focuses on monthly YoY changes in the East North Central Division, offering a broader regional perspective.

Historical Peaks and Troughs: The "Monthly YoY Change (%) Over Time" chart reveals a spike in the early 1980s (nearly 40%), followed by a decline into negative territory by the late 1980s, likely tied to the early 1980s recession.
Recent Stability: The "Trends in Monthly YoY Change" chart shows a downward trend in YoY growth since the 1970s, stabilizing at 2.82% in recent years, indicating a more balanced regional market.
Seasonal Impact: Not Seasonally Adjusted (49.77%) and Seasonally Adjusted (95.02%) YoY changes highlight the importance of accounting for seasonal fluctuations in monthly data.
Monthly Variability: YoY changes in the early 1990s range from 0.00% (May 1991) to 2.72% (April 1992), reflecting a slow but steady recovery post-recession.
Regional Consistency: Compared to Akron’s yearly data, the East North Central Division shows less volatility, providing a more stable regional view.
Comparative Takeaways
The East North Central Division’s monthly data offers a broader, less volatile perspective compared to Akron’s yearly data, underscoring the value of analyzing both regional and local trends.
Seasonal adjustments are critical in both datasets, as unadjusted figures (49.77%) differ significantly from adjusted ones (95.02%), impacting trend interpretation.
Economic events, such as recessions in the early 1990s and 2008, are evident in both datasets, with Akron showing more pronounced local impacts.


📥 Data Source
The original dataset (hpi_master.csv) was sourced from Data.gov. The hpi_master_test table serves as a copy of the raw imported data.
