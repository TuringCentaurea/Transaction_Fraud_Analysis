# Fraud Detection Analysis using Machine Learning

## Executive Summary

This comprehensive study spans the entire year of 2023, analyzing a dataset comprising 50,000 transaction records involving 8,963 users from five countries ('Sydney', 'New York', 'Mumbai', 'Tokyo', 'London'). The total financial loss from fraudulent activities amounted to $1,601,617.65, averaging $99.68 per fraud with a median loss of $70.12. More than 53% of fraud incidents involved repeat offenders, with users having prior fraudulent activity four times more likely to encounter repeat fraud attempts.

## Introduction

The primary goal of this analysis was to develop robust predictive models to distinguish fraudulent transactions accurately. The project entailed extensive exploratory data analysis (EDA), preprocessing, feature engineering, model selection, training, evaluation, and interpretation of the results.

## Data Exploration

The dataset contains detailed transaction records labeled as fraudulent or legitimate. Key attributes include transaction amounts, timestamps, and several anonymized numerical features.

### Exploratory Data Analysis (EDA)

Initial exploration included:
- Missing values visualization (heatmaps)
- Transaction amount distribution analysis (right-skewed, many low-value transactions)
- Temporal pattern analysis (transaction frequency across different days and weeks)
- Correlation analysis among key features (correlation heatmaps)
- Class imbalance visualization

## Insights Deep Dive

### Time-Based Analysis
![image](https://github.com/user-attachments/assets/9225d740-7470-4241-8349-66cf5db13c04)
- Throughout 2023, an average of 1,339 fraudulent transactions occurred per month, peaking in August (1,434) and lowest in February (1,246).
- Fraudulent activities were more frequent on weekends compared to weekdays (2354.5 vs. 2278.75, a 3.32% increase), with Sunday being the peak (2,379).
- Peak hours for weekend fraud were 4 PM (average 113 counts), 10 AM (111 counts), and 11 AM (109 counts). Weekdays saw the most activity at 11 AM (106 counts), 3 PM (103 counts), and 1 PM (103 counts).

### User-Related Analysis
![image](https://github.com/user-attachments/assets/cbf54fbf-d482-4844-9c57-eaee16516852)
- User distribution was balanced across five key cities, tracking individual transactions per city.
- Tokyo recorded the highest fraud loss ($330,928.10) and user count (6,129) with the highest fraud rate (45.29%) and repeat fraud rate (7.86%). Mumbai had the lowest loss ($311,294.40), lowest fraud rate (44.3%), and repeat fraud rate (7.39%).
![image](https://github.com/user-attachments/assets/bd16948e-23a4-44e4-bb03-64d6cbcdce70)

### High-Risk Users
- Over 53% of fraud involved repeat offenders, indicating a critical area for targeted interventions and continuous monitoring.

## Data Preprocessing and Feature Engineering

Preprocessing involved:
- Handling missing values via median/mean imputation.
- Normalization and standardization of numerical features.
- Class imbalance correction using SMOTE.

Feature engineering included:
- Extracting temporal features (transaction hour, day, month).
- User-based transaction aggregations (average, maximum spend, frequency).
- Interaction features between transaction amounts and temporal attributes.

## Transaction Analysis
Analysis covered 14 key elements: 'Transaction_ID', 'Transaction_Amount', 'Transaction_Type', 'Account_Balance', 'Device_Type', 'Merchant_Category', 'IP_Address_Flag', 'Previous_Fraudulent_Activity', 'Daily_Transaction_Count', 'Avg_Transaction_Amount_7d', 'Failed_Transaction_Count_7d', 'Card_Type', 'Card_Age', 'Authentication_Method'.
- Box plots revealed substantial outliers in transaction amounts for both fraud and legitimate transactions, indicating high amounts are unreliable fraud indicators.
- ![image](https://github.com/user-attachments/assets/b8b1ec96-8795-4e00-8157-5007157c9022)
- Merchant_Category provided categorical insights, highlighting categories with higher fraud prevalence.
- ![image](https://github.com/user-attachments/assets/018c82da-e55f-4483-bbfd-53ef5d56c734)

### Recommended Correlation Heatmap Features
- Transaction Amount
- Account Balance
- Daily Transaction Count
- Avg Transaction Amount (7 days)
- Failed Transaction Count (7 days)
- Card Age
- IP Address Flag
- Previous Fraudulent Activity
![image](https://github.com/user-attachments/assets/3dd29676-f4c6-4ad6-9e73-9b0ae14de5fe)

## Model Development and Evaluation

Tested models:
- Logistic Regression
- Decision Tree
- Random Forest
- XGBoost

### Evaluation Metrics
- Accuracy, Precision, Recall, F1-Score, ROC-AUC

### Results
XGBoost model performed best with:
- Accuracy: 100%
- Precision: 100%
- Recall: 100%
- F1-Score: 100%
- ROC-AUC: 100%

## Interpretation and Insights
- Transaction amounts, temporal patterns, and user transaction frequencies significantly predict fraud.
- Weekend and repeat offenders represent high-risk factors.
- Fraudulent transaction distributions suggest targeted monitoring at specific times and locations.

## Conclusion and Future Work

This analysis underscores machine learning’s efficacy in fraud detection. However, the dataset used in this study has certain limitations, primarily its simulated nature, which may not fully reflect real-world scenarios. Recommended future directions include:
- Integrating real-world data from diverse and more extensive transaction datasets to improve model generalization.
- Implementing real-time fraud analytics to promptly identify and address fraudulent activities.
- Periodically retraining and continuously monitoring the models to adapt to evolving fraud patterns and new fraud methodologies.
By addressing these limitations and applying real transaction data, future analyses can enhance fraud detection capabilities, ensuring robust protection against fraudulent activities.




