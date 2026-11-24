# Banking Credit Risk, Repayment Behaviour & Portfolio Analytics

## 1. Introduction

This project analyses historical credit card customer data to understand repayment behaviour and identify patterns associated with credit default.

The analysis uses 30,000 customer records from the UCI Machine Learning Repository.

## 2. Business Objective

The main objective is to understand customer credit-risk patterns by analysing demographic information, credit limits, repayment status, bill amounts and payment amounts.

## 3. Dataset Overview

- Dataset: Default of Credit Card Clients
- Source: UCI Machine Learning Repository
- Total Records: 30,000
- Original Columns: 25
- Target Variable: `default payment next month`

## 4. Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- MySQL
- Microsoft Excel

## 5. Analysis Performed

### Python
Data cleaning, feature engineering, exploratory data analysis, statistical summaries and visualisation.

### SQL
Database creation, data import, customer segmentation, aggregate queries, CTEs and window functions.

### Excel
Nine PivotTables, five PivotCharts, KPI cards and a dashboard containing business insights and recommendations.

## 6. Key Findings

1. Overall default rate was 22.12%.
2. Customers aged 61–79 recorded a 26.84% default rate.
3. Customers in the 0–50K credit limit group recorded a 31.79% default rate.
4. Male customers recorded a 24.17% default rate, compared with 20.78% for female customers.
5. Customers with repayment status 2 in PAY_0 recorded a 69.14% default rate.
6. Non-default customers had higher average payment amounts across all six periods.
7. Customers with credit utilisation above 100% recorded a 30.07% default rate.
8. PAY_0 had the strongest positive correlation with default (0.325) among the selected variables.

## 7. Business Recommendations

- Monitor repeated repayment delays.
- Review customers with high credit utilisation.
- Analyse repayment history and payment patterns together.
- Segment customers based on credit limits and repayment behaviour.
- Conduct regular credit-risk assessments.

## 8. Limitations

- The dataset represents historical credit card information from Taiwan.
- The findings do not necessarily represent current banking behaviour in other countries.
- Observed associations do not establish causation.
- The dataset does not contain collection activities or recovery amounts.
- Further validation is required before applying findings to real-world credit decisions.

## 9. Conclusion

The project demonstrates how Python, SQL and Excel can be used together to analyse customer credit-risk patterns.

The analysis identified relationships between repayment behaviour, credit limits, credit utilisation and default status.

The findings provide a basis for further credit-risk analysis and business decision-making.

## 10. Future Scope

- Develop an interactive Power BI dashboard.
- Explore machine learning models for default prediction.
- Evaluate model performance using appropriate classification metrics.
- Extend the analysis with additional customer and financial data.