
---

# 🏡 House Sales Analysis (1975–2024)

![image](https://github.com/user-attachments/assets/7cdc5fde-a1ab-42c5-8b27-f147985be2b2)

This project explores house price growth trends across U.S. states from 1975 to 2024, using historical index data stored in a PostgreSQL database (House_db). The analysis places a spotlight on Montana, with comparisons to other high-growth states such as Utah, Washington, and Oregon.

📊 Montana Housing Market Metrics
Percentage Growth: 260.15%

Total Index Growth: 492.41

Average Quarterly Growth: 0.64

📌 Key Findings
🔝 Highest Total Growth (1975–2024)
Montana

Utah

Washington

Oregon

Montana leads all states in total index growth, underscoring its strong long-term increase in housing values and making it a standout in the national housing market.
### 📈 Quarterly Growth Leaders
- **Utah** ranks first in quarterly growth, followed closely by **Montana** and **Colorado**.
- Other strong performers: Oregon, Idaho, and Washington.

### 📉 Historical Trends
- The **average seasonally adjusted index (`index_sa`)** illustrates steady house price growth with a sharp increase post-2000.
- A dip around the early 1990s suggests possible market corrections or economic shifts.

## 🗺️ Visualizations

- **Bar Charts** for percentage and total growth
- **Map** of top-performing states
- **Quarterly Growth Rankings**
- **Line Chart** of indexed price trends over time

## 🛠️ Tools & Technologies

| Tool         | Purpose                          |
|--------------|----------------------------------|
| PostgreSQL   | Data storage and querying (`House_db`) |
| SQL          | Data transformation and calculation |
| Power BI     | Data visualization and dashboarding |
| GitHub       | Version control and collaboration |

## 🧾 Data Overview
- **Database Name:** `House_db`
- **Frequency:** Quarterly
- **Index Used:** `index_sa` (Seasonally Adjusted)
- **Time Period:** 1975 to 2024
- **Data Source:** [gov.ie housing dataset ](https://www.gov.ie)

## 📁 Project Structure
```bash
├── sql/
│   └── house_growth_analysis.sql
├── visuals/
│   └── dashboard.png
├── README.md
```

## 🚀 How to Use

1. **Clone this repository**  
   `git clone https://github.com/your-username/house-sales-analysis.git`

2. **Import the SQL dataset** into PostgreSQL as `House_db`.

3. **Run analysis queries** from `sql/house_growth_analysis.sql`.

4. **Open the Power BI dashboard** to explore visualizations.

5. **Adjust filters by state, year, or index type** to explore trends.

## 🎯 Key Learning

This project highlights how combining **SQL querying in PostgreSQL** with **Power BI dashboards** enables deep, visually-driven insights into long-term trends in the U.S. housing market.

---

Would you like me to help write the SQL queries section too, or export this as a downloadable markdown file?
