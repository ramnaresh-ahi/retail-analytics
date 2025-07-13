# 🛍️ Retail Analytics 

This project aims to derive insights from a retail dataset by analyzing customer behavior, support interactions, marketing campaigns, and transactions. Built using **dbt Cloud** and **BigQuery**, the project follows a modular, scalable, and maintainable analytics engineering workflow.

---

## 📌 Objective

- Identify the most effective **campaigning strategies**.
- Analyze **customer acquisition sources**.
- Evaluate **support issues and patterns**.
- Understand **customer sentiment** through reviews.
- Analyze **retail transactions** to identify trends.

---

## 📦 Data Source

- **Kaggle Dataset**: [Retail Customer and Transaction Dataset](https://www.kaggle.com/datasets/raghavendragandhi/retail-customer-and-transaction-dataset)

---

## 🧱 Project Structure (High-Level)

The project follows a modular, layer-based dbt structure:

- **Staging Layer**: Raw source tables cleaned and renamed for consistency  
- **Intermediate Layer**: Business logic transformations, joins, derived tables  
- **Marts Layer**: Final fact and dimension tables for analytics use  
- **Snapshots**: Historical tracking for slowly changing dimensions  
- **Macros & Tests**: Custom macros and reusable test logic

---

## ✅ Testing & Macros

### 🧪 Built-in Tests

- `unique`  
- `not_null`  
- `accepted_values`  
- `relationships`  

---

### 🛠️ Custom Macros

- `macros/tests/assert_positive_value.sql`: Ensures numerical columns contain values greater than a defined minimum.

---

## 🔁 Snapshots

| Snapshot Table        | Description                                    |
|-----------------------|------------------------------------------------|
| `customers_snapshot`  | Tracks historical changes in customer records  |

Snapshots help preserve **slowly changing dimensions (SCD)** by capturing and storing historical versions of data.

---

## 📊 Data Models

### 🔹 Fact Tables

| Model Name             | Description                                      |
|------------------------|--------------------------------------------------|
| `fact_transactions`     | Transaction-level data with quantity, amount, etc. |
| `fact_campaigns_overview` | Summarized campaign performance metrics          |

### 🔸 Dimension Tables

| Model Name             | Description                                      |
|------------------------|--------------------------------------------------|
| `dim_customers`         | Customer demographic and profile data            |
| `dim_campaigns`         | Campaign details and metadata                    |
| `dim_interactions`      | Customer interactions with different channels    |
| `dim_support_tickets`   | Support issues raised by customers               |
| `dim_customer_reviews`  | Customer feedback and reviews                    |

---

## 📚 Documentation

Project documentation is available at: [retail-analytics docs](https://ramnaresh-ahi.github.io/retail-analytics/)

---

## 📊 Dashboard

Check out the interactive dashboard here: [Retail Analytics Dashboard]([https://your-dashboard-link.com](https://lookerstudio.google.com/reporting/6206d567-bca9-476a-9663-04777b5db8cf))

---

## 🧰 Tech Stack

| Tool         | Purpose                                  |
|--------------|------------------------------------------|
| **dbt Cloud**| Data modeling, testing, scheduling       |
| **BigQuery** | Data warehouse for storage & querying    |
| **GCS**      | Raw data storage                         |
| **dbt Cloud Scheduler** | Automates scheduled runs      |

---

## ⚙️ Features

- ✅ Built with **dbt Cloud**
- ✅ Uses **BigQuery** as the warehouse
- ✅ Automated jobs using **dbt Cloud Scheduler**
- ✅ **Incremental models** for efficient transformation
- ✅ **Snapshots** to track changes over time (e.g., customers)
- ✅ **Custom tests and macros** to ensure data quality
- ✅ **Schema documentation** for model transparency

---

## 🚀 How to Run

### dbt Cloud
- Connect BigQuery
- Set up deployment environment
- Schedule jobs with dbt Cloud Scheduler

### dbt CLI
```bash
pip install dbt-bigquery
dbt init retail_analytics
dbt run
dbt test
dbt docs generate
dbt docs serve
```
---

## 👨‍💻 Author

**Ramnaresh Ahirwar**  
Data Enthusiast | dbt & BigQuery Practitioner  
📧 Email: ramnareshahi77@gmail.com  
🌐 GitHub: [ramnaresh-ahi](https://github.com/ramnaresh-ahi)  
