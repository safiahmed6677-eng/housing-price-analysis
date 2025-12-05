<h1 align="center">🏡 Housing Price Analysis — R Statistics, EDA & Regression Modelling</h1>

<p align="center">
  Comprehensive statistical analysis of housing prices using R.<br>
  Includes EDA, feature exploration, regression modelling, and a full written report.
</p>

---

<!-- Badges Row -->
<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white"/>
  <img src="https://img.shields.io/badge/ggplot2-1A162D?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/dplyr-1F77B4?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Statistics-4B8BBE?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Regression%20Modeling-0FAAFF?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/EDA-00897B?style=for-the-badge"/>
</p>

---

## 📘 Table of Contents
- [Project Overview](#project-overview)
- [Project Structure](#project-structure)
- [Tools & Libraries](#tools--libraries)
- [Key Analysis Steps](#key-analysis-steps)
- [Regression Modelling](#regression-modelling)
- [Diagnostic Checks](#diagnostic-checks)
- [Files Included](#files-included)
- [Key Findings](#key-findings)
- [CV Bullet](#cv-bullet)

---

## 📌 Project Overview

This project investigates **which features most strongly influence housing prices** using a dataset of **545 properties**. The workflow includes:

- Exploratory Data Analysis  
- Visualisation using `ggplot2`  
- Feature engineering  
- Linear regression  
- Log-transformed regression  
- Model comparison  
- Full professional report  

---

## 🔧 Tools & Libraries

- **R**
- **dplyr**
- **ggplot2**
- **MASS**
- **scales**

---

## 📊 Key Analysis Steps

### **1️⃣ Data Understanding**
- 545 rows, 13 variables  
- Mixture of numerical + categorical features  
- No missing data  
- No duplicates  
- Target variable (`price`) is right-skewed  

---

### **2️⃣ Exploratory Data Analysis (EDA)**

**Visualisations created:**

#### **📌 Distribution**
- Histogram of Price  

#### **📌 Categorical Price Comparison**
- Furnishing Status vs Price  
- Air Conditioning vs Price  
- Preferred Area vs Price  

#### **📌 Grouped Averages**
- Avg price by Bedrooms  
- Avg price by Number of Stories  

These plots help identify meaningful price drivers.

---

## 📈 Regression Modelling

Two models were developed:

---

### **📘 Model 1 — Linear Regression**
- **Adjusted R²: 0.6127**  
- Significant predictors:  
  - Bathrooms  
  - Air Conditioning  
  - Preferred Area  
  - Parking  
  - Hot Water Heating  

---

### **📘 Model 2 — Log-Transformed Regression**
- **Adjusted R²: 0.6279**  
- Better residual behaviour & interpretability  
- Coefficients represent *percentage change*  
- Example effects:
  - Air Conditioning → **+20.3%**
  - Bathroom (per unit) → **+18.4%**
  - Preferred Area → **+16.5%**
  - Unfurnished → **−12.3%**

---

## 🔍 Diagnostic Checks

Performed full diagnostic suite:

- Residuals vs fitted  
- Q-Q normality plot  
- Leverage points  
- Influence (Cook's Distance)  

Model 2 performs better across assumptions.

---

## 📄 Files Included

- `housing_analysis.R` — full reproducible analysis  
- `housing_report.pdf` — final written report  
- `/assets/` — exported graphs  
- `/data/` — dataset  

---

## 🧠 Key Findings

- Homes with **air conditioning, more bathrooms, preferred neighborhood, and parking** sell for **significantly higher prices**.  
- The **log model** improves both interpretability and statistical fit.  
- Approximately **63% of price variability** is explained by the model.  

---


