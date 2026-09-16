# Customer Churn Prediction & Analytics

**Tools:** SQL Server, Python, Machine Learning, MLflow, Power BI  
**Prepared by:** Surya

---

## 📌 Project Overview

This project analyzes customer churn for a telecommunications company and develops a machine learning model to identify customers who are likely to leave.

The project follows an end-to-end data analytics and machine learning workflow:

**SQL Server → Python → Data Cleaning → Feature Engineering → Machine Learning → MLflow → Churn Prediction → Power BI**

The main objective is to understand customer churn patterns, predict potential churn customers, and provide business insights that can support customer retention activities.

---

## 🎯 Project Objectives

- Analyze customer churn patterns.
- Clean and prepare customer data for analysis.
- Perform exploratory data analysis using SQL and Python.
- Create useful customer features for machine learning.
- Handle class imbalance using SMOTE.
- Train and compare multiple machine learning models.
- Tune model parameters using GridSearchCV.
- Track model experiments using MLflow.
- Generate customer-level churn probabilities.
- Categorize customers based on churn risk.
- Build Power BI dashboards for business reporting.
- Explain model predictions using feature importance and LIME.
- Save the trained model as a reusable pipeline.

---

## 📊 Dataset

The project uses the **Telco Customer Churn dataset**.

### Dataset Details

- **Customers:** 7,043
- **Original columns:** 21
- **Target variable:** `Churn`

### Important Columns

| Column | Description |
|---|---|
| customerID | Unique customer identifier |
| gender | Customer gender |
| SeniorCitizen | Indicates whether the customer is a senior citizen |
| Partner | Whether the customer has a partner |
| Dependents | Whether the customer has dependents |
| tenure | Number of months the customer has stayed |
| PhoneService | Whether the customer has phone service |
| MultipleLines | Multiple phone lines |
| InternetService | Type of internet service |
| OnlineSecurity | Online security service |
| OnlineBackup | Online backup service |
| DeviceProtection | Device protection service |
| TechSupport | Technical support service |
| StreamingTV | Streaming TV service |
| StreamingMovies | Streaming movies service |
| Contract | Customer contract type |
| PaperlessBilling | Whether paperless billing is enabled |
| PaymentMethod | Customer payment method |
| MonthlyCharges | Monthly amount charged |
| TotalCharges | Total amount charged |
| Churn | Whether the customer left the company |

---

## 🛠️ Tools & Technologies

### Database
- SQL Server
- SQL Server Management Studio (SSMS)

### Programming
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn

### Machine Learning
- Scikit-learn
- Logistic Regression
- Random Forest
- XGBoost
- SMOTE
- GridSearchCV

### Model Tracking
- MLflow

### Explainable AI
- LIME
- XGBoost Feature Importance

### Visualization
- Power BI

### Model Deployment / Reusability
- Joblib
- Scikit-learn Pipeline

---

## 🔄 Project Workflow

### 1. SQL Server

The customer churn dataset was imported into SQL Server.

SQL was used to:

- Explore the dataset.
- Check customer counts.
- Calculate churn rate.
- Analyze monthly charges.
- Analyze tenure.
- Analyze internet service and churn.
- Analyze technical support and churn.
- Analyze payment methods and churn.
- Create the `vw_ChurnData` view.

---

### 2. Python Data Preparation

The data was imported from SQL Server into Python using Pandas and PyODBC/SQLAlchemy.

Data preparation included:

- Checking dataset shape.
- Checking data types.
- Handling blank `TotalCharges` values.
- Converting required columns into appropriate formats.
- Encoding categorical variables.
- Preparing the dataset for machine learning.

There were 11 customers with blank `TotalCharges`. These records had zero tenure, so the customer records were retained rather than removed.

---

### 3. Feature Engineering

Additional features were created to improve the analysis.

### Customer Segment

Customers were divided based on tenure:

- **0–1 Year:** New
- **1–2 Years:** Established
- **2+ Years:** Loyal

### Total Services Used

The following services were used to calculate the number of additional services used by each customer:

- Online Security
- Online Backup
- Device Protection
- Tech Support
- Streaming TV
- Streaming Movies

The resulting feature was:

`TotalServicesUsed`

---

## 🤖 Machine Learning

The target variable was:

`Churn`

The data was divided into training and testing datasets using an 80/20 split with stratification.

### Models Tested

Three machine learning models were trained and compared:

1. Logistic Regression
2. Random Forest
3. XGBoost

---

## ⚖️ Handling Class Imbalance

Customer churn is an imbalanced classification problem because the number of customers who stayed is higher than the number who churned.

SMOTE (**Synthetic Minority Over-sampling Technique**) was used on the training data to improve the model's ability to identify churn customers.

