/*Cost of care*/


/*how much was the total claim cost for each encounter?*/

SELECT sum(TOTAL_CLAIM_COST) AS 'Total 2019'
,AVG(TOTAL_CLAIM_COST) AS 'Average 2019'
 FROM encounters
WHERE START >= '2019-01-01'
and START < '2020-01-01'


/*what is the total payer coverage for each encounter in 2019?*/

SELECT sum(TOTAL_CLAIM_COST) AS 'Total Claims 2019'
,AVG(TOTAL_CLAIM_COST) AS 'Average Claims 2019'
,sum(PAYER_COVERAGE) AS 'Total Payer Coverage 2019'
,AVG(PAYER_COVERAGE) AS  'Average Payer Coverage 2019'
FROM encounters
WHERE START >= '2019-01-01'
and START < '2020-01-01'


/*Which encounter types had the highest cost covered by payers?*/

SELECT payer, name, ENCOUNTERCLASS
--- ,sum(TOTAL_CLAIM_COST) AS 'Total Claims 2019'
--- ,AVG(TOTAL_CLAIM_COST) AS 'Average Claims 2019'
--- ,sum(PAYER_COVERAGE) AS 'Total Payer Coverage 2019'
--- ,AVG(PAYER_COVERAGE) AS  'Average Payer Coverage 2019'
, sum(TOTAL_CLAIM_COST) - sum(PAYER_COVERAGE) AS 'Diff. in Claim to Payer Coverage - TOTAL'
, AVG(TOTAL_CLAIM_COST) - AVG(PAYER_COVERAGE) AS 'Diff. in Claim to Payer Coverage - AVERAGE'
FROM encounters ENC
join payers PAY on enc.payer = PAY.id
WHERE START >= '2019-01-01'
and START < '2020-01-01'
GROUP BY PAYER, name, ENCOUNTERCLASS
order BY ENCOUNTERCLASS


/*which encounter types had the highest cost?*/

SELECT ENCOUNTERCLASS
--- ,sum(TOTAL_CLAIM_COST) AS 'Total Claims 2019'
--- ,AVG(TOTAL_CLAIM_COST) AS 'Average Claims 2019'
--- ,sum(PAYER_COVERAGE) AS 'Total Payer Coverage 2019'
--- ,AVG(PAYER_COVERAGE) AS  'Average Payer Coverage 2019'
, sum(TOTAL_CLAIM_COST) - sum(PAYER_COVERAGE) AS 'Diff. in Claim to Payer Coverage - TOTAL'
, AVG(TOTAL_CLAIM_COST) - AVG(PAYER_COVERAGE) AS 'Diff. in Claim to Payer Coverage - AVERAGE'
FROM encounters ENC
WHERE START >= '2019-01-01'
and START < '2020-01-01'
GROUP BY ENCOUNTERCLASS
order BY ENCOUNTERCLASS


