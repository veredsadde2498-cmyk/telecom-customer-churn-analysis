
# Telecom Customer Churn Analysis

## **Project Overview & Business Problem**

In this project, I analyzed a Telco customer churn dataset  from Kaggle to find the main reasons why customers leave and suggest ways to keep them. **The problem is customer churn, which leads to financial loss. The goal is to retain customers and reduce churn.**

link for the dataset: https://www.kaggle.com/datasets/blastchar/telco-customer-churn

### Data Preparation & Normalization

The original dataset was provided as a Flat File (denormalized). To ensure data integrity and optimize analysis, I performed Database Normalization in MySQL Workbench, restructuring the data into three relational tables:

- **Customers:** Demographic information.
- **Services:** Details of the services each customer is subscribed to.
- **Account:** Billing details, contract types, and churn status.

I used Microsoft Excel for visualization and creating Pivot Tables.

## Key Insights

### 1. Price Sensitivity (Monthly Charges)

My analysis revealed that price is a significant factor in customer retention.

- **Finding:** The average monthly charge for customers who churned was **$74.44**, which is approximately **21% higher** than the average for customers who stayed ($61.27).

 ### 2. Infrastructure & Service Type

I found a stark difference in churn rates based on the type of internet service.
- **Finding:** The churn rate among **Fiber Optic** customers is **2.3 times higher** than those using DSL.

Observation: While Fiber Optic offers higher speeds, its higher cost and potential service stability issues make these customers more prone to leaving.
