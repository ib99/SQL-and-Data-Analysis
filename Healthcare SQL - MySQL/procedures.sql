/*how many types of procedures performed in 2019?*/

SELECT * FROM
    (SELECT DESCRIPTION, count(*) AS Total_Procedures
    FROM procedures
    WHERE DATE >= '2019-01-01'
    and DATE < '2020-01-01'
    GROUP BY DESCRIPTION
    ) PROCS
    ORDER BY Total_Procedures DESC



/*How many procedures were performed across each care setting (inpatient/ambulatory)?*/

SELECT ENC.encounterclass, count(*) 'Total Procedures per Class'
FROM procedures PROCS
join encounters ENC on PROCS.encounter = ENC.id
WHERE DATE >= '2019-01-01'
and DATE < '2020-01-01'
GROUP BY enc.encounterclass


/*which organizations performed the most inpatient procedures in 2019?*/

SELECT ENC.organization, count(*) as 'Total Procedures'
FROM procedures PROCS
join encounters ENC on PROCS.encounter = ENC.id
join organizations ORG on ENC.organization = ORG.id
WHERE DATE >= '2019-01-01'
and DATE < '2020-01-01'
and encounterclass = 'inpatient'
group BY enc.organization