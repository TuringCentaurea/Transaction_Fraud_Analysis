# Transaction_Fraud_Analysis
## Project Background
This study investigates fraudulent activities by analyzing 50,000 financial transaction records. The objective is to identify key risk factors, assess user behavior, and provide actionable insights to strengthen fraud prevention systems. This analysis aims to help financial institutions reduce fraudulent incidents and improve risk assessment strategies.

The dataset (add senetence there are 21 features in this datasets) includes comprehensive transaction details, user profiles, and fraud labels, enabling an in-depth examination of factors linked to fraudulent activities. The dataset was processed using SQL for data cleaning, feature engineering, and exploratory data analysis (EDA).

## Executive Summary
This study focuses on **Leadership, Data Analyst, and Data Science** roles due to data limitations in other categories.

**Data Science** has the highest representation **(515 individuals)** with an **average salary of $164,099**, primarily held by **PhD graduates (71.26%)**. **Data Analysts (391 individuals)** earn an **average of $120,606**, with most holding a **Bachelor’s degree (79.8%)**. **Leadership roles (58 individuals)** have the **highest salary** at **$204,827**, with **100% holding a PhD**.

**Salary growth is tied to experience**, with **Data Scientists** progressing from **$108,636 (5 years) to $240,000 (25 years)**. Promotions in **Data Analysis** show a **200% salary increase** from **Junior to Senior** roles. **Leadership salaries rise steadily with experience, reaching $220,000 at 20 years**.

The **most common** job title is **Data Scientist (453 records), followed by Data Analyst (363 records)**. Senior and leadership roles appear less frequently but offer **higher earning potential**.
## [Salary Analysis Dashboard](https://public.tableau.com/views/salary_analysis_entry/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
[![image](https://github.com/user-attachments/assets/3586780d-c77d-4386-b7c7-98f48188b409)](https://public.tableau.com/views/salary_analysis_entry/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


## Data Preparation
### Handling Missing Data
The dataset contained **6,699 entries** after cleaning. Since data was imported from **Excel to SQL, empty rows were removed** before analysis.
### Correcting Import Errors
During import, the **"age" column** had encoding errors, resulting in **garbled text**. This issue was corrected, and the column name was restored.
### Standardizing Inconsistent Values
The **"Education Level" column** contained variations such as **"Bachelor's Degree" and "Bachelor’s"**, which were standardized for consistency.
### Dealing with Duplicate Entries
Approximately **4,913 duplicate entries** (70% of the dataset) were identified. Since removing them would significantly reduce the sample size, they were **retained** for reference but flagged in the analysis to prevent skewed insights.

## Insights Deep-Dive
### 1.	Educational Distribution Across Job Functions
* **PhD degrees are dominant in high-paying roles**, particularly in **Leadership (100%)** and **Data Science (71.26%)**.
* **Data Analyst positions are the most accessible**, with **79.8% of professionals holding a Bachelor's degree**.
### 2.	Salary Growth & Career Progression
*	Experience significantly impacts salaries:
** **Data Scientists**' salaries grow from **$108,636 (5 years)** to **$240,000 (25 years)**.
**	**Senior Data Analysts earn 3 times more than Junior Analysts**, with an increase from **$51,360** to **$155,000**.
**	**Chief Data Officers** earn **$220,000** with an **average of 17.67 years** of experience.
*	**Leadership salaries** steadily rise, reaching **$220,000 by 20 years** of experience.
### 3.	Most Common Job Titles & Market Demand
* **Data Scientist** (453 records) and **Data Analyst** (363 records) are the **most frequent roles**, indicating high market demand.
*	**Senior and leadership** roles appear **less frequently** but offer significantly **higher salaries**.

## Recommendations
Based on the analysis, the following recommendations are provided to help individuals **navigate career paths** in data-related fields. 
### For Entry-Level Professionals:
* Pursuing a **Bachelor’s degree** is the most common route to Data Analyst roles, providing an accessible entry into the industry.
*	**For aspiring Data Scientists**, obtaining a **PhD** offers **higher starting salaries**, but alternative pathways include **bootcamps, certifications, and hands-on projects**.
### For Mid-Career Professionals:
* Consider **upskilling through a Master’s or PhD** to transition into **Data Science or Leadership roles**.
* **Gaining 5+ years** of experience significantly boosts earning potential, with **Data Scientist salaries rising from $108,636 to $164,099**.
### For Long-Term Career Growth:
* **Leadership roles** offer the **highest salaries** but **require extensive experience (15+ years) and a PhD**.
*	Target **promotions within Data Analysis or Data Science**, as moving from **Junior to Senior** roles can result in a **3x salary increase**.
### For Job Market Competitiveness:
***	Data Science and Data Analyst** roles remain in **high demand**, making them strategic career choices.
*	**Senior and leadership** positions are **less frequent but lucrative**, emphasizing the need for **long-term career planning**.

## Clarifying Questions, Assumptions, and Caveats
*	Salary trends are primarily influenced by education and experience, though factors like location, industry, and company size also contribute.
*	The dataset includes **969 job records from a larger dataset of 6,500+**, which **may not fully capture all job markets**.
*	**Leadership and Data Engineering roles are underrepresented (58 and 4 records, respectively)**, limiting insights for these roles.
*	Salary growth **is based on averages across job titles** and may vary depending on job responsibilities and industry.
*	**This dataset** was sourced from Kaggle and **may contain data from several years ago**. Therefore, this report does **not reflect the most up-to-date job market trends** but provides an analysis based on the available dataset.

## Technical Project Information
The [orginal data is avaliable](salary_data.json) here used for this analysis was sourced from **Kaggle**, containing data from multiple sources, including surveys, job postings, and publicly available records**. The dataset includes details on job titles, salaries, education levels, years of experience, and job functions.

Data cleaning and transformation were performed in **SQL**, including handling missing values and standardizing job categoriesm, you can [view the SQL script here](salary_sql.sql). The final dataset was then **analyzed and visualized using Tableau**, providing key insights into salary distribution, career progression, and job market trends, you can check out the [Salary Analysis - Tableau Dashboard](https://public.tableau.com/views/salary_analysis_entry/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

