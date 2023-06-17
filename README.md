<!DOCTYPE html>
<html>
<head>
</head>
<body>

  <h1>Data Analysis using SQL - International Breweries Dataset</h1>
  
  <p>This repository contains SQL queries and analysis performed on the International Breweries dataset. The dataset consists of information related to sales, brands, regions and sales representatives.</p>
  
  <h2>Dataset Description</h2>
  
  <p>The International Breweries dataset includes the following columns:</p>
  
  <ul>
    <li>SALES_REP: The name of the sales representative</li>
    <li>BRANDS: The brand of the product</li>
    <li>QUANTITY: The quantity of products sold</li>
    <li>COSTS: The cost of the products</li>
    <li>REGION: The region where the sales occurred</li>
    <li>YEAR: The year of the sales</li>
  </ul>
  
  <h2>Analysis Questions</h2>
  
  <ol>
    <li>What are the total sales made by each sales representative?</li>
    <li>Which brand had the highest sales in each year?</li>
    <li>Which region recorded the highest quantity of goods in each quarter?</li>
    <li>What is the average cost of products sold in each year?</li>
  </ol>
  
  <h2>SQL Queries</h2>
  
  <p>Here are some example SQL queries used for data analysis:</p>
  
  <pre>
    <code>
SELECT SALES_REP, SUM(QUANTITY) AS TOTAL_SALES
FROM breweries
GROUP BY SALES_REP;

SELECT YEAR, BRANDS, MAX(QUANTITY) AS HIGHEST_SALES
FROM breweries
GROUP BY YEAR;

SELECT YEAR, QUARTER, REGION, MAX(QUANTITY) AS HIGHEST_QUANTITY
FROM breweries
GROUP BY YEAR, QUARTER;

SELECT YEAR, AVG(COSTS) AS AVERAGE_COST
FROM breweries
GROUP BY YEAR;
    </code>
  </pre>
  
  <h2>Conclusion</h2>
  
  <p>Through SQL analysis on the International Breweries dataset, we can gain insights into sales performance, popular brands, regional trends, and cost analysis. These insights can help inform decision-making and drive business growth.</p>
  
</body>
</html>
