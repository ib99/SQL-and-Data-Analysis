/***Looking at Emergency Department data***/


/* How many ED encounters did we have in 2019? */

SELECT count(*) AS 'ER Volumes' FROM encounters
WHERE START >= '2019-01-01'
    AND START < '2020-01-01'
    AND ENCOUNTERCLASS = 'emergency';



/* What conditions were treated in the above encounters? note there will be missing data*/

SELECT CON.DESCRIPTION, count(*)
FROM encounters ENC
JOIN conditions CON ON ENC.Id=CON.encounter
WHERE ENC.START >= '2019-01-01'
    AND ENC.START < '2020-01-01'
    AND ENC.ENCOUNTERCLASS = 'emergency'
GROUP BY CON.DESCRIPTION;

/* add LEFT JOIN to pull all information from encounters column that meets the criteria identified in this WHERE query, if there's no match, stil return data (could be null data)*/

SELECT CON.DESCRIPTION, count(*)
FROM encounters ENC
LEFT JOIN conditions CON ON ENC.Id=CON.encounter
WHERE ENC.START >= '2019-01-01'
    AND ENC.START < '2020-01-01'
    AND ENC.ENCOUNTERCLASS = 'emergency'
GROUP BY CON.DESCRIPTION;

SELECT *
FROM encounters ENC
LEFT JOIN conditions CON ON ENC.Id=CON.encounter
WHERE ENC.START >= '2019-01-01'
    AND ENC.START < '2020-01-01'
    AND ENC.ENCOUNTERCLASS = 'emergency';




/*What was ED LOS and how did that vary by condition trreated*/

SELECT * ,TIMESTAMPDIFF(MINUTE,START,STOP) 'LOS in Minutes'
FROM encounters
WHERE START >= '2019-01-01'
    AND START < '2020-01-01'
    AND ENCOUNTERCLASS = 'emergency';

/*what about average LOS?*/

SELECT LOS.DESCRIPTION, avg(LOS_Minutes) AS 'Average LOS' FROM (
        SELECT ENC.id, CON.DESCRIPTION ,TIMESTAMPDIFF(MINUTE,ENC.START,ENC.STOP) LOS_Minutes
        FROM encounters ENC
        LEFT JOIN conditions CON ON ENC.Id=CON.encounter
        WHERE ENC.START >= '2019-01-01'
        AND ENC.START < '2020-01-01'
        AND ENC.ENCOUNTERCLASS = 'emergency'
) LOS /*naming the table*/
GROUP BY LOS.DESCRIPTION

