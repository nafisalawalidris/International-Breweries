CREATE TABLE breweries (
	SALES_ID INT,
	SALES_REP VARCHAR,
	EMAILS VARCHAR,
	BRANDS VARCHAR,
	PLANT_COST INT,
	UNIT_PRICE INT,
	QUANTITY INT, 
	COSTS INT,  
	PROFIT	INT, 
	COUNTRIES VARCHAR,
	REGION VARCHAR,
	MONTHS CHAR (10),
	YEARS INT
);

SELECT * FROM breweries;

--Question 1: query to fetch “SALES_REP” from breweries  table using the alias name as WORKER_NAME--
SELECT sales_rep AS worker_name 
	FROM breweries;

--Question 2: query to fetch “BRANDS” from breweries table in upper case--
SELECT sales_rep, UPPER(brands) 
	FROM breweries;

/* Question 3: query to sort the QUANTITY column in Ascending order and 
the COSTS column in Descending order */

SELECT sales_rep, SUM(quantity), SUM(costs)
	FROM breweries
	GROUP BY sales_rep
	ORDER BY SUM(quantity) ASC, SUM(costs) DESC
	LIMIT 5;
	
/* Question 4: query for profit made from two BRANDS, 
“trophy” and “eagle” in the first quarter of 2019 */
SELECT sales_rep, SUM(profit)
	FROM breweries
	WHERE (brands = 'trophy' OR brands = 'eagle')
	AND years = 2019
	AND
	CASE
		WHEN months IN ('January', 'February', 'March') THEN 1
		WHEN months IN ('April', 'May', 'June') THEN 2
		WHEN months IN ('July', 'August', 'September') THEN 3
	ELSE 4
	END = 1
	GROUP BY sales_rep
	ORDER BY 2 ASC;

--Question 5: query that reduces the cost of the trophy brand by 2%--
UPDATE breweries
	SET costs = costs * 0.98
	WHERE brands = 'trophy';

--Question 6:sales rep made the highest profit in Ghana in the year 2017--
SELECT sales_rep, SUM(profit)
	FROM breweries
	WHERE countries = 'Ghana' AND years = 2017
	GROUP BY sales_rep
	ORDER BY SUM(profit) DESC
	LIMIT 1;

--Question 7:query to region recorded the lowest quantity of goods in the last quarter of every year--
WITH region_qty AS (
	SELECT region, SUM(quantity) as total_quantity
	FROM breweries
	WHERE months >= 'October' AND months <= 'December'
	GROUP BY region
)
	SELECT region
	FROM region_qty
	ORDER BY total_quantity
	LIMIT 1;
	
/* Question 8: the sales_rep who makes the highest profit in the year
Who deserves this promotion in 2019 */
SELECT sales_rep, SUM(profit) as total_profit
	FROM breweries
	WHERE years = 2019
	GROUP BY sales_rep
	ORDER BY total_profit DESC
	LIMIT 1;
	
/* Question 9: Regions with quantities of trophy which are less than 60000 
need to be restocked. What regions do we restock with the trophy brand */	
SELECT region
	FROM breweries
	WHERE brands = 'trophy' AND quantity < 60000 
	GROUP BY region;