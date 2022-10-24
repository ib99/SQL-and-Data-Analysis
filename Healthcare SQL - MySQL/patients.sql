/***** Analyzing Patients in a Health System *****/

select GENDER , count(*)
from patients
group by GENDER;

select RACE , count(*)
from patients
group by RACE;

select ETHNICITY , count(*)
from patients
group by ETHNICITY;

select ETHNICITY, RACE , count(*)
from patients
group by ETHNICITY, RACE;

select ETHNICITY, RACE , GENDER, count(*)
from patients
group by ETHNICITY, RACE, GENDER;

select Id, BIRTHDATE, floor(datediff(curdate(), birthdate)/365.25) as 'AGE IN YEARS'
from patients;

select distinct STATE
from patients;

select distinct ZIP, count(*)
from patients
group by ZIP;

select distinct COUNTY, count(*)
from patients
group by COUNTY;

select distinct COUNTY, count(*)
from patients
group by COUNTY;

select GENDER, RACE, ETHNICITY , count(*) as Volumes
from encounters enc
join patients pat on enc.PATIENT = pat.Id
where START >= '2019-01-01'
and START < '2020-01-01'
and ENCOUNTERCLASS = 'inpatient'
group by GENDER, RACE, ETHNICITY;



