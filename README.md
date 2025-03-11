# Fraudulent Transactions Analysis Report

## Project Background
This study investigates fraudulent activities by analyzing 50,000 financial transaction records. The objective is to identify key risk factors, assess user behavior, and provide actionable insights to strengthen fraud prevention systems. This analysis aims to help financial institutions reduce fraudulent incidents and improve risk assessment strategies.  
The dataset includes comprehensive transaction details, user profiles, and fraud labels, enabling an in-depth examination of factors linked to fraudulent activities. There are **21 features** in this dataset. The dataset was processed using SQL for data cleaning, feature engineering, and exploratory data analysis (EDA).  

## Executive Summary  
This analysis examined 50,000 financial transaction records, with fraudulent transactions representing **32.1%** of all entries. The study identified key patterns and behaviors that contributed to fraudulent incidents.  

* **Fraud Trends by Time:** Fraudulent activities were fairly consistent throughout the day, with peak incidents occurring at **11 AM**, **10 AM**, and **2 AM**.  
* **Fraud by Month:** Fraud occurrences were highest in **August**, **December**, and **January**.  
* **High-Risk Users:** Over **53%** of fraud cases involved users with repeated fraudulent incidents.  
* **Transaction Patterns:** Fraudulent transactions exhibited slightly higher average amounts compared to non-fraudulent transactions (approx. **$99.68** vs **$99.28**).  
* **Risk Scores:** The average risk score for fraudulent transactions was **0.6629**, while non-fraudulent transactions had a lower average risk score of **0.425**.  
* **Geographical Trends:** Fraud rates were consistent across major cities like **New York**, **Tokyo**, **Sydney**, **London**, and **Mumbai**, with percentages ranging from **31.5%** to **32.5%**.  
* **Device Vulnerability:** Fraud incidents were fairly evenly distributed across **Laptop**, **Mobile**, and **Tablet** devices.  

## Data Preparation  
* **Null Data Handling:** No missing data was identified in the dataset. Additional checks for erroneous values ensured the data’s integrity.  
* **Data Type Correction:** Key fields such as **Transaction_ID**, **Transaction_Amount**, and **Timestamp** were converted to appropriate data types to enhance compatibility with SQL functions.  
* **Feature Engineering:** Additional columns such as **Season**, **Month**, **Day**, and **Hour** were generated from the **Timestamp** field to allow deeper time-based analysis.  
* **Duplicate Entries:** The dataset was verified for duplicates, and no duplicate entries were found, ensuring data reliability.  

## Insights Deep-Dive or Summary of Insights 

### Time-Based Analysis  
  * Fraud incidents were consistently distributed across different hours of the day, with slight peaks at **11 AM**, **10 AM**, and **2 AM**.  
  * Fraud occurrences peaked in **August**, followed by **December** and **January**.  

### User Analysis  
  * **High-Risk Users:** Over **53%** of fraud incidents involved repeat offenders.  
  * Users with prior fraudulent history were **4 times** more likely to encounter repeat fraud attempts.  

### Transaction Analysis  
  * Fraudulent transactions had an average amount of **$99.68**, compared to **$99.28** for non-fraudulent ones.  
  * The majority of fraudulent cases involved **Bank Transfer** and **POS** transactions.  
  * **Zero-Amount Transactions:** A total of **93** fraudulent transactions had **Transaction_Amount = 0**, indicating successful prevention strategies.  

### Risk Score Analysis 
  * The average fraud risk score was **0.6629**, while non-fraud transactions averaged **0.425**.  
  * Surprisingly, some transactions with **low-risk scores** (below **0.2**) were later identified as fraudulent, exposing vulnerabilities in the scoring model.  

### Geographical Analysis 
  * Fraud rates were evenly distributed across cities such as **New York**, **Tokyo**, **Sydney**, **London**, and **Mumbai**, each showing fraud rates between **31.5%** and **32.5%**.  

### Device Analysis 
  * Fraud incidents were consistently distributed across devices with **Laptop** (**5,298 cases**), **Mobile** (**5,305 cases**), and **Tablet** (**5,464 cases**) all showing comparable risks.  

## Recommendations  
Based on the analysis, the following recommendations are provided to strengthen fraud detection and prevention efforts:  

1. **Enhanced Fraud Detection Algorithms:** Develop machine learning models that integrate key features such as **Hour**, **Risk_Score**, and **Transaction_Amount** to improve predictive accuracy.  
2. **Behavior-Based Anomaly Detection:** Introduce monitoring systems that identify unusual transaction patterns during high-risk periods (e.g., early morning hours).  
3. **User Risk Profiling:** Implement a **High-Risk User Flag** to closely monitor users with repeated fraudulent behavior.  
4. **Risk Score Improvement:** Enhance the risk scoring model to improve the detection of suspicious low-risk transactions.  
5. **Proactive Fraud Prevention Systems:** Strengthen real-time monitoring and interception systems to block suspicious transactions before completion.  
6. **Device-Specific Safeguards:** Introduce stricter security protocols for transactions initiated via **Mobile** and **Tablet** devices.  
7. **Cross-Border Transaction Monitoring:** Introduce stricter security checks for transactions originating from high-risk international regions.  
8. **Targeted Merchant Monitoring:** Develop customized alerts for high-risk merchant categories such as **Travel**, **Clothing**, and **Electronics**.  

## Assumptions and Caveats  
* This analysis assumes that fraudulent activities are influenced primarily by **transaction amounts**, **user behavior**, and **risk scores**, though other factors such as merchant type and device security may also play a role.  
* The dataset provides comprehensive details but may not account for emerging fraud tactics or sophisticated fraud methods not yet captured in transaction logs.  
* The proposed strategies are designed to complement existing fraud prevention protocols, ensuring robust security frameworks.  

## Technical Project Information
The dataset used for this analysis was processed using **SQL** for data cleaning, feature engineering, and exploratory analysis. Additional insights were generated through visualizations in **Python** for clearer trend identification.  
The combination of advanced statistical methods, behavioral pattern recognition, and predictive modeling aims to enhance fraud detection accuracy and minimize financial losses.

