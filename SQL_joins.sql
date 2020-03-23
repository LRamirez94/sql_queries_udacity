--SQL Joins

SELECT accounts.primary_poc, web_events.occured_at, web_events.channel, accounts.name
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
WHERE accounts.name = 'Walmart';

SELECT region.name, sales_reps.name,
	   accounts.name
FROM sales_reps
JOIN region
ON region.id = sales_reps.region_id
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
ORDER BY accounts.name;

SELECT region.name, accounts.name,
	   (orders.total_amt_usd/100) as unit_price
FROM region
JOIN sales_reps
ON region.id = sales_reps.region_id
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id;

Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT r.name RegionName, s.name SalesName, a.name AccountName
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest'
ORDER BY a.name;

Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT r.name RegionName, s.name SalesName, a.name AccountName
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name LIKE 'S%' AND r.name = 'Midwest'
ORDER BY a.name;

Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT r.name RegionName, s.name SalesName, a.name AccountName
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name LIKE '% K%' AND r.name = 'Midwest'
ORDER BY a.name;

Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).

SELECT r.name RegionName, a.name AccountName, o.total_amt_usd/(o.total+0.01) UnitPrice
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id;

Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).

SELECT r.name RegionName, a.name AccountName, o.total_amt_usd/(o.total+0.01) UnitPrice
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY UnitPrice;

What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.

SELECT DISTINCT a.id, w.channel
FROM web_events w
JOIN accounts a 
ON w.account_id = a.id
WHERE a.id = 1001;

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;