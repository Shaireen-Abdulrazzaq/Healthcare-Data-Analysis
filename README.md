# ✚ Hospital Executive Summary

![Dashboard Screenshot](Hospital%20Executive%20Dashboard.png)

## ✦ Project Overview
This project analyzes hospital operations data to identify billing trends, admission patterns, and diagnosis distribution. The goal was to transform raw admission records into an executive-level dashboard for operational decision-making.

## ✳ Tools Used
![Power Bi](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

---

## ❖ Deep Dive: Key Insights

### 1. Operational Efficiency (Length of Stay Analysis)
![Scatter Plot](scatter.png)
* **The Discovery:** This scatter plot reveals a major inefficiency. The trend line is nearly flat, meaning **longer patient stays do not result in significantly higher revenue.**
* **Business Impact:** Patients staying 20+ days (the outliers at the top) are occupying beds without generating proportional value. A review of discharge procedures for these specific cases could improve bed turnover rates.

### 2. Financial Stability (Payer Mix)
![Insurance Donut](donut.png)
* **The Discovery:** Unlike many hospitals that rely heavily on one insurer, our patient base is perfectly balanced between Cigna, Medicare, UnitedHealthcare, and Blue Cross.
* **Business Impact:** This **low concentration risk** means the hospital is financially stable even if one provider changes their reimbursement policies.

---

## ⌗ Technical Implementation

1.  **Data Cleaning:** Standardized text fields, removed duplicates using `ROW_NUMBER()`, and enforced data types in SQL.
2.  **Analysis:** Used SQL CTEs to compare individual patient stay duration against hospital averages to find the LOS outliers.
3.  **Visualization:** Built a focused executive dashboard with slicers for Blood Type and Gender to allow dynamic filtering.
