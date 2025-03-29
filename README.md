# House Price Index (HPI) Database Project

![image](https://github.com/user-attachments/assets/3e60fec9-9ea0-4c43-810a-39ddc6d7b02c)

![image](https://github.com/user-attachments/assets/49bba3b9-79d3-427a-960e-76db69998902)


📌 Overview
The House Price Index (HPI) Database Project is designed to analyze trends in housing prices using structured SQL-based data processing. It involves data extraction, transformation, and analysis to track price changes over time on a monthly and quarterly basis, with insights visualized through Power BI dashboards.

🎯 Objectives
📂 Store and manage historical HPI data efficiently.
📊 Calculate year-over-year (YoY) changes for both monthly and quarterly data.
✅ Ensure data integrity and structure for effective querying and visualization.
📈 Provide insights into house price trends using analytical tools like Power BI.
🛠️ Features
🔹 Data Organization
📌 Separates raw data into hpi_monthly and hpi_quarterly tables.
⚡ Indexing for faster query performance.
🔄 Dynamic column adjustments to accommodate different data formats.
🔹 Year-over-Year (YoY) Calculation
📈 Uses LAG() function to compare prices from the same month/quarter in the previous year.
🚀 Handles missing values to prevent calculation errors.
🎯 Rounds results to two decimal places for clarity.
🔹 Scalability & Performance
⚙️ Well-indexed database design.
⚡ Structured queries for optimized retrieval.
📊 Ready for integration with BI tools for visualization.
📋 Database Schema
Tables:
hpi_monthly – Stores monthly house price index data.
hpi_quarterly – Stores quarterly house price index data.
hpi_master_test – A copy of the raw imported data.
📌 SQL Operations Used
Database Creation: CREATE DATABASE house_db;
Data Import: SELECT * FROM hpi_master_test;
Table Creation: CREATE TABLE hpi_monthly (...) and CREATE TABLE hpi_quarterly (...);
Data Insertion: INSERT INTO hpi_monthly (...) SELECT ... FROM hpi_master_test;
YoY Calculation: Using LAG() function and UPDATE queries.
Data Cleaning: Handling NULL values and rounding calculations.
📊 Insights from Power BI Visualizations
🔍 Yearly YoY Change Analysis (Akron, OH)
This dashboard provides a yearly perspective on house price trends in Akron, OH, highlighting YoY changes and long-term patterns.

Historical Volatility: Akron, OH, experienced significant fluctuations in YoY changes, with a peak of 133.49% in 1994 and a sharp decline to -24.59% in 1997, reflecting local market sensitivity to economic conditions.
Long-Term Cooling: The "Trends in Yearly YoY (%) Change" chart shows a consistent decline in YoY growth since the 1980s, stabilizing at 10.23% in recent years, indicating a more balanced but slower growth trajectory.
Localized Recovery Patterns: Akron saw a -14.89% YoY drop in 1991 but rebounded to 5.66% by 1992, showcasing resilience in the local housing market.
Seasonal Adjustments Matter: The dashboard highlights a stark difference between Not Seasonally Adjusted (49.77%) and Seasonally Adjusted (95.02%) YoY changes, emphasizing the importance of accounting for seasonal effects.
Economic Impact: Notable dips around the early 1990s and 2008 align with economic recessions, with Akron showing sharper local impacts.
🔍 Monthly YoY Change Analysis (East North Central Division)
This dashboard focuses on monthly YoY changes in the East North Central Division, offering a broader regional perspective.

Historical Peaks and Troughs: The "Monthly YoY Change (%) Over Time" chart shows a significant spike in the early 1980s, with YoY changes reaching nearly 40%, followed by a decline into negative territory by the late 1980s, likely tied to the early 1980s recession.
Recent Stability: The "Trends in Monthly YoY Change" chart indicates a downward trend in YoY growth since the 1970s, stabilizing around 2.82% in recent years, suggesting a more balanced regional market.
Seasonal Impact: A notable difference exists between Not Seasonally Adjusted (49.77%) and Seasonally Adjusted (95.02%) YoY changes, underscoring the need to account for seasonal fluctuations in monthly data.
Monthly Variability: The table shows YoY changes in the early 1990s ranging from 0.00% (May 1991) to 2.72% (April 1992), indicating a period of slow but steady recovery post-recession.
Regional Consistency: Compared to Akron’s yearly data, the East North Central Division shows less volatility, providing a more stable regional perspective.
Comparative Takeaways
The East North Central Division’s monthly data offers a broader, less volatile view compared to Akron’s yearly data, highlighting the value of analyzing both regional and local trends.
Both datasets emphasize the importance of seasonal adjustments, as unadjusted figures (49.77%) significantly differ from adjusted ones (95.02%), impacting trend interpretation.
Economic events, such as recessions in the early 1990s and 2008, are evident in both datasets, with Akron showing more pronounced local impacts.
📥 Data Source
The original dataset (hpi_master.csv) was sourced from Data.gov. The hpi_master_test table is a copy of the raw imported data.

🚀 Future Enhancements
