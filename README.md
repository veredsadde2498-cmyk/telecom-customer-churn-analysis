
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
<img width="1687" height="993" alt="Fiber Optic Customers Exhibit Significantly Higher Churn Rates Compared to DSL" src="https://github.com/user-attachments/assets/7ea431ad-6501-493d-8759-7d944860dab3" />
Observation: While Fiber Optic offers higher speeds, its higher cost and potential service stability issues make these customers more prone to leaving.

### 3. Technical Support

- **Finding:** Customers **without Technical Support** are nearly **3 times more likely to churn** compared to those with the service.
<img width="1653" height="993" alt="תמונה לעלות" src="https://github.com/user-attachments/assets/f3422a4f-55da-4965-9e3f-8e217da00844" />

*To see if the problem was the price or the service, I checked the monthly bills for customers with and without support. The graph shows the results:*

<img width="1653" height="993" alt="עוד תמונה" src="https://github.com/user-attachments/assets/20ceebf8-bcd3-45ee-a311-4233a141f5f0" />

**Finding:** The data shows that churned customers without support *paid nearly the same as those who stayed*. This suggests that *service quality and lack of assistance*, rather than the price of the support itself, are the primary drivers of churn.

### 4. Short Term Contracts Lead to Higher Churn

- **Finding**: We found that customers with short term contracts, such as month to month, tend to churn more compared to those with long term contracts.

### Final Recommendations

Based on the analysis, the customers most likely to churn are those using Fiber Optic services (because they are expensive) and those without Technical Support, especially if they are on short term contracts. To address this, I recommend creating a retention package that offers a **lower monthly rate for Fiber Optic** and **2 months of free Technical Support** to customers who commit to an **Annual Contract**. This approach targets the main drivers of churn identified in the data, encourages longer term commitment, and combines both financial and service based incentives to retain high risk customers effectively.


