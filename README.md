# Customer Churn Analysis and Prediction

## Project Overview

- This project is an end-to-end customer churn analytics and prediction solution built on the Telco Customer Churn dataset (7,043 customers, 21 columns).

- It progresses through five phases: environment setup and SQL-based data modeling, Python data preparation and exploratory analysis, machine learning model development, explainability and pipeline packaging, and finally documentation with a live Streamlit deployment.

- The workflow integrates four tools into a single pipeline: SQL Server for data storage, cleaning and exploratory analysis; Python (pandas, scikit-learn, XGBoost) for feature engineering and model building; Power BI for a three-page interactive business dashboard; and Streamlit for a live, user-facing churn prediction app. MLflow was used throughout to track and compare model experiments


---

## Problem Statement

- A telecom company wants to understand why customers stop using its services, since customer attrition directly affects company growth and revenue.

- By analyzing customer demographics, account information and service usage, the company aims to identify the drivers of churn, flag customers at high risk of leaving, and take proactive retention action before they churn.

---

## Dataset

The project uses the Telco Customer Churn dataset.

The dataset contains 7,043 customer records and 21 columns.

Important columns include:

- Customer ID
- Gender
- Senior Citizen
- Partner
- Dependents
- Tenure
- Internet Service
- Online Security
- Online Backup
- Device Protection
- Tech Support
- Contract
- Payment Method
- Monthly Charges
- Total Charges
- Churn

The dataset was cleaned and prepared before performing analysis and machine learning.

---

## Project Objectives


- Understand historical churn patterns using SQL-based exploratory data analysis.
- Clean and prepare the dataset for machine learning using Python.
- Engineer features that capture customer behaviour (Total services used, customer segment).
- Train, evaluate, and compare multiple churn-prediction models.
- Track experiments systematically using MLflow.
- Explain individual model predictions using feature importance and LIME.
- Package the model into a reusable, validated prediction pipeline.
- Present findings through an interactive Power BI dashboard.
- Deploy a live prediction interface using Streamlit.
- Translate model output into an actionable, rule-based retention strategy.


---

## Tools Used

- SQL Server
- SQL Server Management Studio (SSMS)
- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Imbalanced-learn
- XGBoost
- LIME
- MLflow
- Joblib
- Power BI

---

## Project Workflow

The project follows the workflow below:

→ SQL Server
→ SQL Data Modelling
→ SQL Exploratory Data Analysis
→ Data Preparation & Cleaning in Python
→ Exploratory Data Analysis
→ Python Feature Engineering
→ One-Hot Encoding
→ Train/Test Split
→ SMOTE Analysis
→ Machine Learning Models
→ GridSearchCV
→ MLflow
→ Churn Prediction
→ Risk Classification
→ Power BI Dashboard
→ Feature Importance
→ Lime Explanation
→ Validate customer
→ Pipeline


---

## 1. SQL Analysis

The customer churn data was imported into SQL Server and analyzed using SQL queries.

Business questions included:

- What is the overall churn rate?
- What is the average monthly charge for churned and retained customers?
- How does tenure relate to churn?
- How does Internet Service relate to churn?
- Does Tech Support relate to churn?
- Which payment methods are associated with customer churn?

The SQL analysis helped identify important customer churn patterns before machine learning.

---

## 2. Python Data Preparation

Python was used to prepare the dataset for machine learning.

The main preprocessing steps included:

- Handling missing values.
- Converting categorical values into numerical values.
- Binary encoding.
- One-hot encoding.
- Removing Customer ID from the machine learning features.

A cleaned dataset was saved as:

`cleaned_churn_data.csv`

---

## 3. Feature Engineering

Additional features were created to improve the analysis.

### Customer Segment

Customers were grouped based on tenure:

- New
- Established
- Loyal

And done One-hot encoding for Customer Segment

### Total Services Used

A new feature called `TotalServicesUsed` was created by counting the number of additional services used by each customer.

The feature-engineered dataset was saved as:

`cleaned_featured_churn_data.csv`

---

## 4. Machine Learning

Three machine learning models were evaluated:

- Logistic Regression
- Random Forest
- XGBoost

The dataset was divided into training and testing data.

SMOTE was applied to the training data to address the imbalance between churn and non-churn customers.

GridSearchCV was then used to tune model parameters.

---

## 5. Model Results

The models were compared using:

- Precision
- Recall
- F1 Score
- Accuracy

The tuned Logistic Regression model produced the following test results:

| Metric | Result |
|---|---:|
| Precision | 56.66% |
| Recall | 67.11% |
| F1 Score | 61.44% |
| Accuracy | 77.64% |

