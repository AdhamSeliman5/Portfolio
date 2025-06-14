SELECT * FROM df_orders
-- Top 10 product by revenue

SELECT TOP 10 [Product Id], SUM(final_price) AS Sales FROM df_orders
GROUP BY [Product Id]
ORDER BY Sales DESC

-- Find top 5 highest selling products in each region
SELECT DISTINCT Region FROM df_orders

SELECT TOP 5 [Region], [Product Id], SUM(final_price) AS Sales FROM df_orders
GROUP BY [Region], [Product Id]
ORDER BY Region,Sales DESC

WITH CTE AS (
SELECT [Region], [Product Id], SUM(final_price) AS Sales FROM df_orders
GROUP BY [Region], [Product Id])

SELECT * FROM (
	SELECT *, ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Sales DESC) AS rn
	FROM CTE) A 
	WHERE rn<6


-- Find MOM Growth comparison for 2022 & 2023

SELECT DISTINCT YEAR([Order Date]) FROM df_orders


WITH CTE AS(
	SELECT YEAR([Order Date]) AS Years, MONTH([Order Date]) AS Months, SUM(final_price) AS Sales
	FROM df_orders
	GROUP BY YEAR([Order Date]), MONTH([Order Date])
	--ORDER BY Years, Months
)
	SELECT Months
	, SUM(CASE WHEN Years=2022 THEN Sales ELSE 0 END) AS Sales_2022
	, SUM(CASE WHEN Years=2023 THEN Sales ELSE 0 END) AS Sales_2023
	FROM CTE
	GROUP BY Months
	ORDER BY Months


-- For each category which month has the hitghest sales?

WITH CTE AS(
	SELECT Category, FORMAT([Order Date],'yyyyMM') AS Order_Month, SUM(final_price) AS Sales
	FROM df_orders
	GROUP BY Category, FORMAT([Order Date],'yyyyMM')
)
SELECT * FROM (
	SELECT *, ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Sales DESC) AS rn
	FROM CTE
	) A
	WHERE rn=1

-- Which subcategory has highest growth by profit in 2023 comparing with 2022

WITH CTE AS (
	SELECT [Sub Category], YEAR([Order Date]) AS Year, SUM(final_price) AS Sales
	FROM df_orders
	GROUP BY [Sub Category], YEAR([Order Date])
)
,CTE2 AS(
	SELECT [Sub Category]
	,SUM(CASE WHEN Year = 2022 THEN Sales ELSE 0 END) AS Sales_2022
	,SUM(CASE WHEN Year = 2023 THEN Sales ELSE 0 END) AS Sales_2023
	FROM CTE
	GROUP BY [SUB Category]
)
SELECT TOP 1 *, (Sales_2023 - Sales_2022)
FROM CTE2