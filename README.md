# 🏡 Housing Price Analysis — R Statistics, EDA & Regression Modelling

This project analyses the factors affecting housing prices using a dataset of 545 properties.  
The analysis includes exploratory data analysis, feature engineering, and linear regression modelling (with and without log transformation).  
A full report and R code are included.

---

## 📁 Project Structure


---

## 🔧 Tools & Libraries

- R  
- dplyr  
- ggplot2  
- MASS  
- scales  

---

## 📊 Key Analysis Steps

### **1. Data Understanding**
- 545 rows, 13 columns  
- Mix of numeric + categorical features  
- No missing values  
- No duplicates  
- Skewed target variable (price)

### **2. EDA**
Included visualisations:
- Histogram of price  
- Boxplots by:
  - furnishing status  
  - air conditioning  
  - preferred area  
- Bar charts for:
  - average price by bedrooms  
  - average price by stories  

### **3. Modelling**
Two models were built:

#### **Model 1 — Linear Regression**
- Adjusted R²: 0.6127  
- Significant predictors:  
  bathrooms, A/C, preferred area, parking, hot water heating, etc.

#### **Model 2 — Log-Transformed Regression**
- Adjusted R²: 0.6279  
- Better residual behaviour  
- Coefficients represent % change in price  

Example:  
- Air conditioning → +20.3%  
- Bathroom → +18.4%  
- Preferred area → +16.5%  
- Unfurnished → –12.3%

### **4. Diagnostics**
- Check residual vs fitted  
- Q-Q plot  
- Leverage & influence  

---

## 📄 Files Included

- `housing_analysis.R` — full analysis code  
- `housing_report.pdf` — full written report with visuals  
- Plots in `/assets/`  
- Dataset in `/data/`

---

## 📈 Summary of Findings

- Homes with **air conditioning, bathrooms, preferred area, parking** have significantly higher prices.  
- The **log-transformed model** improves model assumptions and interpretability.  
- About **63%** of price variation is explained by the model.  

---

## CV Bullet

**Housing Price Analysis (2025)** — Conducted full EDA and built multiple regression models (R). Improved model fit through log transformation and extracted key drivers of price (+20.3% for A/C, +18.4% per bathroom). Delivered full professional report and reproducible code.
