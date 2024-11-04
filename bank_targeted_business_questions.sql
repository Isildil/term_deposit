SELECT *
FROM term_deposit.bank_full
LIMIT 3;

#looking for duplicates
SELECT duration, age, balance, COUNT(*)
FROM term_deposit.bank_full
GROUP BY duration, age, balance
HAVING COUNT(*) >1
;
-- number of clients that participated
SELECT COUNT(*) as total_clients
FROM term_deposit.bank_full
;

-- number of subscriptions
SELECT y, COUNT(y) as subscriptions
FROM term_deposit.bank_full
GROUP BY y
	
;
-- percentage of non subscribers and subscribers
SELECT Y, COUNT(*)*100/(SELECT COUNT(*) FROM term_deposit.bank_full) AS 'percentage of subscriptions'
FROM term_deposit.bank_full
GROUP BY y
;

-- Conversion rate
SELECT *
FROM (
	SELECT Y, COUNT(y)*100/SUM(campaign) AS 'conversion rate'
	FROM term_deposit.bank_full
	GROUP BY y) as t
WHERE y='yes'
;

-- number of calls
SELECT SUM(campaign)
FROM term_deposit.bank_full
;

-- average duration
SELECT AVG(duration)/60 AS 'average duration'
FROM term_deposit.bank_full
;


-- average handle time
SELECT (SUM(duration)/ (SELECT COUNT(*) FROM term_deposit.bank_full WHERE y='yes'))/60 AS 'average handle time'
FROM term_deposit.bank_full

;

-- number and percentage of clients by housing loan
SELECT housing, COUNT(housing) AS total, 
COUNT(housing)*100/(SELECT COUNT(*) FROM term_deposit.bank_full) AS percentage
FROM term_deposit.bank_full
GROUP BY housing
;

-- number and percentage of clients by job
SELECT job, COUNT(housing) AS total, 
COUNT(job)*100/(SELECT COUNT(*) FROM term_deposit.bank_full) AS percentage
FROM term_deposit.bank_full
GROUP BY job
ORDER BY job
;

-- Conversion rate by job
SELECT *
FROM (
	SELECT job,y, COUNT(y)*100/SUM(campaign) AS 'conversion rate'
	FROM term_deposit.bank_full
	GROUP BY y, job
    ORDER BY job) as t
WHERE y='yes'
;

-- conversion rate by month
SELECT *
FROM (
	SELECT month,y, COUNT(y)*100/SUM(campaign) AS 'conversion rate'
	FROM term_deposit.bank_full
	GROUP BY y, month
    ORDER BY month) as t
WHERE y='yes'
;

-- conversion rate by housing loan
SELECT *
FROM (
	SELECT housing,y, COUNT(y)*100/SUM(campaign) AS 'conversion rate'
	FROM term_deposit.bank_full
	GROUP BY y, housing
    ORDER BY housing) as t
WHERE y='yes'
;
-- conversion rate by previous campaign success
SELECT *
FROM (
	SELECT poutcome, y, COUNT(y)*100/SUM(campaign) AS 'conversion rate'
	FROM term_deposit.bank_full
	GROUP BY y, poutcome) as t
WHERE y='yes'
;
