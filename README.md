# 🛢️ European Fuel Prices — Business Intelligence Project

An **end-to-end Business Intelligence project** covering the full pipeline from raw data ingestion to final visualization. The project analyzes the evolution of **petrol and diesel prices across Europe** from 2005 to 2023 — exploring how fuel prices change over time and how exchange rates across 23 currencies influence the perceived price of fuel.

---

## 📌 Key Objectives

- **Price Comparison** — Analyze petrol vs. diesel price trends over time.
- **Tax Impact Analysis** — Compare fuel prices with and without taxes to understand the cost of taxation in Europe.
- **Cross-Country Analysis** — Examine data from the 10 most populous European countries (excluding the UK).
- **Currency Impact** — Evaluate how 23 worldwide and European currencies affect the perceived price of fuel.

---

## 📂 Project Structure

```
C:.
├───data  source data
│
├───docs
│       the etl process.png                         # Full ETL pipeline overview
│       staging fuel price package .png             # SSIS package — fuel price staging
│       staging exhange rates.png                   # SSIS package — exchange rates staging
│       dwh dimensions.png                          # DWH dimension tables schema
│       dwh facts.png                               # DWH fact tables schema
│       dwh_time_dim.png                            # Time dimension detail
│
└───scripts
    │   initialize_database.sql                     # Master script — creates databases
    │
    ├───dwh
    │       00_Create_DWH_Errors.sql                # Error logging table for the DWH
    │       01_Create_DWH_Dim_Currency_Table.sql    # Currency dimension table
    │       02_Create_DWH_Dim_Country_Table.sql     # Country dimension table
    │       03_Create_DWH_Dim_Time_Table.sql        # Time dimension table
    │       04_Create_DWH_Fact_Fuel_Price_With_Taxes.sql   # Fact table — prices with taxes
    │       05_Create_DWH_Fact_Fuel_Price_WO_Taxes.sql     # Fact table — prices without taxes
    │       06_Create_DWH_Fact_Exchange_Rates.sql          # Fact table — daily exchange rates
    │
    └───staging
            01_Create_Insert_Dim_Currency_Table.sql # Staging — create & populate currency dim
            02_Create_Insert_Dim_Country_Table.sql  # Staging — create & populate country dim
            03_Create_Insert_Dim_Time_Table.sql     # Staging — create & populate time dim
            04_Create_Fact_Fuel_Price_With_Taxes.sql  # Staging — load fuel prices with taxes
            05_Create_Fact_Fuel_Price_WO_Taxes.sql    # Staging — load fuel prices without taxes
            06_Create_Fact_Exchange_Rates.sql          # Staging — load ECB exchange rates
```

---

## 🗄️ Data Sources

| Data | Source | Format | Granularity |
|---|---|---|---|
| Fuel Prices (with & without taxes) | Official EU Energy Portal | CSV | Weekly |
| Exchange Rates | European Central Bank (ECB) | CSV | Daily |

- **Timeframe:** 2005 – 2023
- **Countries:** Belgium, Czech Republic, Germany, Spain, France, Italy, Netherlands, Poland, Romania, Sweden
- **Currencies:** 23 currencies (20 most used worldwide + 4 European non-Euro currencies)

---

## 🏗️ Data Architecture

The project follows a standard **Star Schema** for the data warehouse.

### Dimensions

- Time
- Country
- Currency

### Fact Tables

| Fact Table | Description | Granularity |
|---|---|---|
| **Fuel Price (With Taxes)** | Weekly pump prices including tax | Weekly |
| **Fuel Price (Without Taxes)** | Weekly prices excluding tax | Weekly |
| **Exchange Rates** | Daily conversion rates for 23 currencies | Daily |

---

## ⚙️ ETL Process

The ETL pipeline is built using **SQL Server Integration Services (SSIS)** and follows a layered approach:

![ETL Process Overview](docs/the%20etl%20process.png)

### Pipeline Stages

**1. Source Systems**
Raw CSV flat files for fuel prices (per country, with/without taxes) and ECB exchange rates.

**2. Operational Data Store (ODS / Staging)**
Data is initially loaded into the staging layer using SQL scripts and SSIS packages. Separate packages handle fuel prices and exchange rates.

![Fuel Price SSIS Package](docs/staging%20fuel%20price%20package%20.png)

![Exchange Rates SSIS Package](docs/staging%20exhange%20rates.png)

**3. Data Warehouse (DWH)**
Staged data is transformed and loaded into the Star Schema, introducing primary/foreign keys and enforcing data integrity. SQL scripts are numbered and executed in order (00 → 06).

**4. Reporting**
Power BI connects directly to the DWH for interactive dashboards, trend analysis, and visualization.

---

## 🛠️ Technology Stack

| Layer | Tool |
|---|---|
| ETL | SQL Server Integration Services (SSIS) |
| Database | SQL Server |
| Reporting & Visualization | Power BI |

---


## 📊 Sample Analyses

- Petrol vs. Diesel price trends from 2005 to 2023 across 10 European countries
- Tax vs. pre-tax price comparison to isolate government tax contribution
- Fuel price comparison in JPY, CAD, and 20 other currencies to separate real price changes from currency fluctuations
