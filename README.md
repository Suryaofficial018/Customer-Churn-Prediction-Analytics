# Customer Churn Prediction & Analytics

**Prepared by:** Surya  
**Project Type:** Data Analytics & Machine Learning  
**Domain:** Telecommunications / Customer Retention

---

## 1. Project Overview

Customer churn is an important business problem for telecommunications companies because losing existing customers can reduce recurring revenue.

This project analyzes customer data to understand churn patterns, identify customers who are likely to churn, and provide actionable insights through Power BI dashboards.

The project combines SQL, Python, Machine Learning, MLflow, and Power BI into one end-to-end analytics workflow.

### Project Workflow

SQL Server  
↓  
Data Cleaning & Exploration  
↓  
Python  
↓  
Feature Engineering  
↓  
Machine Learning  
↓  
Model Evaluation  
↓  
MLflow Tracking  
↓  
Customer Churn Prediction  
↓  
Power BI Dashboard

---

## 2. Project Objectives

The main objectives of this project are:

- Analyze customer churn patterns.
- Clean and prepare customer data for analysis.
- Perform exploratory data analysis using SQL and Python.
- Create useful customer features for machine learning.
- Build and compare multiple classification models.
- Handle class imbalance using SMOTE.
- Optimize models using GridSearchCV.
- Track model experiments using MLflow.
- Predict churn probability for individual customers.
- Categorize customers based on churn risk.
- Explain model predictions using LIME and feature importance.
- Create interactive Power BI dashboards for business users.
- Package the trained model into a reusable pipeline.

---

## 3. Dataset

The project uses the **Telco Customer Churn dataset**.

### Dataset Details

- **Customers:** 7,043
- **Original columns:** 21
- **Target variable:** `Churn`

### Main Columns

| Column | Description |
|---|---|
| customerID | Unique customer identifier |
| gender | Customer gender |
| SeniorCitizen | Whether the customer is a senior citizen |
| Partner | Whether the customer has a partner |
| Dependents | Whether the customer has dependents |
| tenure | Number of months the customer has stayed |
| PhoneService | Whether phone service is active |
| MultipleLines | Multiple line service |
| InternetService | Internet service type |
| OnlineSecurity | Online security service |
| OnlineBackup | Online backup service |
| DeviceProtection | Device protection service |
| TechSupport | Technical support service |
| StreamingTV | Streaming TV service |
| StreamingMovies | Streaming movie service |
| Contract | Customer contract type |
| PaperlessBilling | Whether paperless billing is used |
| PaymentMethod | Customer payment method |
| MonthlyCharges | Monthly customer charges |
| TotalCharges | Total customer charges |
| Churn | Whether the customer churned |

---

## 4. Tools & Technologies

### Database

- SQL Server
- SQL Server Management Studio (SSMS)

### Programming

- Python
- Jupyter Notebook

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Imbalanced-learn
- XGBoost
- PyODBC
- SQLAlchemy
- MLflow
- LIME
- Joblib

### Visualization

- Power BI

### Machine Learning

- Logistic Regression
- Random Forest
- XGBoost
- SMOTE
- GridSearchCV

---

## 5. Project Structure

The project was completed in multiple tasks covering SQL, Python, Machine Learning, explainability, prediction, and Power BI.

### SQL Analysis

The initial analysis was performed using SQL Server.

The SQL work included:

- Database and table creation.
- Data import.
- Data validation.
- Data cleaning.
- Churn rate analysis.
- Average monthly charges analysis.
- Tenure analysis.
- Internet service analysis.
- Technical support analysis.
- Payment method analysis.
- Creation of a reusable SQL view.

The main SQL view used in Python was:

`dbo.vw_ChurnData`

---

## 6. Data Cleaning

The data was checked for missing and invalid values before performing machine learning.

### TotalCharges

There were 11 customers with blank `TotalCharges`.

After checking these records, all 11 customers had:

- `tenure = 0`

These records were retained because they are valid customer records.

For the machine learning dataset, the blank numeric values were handled during Python preprocessing so that the model could process the data.

---

## 7. Feature Engineering

Additional features were created to improve the analysis and machine learning process.

### Customer Segment

Customers were grouped based on tenure:

| Tenure | Customer Segment |
|---|---|
| 0–12 months | New |
| 13–24 months | Established |
| 25+ months | Loyal |

### Total Services Used

The following services were counted:

- Online Security
- Online Backup
- Device Protection
- Tech Support
- Streaming TV
- Streaming Movies