The Logistic Regression model was selected as the final model based on the comparison of the evaluated metrics.

---

## 6. MLflow

MLflow was used to track the machine learning experiments.

The following models were logged:

- Logistic Regression
- Random Forest
- XGBoost

For each model, parameters and evaluation metrics were recorded.

This makes it easier to compare model experiments and keep track of the results.

---


## 7. New Customer Validation & Prediction

- A validation function was built to check any new customer record before scoring it — verifying required fields are present, and that tenure, MonthlyCharges and TotalCharges are non-negative numeric values.

- created TotalServicesUsed , Converted Yes/No columns into 1/0, One-Hot Encoding for the new customer
and churn probability for new customer

- Invalid inputs raise clear errors (Tenure cannot be negative, finding missing field and wrong data type) instead of failing silently or producing a nonsense prediction.

- A sample new customer (18-month tenure, Fiber optic, One-year contract, 95.50/month) was validated, feature-engineered, encoded and scored — returning a churn probability of 99.89%, correctly flagged for retention attention given the combination of high monthly charges and moderate tenure.

## Churn Prediction

The selected model was used to generate:

- Churn Probability
- Predicted Churn
- Risk Level

Customers with a churn probability of 50% or higher were classified as predicted churn customers.

Customers with a churn probability of 70% or higher were classified as High Risk.

The prediction results were saved as:

 `ChurnPredictions.csv`
 
---

## 8. Power BI Dashboard

Power BI was used to present the customer churn analysis and prediction results.

### Dashboard Page 1 – Customer Churn Overview

This page focuses on:

Actual customer churn and historical churn patterns.

- Actual churn rate
- Customer distribution
- Churn patterns
- Contract
- Internet Service
- Tenure

### Dashboard Page 2 – Prediction Insights

This page focuses on:

Predicted churn, risk, and revenue exposure.

- Predicted churn
- Churn probability
- Revenue at risk
- High-risk customers
- Contract and tenure patterns

### Dashboard Page 3 – High-Risk Customer Details

This page provides customer-level details for customers classified as high risk.

Important fields include:

- Customer ID
- Contract
- Tenure
- Internet Service
- Monthly Charges
- Total Charges
- Total Services Used
- Churn Probability
- Predicted Churn
- Risk Level
- Rention Strategy
---
## 9.Power BI Dashboard Screenshots

### Page 1 – Customer Churn Overview

![Page 1](customer_churn_project/powerbi_dashboard_image/powerbi_page1.png)

### Page 2 – Prediction Insights

![Page 2](powerbi_dashboard_image/powerbi_page2.png)

### Page 3 – High-Risk Customer Details

![Page 3](powerbi_dashboard_image/powerbi_page3.png)

---

### Key Findings:

The analysis identified several important churn patterns:

- The overall customer churn rate is approximately **26.54%**.
- Customers who churned had higher average monthly charges than customers who stayed.
- Customers with shorter tenure generally show higher churn.
- Month-to-month contracts show a higher churn rate than longer-term contracts.
- Lack of additional services such as Online Security and Tech Support can be associated with higher churn risk.
- Customers with higher churn probabilities can be identified for targeted retention activities.
- Customer-level churn probabilities can help prioritize retention efforts.

## 10. Model Explainability

Model explainability was performed to understand why the machine learning model makes particular churn predictions.

### Feature Importance

XGBoost feature importance was used to understand which features contributed most to the model's predictions.

The top features identified were:

- Contract_Two year – 0.3414
- Contract_One year – 0.1563
- InternetService_No – 0.1428
- MultipleLines_No phone service – 0.0527
- Customer_segment_Loyal – 0.0442
- OnlineSecurity_Yes – 0.0259
- Dependents – 0.0236
- PhoneService – 0.0211
- TechSupport_Yes – 0.0209
- PaymentMethod_Mailed check – 0.0203

Contract-related features had the highest feature-importance values in the model, followed by Internet Service and other customer service characteristics.

Feature importance shows how much each feature contributed to the model's overall predictions. It does not by itself indicate whether a feature increases or decreases churn.

### LIME – Explanation

LIME was used to explain an individual customer prediction.

### LIME – Churn Customer

Model predicted 69.5% churn probability.

High monthly charges and lack of Online Security, Online Backup, and Device Protection increased churn risk.

Tech Support and streaming services reduced the churn tendency.

### LIME – No Churn Customer

Model predicted only 2.75% churn probability, resulting in No Churn.

Long tenure and a two-year contract reduced churn risk.

Online Security, Tech Support, Device Protection, and Online Backup also supported the No Churn prediction.


The analysis showed that factors such as monthly charges, contract type, tenure, and service-related variables contributed to the model's predictions.

