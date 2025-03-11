

-- Check the loading data is successful or not
select * from fraud;
select count(*) from fraud;   -- Check if the amount of imported data is correct
DESCRIBE fraud;               -- Check the data type of each column

-- Data Cleaning and Preprocessing
-- Part of Datatype found is not appropiate, we have to covert the datatype  
ALTER TABLE fraud MODIFY COLUMN Transaction_ID VARCHAR(50), MODIFY COLUMN User_ID VARCHAR(50), MODIFY COLUMN Transaction_Amount DECIMAL(15,2),
MODIFY COLUMN Transaction_Type VARCHAR(50), MODIFY COLUMN Timestamp DATETIME, MODIFY COLUMN Account_Balance DECIMAL(15,2),
MODIFY COLUMN Device_Type VARCHAR(50), MODIFY COLUMN Location VARCHAR(100), MODIFY COLUMN Merchant_Category VARCHAR(100),
MODIFY COLUMN IP_Address_Flag VARCHAR(45), MODIFY COLUMN Previous_Fraudulent_Activity INT, MODIFY COLUMN Avg_Transaction_Amount_7d DECIMAL(15,2),
MODIFY COLUMN Transaction_Distance DECIMAL(10,4),  MODIFY COLUMN Risk_Score DECIMAL(5,2),  MODIFY COLUMN Card_Type VARCHAR(50),
MODIFY COLUMN Authentication_Method VARCHAR(50);
-- Since the timestamp on here only record all detailed, next, split it into day, hour, month, session
#ALTER TABLE fraud ADD COLUMN Season VARCHAR(10), ADD COLUMN `Month` INT, ADD COLUMN `Day` INT, ADD COLUMN `Hour` INT;
#UPDATE fraud SET Season = CASE 
	#WHEN MONTH(Timestamp) IN (12, 1, 2) THEN 'Winter'
	#WHEN MONTH(Timestamp) IN (3, 4, 5) THEN 'Spring'
	#WHEN MONTH(Timestamp) IN (6, 7, 8) THEN 'Summer'
	#ELSE 'Autumn' END, 
   # Month = MONTH(Timestamp), Day = DAY(Timestamp), Hour = HOUR(Timestamp);

