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

<img src="assets/scatter.png" width="500">

**The Discovery:** This scatter plot reveals a major inefficiency. The trend line is nearly flat, meaning **longer patient stays do not result in significantly higher revenue.**

**Business Impact:** Patients staying 20+ days (the outliers at the top) are occupying beds without generating proportional value.

**Actionable Recommendation:**
- Conduct a case review for patients with 20+ day stays to identify discharge bottlenecks (administrative delays, coordination issues, etc.)
- Implement a protocol to flag long-stay cases after day 15 for management review
- Target a 10-15% reduction in average length of stay within 6 months
- Expected outcome: Improved bed turnover and increased revenue per patient

---

### 2. Financial Stability (Payer Mix)

<img src="assets/donut.png" width="400">

**The Discovery:** Unlike many hospitals that rely heavily on one insurer, our patient base is perfectly balanced between Cigna, Medicare, UnitedHealthcare, and Blue Cross.

**Business Impact:** This **low concentration risk** means the hospital is financially stable even if one provider changes their reimbursement policies.

**Actionable Recommendation:**
- Maintain diversified payer relationships—this is a competitive advantage
- Monitor each payer's reimbursement trends quarterly to identify shifting patterns early
- Use this stability as a selling point to investors/stakeholders

---


⌗ Technical Implementation
SQL: Data cleaning with ALTER TABLE MODIFY, ROW_NUMBER() for duplicates. Built CTEs to calculate hospital averages, then compared individual patient stays using JOINs and DATEDIFF(). Ranked high-billing patients by condition using RANK() OVER(), aggregated by medical condition and admission type.

Power BI: Loaded cleaned SQL results as fact table. Added slicers (Blood Type, Gender) for drill-down. Displayed KPIs (total billing, avg stay, patient count, doctor count). Built line chart (billing trends), scatter plot (stay vs. revenue), donut chart (admission types), bar chart (top conditions).
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
