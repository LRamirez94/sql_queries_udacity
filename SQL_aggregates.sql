Use DISTINCT to test if there are any accounts associated with more than one region.

SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;
--OR
SELECT DISTINCT id, name
FROM accounts;

Have any sales reps worked on more than one account?

SELECT DISTINCT id, name
FROM sales_reps;