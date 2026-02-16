# ✚ Hospital Executive Summary

![Dashboard Screenshot](Hospital%20Executive%20Dashboard.png)

## ✦ Project Overview

This project analyzes hospital operations data to identify billing trends, admission patterns, and diagnosis distribution. The goal was to transform raw admission records into an executive-level dashboard for operational decision-making.

## ✳ Tools Used

![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

---

## ❖ Key Findings & Recommendations

### 1. Operational Efficiency (Length of Stay Analysis)

![Scatter Plot](assets/scatter.png)

**The Discovery:** This scatter plot reveals a major inefficiency. The trend line is nearly flat, meaning **longer patient stays do not result in significantly higher revenue.**

**Business Impact:** Patients staying 20+ days (the outliers at the top) are occupying beds without generating proportional value.

**Actionable Recommendation:**
- Conduct a case review for patients with 20+ day stays to identify discharge bottlenecks (administrative delays, coordination issues, etc.)
- Implement a protocol to flag long-stay cases after day 15 for management review
- Target a 10-15% reduction in average length of stay within 6 months
- Expected outcome: Improved bed turnover and increased revenue per patient

---

### 2. Financial Stability (Payer Mix)

![Donut Chart](assets/donut.png)

**The Discovery:** Unlike many hospitals that rely heavily on one insurer, our patient base is perfectly balanced between Cigna, Medicare, UnitedHealthcare, and Blue Cross.

**Business Impact:** This **low concentration risk** means the hospital is financially stable even if one provider changes their reimbursement policies.

**Actionable Recommendation:**
- Maintain diversified payer relationships—this is a competitive advantage
- Monitor each payer's reimbursement trends quarterly to identify shifting patterns early
- Use this stability as a selling point to investors/stakeholders

---

## ⌗ Technical Implementation

### SQL Approach

1. **Data Cleaning & Standardization**
   - Used `TRIM()` and `UPPER()` functions to standardize text fields
   - Identified and removed duplicates using `ROW_NUMBER()` OVER `PARTITION BY` to flag duplicate patient admissions
   - Enforced data types for dates and numerical fields to prevent calculation errors

2. **Patient Stay Analysis**
   - Created a CTE (Common Table Expression) to calculate hospital-wide average length of stay
   - Compared each individual patient's stay duration against their hospital's average using window functions (`AVG() OVER (PARTITION BY hospital)`)
   - Identified outliers (patients with stays 30%+ above hospital average) for executive attention

3. **Billing & Diagnosis Analysis**
   - Aggregated billing amounts by medical condition and admission type to identify high-revenue and high-volume categories
   - Used `GROUP BY` with `HAVING` clauses to filter meaningful segments (e.g., conditions affecting 100+ patients)
   - Calculated percentage contribution of each diagnosis to total revenue for prioritization

### Power BI Implementation

1. **Data Connection:** Loaded cleaned SQL query results into Power BI as a fact table
2. **Slicers:** Added dynamic filters for Blood Type and Gender to allow stakeholders to drill down by demographics
3. **KPIs:** Displayed total billing, average stay, patient count, and doctor count as executive summary metrics
4. **Visualizations:**
   - Line chart for seasonal billing trends by medical condition
   - Scatter plot with trend line for length-of-stay vs. revenue correlation
   - Donut chart for admission type distribution
   - Bar chart for top medical conditions by patient count

---

## 📊 Dashboard Features

- **Executive Summary Cards:** Total billing, average stay, patient count, doctor count
- **Dynamic Filtering:** Blood Type and Gender slicers for demographic drill-down
- **Trend Analysis:** Monthly billing trends for top chronic conditions (Diabetes, Hypertension, Obesity)
- **Operational Insights:** Length of stay vs. revenue correlation to identify efficiency gaps
- **Patient Distribution:** Age group analysis and admission type breakdown

---

## 🎯 Next Steps / Future Enhancements

1. **Add Readmission Rate Analysis:** Identify which conditions have high readmission rates and flag quality issues
2. **Implement Cost Per Case:** Calculate cost-to-revenue ratio by diagnosis to identify unprofitable services
3. **Doctor Performance Dashboard:** Track admissions, revenue, and average stay by physician
4. **Seasonal Forecasting:** Use historical trends to predict Q1/Q2 admission volumes for staffing planning

---

## 📁 Repository Structure

```
├── Healthcare-Data-Analysis.sql       # All SQL queries for data cleaning and analysis
├── Hospital_Executive_Dashboard.pbix  # Power BI dashboard file (interactive)
├── Hospital Executive Dashboard.png   # Static screenshot of dashboard
├── healthcare_dataset.csv             # Raw data (40,235 patient records)
├── assets/                            # Supporting images and charts
│   ├── scatter.png
│   └── donut.png
└── README.md                          # This file
```

---

## 📝 How to Use

1. **View the Dashboard:** Open `Hospital_Executive_Dashboard.pbix` in Power BI Desktop
2. **Review the SQL:** Check `Healthcare-Data-Analysis.sql` for all queries and transformations
3. **Understand the Data:** See `healthcare_dataset.csv` for raw data structure
4. **Read the Insights:** Review key findings above for business context

---

## License

MIT License - See LICENSE file for details
