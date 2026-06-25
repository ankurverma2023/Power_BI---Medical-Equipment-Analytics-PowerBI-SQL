# Power_BI---Medical-Equipment-Analytics-PowerBI-SQL
Power BI + SQL Server | Star Schema | DAX | Healthcare Analytics

This project presents an end-to-end Healthcare Equipment Analytics Dashboard developed using SQL Server and Power BI. The dashboard provides comprehensive insights into medical equipment assets, maintenance performance, vendor efficiency, and financial metrics across hospitals.

The dataset consists of 100,000+ medical equipment records, 600 hospitals, and multiple equipment categories distributed across India.

🎯 Business Objective

To help healthcare organizations:
Monitor medical equipment performance
Track maintenance and service activities
Analyze asset utilization and downtime
Evaluate vendor performance
Improve financial planning and asset management

🛠️ Tools & Technologies
SQL Server
Power BI
DAX
Power Query
Data Modeling
Star Schema

🗂️ Data Model
Implemented a Star Schema model using:
Fact Table
Fact_MedicalEquipment
Dimension Tables
Dim_Date
Dim_Hospital
Dim_Vendor
Relationships
One-to-Many (1:*)
Single Direction Filtering
Active Relationships


📊 Dashboard Pages
1️⃣ Asset Overview
KPIs
Total Equipment
Total Hospitals
Asset Value
Net Value
Avg Utilization %
Avg Uptime %
Visualizations
Equipment Status
Equipment by State
Asset Value by Category
Asset Value by Hospital Type
Equipment Trend
Slicers
State
Region
Hospital Type
Equipment Type
Manufacturer
2️⃣ Maintenance & Reliability
KPIs
Total AMC Cost
Total Repair Cost
Total Incidents
Overdue Services
Avg Downtime
Visualizations
Utilization vs Downtime
Equipment Status by State
Incidents by Department
AMC Cost by Category
Service Details
Slicers
Service
Department
State
Category
Risk Level
3️⃣ Financial Performance
KPIs
Asset Value
Net Value
GST Amount
Book Value
Vendor Rating
Delivery Days
Visualizations
Asset & Maintenance Cost
Top Manufacturers
Vendor Rating Distribution
Repair Cost vs Asset Value
Asset Value by Region
Slicers
Region
Manufacturer
Vendor Rating
Warranty
Category
📈 Key DAX Measures
Total Equipment =
DISTINCTCOUNT(Fact_MedicalEquipment[Equipment_ID])

Total Hospitals =
DISTINCTCOUNT(Fact_MedicalEquipment[Hospital_ID])

Asset Value =
SUM(Fact_MedicalEquipment[Final_Invoice_INR])

Net Value =
SUM(Fact_MedicalEquipment[Net_Value_INR])

Avg Utilization % =
AVERAGE(Fact_MedicalEquipment[Utilization_%])

Avg Uptime % =
AVERAGE(Fact_MedicalEquipment[Uptime_Percentage])

Total Incidents =
SUM(Fact_MedicalEquipment[Incident_Count_YTD])

Total AMC Cost =
SUM(Fact_MedicalEquipment[AMC_Cost_Annual_INR])

Total Repair Cost =
SUM(Fact_MedicalEquipment[Repair_Cost_YTD_INR])
💡 Key Insights
Managed assets worth ₹1.34 Trillion
Monitored equipment performance across 600 hospitals
Identified overdue maintenance activities and downtime trends
Analyzed vendor performance using ratings and delivery lead times
Evaluated asset value distribution across equipment categories and regions
📁 Repository Structure
Healthcare-Equipment-Analytics-Dashboard/
│
├── Medical_Equipment_Analytics.pbix
├── Medical_Equipment_Dataset.csv
├── SQL/
│   └── MedicalEquipment_DB.sql
│
├── Screenshots/
│   ├── Asset_Overview.png
│   ├── Maintenance_Reliability.png
│   └── Financial_Performance.png
│
└── README.md
