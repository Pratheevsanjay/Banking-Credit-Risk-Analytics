-- Banking Credit Risk, Repayment Behaviour & Portfolio Analytics

-- 1. Create Database
CREATE DATABASE banking_credit_risk;

USE banking_credit_risk;


-- 2. Create Customer Table
CREATE TABLE credit_card_customers (
    ID INT PRIMARY KEY,
    LIMIT_BAL DOUBLE,
    SEX INT,
    EDUCATION INT,
    MARRIAGE INT,
    AGE INT,
    PAY_0 INT,
    PAY_2 INT,
    PAY_3 INT,
    PAY_4 INT,
    PAY_5 INT,
    PAY_6 INT,
    BILL_AMT1 DOUBLE,
    BILL_AMT2 DOUBLE,
    BILL_AMT3 DOUBLE,
    BILL_AMT4 DOUBLE,
    BILL_AMT5 DOUBLE,
    BILL_AMT6 DOUBLE,
    PAY_AMT1 DOUBLE,
    PAY_AMT2 DOUBLE,
    PAY_AMT3 DOUBLE,
    PAY_AMT4 DOUBLE,
    PAY_AMT5 DOUBLE,
    PAY_AMT6 DOUBLE,
    default_payment_next_month INT,
    AGE_GROUP VARCHAR(20),
    CREDIT_LIMIT_GROUP VARCHAR(20),
    CREDIT_UTILIZATION DOUBLE,
    UTILIZATION_GROUP VARCHAR(20)
);


-- 3. Default Customer Distribution

SELECT
    default_payment_next_month AS Default_Status,
    COUNT(*) AS Customer_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM credit_card_customers),
        2
    ) AS Percentage
FROM credit_card_customers
GROUP BY default_payment_next_month;


-- 4. Default Rate by Age Group

SELECT
    AGE_GROUP,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY AGE_GROUP
ORDER BY AGE_GROUP;


-- 5. Default Rate by Credit Limit Group

SELECT
    CREDIT_LIMIT_GROUP,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY CREDIT_LIMIT_GROUP
ORDER BY
    CASE CREDIT_LIMIT_GROUP
        WHEN '0-50K' THEN 1
        WHEN '50K-100K' THEN 2
        WHEN '100K-200K' THEN 3
        WHEN '200K-500K' THEN 4
        WHEN '500K+' THEN 5
    END;
    
    
    -- 6. Default Rate by Gender

SELECT
    SEX,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY SEX
ORDER BY SEX;


-- 7. Default Rate by Education

SELECT
    EDUCATION,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY EDUCATION
ORDER BY EDUCATION;


-- 8. Default Rate by Marital Status

SELECT
    MARRIAGE,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY MARRIAGE
ORDER BY MARRIAGE;


-- 9. Default Rate by Recent Repayment Status

SELECT
    PAY_0,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY PAY_0
ORDER BY PAY_0;


-- 10. Average Payment Amount by Default Status

SELECT
    default_payment_next_month AS Default_Status,
    ROUND(AVG(PAY_AMT1), 2) AS Avg_Payment_1,
    ROUND(AVG(PAY_AMT2), 2) AS Avg_Payment_2,
    ROUND(AVG(PAY_AMT3), 2) AS Avg_Payment_3,
    ROUND(AVG(PAY_AMT4), 2) AS Avg_Payment_4,
    ROUND(AVG(PAY_AMT5), 2) AS Avg_Payment_5,
    ROUND(AVG(PAY_AMT6), 2) AS Avg_Payment_6
FROM credit_card_customers
GROUP BY default_payment_next_month
ORDER BY Default_Status;


-- 11. Average Bill Amount by Default Status

SELECT
    default_payment_next_month AS Default_Status,
    ROUND(AVG(BILL_AMT1), 2) AS Avg_Bill_1,
    ROUND(AVG(BILL_AMT2), 2) AS Avg_Bill_2,
    ROUND(AVG(BILL_AMT3), 2) AS Avg_Bill_3,
    ROUND(AVG(BILL_AMT4), 2) AS Avg_Bill_4,
    ROUND(AVG(BILL_AMT5), 2) AS Avg_Bill_5,
    ROUND(AVG(BILL_AMT6), 2) AS Avg_Bill_6