A new feature called:

`TotalServicesUsed`

was created to represent the number of services used by each customer.

---

## 8. Data Preparation for Machine Learning

The following preprocessing steps were performed:

- Converted binary Yes/No columns into numeric values.
- Applied one-hot encoding to categorical variables.
- Created customer tenure segments.
- Created `TotalServicesUsed`.
- Removed `customerID` from the machine learning features.
- Prepared the feature matrix `X`.
- Prepared the target variable `y`.
- Split the data into training and testing sets.

The train-test split used:

- Training data: 80%
- Testing data: 20%
- Random state: 42
- Stratification based on the churn target.

---

## 9. Exploratory Data Analysis

SQL and Python were used to understand customer churn patterns.

### Overall Churn

The overall churn rate was approximately:

**26.54%**

### Monthly Charges

The average monthly charge was:

- **Churned customers:** ₹74.44
- **Stayed customers:** ₹61.27

This shows that churned customers had higher average monthly charges in the analyzed dataset.

### Tenure

Customers with longer tenure generally showed lower churn compared with newer customers.

### Contract

Month-to-month customers showed a higher churn rate compared with customers on longer-term contracts.

### Customer Services

Service usage such as technical support, online security, online backup, and device protection was also analyzed to understand its relationship with churn.

---

## 10. Machine Learning Models

Three classification algorithms were trained and compared:

1. Logistic Regression
2. Random Forest
3. XGBoost

The target variable was:

`Churn`

The models were evaluated using:

- Precision
- Recall
- F1 Score
- Accuracy

---

## 11. Class Imbalance Handling

The dataset contains fewer churned customers than non-churned customers.

To handle this class imbalance, **SMOTE (Synthetic Minority Oversampling Technique)** was applied to the training data.

SMOTE creates synthetic examples of the minority class to help the model identify churn customers more effectively.

### Before SMOTE

The training dataset contained more non-churn customers than churn customers.

### After SMOTE

The churn and non-churn classes were balanced in the training data.

---

## 12. Model Optimization

GridSearchCV was used to find better hyperparameters for the machine learning models.

The models were optimized using:

- 3-fold cross-validation
- F1 score as the scoring metric

The following models were tuned:

- Logistic Regression
- Random Forest
- XGBoost

---

## 13. Model Results

The final tuned model results were:

| Model | Precision | Recall | F1 Score | Accuracy |
|---|---:|---:|---:|---:|
| Logistic Regression | 56.66% | 67.11% | 61.44% | 77.64% |
| Random Forest | 57.22% | 59.36% | 58.27% | 77.43% |
| XGBoost | 57.11% | 59.09% | 58.08% | 77.36% |

The Logistic Regression model was used as the final prediction model in the project based on the evaluation results, particularly its recall and F1 score.

---

## 14. Why Recall Matters for Churn Prediction

For a churn prediction problem, identifying customers who may actually churn is important.

Recall measures how many of the actual churn customers were correctly identified by the model.

The final Logistic Regression model achieved:

**67.11% Recall**

This means the model identified approximately 67% of the actual churn cases in the test data.

This metric is useful when the business wants to identify more potentially churn-prone customers for retention activities.

---

## 15. MLflow Experiment Tracking

MLflow was used to track the machine learning experiments.

The MLflow experiment was:

`Customer Churn Prediction Final`

The following information was logged:

### Parameters

- Model parameters
- Logistic Regression `C`
- Random Forest `n_estimators`
- XGBoost `n_estimators`

### Metrics

- Precision
- Recall
- F1 Score
- Accuracy

This provides a record of the model experiments and makes it easier to compare model performance.

---

## 16. Customer Churn Prediction

After selecting the final model, customer-level predictions were generated.

The prediction dataset contains information such as:

- Customer ID
- Tenure
- Monthly Charges
- Total Charges
- Internet Service
- Contract
- Total Services Used
- Churn Probability
- Predicted Churn
- Risk Level

The prediction output was saved as:

`ChurnPredictions.csv`

---

## 17. Churn Probability

The model generates a probability between 0 and 1.

For example:

- `0.10` = 10% churn probability
- `0.50` = 50% churn probability
- `0.80` = 80% churn probability

The project converts this probability into a percentage for easier business interpretation.

---

## 18. Prediction Rules

The following threshold was used for predicted churn:

```text
Churn Probability >= 50%
        ↓
Predicted Churn = Yes
