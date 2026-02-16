# Healthcare-Data-Analysis
End-to-end healthcare data analysis using SQL and Power BI including data cleaning, business analysis, and executive dashboard.


# Hospital Executive Summary | Power BI + SQL Project

![Dashboard Screenshot](YOUR_IMAGE_FILENAME.png)

## ✦ Project Overview
This project analyzes hospital operations data to identify billing trends, admission patterns, and diagnosis distribution. The goal was to transform raw admission records into an executive-level dashboard for operational decision-making.

## ❖ Key Insights & Business Impact

**1. Revenue is driven by chronic conditions**
* **Observation:** Arthritis, Diabetes, Hypertension, and Cancer dominate patient volume.
* **Business Impact:** These long-term conditions create recurring admissions and stable billing streams, suggesting revenue planning should align with chronic disease management programs.

**2. Elective admissions lead patient volume**
* **Observation:** Elective procedures represent the largest share of admissions compared to Emergency or Urgent care.
* **Business Impact:** Revenue forecasting is predictable as scheduled admissions are a core financial driver.

**3. Billing is evenly distributed across genders**
* **Observation:** Average billing is nearly identical (Male: $25,633 vs. Female: $25,483).
* **Business Impact:** Cost patterns are purely condition-driven rather than demographic-driven, allowing for simplified financial modeling.

**4. Length of Stay (LOS) varies significantly**
* **Observation:** Analysis reveals high variance, with some patients exceeding hospital averages by +7 days while others are discharged -8 days early.
* **Business Impact:** High deviation impacts bed utilization and revenue optimization. A review of discharge processes for outliers could improve operational efficiency.

## ✳ Tools Used
* **SQL (MySQL):** Data cleaning, CTEs for performance comparison, window functions for duplicate removal.
* **Power BI:** Data modeling, DAX measures, and interactive dashboard design.

## ⌗ Technical Implementation
1.  **Data Cleaning:** Standardized text fields, removed duplicates using `ROW_NUMBER()`, and enforced data types.
2.  **Analysis:** Used SQL CTEs to compare individual patient stay duration against hospital averages to find the LOS outliers mentioned above.
3.  **Visualization:** Built a focused executive dashboard with slicers for Blood Type and Gender to allow dynamic filtering.