---

## 11. New Customer Prediction & Validation

Created a predict_new_customer() function to predict churn probability for a new customer.

Added validation for missing fields, incorrect data types, and invalid values.

Tested the function with valid and invalid customer inputs to ensure errors are handled properly.

Generated a churn probability and prediction for a new customer.


---

## 12. Model Pipeline

Combined data scaling and the trained Logistic Regression model into a reusable pipeline.

Used the pipeline to make predictions for new customers.

Saved the pipeline as churn_pipeline.pkl using joblib.

The saved pipeline can be loaded and used to make predictions without retraining the model.

---

## 13. Streamlit Deployment

A simple Streamlit app was created to demonstrate the customer churn prediction model.

- Created app.py 
- Added customer details as inputs.
- Loads the saved `cleaned_featured_churn_data.csv`
- Performs feature engineering and encoding.
- Loads the saved `churn_pipeline.pkl` model.
- Displays churn probability and Churn / No Churn prediction.

### Run the App

streamlit run app.py


The app provides a simple interface for generating live customer churn predictions.


### Files Used

- `app.py` – Streamlit application code.
- `churn_pipeline.pkl` – Saved machine learning pipeline.
- `cleaned_featured_churn_data.csv` – Feature-engineered dataset used to match the model's expected features.

### How to Run

Open Anaconda Prompt and navigate to the project folder:


cd "C:\Users\Surya\OneDrive\Desktop\CUSTOMER CHURN PROJECT"


Run the Streamlit application:

streamlit run app.py


The application opens in the browser and allows users to enter customer details and generate a live churn prediction.

---

## 14. Retention Strategy Extension

A rule-based retention strategy was added to connect churn predictions with business actions.

- **High Risk + Month-to-month:** Offer contract upgrade discount
- **Other customers:** Continue regular engagement

The `RetentionStrategy` column was added to `ChurnPredictions.csv` and integrated into the Power BI dashboard to support customer retention analysis.

---

## 15. Key Business Insights

- Contract type is the strongest churn driver: month-to-month customers churn at 42.71% versus 2.83% for two-year contracts.

- New customers (0–1 year tenure) are the highest-risk segment, churning at 47.44% — far above established or loyal customers.

- Fiber optic customers churn more than DSL or no-internet customers, both in actual and predicted data.

- Higher monthly charges are consistently associated with higher churn, both in SQL findings and in individual LIME explanations.

- Lack of add-on services (Tech Support, Online Security, Device Protection) increases churn risk; using more services reduces it.

- The predictive model flags 1,155 customers as high risk, representing 139.13K in revenue at risk — ₹concentrated almost entirely in month-to-month, fiber-optic, low-tenure customers.

---

## 15. How to Run the Project

### Step 1 – SQL Server

- Create the `ChurnDB` database.
- Import the Telco Customer Churn dataset.
- Create the required table and view.
- Run the SQL analysis queries.

### Step 2 – Python

Open the Python/Jupyter notebooks and run the data preparation and machine learning steps.

The feature-engineered dataset is created as:

`cleaned_featured_churn_data.csv`

### Step 3 – Machine Learning

Run the model notebook to:

- Train the models.
- Apply SMOTE.
- Tune the models using GridSearchCV.
- Compare the models.
- Track experiments using MLflow.

### Step 4 – Prediction

Generate customer churn probability, predicted churn, and risk level.

The output is saved as:

`ChurnPredictions.csv`

### Step 5 – Power BI

Open Power BI and import:

`ChurnPredictions.csv`

Refresh the dashboard to view the latest prediction results.

---

## 16. Project Files

Important project files include:

- `cleaned_churn_data.csv`
- `cleaned_featured_churn_data.csv`
- `ChurnPredictions.csv`
- `churn_pipeline.pkl`
- `requirements.txt`
- `Python notebooks`
- `SQL scripts`
- `Power BI report`

---

## 17. Conclusion

- This project took customer churn analysis from raw SQL data through to a deployed, business-ready decision tool. SQL-based EDA established the historical drivers of churn; Python feature engineering and a SMOTE-balanced, GridSearchCV-tuned Logistic Regression model improved the ability to catch at-risk customers (67% recall on the churn class);

- MLflow gave a reproducible experiment record; LIME and feature importance made individual predictions explainable; and the model was packaged into a validated, reusable pipeline.

- That predictions of 3 models powers both a three-page Power BI dashboard for business reporting and a live Streamlit app for on-demand predictions, and its output is translated into a concrete, rule-based retention strategy.

- Together, these components move the project from a one-off notebook analysis to a reproducible, documented, and business-oriented churn-prevention solution.
