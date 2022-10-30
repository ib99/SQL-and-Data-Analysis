/*How many patients had documented uncontrolled HTN at any time 2018-2019?*/
/*140/90 cut off*/

SELECT DISTINCT PATIENT FROM observations
WHERE (
        (DESCRIPTION = 'Diastolic Blood Pressure' AND VALUE > 90)
        OR (DESCRIPTION = 'Systolic Blood Pressure' AND VALUE > 140)
      )
        
    AND DATE >= '2018-01-01'
    and DATE <'2020-01-01'



/*Which providers tereated patients with uncontrolled HTN 2018-2019*/

SELECT DISTINCT BP.PATIENT
, PROV.name as 'Provider Name' 
, PROV.speciality
FROM observations BP
join encounters ENC ON BP.PATIENT=ENC.PATIENT
                        AND ENC.START >=BP.DATE
join providers PROV ON ENC.provider=PROV.id
WHERE (
        (BP.DESCRIPTION = 'Diastolic Blood Pressure' AND BP.VALUE > 90)
        OR (BP.DESCRIPTION = 'Systolic Blood Pressure' AND BP.VALUE > 140)
      )
        
    AND BP.DATE >= '2018-01-01'
    and BP.DATE <'2020-01-01'



/*What medications were given to patients with uncontorlled HTN?*/

SELECT DISTINCT BP.PATIENT , MED.DESCRIPTION as MEDICATION
FROM observations BP
join medications MED ON BP.PATIENT = MED.PATIENT
                            AND MED.START >= BP.DATE
WHERE (
        (BP.DESCRIPTION = 'Diastolic Blood Pressure' AND BP.VALUE > 90)
        OR (BP.DESCRIPTION = 'Systolic Blood Pressure' AND BP.VALUE > 140)
      )
        
    AND BP.DATE >= '2018-01-01'
    and BP.DATE <'2020-01-01'