FROM credit_card_customers
GROUP BY default_payment_next_month
ORDER BY Default_Status;


-- 12. Average Credit Utilisation by Default Status

SELECT
    default_payment_next_month AS Default_Status,
    ROUND(AVG(CREDIT_UTILIZATION), 2) AS Avg_Credit_Utilization,
    ROUND(MIN(CREDIT_UTILIZATION), 2) AS Min_Utilization,
    ROUND(MAX(CREDIT_UTILIZATION), 2) AS Max_Utilization
FROM credit_card_customers
GROUP BY default_payment_next_month
ORDER BY Default_Status;


-- 13. Default Rate by Credit Utilisation Group

SELECT
    UTILIZATION_GROUP,
    COUNT(*) AS Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY UTILIZATION_GROUP
ORDER BY
    CASE UTILIZATION_GROUP
        WHEN 'Negative' THEN 1
        WHEN '0-25%' THEN 2
        WHEN '25-50%' THEN 3
        WHEN '50-75%' THEN 4
        WHEN '75-100%' THEN 5
        WHEN 'Above 100%' THEN 6
    END;
    
    
    -- 14. Repayment Status Analysis Across All Six Periods

SELECT
    'PAY_0' AS Repayment_Period,
    PAY_0 AS Repayment_Status,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(default_payment_next_month) * 100, 2) AS Default_Rate
FROM credit_card_customers
GROUP BY PAY_0

UNION ALL

SELECT
    'PAY_2',
    PAY_2,
    COUNT(*),
    ROUND(AVG(default_payment_next_month) * 100, 2)
FROM credit_card_customers
GROUP BY PAY_2

UNION ALL

SELECT
    'PAY_3',
    PAY_3,
    COUNT(*),
    ROUND(AVG(default_payment_next_month) * 100, 2)
FROM credit_card_customers
GROUP BY PAY_3

UNION ALL

SELECT
    'PAY_4',
    PAY_4,
    COUNT(*),
    ROUND(AVG(default_payment_next_month) * 100, 2)
FROM credit_card_customers
GROUP BY PAY_4

UNION ALL

SELECT
    'PAY_5',
    PAY_5,
    COUNT(*),
    ROUND(AVG(default_payment_next_month) * 100, 2)
FROM credit_card_customers
GROUP BY PAY_5

UNION ALL

SELECT
    'PAY_6',
    PAY_6,
    COUNT(*),
    ROUND(AVG(default_payment_next_month) * 100, 2)
FROM credit_card_customers
GROUP BY PAY_6;


-- 15. High-Risk Customer Segment Analysis Using CTE

WITH high_risk_customers AS (
    SELECT
        ID,
        LIMIT_BAL,
        PAY_0,
        CREDIT_UTILIZATION,
        default_payment_next_month
    FROM credit_card_customers
    WHERE CREDIT_UTILIZATION > 75
      AND PAY_0 >= 2
)

SELECT
    COUNT(*) AS High_Risk_Customer_Count,
    SUM(default_payment_next_month) AS Default_Customers,
    ROUND(
        AVG(default_payment_next_month) * 100,
        2
    ) AS Default_Rate
FROM high_risk_customers;


-- 16. Rank Customers by Credit Utilisation

SELECT
    ID,
    LIMIT_BAL,
    CREDIT_UTILIZATION,
    default_payment_next_month,
    RANK() OVER (
        ORDER BY CREDIT_UTILIZATION DESC
    ) AS Utilization_Rank
FROM credit_card_customers
ORDER BY Utilization_Rank
LIMIT 10;

-- 17. Rank Customers by First Payment Amount

SELECT
    ID,
    PAY_AMT1,
    LIMIT_BAL,
    default_payment_next_month,
    RANK() OVER (
        ORDER BY PAY_AMT1 DESC
    ) AS Payment_Rank
FROM credit_card_customers
ORDER BY Payment_Rank
LIMIT 10;