-- Deal with missing value
-- Check missing value in each column 
SELECT 'Transaction_ID' AS column_name, SUM(CASE WHEN Transaction_ID IS NULL THEN 1 ELSE 0 END) AS null_count FROM fraud
UNION ALL SELECT 'User_ID', SUM(CASE WHEN User_ID IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Transaction_Amount', SUM(CASE WHEN Transaction_Amount IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Transaction_Type', SUM(CASE WHEN Transaction_Type IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Timestamp', SUM(CASE WHEN Timestamp IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Account_Balance', SUM(CASE WHEN Account_Balance IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Device_Type', SUM(CASE WHEN Device_Type IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Location', SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Merchant_Category', SUM(CASE WHEN Merchant_Category IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'IP_Address_Flag', SUM(CASE WHEN IP_Address_Flag IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Previous_Fraudulent_Activity', SUM(CASE WHEN Previous_Fraudulent_Activity IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Daily_Transaction_Count', SUM(CASE WHEN Daily_Transaction_Count IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Avg_Transaction_Amount_7d', SUM(CASE WHEN Avg_Transaction_Amount_7d IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Failed_Transaction_Count_7d', SUM(CASE WHEN Failed_Transaction_Count_7d IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Card_Type', SUM(CASE WHEN Card_Type IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Card_Age', SUM(CASE WHEN Card_Age IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Transaction_Distance', SUM(CASE WHEN Transaction_Distance IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Authentication_Method', SUM(CASE WHEN Authentication_Method IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Risk_Score', SUM(CASE WHEN Risk_Score IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Is_Weekend', SUM(CASE WHEN Is_Weekend IS NULL THEN 1 ELSE 0 END) FROM fraud
UNION ALL SELECT 'Fraud_Label', SUM(CASE WHEN Fraud_Label IS NULL THEN 1 ELSE 0 END) FROM fraud;
-- Check for duplicate
SELECT Transaction_ID, COUNT(*) AS count FROM fraud GROUP BY Transaction_ID HAVING COUNT(*) > 1;
-- Check the vairable for each column store correctly 
select distinct(Transaction_ID) from fraud;
select distinct(User_ID) from fraud;
select distinct(Transaction_Amount) from fraud order by Transaction_Amount asc;


-- EDA 
-- Time Range For this dataset 
select max(Timestamp) as Time_Range from fraud union all select min(Timestamp) from fraud; 

-- How many user_account have suffered the fraud 
select count(*) as `Total people, Fraud people` from (select distinct(User_id) from fraud) as total
	union all select count(*) from (select distinct(User_id) from fraud where Fraud_label = 1) as user_fraud;
    
-- How many fraud transaction was happened
select count(*) as `Total transaction vs Fraud Transaction`from fraud union all select count(*) from fraud where Fraud_label = 1;

-- For those transaction where their user account that had been recognized as fraud  
select * from fraud where User_ID in (select User_id from fraud where Fraud_Label = 1) order by User_ID asc, Timestamp desc;
	
-- How many user account suffer more than one time fraud transaction
select count(user_id) as `Count for user that have more than one time fraud records` from 
	(select user_id, count(user_id) as fraud_count from fraud where Fraud_Label = 1 group by user_id having fraud_count > 1) as user_fraud_table;
    
-- How many transaction fraud that successfully been stoped
select count(transaction_id) from fraud where Transaction_Amount = 0 and Fraud_Label = 1;

-- The average risk score for the transaction 
select avg(risk_score) from fraud where fraud_label = 1;

-- 6. Transaction type about the fraud
select transaction_type, count(Transaction_Type) as 'count' from fraud where Fraud_Label = 1 group by transaction_type order by count desc;
-- 7. Device type about the fraud
select Device_Type, count(Device_Type) as 'count' from fraud where Fraud_Label = 1 group by Device_Type order by count desc;
-- 8. Location about the fraud
select a.Location, b.count_all, a.count_fraud, a.count_fraud/b.count_all as percent_fraud from
	(select Location, count(Location) as 'count_fraud' from fraud where Fraud_Label = 1 group by Location order by count_fraud desc) a
    left join (select Location, count(Location) as 'count_all' from fraud group by Location order by count_all desc) b
	on a.Location = b.Location
    order by percent_fraud desc 
;

-- 9. Merchant Category about the fraud
select Merchant_Category, count(Merchant_Category) as 'count' from fraud where Fraud_Label = 1 group by Merchant_Category order by count desc;
-- 10. Card type about the fraud
select Card_Type, count(Card_Type) as 'count' from fraud where Fraud_Label = 1 group by Card_Type order by count desc;
-- 11. Authentication Method about the fraud
select Authentication_Method, count(Authentication_Method) as 'count' from fraud where Fraud_Label = 1 
	group by Authentication_Method order by count desc;
-- 12. IP address flag about the fraud
select count(*) as `ip flag vs ip without flag in fraud transaction` from 
		(select IP_Address_Flag from fraud where Fraud_Label = 1) as ip_fraud where IP_Address_Flag = 1
		union all select count(*) from (select IP_Address_Flag from fraud where Fraud_Label = 1) as ip_fraud where IP_Address_Flag = 0;

-- 13. Most fraud Season
select Season, count(season) as cnt from fraud where Fraud_Label = 1 group by season order by cnt desc;

-- 14. Fraud frequency For Month
select `Month`, count(`Month`) as cnt from fraud where Fraud_Label = 1 group by `Month` order by cnt desc;

-- 15. Fraud frequency For Day
select `Day`, count(`Day`) as cnt from fraud where Fraud_Label = 1 group by `Day` order by cnt desc;

-- 16. Fraud frequency For Hour
select `Hour`, count(`Hour`) as cnt from fraud where Fraud_Label = 1 group by `Hour` order by cnt desc;

-- 17. Distribution Analysis - Transaction Amount Distribution
SELECT Transaction_Amount, COUNT(*) AS count FROM fraud GROUP BY Transaction_Amount ORDER BY count DESC;

-- 18. Distribution Analysis - Risk Score Distribution
SELECT Risk_Score, COUNT(*) AS count FROM fraud GROUP BY Risk_Score ORDER BY Risk_Score DESC;

-- 19. Outlier Detection - Identify Extremely Large Transaction Amounts
SELECT * FROM fraud WHERE Transaction_Amount > (SELECT AVG(Transaction_Amount) + 3 * STDDEV(Transaction_Amount) FROM fraud);

-- 20. Unusual Risk Scores
SELECT * FROM fraud WHERE Risk_Score > 0.95;

-- Time-Series Analysis - Fraud Trends Over Time
SELECT DATE(Timestamp) AS Date, COUNT(*) AS Fraud_Count FROM fraud WHERE Fraud_Label = 1 GROUP BY Date ORDER BY Date;

-- 21. Time-Series Analysis - Fraud Trends by Hour
SELECT Hour, COUNT(*) AS Fraud_Count FROM fraud WHERE Fraud_Label = 1 GROUP BY Hour ORDER BY Fraud_Count DESC;

-- 22. User Behavior Analysis - Users with High Transaction Frequency
SELECT User_ID, COUNT(*) AS Transaction_Count FROM fraud GROUP BY User_ID ORDER BY Transaction_Count DESC LIMIT 10;

-- User Behavior Analysis - Users with Unusual Account Balances
SELECT * FROM fraud WHERE Account_Balance > (SELECT AVG(Account_Balance) + 3 * STDDEV(Account_Balance) FROM fraud);

-- Feature Engineering for Deeper Insights - Average Transaction Amount Per User
#ALTER TABLE fraud ADD COLUMN Avg_User_Transaction_Amount DECIMAL(15, 2);
#UPDATE fraud 
#SET Avg_User_Transaction_Amount = (
    #SELECT AVG(Transaction_Amount)
    #FROM fraud AS f
    #WHERE f.User_ID = fraud.User_ID
#);
-- Transaction Frequency (Weekly or Monthly)
SELECT 
    User_ID, 
    COUNT(*) AS Weekly_Transaction_Count 
FROM fraud 
WHERE Timestamp >= DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY User_ID
ORDER BY Weekly_Transaction_Count DESC;

-- Geospatial Analysis (If Location Data is Available)
SELECT Location, COUNT(*) AS Fraud_Count FROM fraud WHERE Fraud_Label = 1 GROUP BY Location ORDER BY Fraud_Count DESC;

-- Anomaly Detection -- Transactions with Zero Amount But Marked as Non-Fraudulent
SELECT * FROM fraud WHERE Transaction_Amount = 0 AND Fraud_Label = 0;

-- Anomaly Detection - Suspiciously High Transaction Amounts in Low-Risk Transactions
SELECT * FROM fraud WHERE Transaction_Amount > 5000 AND Risk_Score < 0.2;

-- Trend Analysis in Fraudulent Activities - Fraud Patterns by Month-Year Combination
SELECT 
    YEAR(Timestamp) AS Year, 
    MONTH(Timestamp) AS Month, 
    COUNT(*) AS Fraud_Count
FROM fraud 
WHERE Fraud_Label = 1
GROUP BY YEAR(Timestamp), MONTH(Timestamp)
ORDER BY Fraud_Count DESC;

-- Comparative Analysis - Transaction Amount Comparison
SELECT 
    Fraud_Label, 
    AVG(Transaction_Amount) AS Avg_Transaction_Amount
FROM fraud
GROUP BY Fraud_Label;


-- 1. Deepen Time-Based Analysis
-- Fraud Trends by Weekday and Weekend Analysis
SELECT 
    CASE 
        WHEN WEEKDAY(Timestamp) IN (5, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    COUNT(*) AS Fraud_Count
FROM fraud
WHERE Fraud_Label = 1
GROUP BY Day_Type;
-- Fraud Peaks in Specific Hours
SELECT 
    Hour, 
    COUNT(*) AS Fraud_Count
FROM fraud
WHERE Fraud_Label = 1
GROUP BY Hour
ORDER BY Fraud_Count DESC;

-- 2. Feature Engineering for Advanced Insights
--  Transaction Frequency per User
SELECT 
    User_ID, 
    COUNT(*) AS Transaction_Count
FROM fraud
GROUP BY User_ID
ORDER BY Transaction_Count DESC;
-- Average Transaction Amount for Fraudulent vs Non-Fraudulent Transactions
SELECT 
    Fraud_Label, 
    AVG(Transaction_Amount) AS Avg_Transaction_Amount
FROM fraud
GROUP BY Fraud_Label;
-- High-Risk User Flag
SELECT 
    Device_Type, 
    COUNT(*) AS Fraud_Count
FROM fraud
WHERE Fraud_Label = 1
GROUP BY Device_Type
ORDER BY Fraud_Count DESC;



select * from fraud where Fraud_Label = 1 and Transaction_Amount = 0;