The model was evaluated using:

- Precision
- Recall
- F1 Score
- Accuracy

Recall was especially important because identifying more potential churn customers can support customer retention activities.

---

## 🔧 Hyperparameter Tuning

`GridSearchCV` was used to test different model parameters.

The models were tuned using:

- Logistic Regression → `C`
- Random Forest → `n_estimators`
- XGBoost → `n_estimators`

The models were evaluated using **F1 score** during cross-validation.

---

## 📈 Model Results

The final tuned model results were:

| Model | Precision | Recall | F1 Score | Accuracy |
|---|---:|---:|---:|---:|
| Logistic Regression | 56.66% | 67.11% | 61.44% | 77.64% |
| Random Forest | 57.22% | 59.36% | 58.27% | 77.43% |
| XGBoost | 57.11% | 59.09% | 58.08% | 77.36% |

### Selected Model

**Logistic Regression**

The tuned Logistic Regression model was selected based on the model comparison results, particularly its recall and F1 score for the churn class.

---

## 📊 MLflow Experiment Tracking

MLflow was used to track the machine learning experiments.

The experiment recorded:

- Model parameters
- Precision
- Recall
- F1 Score
- Accuracy

The three final model runs were tracked in the MLflow experiment:

`Customer Churn Prediction Final`

This makes it easier to compare model experiments and maintain a record of the results.

---

## 🔮 Customer Churn Prediction

The final model was used to generate customer-level predictions.

For each customer, the project generated:

- Churn Probability
- Predicted Churn
- Risk Level

### Prediction Rule

If:

`Churn Probability >= 50%`

the customer is classified as:

**Churn**

Otherwise:

**No Churn**

### Risk Rule

If:

`Churn Probability >= 70%`

the customer is classified as:

**High Risk**

Otherwise:

**Normal Risk**

The predictions were saved in:

`ChurnPredictions.csv`

---

## 🔍 Model Explainability

Model explainability was performed to understand why the model produces certain predictions.

### Global Feature Importance

XGBoost feature importance was used to identify features that have a strong influence on churn prediction.

### LIME

LIME was used to explain individual customer predictions.

For example, factors such as:

- Higher monthly charges
- Lack of online security
- Lack of technical support
- Shorter contract periods
- Fewer additional services
- Lower tenure

can contribute to a customer's predicted churn risk in individual model explanations.

LIME was also used to explain both churn and no-churn examples.

---

## 🔄 Reusable Machine Learning Pipeline

A Scikit-learn Pipeline was created containing:

1. StandardScaler
2. Tuned Logistic Regression model

The pipeline was saved using Joblib as:

`churn_pipeline.pkl`

The saved pipeline can be loaded later and used to generate predictions without retraining the model.

---

## 📊 Power BI Dashboard

The Power BI report contains three main pages.

### Page 1 — Customer Churn Overview

This page provides an overview of actual customer churn and customer patterns.

Key areas include:

- Customer churn
- Churn rate
- Customer characteristics
- Contract patterns
- Tenure patterns
- Service-related churn patterns

---

### Page 2 — Prediction Insights

This page focuses on machine learning predictions.

It contains:

- Predicted Churn by Contract
- Revenue at Risk by Tenure Group
- Monthly Charges vs Churn Probability
- High-Risk Customers by Tenure Group

Slicers include:

- Contract
- Internet Service
- Risk Level

---

### Page 3 — High-Risk Customer Details

This page provides customer-level information for customers identified as high risk.

The table includes:

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

The table is filtered to show **High Risk** customers and sorted by churn probability.

---

## 💡 Key Business Insights

The analysis identified several important churn patterns:

- The overall customer churn rate is approximately **26.54%**.
- Customers who churned had higher average monthly charges than customers who stayed.
- Customers with shorter tenure generally show higher churn.
- Month-to-month contracts show a higher churn rate than longer-term contracts.
- Lack of additional services such as Online Security and Tech Support can be associated with higher churn risk.
- Customers with higher churn probabilities can be identified for targeted retention activities.
- Customer-level churn probabilities can help prioritize retention efforts.

---

## 📁 Important Project Files

The project contains files related to:

```text
Customer Churn Analysis/
│
├── README.md
├── requirements.txt
├── Customer_Churn_SQL_Task_1_to_4.pdf
├── Customer_Churn_Tasks_5_to_9.docx
├── Customer_Churn_Tasks_10_to_14.docx
├── Customer_Churn_Tasks_15_to_17.docx
├── cleaned_churn_data.csv
├── feature_engineered_churn_data.csv
├── ChurnPredictions.csv
├── churn_pipeline.pkl
└── Power BI report / screenshots
