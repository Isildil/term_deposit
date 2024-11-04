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
SELECT y, AVG(duration)/60 AS 'average handle time'
FROM term_deposit.bank_full
GROUP BY y
;





