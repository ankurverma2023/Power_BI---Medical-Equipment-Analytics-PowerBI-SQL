USE MedicalEquipment_DB

SELECT * FROM DBO.Medical_Equipment

-- Total rows count
SELECT COUNT(*) AS Total_Rows FROM Medical_Equipment

SELECT TOP 5 * FROM DBO.Medical_Equipment

-- Null Values Check
SELECT
	SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS Null_Products,
	SUM(CASE WHEN Final_Invoice_INR IS NULL THEN 1 ELSE 0 END) AS Null_Invoice,
	SUM(CASE WHEN Purchase_Date IS NULL THEN 1 ELSE 0 END) AS Null_Date
FROM DBO.Medical_Equipment

-- Category distribution
SELECT Equipment_Category, COUNT(*) AS Count
FROM DBO.Medical_Equipment
GROUP BY Equipment_Category
ORDER BY Count DESC

-- Total Equipment Count by Category
SELECT
	Equipment_Category,
	COUNT(*) AS Total_Equipment,
	COUNT(DISTINCT Product_Name) AS Unique_Products,
	COUNT(DISTINCT Manufacturer) AS Manufacturers
FROM DBO.Medical_Equipment
GROUP BY Equipment_Category
ORDER BY Total_Equipment DESC

-- Domestic vs International Equipment Analysis
SELECT
    Manufacturer_Origin,
    COUNT(*) AS Total_Equipment,
    SUM(CAST(Final_Invoice_INR AS BIGINT)) AS Total_Invoice_INR,
    AVG(CAST(Unit_Price_INR AS DECIMAL(18,2))) AS Avg_Unit_Price,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS Pct_Share
FROM dbo.Medical_Equipment
GROUP BY Manufacturer_Origin
ORDER BY Total_Equipment DESC

SELECT SUM(Final_Invoice_INR)
FROM DBO.Medical_Equipment

SELECT AVG(CAST(Unit_Price_INR AS BIGINT)) AS Avg_Unit_Price
FROM dbo.Medical_Equipment

SELECT COUNT(*)
FROM DBO.Medical_Equipment

-- Equipment Status Distribution — Active vs Down
SELECT
    Equipment_Status,
    COUNT(*) AS [Count],
    ROUND(AVG(CAST(Uptime_Percentage AS DECIMAL(18,2))), 1) AS Avg_Uptime,
    ROUND(AVG(CAST(Utilization AS DECIMAL(18,2))), 1) AS Avg_Utilization
FROM dbo.Medical_Equipment
GROUP BY Equipment_Status
ORDER BY [Count] DESC

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Medical_Equipment'

-- Top 10 Most Expensive Equipment
SELECT TOP 10
    Product_Name,
    Manufacturer,
    Manufacturer_Origin,
    MAX(Unit_Price_INR) AS Highest_Unit_Price,
    MAX(Final_Invoice_INR) AS Highest_Invoice_INR
FROM DBO.Medical_Equipment
GROUP BY
    Product_Name,
    Manufacturer,
    Manufacturer_Origin
ORDER BY Highest_Unit_Price DESC

-- State-wise Equipment Count aur Total Value
SELECT
    State,
    Region,
    COUNT(*) AS Total_Equipment,
    SUM(CAST(Final_Invoice_INR AS BIGINT)) AS Total_Spend_INR,
    ROUND(AVG(CAST(Utilization AS DECIMAL(18,2))), 1) AS Avg_Utilization_Pct,
    SUM(CASE WHEN Equipment_Status = 'Active' THEN 1 ELSE 0 END) AS Active_Equipment
FROM dbo.Medical_Equipment
GROUP BY State, Region
ORDER BY Total_Spend_INR DESC












