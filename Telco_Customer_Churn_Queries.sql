CREATE DATABASE Telco_Churn;
USE Telco_Churn;
RENAME TABLE `wa_fn-usec_-telco-customer-churn` TO raw_data;
SELECT * FROM raw_data;

CREATE TABLE customers (
customer_id VARCHAR(50) PRIMARY KEY, 
gender VARCHAR(10),
seniorcitizen INT,
partner VARCHAR(10), 
dependent VARCHAR(10)
);
-- נכניס נתונים לטבלה מטבלת ה raw
INSERT INTO customers (customer_id, gender, seniorcitizen, partner, dependent)
SELECT customerID, gender, SeniorCitizen, Partner, Dependents
FROM raw_data;
-- נבדוק שהטבלה מכילה את כל מה שצריך
select * from customers;

CREATE TABLE Services (
customer_id VARCHAR(50) PRIMARY KEY, 
phoneService VARCHAR(10),
MultipleLines VARCHAR(30),
internetService VARCHAR(30),
onlineSecurity VARCHAR(30),
onlineBackup VARCHAR(30),
deviceProtection VARCHAR(30),
techSupport VARCHAR(30),
streamingTV VARCHAR(30),
streamingMovies VARCHAR(30),
CONSTRAINT fk_customer_services FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- נכניס נתונים לטבלה מטבלת ה raw
INSERT INTO Services (
    customer_id, phoneService, MultipleLines, internetService, 
    onlineSecurity, onlineBackup, deviceProtection, techSupport, 
    streamingTV, streamingMovies
)
SELECT 
    customerID, PhoneService, MultipleLines, InternetService, 
    OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, 
    StreamingTV, StreamingMovies
FROM raw_data;

-- בדיקה שהצליח
SELECT * FROM Services LIMIT 5;

CREATE TABLE Account (
    customer_id VARCHAR(50) PRIMARY KEY, 
    contract VARCHAR(30), 
    paymentMethod VARCHAR(50),
    paperlessBilling VARCHAR(10),
    monthlyCharges DECIMAL(10,2), 
    totalCharges VARCHAR(20),     -- VARCHAR כדי למנוע שגיאות בשלב הייבוא
    tenure INT,
    churn VARCHAR(10),
    CONSTRAINT fk_customer_account FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- נכניס נתונים לטבלה מטבלת ה raw
INSERT INTO Account (
    customer_id, contract, paymentMethod, paperlessBilling, 
    monthlyCharges, totalCharges, tenure, churn
)
SELECT 
    customerID, Contract, PaymentMethod, PaperlessBilling, 
    MonthlyCharges, TotalCharges, tenure, Churn
FROM raw_data;
-- בדיקה שהכל עובד
SELECT * FROM account LIMIT 5;

-- עכשיו אחרי שסיימנו עם הנירמול נתחיל בניתוח
-- שאלת החקר שלנו היא מהם המאפיינים העיקריים של לקוחות שנוטשים ואיך החברה יכולה לצמצם אובדן הכנסות
SELECT * FROM account;
-- נבדוק כמה לקוחות עזבו בחודשיים האחרונים
SELECT COUNT(*) AS 'Customers status', Churn
FROM account
GROUP BY Churn;
-- עזבו 1869 לקוחות, נשארו 5163. ולכן אחוז הנטישה הוא 26.6%

-- נהאם הלקוחות שמשלמים יותר נוטים לעזו?
SELECT AVG(monthlyCharges) as Avg_Bill, churn
FROM account
GROUP BY churn
ORDER BY AVG(monthlyCharges);
-- אלו שעזבו משלמים בממוצע 74 ואילו שנשארו 61
-- בממוצע, לקוחות שנטשו שילמו חשבון חודשי גבוה בכ-21% מאלו שנשארו (חישוב: 74.44/61.3-1)

-- ננסה להבין אולי זה קשור לאיכות המוצרים
-- היה ניתוח באקסל על הטבלה הזאת
SELECT a.monthlyCharges, a.churn, s.phoneService, s.MultipleLines, s.internetService, s.onlineSecurity, s.onlineBackup, 
s.deviceProtection, s.techSupport, s.streamingTV, s.streamingMovies, customer_id
FROM account a 
JOIN Services s USING(customer_id);

SELECT contract, churn, COUNT(*) 
FROM account 
GROUP BY contract, churn;
-- אנשים עם חוזה קצר כמו מחודש לחודש נוטים לעזוב יותר בהשוואה לכאלה עם חוזה ארוך טווח 
