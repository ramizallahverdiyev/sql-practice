/*
1.Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.
For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
*/

SELECT
  COUNT(*) AS patients_in_group,
  FLOOR(weight / 10) * 10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;


/*
2.Show patient_id, weight, height, isObese from the patients table.
Display isObese as a boolean 0 or 1.
Obese is defined as weight(kg)/(height(m)2) >= 30.
weight is in units kg.
height is in units cm.
*/

SELECT
  patient_id,
  weight,
  height,
  (
    CASE
      WHEN weight / (POWER(height / 100.0, 2)) >= 30 THEN 1
      ELSE 0
    END
  ) AS isObese
FROM patients;


/*
3.Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
Check patients, admissions, and doctors tables for required information.
*/

select
  p.patient_id,
  p.first_name,
  p.last_name,
  d.specialty
from patients p
  join admissions a on p.patient_id = a.patient_id
  join doctors d on d.doctor_id = a.attending_doctor_id
where
(
    a.diagnosis = "Epilepsy"
    and d.first_name = "Lisa"
  );

/*
4.All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.
The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date
*/

select
  distinct p.patient_id,
  concat(
    p.patient_id,
    len(p.last_name),
    year(p.birth_date)
  )
from patients p
  join admissions a on p.patient_id = a.patient_id;


/*
5.Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.
Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group.
*/

SELECT
  CASE
    WHEN patient_id % 2 = 0 Then 'Yes'
    ELSE 'No'
  END as has_insurance,
  SUM(
    CASE
      WHEN patient_id % 2 = 0 Then 10
      ELSE 50
    END
  ) as cost_after_insurance
FROM admissions
GROUP BY has_insurance;


/*
6.
Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name
*/

SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  COUNT(
    CASE
      WHEN gender = 'M' THEN 1
    END
  ) > COUNT(
    CASE
      WHEN gender = 'F' THEN 1
    END
  );


/*
7.For each day display the total amount of admissions on that day. Display the amount changed from the previous date.
*/

SELECT
 admission_date,
 count(admission_date) as admission_day,
 count(admission_date) - LAG(count(admission_date)) OVER(ORDER BY admission_date) AS admission_count_change 
FROM admissions
GROUP BY admission_date;

/*
8.We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston'
*/


SELECT *
FROM patients
WHERE
  first_name LIKE '__r%'
  AND gender = 'F'
  AND MONTH(birth_date) IN (2, 5, 12)
  AND weight BETWEEN 60 AND 80
  AND patient_id % 2 = 1
  AND city = 'Kingston';


/*
9.Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.
*/

SELECT CONCAT(
    ROUND(
      (
        SELECT COUNT(*)
        FROM patients
        WHERE
          gender = 'M'
      ) / CAST(COUNT(*) as float),
      4
    ) * 100,
    '%'
  ) as percent_of_male_patients
FROM patients;

/*
10.Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.
*/

select province_name
from province_names
order by
  province_name = 'Ontario' desc,
  province_name;

/*
11.We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.
*/

select
  d.doctor_id as doctor_id,
  CONCAT(d.first_name,' ', d.last_name) as doctor_name,
  d.specialty,
  YEAR(a.admission_date) as selected_year,
  COUNT(*) as total_admissions
FROM doctors as d
  LEFT JOIN admissions as a ON d.doctor_id = a.attending_doctor_id
GROUP BY
  doctor_name,
  selected_year
ORDER BY doctor_id, selected_year



