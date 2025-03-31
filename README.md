# Data Mining Project — USA Fatal Crash Analysis (2015–2022)

> Master 1 MLDM | Université Jean Monnet de Saint-Étienne  
> Author: Abhishe KUMAR  
> Date: March 2025

---

## Project Overview

This project analyzes fatal traffic crashes across the United States between **2015 and 2022** using real-world data sourced from Kaggle. We perform end-to-end data mining workflows, including:

- Data understanding and cleaning  
- Exploratory Data Analysis (EDA)  
- Clustering states based on crash patterns  
- Correlation analysis  
- Predictive modeling for fatalities  
- Actionable recommendations for policy

---

## Repository Structure

```bash
.
├── R/
│   ├── 01_data_understanding.R    # Initial EDA & summary insights
│   ├── 02_data_preparation.R      # Cleaning and feature engineering
│   └── 03_modelling.R             # Clustering, correlation, regression
├── data/
│   └── FatalityCrashData_clean.csv
├── images/
│   ├── fatalities_by_state.png
│   ├── crashes_by_year.png
│   ├── crashes_by_month.png
│   ├── crashes_by_dayofweek.png
│   ├── crashes_by_hour.png
│   ├── fatalities_per_crash.png
│   ├── correlation_matrix.png
│   ├── state_clustering.png
│   └── actual_vs_predicted_fatals.png
├── report/
│   └── DataMiningReport.pdf       # Final PDF report
└── README.md                      # Project overview & setup instructions

