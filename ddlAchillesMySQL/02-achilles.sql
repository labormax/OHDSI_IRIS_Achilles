-- CREATE PROCEDURE results.achilles_go()
-- BEGIN
-- START TRANSACTION;
TRUNCATE TABLE results.achilles_results;
TRUNCATE TABLE results.achilles_results_dist;

-- 0	cdm name, version of Achilles and date when pre-computations were executed
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_0(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_0(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    0 as analysis_id,  CAST('' AS VARCHAR(255)) as stratum_1, CAST('1.7' AS VARCHAR(255)) as stratum_2,
    CAST(CURRENT_DATE AS VARCHAR(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_0(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_0(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    0 as analysis_id, CAST('' AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value,
    cast(null as NUMERIC) as min_value,
    cast(null as NUMERIC) as max_value,
    cast(null as NUMERIC) as avg_value,
    cast(null as NUMERIC) as stdev_value,
    cast(null as NUMERIC) as median_value,
    cast(null as NUMERIC) as p10_value,
    cast(null as NUMERIC) as p25_value,
    cast(null as NUMERIC) as p75_value,
    cast(null as NUMERIC) as p90_value
FROM
    SQLUser.person;

-- 1	Number of persons
CREATE TABLE temp.s_tmpach_1(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person;



-- 2	Number of persons by gender
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2 as analysis_id,
    CAST(gender_concept_id AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by GENDER_CONCEPT_ID;



-- 3	Number of persons by year of birth
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_3(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_3(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    3 as analysis_id,  CAST(year_of_birth AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by YEAR_OF_BIRTH;



-- 4	Number of persons by race
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_4(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_4(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    4 as analysis_id,  CAST(RACE_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by RACE_CONCEPT_ID;



-- 5	Number of persons by ethnicity
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_5(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_5(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    5 as analysis_id,  CAST(ETHNICITY_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by ETHNICITY_CONCEPT_ID;



-- 7	Number of persons with invalid provider_id
CREATE TABLE temp.s_tmpach_7(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_7(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    7 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(p1.person_id) as count_value
FROM
    SQLUser.person p1
        left join SQLUser.provider pr1
                  on p1.provider_id = pr1.provider_id
where p1.provider_id is not null
  and pr1.provider_id is null
;



-- 8	Number of persons with invalid location_id
CREATE TABLE temp.s_tmpach_8(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_8(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    8 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(p1.person_id) as count_value
FROM
    SQLUser.person p1
        left join SQLUser.location l1
                  on p1.location_id = l1.location_id
where p1.location_id is not null
  and l1.location_id is null
;



-- 9	Number of persons with invalid care_site_id
CREATE TABLE temp.s_tmpach_9(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_9(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    9 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(p1.person_id) as count_value
FROM
    SQLUser.person p1
        left join SQLUser.care_site cs1
                  on p1.care_site_id = cs1.care_site_id
where p1.care_site_id is not null
  and cs1.care_site_id is null
;



-- 10	Number of all persons by year of birth and by gender
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_10(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_10(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    10 as analysis_id,  CAST(year_of_birth AS VARCHAR(255)) as stratum_1,
    CAST(gender_concept_id AS VARCHAR(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by YEAR_OF_BIRTH, gender_concept_id;



-- 11	Number of non-deceased persons by year of birth and by gender
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_11(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_11(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    11 as analysis_id,  CAST(P.year_of_birth AS VARCHAR(255)) as stratum_1,
    CAST(P.gender_concept_id AS VARCHAR(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct P.person_id) as count_value
FROM
    SQLUser.person P
where not exists
    (
select
1
from SQLUser.death D
        where P.person_id = D.person_id
    )
group by P.YEAR_OF_BIRTH, P.gender_concept_id;


-- 12	Number of persons by race and ethnicity
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_12(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_12(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    12 as analysis_id, CAST(RACE_CONCEPT_ID AS VARCHAR(255)) as stratum_1, CAST(ETHNICITY_CONCEPT_ID AS VARCHAR(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person
group by RACE_CONCEPT_ID,ETHNICITY_CONCEPT_ID;


-- 101	Number of persons by age, with age at first observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_101(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_101(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
select
    101 as analysis_id,
    CAST(YEAR(op1.index_date) - p1.YEAR_OF_BIRTH AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(p1.person_id) as count_value
from SQLUser.person p1
         inner join (select person_id, MIN(observation_period_start_date) as index_date from SQLUser.observation_period group by PERSON_ID) op1
                    on p1.PERSON_ID = op1.PERSON_ID
group by YEAR(op1.index_date) - p1.YEAR_OF_BIRTH;

-- 102	Number of persons by gender by age, with age at first observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_102(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_102(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
select
    102 as analysis_id,
    CAST(p1.gender_concept_id AS VARCHAR(255)) as stratum_1,
    CAST(YEAR(op1.index_date) - p1.YEAR_OF_BIRTH AS VARCHAR(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(p1.person_id) as count_value
from SQLUser.person p1
         inner join (select person_id, MIN(observation_period_start_date) as index_date from SQLUser.observation_period group by PERSON_ID) op1
                    on p1.PERSON_ID = op1.PERSON_ID
group by p1.gender_concept_id, YEAR(op1.index_date) - p1.YEAR_OF_BIRTH;

-- 103	Distribution of age at first observation period
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData(person_id INT,age_value NUMERIC);
INSERT INTO temp.rawData(person_id,age_value)
select
p.person_id,
       MIN(YEAR(observation_period_start_date)) - P.YEAR_OF_BIRTH as age_value
from SQLUser.person p
         JOIN SQLUser.observation_period op on p.person_id = op.person_id
group by p.person_id, p.year_of_birth;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * age_value) AS NUMERIC) as avg_value,
          CAST(STDDEV(age_value) AS NUMERIC) as stdev_value,
          min(age_value) as min_value,
          max(age_value) as max_value,
          COUNT(*) as total
FROM temp.rawData;

CREATE TABLE temp.ageStats(age_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.ageStats(age_value,total,rn)
select
age_value, COUNT(*) as total, row_number() over (order by age_value) as rn
from temp.rawData
   group by age_value;

CREATE TABLE temp.ageStatsPrior(age_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.ageStatsPrior(age_value,total,accumulated)
select
s.age_value, s.total, sum(p.total) as accumulated
from temp.ageStats s
            join temp.ageStats p on p.rn <= s.rn
   group by s.age_value, s.total, s.rn;


CREATE TABLE temp.tempResults(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC,tempResults NUMERIC);
INSERT INTO temp.tempResults(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value,tempResults)
select
103 as analysis_id,
          o.total as count_value,
          o.min_value,
          o.max_value,
          o.avg_value,
          o.stdev_value,
          MIN(case when p.accumulated >= .50 * o.total then age_value end) as median_value,
          MIN(case when p.accumulated >= .10 * o.total then age_value end) as p10_value,
          MIN(case when p.accumulated >= .25 * o.total then age_value end) as p25_value,
          MIN(case when p.accumulated >= .75 * o.total then age_value end) as p75_value,
          MIN(case when p.accumulated >= .90 * o.total then age_value end) as p90_value
          --INTO #tempResults
from temp.ageStatsPrior p
            CROSS JOIN temp.overallStats o
   GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value;

CREATE TABLE temp.s_tmpach_dist_103(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_103(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
       analysis_id,
       cast(null as varchar(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2,
       cast(null as varchar(255)) as stratum_3,
       cast(null as varchar(255)) as stratum_4,
       cast(null as varchar(255)) as stratum_5,
       count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
       temp.tempResults;

-- TRUNCATE TABLE tempData_103;
-- TRUNCATE TABLE temp.tempResults_103;
-- TRUNCATE TABLE temp.overallStats_103;
-- TRUNCATE TABLE temp.ageStats_103;
-- TRUNCATE TABLE temp.ageStatsPrior_103;

DROP TABLE temp.rawData;
DROP TABLE temp.tempResults;
DROP TABLE temp.overallStats;
DROP TABLE temp.ageStats;
DROP TABLE temp.ageStatsPrior;

-- 104	Distribution of age at first observation period by gender
--HINT DISTRIBUTE_ON_KEY(stratum_1)

CREATE TABLE temp.rawData(gender_concept_id INT,age_value NUMERIC);
INSERT INTO temp.rawData(gender_concept_id,age_value)
select
p.gender_concept_id, MIN(YEAR(observation_period_start_date)) - P.YEAR_OF_BIRTH as age_value
from SQLUser.person p
         JOIN SQLUser.observation_period op on p.person_id = op.person_id
group by p.person_id,p.gender_concept_id, p.year_of_birth;


CREATE TABLE temp.overallStats(gender_concept_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(gender_concept_id,avg_value,stdev_value,min_value,max_value,total)
select
gender_concept_id,
       CAST(avg(1.0 * age_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(age_value) AS NUMERIC) as stdev_value,
       min(age_value) as min_value,
       max(age_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by gender_concept_id;


CREATE TABLE temp.ageStats(gender_concept_id INT,age_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.ageStats(gender_concept_id,age_value,total,rn)
select
gender_concept_id, age_value, COUNT(*) as total, row_number() over (order by age_value) as rn
FROM temp.rawData
group by gender_concept_id, age_value;

CREATE TABLE temp.ageStatsPrior(gender_concept_id INT,age_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.ageStatsPrior(gender_concept_id,age_value,total,accumulated)
select
s.gender_concept_id, s.age_value, s.total, sum(p.total) as accumulated
from temp.ageStats s
         join temp.ageStats p on s.gender_concept_id = p.gender_concept_id and p.rn <= s.rn
group by s.gender_concept_id, s.age_value, s.total, s.rn;

CREATE TABLE temp.tempResults_104(analysis_id INT,stratum_1 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_104(analysis_id,stratum_1,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
       104 as analysis_id,
       CAST(o.gender_concept_id AS VARCHAR(255)) as stratum_1,
       o.total as count_value,
       o.min_value,
       o.max_value,
       o.avg_value,
       o.stdev_value,
       MIN(case when p.accumulated >= .50 * o.total then age_value end) as median_value,
       MIN(case when p.accumulated >= .10 * o.total then age_value end) as p10_value,
       MIN(case when p.accumulated >= .25 * o.total then age_value end) as p25_value,
       MIN(case when p.accumulated >= .75 * o.total then age_value end) as p75_value,
       MIN(case when p.accumulated >= .90 * o.total then age_value end) as p90_value
FROM
       temp.ageStatsPrior p
           join temp.overallStats o on p.gender_concept_id = o.gender_concept_id
   GROUP BY o.gender_concept_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_104(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_104(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_104
;

-- truncate table temp.tempResults_104;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.ageStats;
DROP TABLE temp.ageStatsPrior;

drop table temp.tempResults_104;


-- 105	Length of observation (days) of first observation period
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE tempObs_105(count_value NUMERIC,rn NUMERIC);
INSERT INTO tempObs_105(count_value,rn)
SELECT
count_value, rn
FROM
       (
select
(CAST(op.observation_period_end_date AS DATE) - CAST(op.observation_period_start_date AS DATE)) as count_value,
                  ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
from SQLUser.observation_period op
       ) A
   where rn = 1;

CREATE TABLE temp.statsView_105(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView_105(count_value,total,rn)
SELECT
    count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM
    tempObs_105
group by count_value;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from tempObs_105;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView_105 s
         join temp.statsView_105 p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_105(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_105(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    105 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_105(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_105(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5, count_value,
    min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_105
;

truncate table tempObs_105;
drop table tempObs_105;
truncate table temp.statsView_105;
drop table temp.statsView_105;
truncate table temp.tempResults_105;
drop table temp.tempResults_105;

DROP TABLE temp.priorStats;
DROP TABLE temp.overallStats;


-- 106	Length of observation (days) of first observation period by gender
--HINT DISTRIBUTE_ON_KEY(gender_concept_id)
CREATE TABLE temp.rawData_106(gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_106(gender_concept_id,count_value)
SELECT
       p.gender_concept_id, op.count_value
FROM
       (
select
person_id, (CAST(op.observation_period_end_date AS DATE) - CAST(op.observation_period_start_date AS DATE)) as count_value,
                  ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
from SQLUser.observation_period op
       ) op
           JOIN SQLUser.person p on op.person_id = p.person_id
   where op.rn = 1
;

--HINT DISTRIBUTE_ON_KEY(gender_concept_id)
CREATE TABLE temp.overallStats(gender_concept_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(gender_concept_id,avg_value,stdev_value,min_value,max_value,total)
select
gender_concept_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_106
group by gender_concept_id;

CREATE TABLE temp.statsView(gender_concept_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(gender_concept_id,count_value,total,rn)
select
gender_concept_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM temp.rawData_106
group by gender_concept_id, count_value;

CREATE TABLE temp.priorStats(gender_concept_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(gender_concept_id,count_value,total,accumulated)
select
s.gender_concept_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.gender_concept_id = p.gender_concept_id and p.rn <= s.rn
group by s.gender_concept_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_106(analysis_id INT,gender_concept_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_106(analysis_id,gender_concept_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
       106 as analysis_id,
       CAST(o.gender_concept_id AS VARCHAR(255)) as gender_concept_id,
       o.total as count_value,
       o.min_value,
       o.max_value,
       o.avg_value,
       o.stdev_value,
       MIN(case when p.accumulated >= .50 * o.total then count_value end) as median_value,
       MIN(case when p.accumulated >= .10 * o.total then count_value end) as p10_value,
       MIN(case when p.accumulated >= .25 * o.total then count_value end) as p25_value,
       MIN(case when p.accumulated >= .75 * o.total then count_value end) as p75_value,
       MIN(case when p.accumulated >= .90 * o.total then count_value end) as p90_value
FROM
       temp.priorStats p
           join temp.overallStats o on p.gender_concept_id = o.gender_concept_id
   GROUP BY o.gender_concept_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_106(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_106(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
       analysis_id, gender_concept_id as stratum_1,
       cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
       temp.tempResults_106
;

truncate table temp.rawData_106;
drop table temp.rawData_106;
truncate table temp.tempResults_106;
drop table temp.tempResults_106;

DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 107	Length of observation (days) of first observation period by age decile
--HINT DISTRIBUTE_ON_KEY(age_decile)
CREATE TABLE temp.rawData(age_decile NUMERIC,count_value NUMERIC);
INSERT INTO temp.rawData(age_decile,count_value)
select
floor((YEAR(op.OBSERVATION_PERIOD_START_DATE) - p.YEAR_OF_BIRTH)/10) as age_decile,
       (CAST(op.observation_period_end_date AS DATE) - CAST(op.observation_period_start_date AS DATE)) as count_value
FROM
    (
select
person_id,
               op.observation_period_start_date,
               op.observation_period_end_date,
               ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
from SQLUser.observation_period op
    ) op
        JOIN SQLUser.person p on op.person_id = p.person_id
where op.rn = 1;

CREATE TABLE temp.overallStats(age_decile NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(age_decile,avg_value,stdev_value,min_value,max_value,total)
select
age_decile,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData
group by age_decile;

CREATE TABLE temp.statsView(age_decile NUMERIC,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(age_decile,count_value,total,rn)
select
age_decile,
       count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by age_decile, count_value;

CREATE TABLE temp.priorStats(age_decile NUMERIC,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(age_decile,count_value,total,accumulated)
select
s.age_decile, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.age_decile = p.age_decile and p.rn <= s.rn
group by s.age_decile, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_107(analysis_id INT,age_decile NUMERIC,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_107(analysis_id,age_decile,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
       107 as analysis_id,
       CAST(o.age_decile AS VARCHAR(255)) as age_decile,
       o.total as count_value,
       o.min_value,
       o.max_value,
       o.avg_value,
       o.stdev_value,
       MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
       MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
       MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
       MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
       MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
       temp.priorStats p
           join temp.overallStats o on p.age_decile = o.age_decile
   GROUP BY o.age_decile, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_107(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_107(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, age_decile as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_107
;

truncate table temp.tempResults_107;
drop table temp.tempResults_107;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 108	Number of persons by length of observation period, in 30d increments
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData(stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData(stratum_1,count_value)
select
    floor((CAST(op1.observation_period_end_date AS DATE) - CAST(op1.observation_period_start_date AS DATE))/30) as stratum_1,
    COUNT(distinct p1.person_id) as count_value
from SQLUser.person p1
         inner join
     (select person_id,
             OBSERVATION_PERIOD_START_DATE,
             OBSERVATION_PERIOD_END_DATE,
             ROW_NUMBER() over (PARTITION by person_id order by observation_period_start_date asc) as rn1
from SQLUser.observation_period
     ) op1
     on p1.PERSON_ID = op1.PERSON_ID
where op1.rn1 = 1
group by floor((CAST(op1.observation_period_end_date AS DATE) - CAST(op1.observation_period_start_date AS DATE))/30);

CREATE TABLE temp.s_tmpach_108(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_108(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       108 as analysis_id,
       CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2,
       cast(null as varchar(255)) as stratum_3,
       cast(null as varchar(255)) as stratum_4,
       cast(null as varchar(255)) as stratum_5,
       count_value
FROM
       temp.rawData;

DROP TABLE temp.rawData;

-- 109	Number of persons with continuous observation in each year
--HINT DISTRIBUTE_ON_KEY(stratum_1)
-- generating date key sequences in a cross-dialect compatible fashion
CREATE TABLE temp.century (num VARCHAR(255));
INSERT INTO temp.century (num)
SELECT
 CAST('19' as VARCHAR(255)) num union select '20' num;

CREATE TABLE temp.tens (num VARCHAR(255));
INSERT INTO temp.tens (num)
select
'0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num;

CREATE TABLE temp.ones (num VARCHAR(255));
INSERT INTO temp.ones (num)
select
'0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num;

CREATE TABLE temp.months (num VARCHAR(255));
INSERT INTO temp.months (num)
select
'01' as num union select '02' num union select '03' num union select '04' num union select '05' num union select '06' num union select '07' num union select '08' num union select '09' num union select '10' num union select '11' num union select '12' num;

CREATE TABLE temp.date_keys (obs_month VARCHAR(255));
INSERT INTO temp.date_keys (obs_month)
select
STRING(temp.century.num, temp.tens.num, temp.ones.num,temp.months.num) obs_month from temp.century cross join temp.tens cross join temp.ones cross join temp.months;

-- From temp.date_keys, we just need each year and the first and last day of each year
CREATE TABLE temp.ymd(obs_year NUMERIC,month_start NUMERIC,day_start NUMERIC,month_end NUMERIC,day_end NUMERIC);
INSERT INTO temp.ymd(obs_year,month_start,day_start,month_end,day_end)
select
cast(left(obs_month,4) as integer) obs_year,
       min(cast(right(left(obs_month,6),2) as integer)) month_start,
       1 day_start,
       max(cast(right(left(obs_month,6),2) as integer)) month_end,
       31 day_end
from temp.date_keys
where right(left(obs_month,6),2) in ('01','12')
    group by left(obs_month,4);

-- This gives us each year and the first and last day of the year
CREATE TABLE temp.year_ranges(obs_year NUMERIC,obs_year_start DATE,obs_year_end DATE);
INSERT INTO temp.year_ranges(obs_year,obs_year_start,obs_year_end)
select
obs_year,
       TO_DATE(TO_CHAR(obs_year,'FM0000')||'-'||TO_CHAR(month_start,'FM00')||'-'||TO_CHAR(day_start,'FM00'), 'YYYY-MM-DD') obs_year_start,
       TO_DATE(TO_CHAR(obs_year,'FM0000')||'-'||TO_CHAR(month_end,'FM00')||'-'||TO_CHAR(day_end,'FM00'), 'YYYY-MM-DD') obs_year_end
from temp.ymd
where obs_year >= (select min(YEAR(observation_period_start_date)) from SQLUser.observation_period) and obs_year <= (select max(YEAR(observation_period_start_date)) from SQLUser.observation_period);

CREATE TABLE temp.s_tmpach_109(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_109(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       109                               AS analysis_id,
       CAST(yr.obs_year AS VARCHAR(255)) AS stratum_1,
       CAST(NULL AS VARCHAR(255))        AS stratum_2,
       CAST(NULL AS VARCHAR(255))        AS stratum_3,
       CAST(NULL AS VARCHAR(255))        AS stratum_4,
       CAST(NULL AS VARCHAR(255))        AS stratum_5,
       COUNT(DISTINCT op.person_id)  AS count_value
FROM
       SQLUser.observation_period op
           CROSS JOIN
       temp.year_ranges yr
   WHERE
           op.observation_period_start_date <= yr.obs_year_start
     AND
           op.observation_period_end_date   >= yr.obs_year_end
   GROUP BY
       yr.obs_year
;

-- DROP TABLE temp.century;
-- drop TABLE temp.tens;
-- DROp TABLE temp.ones;
-- DROP TABLE temp.months;
-- DROP TABLE temp.date_keys;
DROP TABLE temp.ymd;
DROP TABLE temp.year_ranges;

-- 110	Number of persons with continuous observation in each month
-- Note: using table instead of nested query because this gives vastly improved performance in Oracle
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_110(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_110(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       110 as analysis_id,
       CAST(t1.obs_month AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(distinct op1.PERSON_ID) as count_value
FROM
       SQLUser.observation_period op1
           join
       (
SELECT
DISTINCT YEAR(observation_period_start_date)*100 + MONTH(observation_period_start_date) AS obs_month,
               TO_DATE(TO_CHAR(YEAR(observation_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(observation_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD') AS obs_month_start,
               LAST_DAY(observation_period_start_date) AS obs_month_end
FROM SQLUser.observation_period
       ) t1 on	op1.observation_period_start_date <= t1.obs_month_start
           and	op1.observation_period_end_date >= t1.obs_month_end
   group by t1.obs_month;


-- 111	Number of persons by observation period start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
select
    YEAR(observation_period_start_date)*100 + MONTH(OBSERVATION_PERIOD_START_DATE) as stratum_1,
    COUNT(distinct op1.PERSON_ID) as count_value
from
    SQLUser.observation_period op1
    group by YEAR(observation_period_start_date)*100 + MONTH(OBSERVATION_PERIOD_START_DATE);

CREATE TABLE temp.s_tmpach_111(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_111(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       111 as analysis_id,
       CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2,
       cast(null as varchar(255)) as stratum_3,
       cast(null as varchar(255)) as stratum_4,
       cast(null as varchar(255)) as stratum_5,
       count_value
FROM
       temp.rawData;

DROP TABLE temp.rawData;

-- 112	Number of persons by observation period end month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
select
    YEAR(observation_period_end_date)*100 + MONTH(observation_period_end_date) as stratum_1,
    COUNT(distinct op1.PERSON_ID) as count_value
from
    SQLUser.observation_period op1
    group by YEAR(observation_period_end_date)*100 + MONTH(observation_period_end_date);

CREATE TABLE temp.s_tmpach_112(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_112(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       112 as analysis_id,
       CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2,
       cast(null as varchar(255)) as stratum_3,
       cast(null as varchar(255)) as stratum_4,
       cast(null as varchar(255)) as stratum_5,
       count_value
FROM
       temp.rawData;

DROP TABLE temp.rawData;

-- 113	Number of persons by number of observation periods
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_113(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_113(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       113 as analysis_id,
       CAST(op1.num_periods AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(distinct op1.PERSON_ID) as count_value
FROM
       (select person_id, COUNT(OBSERVATION_period_start_date) as num_periods from SQLUser.observation_period group by PERSON_ID) op1
   group by op1.num_periods
;



-- 114	Number of persons with observation period before year-of-birth
CREATE TABLE temp.s_tmpach_114(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_114(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       114 as analysis_id,
       cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(distinct p1.PERSON_ID) as count_value
FROM
       SQLUser.person p1
           inner join (select person_id, MIN(YEAR(OBSERVATION_period_start_date)) as first_obs_year from SQLUser.observation_period group by PERSON_ID) op1
                      on p1.person_id = op1.person_id
   where p1.year_of_birth > op1.first_obs_year
;



-- 115	Number of persons with observation period end < start
CREATE TABLE temp.s_tmpach_115(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_115(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       115 as analysis_id,
       cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(op1.PERSON_ID) as count_value
FROM
       SQLUser.observation_period op1
   where op1.observation_period_end_date < op1.observation_period_start_date
;



-- 116	Number of persons with at least one day of observation in each year by gender and age decile
-- Note: using table instead of nested query because this gives vastly improved performance in Oracle
CREATE TABLE temp_dates_116(obs_year NUMERIC);
INSERT INTO temp_dates_116(obs_year)
SELECT
distinct YEAR(observation_period_start_date) as obs_year
FROM
    SQLUser.observation_period
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,count_value)
select
    t1.obs_year as stratum_1,
    p1.gender_concept_id as stratum_2,
    floor((t1.obs_year - p1.year_of_birth)/10) as stratum_3,
    COUNT(distinct p1.PERSON_ID) as count_value
from
    SQLUser.person p1
        inner join
    SQLUser.observation_period op1
    on p1.person_id = op1.person_id
        ,
    temp_dates_116 t1
where YEAR(op1.OBSERVATION_PERIOD_START_DATE) <= t1.obs_year
    and YEAR(op1.OBSERVATION_PERIOD_END_DATE) >= t1.obs_year
    group by t1.obs_year,
    p1.gender_concept_id,
    floor((t1.obs_year - p1.year_of_birth)/10);

CREATE TABLE temp.s_tmpach_116(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_116(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    116 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
    cast(stratum_2 as varchar(255)) as stratum_2,
    cast(stratum_3 as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    count_value
FROM
    temp.rawData;

TRUNCATE TABLE temp_dates_116;
DROP TABLE temp_dates_116;
DROP TABLE temp.rawData;


-- 117	Number of persons with at least one day of observation in each month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
-- generating date key sequences in a cross-dialect compatible fashion
CREATE TABLE temp.s_tmpach_117(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_117(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       117 as analysis_id,
       CAST(t1.obs_month AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COALESCE(COUNT(distinct op1.PERSON_ID),0) as count_value
FROM
       temp.date_keys t1
           left join
       (select t2.obs_month, op2.*
from SQLUser.observation_period op2, temp.date_keys t2
        where YEAR(op2.observation_period_start_date)*100 + MONTH(op2.observation_period_start_date) <= t2.obs_month
          and YEAR(op2.observation_period_end_date)*100 + MONTH(op2.observation_period_end_date) >= t2.obs_month
       ) op1 on op1.obs_month = t1.obs_month
   group by t1.obs_month
   having COALESCE(COUNT(distinct op1.PERSON_ID),0) > 0;

DROP TABLE temp.century;
drop TABLE temp.tens;
DROp TABLE temp.ones;
DROP TABLE temp.months;
DROP TABLE temp.date_keys;

-- 118  Number of observation period records with invalid person_id
CREATE TABLE temp.s_tmpach_118(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_118(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       118 as analysis_id,
       cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(op1.PERSON_ID) as count_value
FROM
       SQLUser.observation_period op1
           left join SQLUser.person p1
                     on p1.person_id = op1.person_id
   where p1.person_id is null
;



-- 119  Number of observation period records by period_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_119(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_119(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
       119 as analysis_id,
       CAST(op1.period_type_concept_id AS VARCHAR(255)) as stratum_1,
       cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
       COUNT(*) as count_value
FROM
       SQLUser.observation_period op1
   group by op1.period_type_concept_id
;



-- 200	Number of persons with at least one visit occurrence, by visit_concept_id
-- restricted to visits overlapping with observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_200(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_200(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    200 AS analysis_id,
    CAST(vo.visit_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
GROUP BY
    vo.visit_concept_id;



-- 201	Number of visit occurrence records, by visit_concept_id
-- restricted to visits overlapping with observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_201(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_201(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    201 AS analysis_id,
    CAST(vo.visit_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
GROUP BY
    vo.visit_concept_id;



-- 202	Number of persons by visit occurrence start month, by visit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,count_value)
SELECT
    vo.visit_concept_id AS stratum_1,
    YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date) AS stratum_2,
    COUNT(DISTINCT vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
    JOIN
    SQLUser.observation_period op
    ON
    vo.person_id = op.person_id
    AND
    vo.visit_start_date >= op.observation_period_start_date
    AND
    vo.visit_start_date <= op.observation_period_end_date
    GROUP BY
    vo.visit_concept_id,
    YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date);

CREATE TABLE temp.s_tmpach_202(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_202(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    202 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;

DROP TABLE temp.rawData;

-- 203	Number of distinct visit occurrence concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData(person_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(person_id,count_value)
SELECT
    vo.person_id,
    COUNT(DISTINCT vo.visit_concept_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
GROUP BY
    vo.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_203(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_203(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    203 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_203(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_203(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_203
;

truncate table temp.tempResults_203;
drop table temp.tempResults_203;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 204	Number of persons with at least one visit occurrence, by visit_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,stratum_4,count_value)
SELECT
    vo.visit_concept_id AS stratum_1,
    YEAR(vo.visit_start_date) AS stratum_2,
    p.gender_concept_id AS stratum_3,
    FLOOR((YEAR(vo.visit_start_date) - p.year_of_birth) / 10) AS stratum_4,
    COUNT(DISTINCT p.person_id) AS count_value
FROM
    SQLUser.person p
    JOIN
    SQLUser.visit_occurrence vo
    ON
    p.person_id = vo.person_id
    JOIN
    SQLUser.observation_period op
    ON
    vo.person_id = op.person_id
    AND
    vo.visit_start_date >= op.observation_period_start_date
    AND
    vo.visit_start_date <= op.observation_period_end_date
    GROUP BY
    vo.visit_concept_id,
    YEAR(vo.visit_start_date),
    p.gender_concept_id,
    FLOOR((YEAR(vo.visit_start_date) - p.year_of_birth) / 10);

CREATE TABLE temp.s_tmpach_204(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_204(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    204 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 as varchar(255)) AS stratum_2,
    CAST(stratum_3 as varchar(255)) AS stratum_3,
    CAST(stratum_4 as varchar(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;

DROP TABLE temp.rawData;


-- 206	Distribution of age by visit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.rawData(stratum1_id INT,stratum2_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum1_id,stratum2_id,count_value)
SELECT
    v.visit_concept_id AS stratum1_id,
    p.gender_concept_id AS stratum2_id,
    v.visit_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            vo.person_id,
            vo.visit_concept_id,
            MIN(YEAR(vo.visit_start_date)) AS visit_start_year
FROM
            SQLUser.visit_occurrence vo
                JOIN
            SQLUser.observation_period op
            ON
                        vo.person_id = op.person_id
                    AND
                        vo.visit_start_date >= op.observation_period_start_date
                    AND
                        vo.visit_start_date <= op.observation_period_end_date
        GROUP BY
            vo.person_id,
            vo.visit_concept_id
    ) v
             ON
                     p.person_id = v.person_id;

CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum1_id,
       stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum1_id, stratum2_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
select
stratum1_id, stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by stratum1_id, stratum2_id order by count_value) as rn
FROM temp.rawData
group by stratum1_id, stratum2_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_206(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_206(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    206 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_206(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_206(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_206
;

truncate table temp.tempResults_206;
drop table temp.tempResults_206;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
Drop TABLE temp.statsView;
DROP TABLE temp.priorStats;

--207	Number of visit records with invalid person_id
CREATE TABLE temp.s_tmpach_207(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_207(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    207 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(vo1.PERSON_ID) as count_value
FROM
    SQLUser.visit_occurrence vo1
        left join SQLUser.person p1
                  on p1.person_id = vo1.person_id
where p1.person_id is null
;



-- 209	Number of visit records with invalid care_site_id
CREATE TABLE temp.s_tmpach_209(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_209(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    209 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(vo1.PERSON_ID) as count_value
FROM
    SQLUser.visit_occurrence vo1
        left join SQLUser.care_site cs1
                  on vo1.care_site_id = cs1.care_site_id
where vo1.care_site_id is not null
  and cs1.care_site_id is null
;



-- 210 Number of visit_occurrence records outside a valid observation period
CREATE TABLE temp.s_tmpach_210(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_210(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    210 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_occurrence vo
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL
;



-- 211	Number of visit records with end date < start date
CREATE TABLE temp.s_tmpach_211(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_211(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    211 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(vo1.PERSON_ID) as count_value
FROM
    SQLUser.visit_occurrence vo1
where visit_end_date < visit_start_date
;



-- 212	Number of persons with at least one visit occurrence by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,count_value)
select
    YEAR(visit_start_date) as stratum_1,
    p1.gender_concept_id as stratum_2,
    floor((YEAR(visit_start_date) - p1.year_of_birth)/10) as stratum_3,
    COUNT(distinct p1.PERSON_ID) as count_value
from SQLUser.person p1
    inner join
    SQLUser.visit_occurrence vo1
    on p1.person_id = vo1.person_id
    group by
    YEAR(visit_start_date),
    p1.gender_concept_id,
    floor((YEAR(visit_start_date) - p1.year_of_birth)/10);

CREATE TABLE temp.s_tmpach_212(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_212(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    212 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
    cast(stratum_2 as varchar(255)) as stratum_2,
    cast(stratum_3 as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 213	Distribution of length of stay by visit_concept_id
-- restrict to visits inside observation period
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData (stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
select
visit_concept_id AS stratum_id, (CAST(visit_end_date AS DATE) - CAST(visit_start_date AS DATE)) as count_value
from SQLUser.visit_occurrence vo inner join
     SQLUser.observation_period op on vo.person_id = op.person_id
     -- only include events that occur during observation period
where vo.visit_start_date >= op.observation_period_start_date and
        COALESCE(vo.visit_end_date,vo.visit_start_date) <= op.observation_period_end_date;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_213(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_213(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    213 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_213(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_213(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_213
;

truncate table temp.tempResults_213;
drop table temp.tempResults_213;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 220	Number of visit occurrence records by condition occurrence start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
SELECT
    YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date) AS stratum_1,
    COUNT(vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
    JOIN
    SQLUser.observation_period op
    ON
    vo.person_id = op.person_id
    AND
    vo.visit_start_date >= op.observation_period_start_date
    AND
    vo.visit_start_date <= op.observation_period_end_date
    GROUP BY
    YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date);

CREATE TABLE temp.s_tmpach_220(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_220(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    220 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 221	Number of persons by visit start year
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
SELECT
    YEAR(vo.visit_start_date) AS stratum_1,
    COUNT(DISTINCT vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
    JOIN
    SQLUser.observation_period op
    ON
    vo.person_id = op.person_id
    AND
    vo.visit_start_date >= op.observation_period_start_date
    AND
    vo.visit_start_date <= op.observation_period_end_date
    GROUP BY
    YEAR(vo.visit_start_date);

CREATE TABLE temp.s_tmpach_221(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_221(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    221 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 225	Number of visit_occurrence records, by visit_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_225(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_225(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    225 AS analysis_id,
    CAST(vo.visit_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
GROUP BY
    visit_source_concept_id;



-- 226	Number of records by domain by visit concept id
CREATE TABLE temp.s_tmpach_226(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_226(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    226 as analysis_id,
    CAST(v.visit_concept_id AS VARCHAR(255)) as stratum_1,
    v.cdm_table as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    v.record_count as count_value
FROM
    (
select
'drug_exposure' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.drug_exposure t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
        union
select
'condition_occurrence' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.condition_occurrence t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
        union
select
'device_exposure' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.device_exposure t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
        union
select
'procedure_occurrence' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.procedure_occurrence t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
        union
select
'measurement' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.measurement t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
        union
select
'observation' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
from SQLUser.observation t
                 left join SQLUser.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
        group by visit_concept_id
    ) v
;



-- 230 Number of visit_occurrence records inside a valid observation period
CREATE TABLE temp.s_tmpach_230(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_230(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    230 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_occurrence vo
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
;



-- 231	Proportion of people with at least one visit_occurrence record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in visit_occurrence (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside(person_count NUMERIC);
INSERT INTO temp.op_outside(person_count)
SELECT
    COUNT(DISTINCT vo.person_id) AS person_count
FROM
    SQLUser.visit_occurrence vo
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.vo_total(person_count NUMERIC);
INSERT INTO temp.vo_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.visit_occurrence;

CREATE TABLE temp.s_tmpach_231(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_231(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    231 AS analysis_id,
    CASE WHEN vo.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/vo.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(vo.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.vo_total vo
;

DROP TABLE temp.op_outside;
DROP TABLE temp.vo_total;

-- 232	Proportion of visit_occurrence records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of visit_occurrence records outside a valid observation period (numerator)
-- stratum_3:   Number of visit_occurrence records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.visit_occurrence vo
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.vo_total(record_count NUMERIC);
INSERT INTO temp.vo_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.visit_occurrence;

CREATE TABLE temp.s_tmpach_232(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_232(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    232 AS analysis_id,
    CASE WHEN vo.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/vo.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(vo.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.vo_total vo
;

DROP TABLE temp.op_outside;
DROP TABLE temp.vo_total;




-- 300	Number of providers
CREATE TABLE temp.s_tmpach_300(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_300(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    300 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct provider_id) as count_value
FROM
    SQLUser.provider;



-- 301	Number of providers by specialty concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_301(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_301(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    301 as analysis_id,
    CAST(specialty_concept_id AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct provider_id) as count_value
FROM
    SQLUser.provider
group by specialty_CONCEPT_ID;



-- 303	Number of provider records, by specialty_concept_id, visit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_303(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_303(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    303 as analysis_id,
    cast(p.specialty_concept_id AS varchar(255)) AS stratum_1,
    cast(vo.visit_concept_id    AS varchar(255)) AS stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.provider p
        join SQLUser.visit_occurrence vo
             on vo.provider_id = p.provider_id
group by p.specialty_concept_id, visit_concept_id;



-- 325	Number of provider records, by specialty_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_325(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_325(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    325 as analysis_id,
    cast(specialty_source_concept_id AS varchar(255)) AS stratum_1,
    cast(null AS varchar(255)) AS stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.provider
group by specialty_source_concept_id;



-- 400	Number of persons with at least one condition occurrence, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_400(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_400(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    400 AS analysis_id,
    CAST(co.condition_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT co.person_id) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_concept_id;



-- 401	Number of condition occurrence records, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_401(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_401(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    401 AS analysis_id,
    CAST(co.condition_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(co.person_id) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_concept_id;



-- 402	Number of persons by condition occurrence start month, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,count_value)
SELECT
    co.condition_concept_id AS stratum_1,
    YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date) AS stratum_2,
    COUNT(DISTINCT co.person_id) AS count_value
FROM
    SQLUser.condition_occurrence co
    JOIN
    SQLUser.observation_period op
    ON
    co.person_id = op.person_id
    AND
    co.condition_start_date >= op.observation_period_start_date
    AND
    co.condition_start_date <= op.observation_period_end_date
    GROUP BY
    co.condition_concept_id,
    YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date);

CREATE TABLE temp.s_tmpach_402(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_402(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    402 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 403	Number of distinct condition occurrence concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (person_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(person_id, count_value)
SELECT
    co.person_id,
    COUNT(DISTINCT co.condition_concept_id) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_403(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_403(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    403 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_403(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_403(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_403
;

truncate table temp.tempResults_403;
drop table temp.tempResults_403;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 404	Number of persons with at least one condition occurrence, by condition_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,stratum_4,count_value)
SELECT
    co.condition_concept_id AS stratum_1,
    YEAR(co.condition_start_date) AS stratum_2,
    p.gender_concept_id AS stratum_3,
    FLOOR((YEAR(co.condition_start_date) - p.year_of_birth) / 10) AS stratum_4,
    COUNT(DISTINCT p.person_id) AS count_value
FROM
    SQLUser.person p
    JOIN
    SQLUser.condition_occurrence co
    ON
    p.person_id = co.person_id
    JOIN
    SQLUser.observation_period op
    ON
    co.person_id = op.person_id
    AND
    co.condition_start_date >= op.observation_period_start_date
    AND
    co.condition_start_date <= op.observation_period_end_date
    GROUP BY
    co.condition_concept_id,
    YEAR(co.condition_start_date),
    p.gender_concept_id,
    FLOOR((YEAR(co.condition_start_date) - p.year_of_birth) / 10);

CREATE TABLE temp.s_tmpach_404(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_404(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    404 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;

DROP TABLE temp.rawData;

-- 405	Number of condition occurrence records, by condition_concept_id by condition_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_405(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_405(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    405 AS analysis_id,
    CAST(co.condition_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(co.condition_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(co.person_id) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_CONCEPT_ID,
    co.condition_type_concept_id;



-- 406	Distribution of age by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_406(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_406(subject_id,gender_concept_id,count_value)
SELECT
    c.condition_concept_id AS subject_id,
    p.gender_concept_id,
    (c.condition_start_year - p.year_of_birth) AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            co.person_id,
            co.condition_concept_id,
            MIN(YEAR(co.condition_start_date)) AS condition_start_year
FROM
            SQLUser.condition_occurrence co
                JOIN
            SQLUser.observation_period op
            ON
                        co.person_id = op.person_id
                    AND
                        co.condition_start_date >= op.observation_period_start_date
                    AND
                        co.condition_start_date <= op.observation_period_end_date
        GROUP BY
            co.person_id,
            co.condition_concept_id
    ) c
             ON
                     p.person_id = c.person_id;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_406
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_406
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_406(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_406(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    406 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_406(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_406(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_406
;

truncate table temp.tempResults_406;
drop table temp.tempResults_406;
truncate Table temp.rawData_406;
drop table temp.rawData_406;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;


-- 409	Number of condition occurrence records with invalid person_id
CREATE TABLE temp.s_tmpach_409(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_409(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    409 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(co1.PERSON_ID) as count_value
FROM
    SQLUser.condition_occurrence co1
        left join SQLUser.person p1
                  on p1.person_id = co1.person_id
where p1.person_id is null
;



-- 410	Number of condition occurrence records outside valid observation period
CREATE TABLE temp.s_tmpach_410(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_410(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    410 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(co1.PERSON_ID) as count_value
FROM
    SQLUser.condition_occurrence co1
        left join SQLUser.observation_period op1
                  on op1.person_id = co1.person_id
                      and co1.condition_start_date >= op1.observation_period_start_date
                      and co1.condition_start_date <= op1.observation_period_end_date
where op1.person_id is null
;



-- 411	Number of condition occurrence records with end date < start date
CREATE TABLE temp.s_tmpach_411(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_411(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    411 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(co1.PERSON_ID) as count_value
FROM
    SQLUser.condition_occurrence co1
where co1.condition_end_date < co1.condition_start_date
;



-- 412	Number of condition occurrence records with invalid provider_id
CREATE TABLE temp.s_tmpach_412(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_412(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    412 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(co1.PERSON_ID) as count_value
FROM
    SQLUser.condition_occurrence co1
        left join SQLUser.provider p1
                  on p1.provider_id = co1.provider_id
where co1.provider_id is not null
  and p1.provider_id is null
;



-- 413	Number of condition occurrence records with invalid visit_id
CREATE TABLE temp.s_tmpach_413(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_413(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    413 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(co1.PERSON_ID) as count_value
FROM
    SQLUser.condition_occurrence co1
        left join SQLUser.visit_occurrence vo1
                  on co1.visit_occurrence_id = vo1.visit_occurrence_id
where co1.visit_occurrence_id is not null
  and vo1.visit_occurrence_id is null
;



-- 414	Number of condition occurrence records, by condition_status_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_414(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_414(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    414 AS analysis_id,
    CAST(co.condition_status_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_status_concept_id;



-- 415	Number of condition occurrence records, by condition_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_415(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_415(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    415 AS analysis_id,
    CAST(co.condition_type_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_type_concept_id;



-- 416	Number of condition occurrence records, by condition_status_concept_id, condition_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_416(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_416(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    416 AS analysis_id,
    CAST(co.condition_status_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(co.condition_type_concept_id AS VARCHAR(255))   AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_status_concept_id, co.condition_type_concept_id;



-- 420	Number of condition occurrence records by condition occurrence start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
SELECT
    YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date) AS stratum_1,
    COUNT(co.person_id) AS count_value
FROM
    SQLUser.condition_occurrence co
    JOIN
    SQLUser.observation_period op
    ON
    co.person_id = op.person_id
    AND
    co.condition_start_date >= op.observation_period_start_date
    AND
    co.condition_start_date <= op.observation_period_end_date
    GROUP BY
    YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date);

CREATE TABLE temp.s_tmpach_420(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_420(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    420 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;

DROP TABLE temp.rawData;

-- 425	Number of condition_occurrence records, by condition_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_425(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_425(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    425 AS analysis_id,
    CAST(co.condition_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
GROUP BY
    co.condition_source_concept_id;



-- 430	Number of condition occurrence records inside a valid observation period
CREATE TABLE temp.s_tmpach_430(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_430(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    430 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_occurrence co
        JOIN
    SQLUser.observation_period op
    ON
                op.person_id = co.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
;



-- 431	Proportion of people with at least one condition_occurrence record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in condition_occurrence (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT co.person_id) AS person_count
FROM
    SQLUser.condition_occurrence co
        LEFT JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.co_total(person_count NUMERIC);
INSERT INTO temp.co_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.condition_occurrence;

CREATE TABLE temp.s_tmpach_431(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_431(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    431 AS analysis_id,
    CASE WHEN co.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/co.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(co.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.co_total co
;
DROP TABLE temp.op_outside;
DROP TABLE temp.co_total;


-- 432	Proportion of condition_occurrence records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of condition_occurrence records outside a valid observation period (numerator)
-- stratum_3:   Number of condition_occurrence records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.condition_occurrence co
        LEFT JOIN
    SQLUser.observation_period op
    ON
                co.person_id = op.person_id
            AND
                co.condition_start_date >= op.observation_period_start_date
            AND
                co.condition_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.co_total(record_count NUMERIC);
INSERT INTO temp.co_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.condition_occurrence;

CREATE TABLE temp.s_tmpach_432(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_432(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    432 AS analysis_id,
    CASE WHEN co.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/co.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(co.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.co_total co
;
DROP TABLE temp.op_outside;
DROP TABLE temp.co_total;


-- 500	Number of persons with death, by cause_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_500(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_500(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    500 AS analysis_id,
    CAST(d.cause_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT d.person_id) AS count_value
FROM
    SQLUser.death d
        JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
GROUP BY
    d.cause_concept_id;



-- 501	Number of records of death, by cause_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_501(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_501(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    501 AS analysis_id,
    CAST(d.cause_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(d.person_id) AS count_value
FROM
    SQLUser.death d
        JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
GROUP BY
    d.cause_concept_id;



-- 502	Number of persons by death month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,count_value)
SELECT
    YEAR(d.death_date) * 100 + MONTH(d.death_date) AS stratum_1,
    COUNT(DISTINCT d.person_id) AS count_value
FROM
    SQLUser.death d
    JOIN
    SQLUser.observation_period op
    ON
    d.person_id = op.person_id
    AND
    d.death_date >= op.observation_period_start_date
    AND
    d.death_date <= op.observation_period_end_date
    GROUP BY
    YEAR(d.death_date) * 100 + MONTH(d.death_date);

CREATE TABLE temp.s_tmpach_502(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_502(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    502 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;

DROP TABLE temp.rawData;

-- 504	Number of persons with a death, by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,count_value)
SELECT
    YEAR(d.death_date) AS stratum_1,
    p.gender_concept_id AS stratum_2,
    FLOOR((YEAR(d.death_date) - p.year_of_birth) / 10) AS stratum_3,
    COUNT(DISTINCT p.person_id) AS count_value
FROM
    SQLUser.person p
    JOIN
    SQLUser.death d
    ON
    p.person_id = d.person_id
    JOIN
    SQLUser.observation_period op
    ON
    d.person_id = op.person_id
    AND
    d.death_date >= op.observation_period_start_date
    AND
    d.death_date <= op.observation_period_end_date
    GROUP BY
    YEAR(d.death_date),
    p.gender_concept_id,
    FLOOR((YEAR(d.death_date) - p.year_of_birth) / 10);

CREATE TABLE temp.s_tmpach_504(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_504(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    504 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 505	Number of death records, by death_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_505(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_505(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    505 AS analysis_id,
    CAST(d.death_type_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(d.person_id) AS count_value
FROM
    SQLUser.death d
        JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
GROUP BY
    d.death_type_concept_id;



-- 506	Distribution of age at death by gender
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData (stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
SELECT
    p.gender_concept_id AS stratum_id,
    d.death_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            d.person_id,
            MIN(YEAR(d.death_date)) AS death_year
FROM
            SQLUser.death d
                JOIN
            SQLUser.observation_period op
            ON
                        d.person_id = op.person_id
                    AND
                        d.death_date >= op.observation_period_start_date
                    AND
                        d.death_date <= op.observation_period_end_date
        GROUP BY
            d.person_id
    ) d
             ON
                     p.person_id = d.person_id;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_506(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_506(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    506 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_506(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_506(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_506
;

truncate table temp.tempResults_506;
drop table temp.tempResults_506;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROp TABLE temp.priorStats;

-- 509	Number of death records with invalid person_id
CREATE TABLE temp.s_tmpach_509(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_509(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    509 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(d1.PERSON_ID) as count_value
FROM
    SQLUser.death d1
        left join SQLUser.person p1
                  on d1.person_id = p1.person_id
where p1.person_id is null
;



-- 510	Number of death records outside valid observation period
CREATE TABLE temp.s_tmpach_510(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_510(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    510 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(d1.PERSON_ID) as count_value
FROM
    SQLUser.death d1
        left join SQLUser.observation_period op1
                  on d1.person_id = op1.person_id
                      and d1.death_date >= op1.observation_period_start_date
                      and d1.death_date <= op1.observation_period_end_date
where op1.person_id is null
;



-- 511	Distribution of time from death to last condition
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_511(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_511(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    511 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(count_value) AS count_value,
    MIN(count_value) AS min_value,
    MAX(count_value) AS max_value,
    CAST(AVG(1.0 * count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) AS stdev_value,
    MAX(CASE WHEN p1 <= 0.50 THEN count_value ELSE - 9999 END) AS median_value,
    MAX(CASE WHEN p1 <= 0.10 THEN count_value ELSE - 9999 END) AS p10_value,
    MAX(CASE WHEN p1 <= 0.25 THEN count_value ELSE - 9999 END) AS p25_value,
    MAX(CASE WHEN p1 <= 0.75 THEN count_value ELSE - 9999 END) AS p75_value,
    MAX(CASE WHEN p1 <= 0.90 THEN count_value ELSE - 9999 END) AS p90_value
FROM
    (
SELECT
            (CAST(co.max_date AS DATE) - CAST(d.death_date AS DATE)) AS count_value,
            1.0 * (ROW_NUMBER() OVER (ORDER BY (CAST(co.max_date AS DATE) - CAST(d.death_date AS DATE)))) / (COUNT(*) OVER () + 1) AS p1
FROM
            SQLUser.death d
                JOIN (
SELECT
                    co.person_id,
                    MAX(co.condition_start_date) AS max_date
FROM
                    SQLUser.condition_occurrence co
                        JOIN
                    SQLUser.observation_period op
                    ON
                                co.person_id = op.person_id
                            AND
                                co.condition_start_date >= op.observation_period_start_date
                            AND
                                co.condition_start_date <= op.observation_period_end_date
                GROUP BY
                    co.person_id
            ) co
                     ON d.person_id = co.person_id
    ) t1;



-- 512	Distribution of time from death to last drug
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    (CAST(de.max_date AS DATE) - CAST(d.death_date AS DATE)) AS count_value
FROM
    SQLUser.death d
        JOIN (
SELECT
            de.person_id,
            MAX(de.drug_exposure_start_date) AS max_date
FROM
            SQLUser.drug_exposure de
                JOIN
            SQLUser.observation_period op
            ON
                        de.person_id = op.person_id
                    AND
                        de.drug_exposure_start_date >= op.observation_period_start_date
                    AND
                        de.drug_exposure_start_date <= op.observation_period_end_date
        GROUP BY
            de.person_id
    ) de
             ON
                     d.person_id = de.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_512(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_512(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    512 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_512(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_512(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_512
;

truncate table temp.tempResults_512;
drop table temp.tempResults_512;
DROp TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROp TABLE temp.priorStats;


-- 513	Distribution of time from death to last visit
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    (CAST(vo.max_date AS DATE) - CAST(d.death_date AS DATE)) AS count_value
FROM
    SQLUser.death d
        JOIN (
SELECT
            vo.person_id,
            MAX(vo.visit_start_date) AS max_date
FROM
            SQLUser.visit_occurrence vo
                JOIN
            SQLUser.observation_period op
            ON
                        vo.person_id = op.person_id
                    AND
                        vo.visit_start_date >= op.observation_period_start_date
                    AND
                        vo.visit_start_date <= op.observation_period_end_date
        GROUP BY
            vo.person_id
    ) vo
             ON
                     d.person_id = vo.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_513(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_513(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    513 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_513(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_513(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_513
;

truncate table temp.tempResults_513;
drop table temp.tempResults_513;
DROP TABLE temp.rawData;
DROP TABLE temp.statsView;
DROP TABLE temp.overallStats;
DROp TABLE temp.priorStats;

-- 514	Distribution of time from death to last procedure
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    (CAST(po.max_date AS DATE) - CAST(d.death_date AS DATE)) AS count_value
FROM
    SQLUser.death d
        JOIN (
SELECT
            po.person_id,
            MAX(po.procedure_date) AS max_date
FROM
            SQLUser.procedure_occurrence po
                JOIN
            SQLUser.observation_period op
            ON
                        po.person_id = op.person_id
                    AND
                        po.procedure_date >= op.observation_period_start_date
                    AND
                        po.procedure_date <= op.observation_period_end_date
        GROUP BY
            po.person_id
    ) po
             ON
                     d.person_id = po.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_514(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_514(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    514 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_514(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_514(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_514
;

truncate table temp.tempResults_514;
drop table temp.tempResults_514;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROp TABLE temp.priorStats;


-- 515	Distribution of time from death to last observation
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    (CAST(o.max_date AS DATE) - CAST(d.death_date AS DATE)) AS count_value
FROM
    SQLUser.death d
        JOIN (
SELECT
            o.person_id,
            MAX(o.observation_date) AS max_date
FROM
            SQLUser.observation o
                JOIN
            SQLUser.observation_period op
            ON
                        o.person_id = op.person_id
                    AND
                        o.observation_date >= op.observation_period_start_date
                    AND
                        o.observation_date <= op.observation_period_end_date
        GROUP BY
            o.person_id
    ) o
             ON
                     d.person_id = o.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_515(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_515(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    515 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_515(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_515(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_515
;

truncate table temp.tempResults_515;
drop table temp.tempResults_515;
DROP TABLE temp.rawData;
DROp TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;


-- 525	Number of death records, by cause_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_525(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_525(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    525 as analysis_id,
    cast(cause_source_concept_id AS varchar(255)) AS stratum_1,
    cast(null AS varchar(255)) AS stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.death
group by cause_source_concept_id;

-- 530	Number of death records inside a valid observation period
CREATE TABLE temp.s_tmpach_530(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_530(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    530 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.death d
        JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
;



-- 531	Proportion of people with at least one death record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in death (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT d.person_id) AS person_count
FROM
    SQLUser.death d
        LEFT JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.death_total(person_count NUMERIC);
INSERT INTO temp.death_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.death;

CREATE TABLE temp.s_tmpach_531(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_531(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    531 AS analysis_id,
    CASE WHEN dt.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/dt.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(dt.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.death_total dt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.death_total;


-- 532	Proportion of death records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of death records outside a valid observation period (numerator)
-- stratum_3:   Number of death records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such rceords exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.death d
        LEFT JOIN
    SQLUser.observation_period op
    ON
                d.person_id = op.person_id
            AND
                d.death_date >= op.observation_period_start_date
            AND
                d.death_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.death_total(record_count NUMERIC);
INSERT INTO temp.death_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.death;

CREATE TABLE temp.s_tmpach_532(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_532(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    532 AS analysis_id,
    CASE WHEN dt.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/dt.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(dt.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.death_total dt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.death_total;

-- 600	Number of persons with at least one procedure occurrence, by procedure_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_600(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_600(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    600 AS analysis_id,
    CAST(po.procedure_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT po.person_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
        JOIN
    SQLUser.observation_period op
    ON
                po.person_id = op.person_id
            AND
                po.procedure_date >= op.observation_period_start_date
            AND
                po.procedure_date <= op.observation_period_end_date
GROUP BY
    po.procedure_concept_id;



-- 601	Number of procedure occurrence records, by procedure_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_601(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_601(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    601 AS analysis_id,
    CAST(po.procedure_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(po.person_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
        JOIN
    SQLUser.observation_period op
    ON
                po.person_id = op.person_id
            AND
                po.procedure_date >= op.observation_period_start_date
            AND
                po.procedure_date <= op.observation_period_end_date
GROUP BY
    po.procedure_concept_id;



-- 602	Number of persons by procedure occurrence start month, by procedure_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,count_value)
SELECT
    po.procedure_concept_id AS stratum_1,
    YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date) AS stratum_2,
    COUNT(DISTINCT po.person_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.procedure_concept_id,
    YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date);

CREATE TABLE temp.s_tmpach_602(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_602(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    602 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS varchar(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
DROP TABLE temp.rawData;


-- 603	Number of distinct procedure occurrence concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData(count_value NUMERIC);
INSERT INTO temp.rawData (count_value)
SELECT
    COUNT(DISTINCT po.procedure_concept_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
    min(count_value) as min_value,
    max(count_value) as max_value,
    COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
    COUNT(*) as total,
    row_number() over (order by count_value) as rn
FROM temp.rawData
    group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
    join temp.statsView p on p.rn <= s.rn
    group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_603(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_603(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    603 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
    CROSS JOIN temp.overallStats o
    GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
        ;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_603(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_603(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_603
        ;

    truncate table temp.tempResults_603;
    drop table temp.tempResults_603;
    DROP TABLE temp.rawData;
    DROP TABLE temp.overallStats;
    DROP TABLE temp.statsView;
    DROP TABLE temp.priorStats;


-- 604	Number of persons with at least one procedure occurrence, by procedure_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.rawData (stratum_1,stratum_2,stratum_3,stratum_4,count_value)
SELECT
    po.procedure_concept_id AS stratum_1,
    YEAR(po.procedure_date) AS stratum_2,
    p.gender_concept_id AS stratum_3,
    FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10) AS stratum_4,
    COUNT(DISTINCT p.person_id) AS count_value
FROM
    SQLUser.person p
    JOIN
    SQLUser.procedure_occurrence po
    ON
    p.person_id = po.person_id
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.procedure_concept_id,
    YEAR(po.procedure_date),
    p.gender_concept_id,
    FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10);

CREATE TABLE temp.s_tmpach_604(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_604(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    604 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    temp.rawData;
    DROP TABLE temp.rawData;


-- 605	Number of procedure occurrence records, by procedure_concept_id by procedure_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_605(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_605(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    605 AS analysis_id,
    CAST(po.procedure_CONCEPT_ID AS VARCHAR(255)) AS stratum_1,
    CAST(po.procedure_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(po.person_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.procedure_CONCEPT_ID,
    po.procedure_type_concept_id;



-- 606	Distribution of age by procedure_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_606(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_606(subject_id,gender_concept_id,count_value)
SELECT
    po.procedure_concept_id AS subject_id,
    p.gender_concept_id,
    po.procedure_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
    JOIN (
SELECT
    po.person_id,
    po.procedure_concept_id,
    MIN(YEAR(po.procedure_date)) AS procedure_start_year
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.person_id,
    po.procedure_concept_id
    ) po
    ON
    p.person_id = po.person_id
        ;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
    gender_concept_id as stratum2_id,
    CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
    min(count_value) as min_value,
    max(count_value) as max_value,
    COUNT(*) as total
FROM temp.rawData_606
    group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_606
    group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
    join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
    group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_606(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_606(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    606 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
    join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
    GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
        ;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_606(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_606(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_606
        ;

    truncate table temp.tempResults_606;
    drop table temp.tempResults_606;
    truncate table temp.rawData_606;
    drop table temp.rawData_606;
    DROP TABLE temp.overallStats;
    DROP TABLE temp.statsView;
    DROp TABLE temp.priorStats;

-- 609	Number of procedure occurrence records with invalid person_id
CREATE TABLE temp.s_tmpach_609(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_609(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    609 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(po1.PERSON_ID) as count_value
FROM
    SQLUser.procedure_occurrence po1
    left join SQLUser.person p1
    on p1.person_id = po1.person_id
    where p1.person_id is null
        ;



-- 610	Number of procedure occurrence records outside valid observation period
CREATE TABLE temp.s_tmpach_610(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_610(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    610 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(po1.PERSON_ID) as count_value
FROM
    SQLUser.procedure_occurrence po1
    left join SQLUser.observation_period op1
    on op1.person_id = po1.person_id
    and po1.procedure_date >= op1.observation_period_start_date
    and po1.procedure_date <= op1.observation_period_end_date
    where op1.person_id is null
        ;



-- 612	Number of procedure occurrence records with invalid provider_id
CREATE TABLE temp.s_tmpach_612(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_612(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    612 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(po1.PERSON_ID) as count_value
FROM
    SQLUser.procedure_occurrence po1
    left join SQLUser.provider p1
    on p1.provider_id = po1.provider_id
    where po1.provider_id is not null
    and p1.provider_id is null
        ;



-- 613	Number of procedure occurrence records with invalid visit_id
CREATE TABLE temp.s_tmpach_613(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_613(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    613 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(po1.PERSON_ID) as count_value
FROM
    SQLUser.procedure_occurrence po1
    left join SQLUser.visit_occurrence vo1
    on po1.visit_occurrence_id = vo1.visit_occurrence_id
    where po1.visit_occurrence_id is not null
    and vo1.visit_occurrence_id is null
        ;



-- 620	Number of procedure occurrence records by condition occurrence start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_620(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_620(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    620 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
    (
SELECT
    YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date) AS stratum_1,
    COUNT(po.person_id) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    YEAR(po.procedure_date)*100 + MONTH(po.procedure_date)
    )
        ;



-- 625	Number of procedure_occurrence records, by procedure_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_625(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_625(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    625 AS analysis_id,
    CAST(po.procedure_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.procedure_source_concept_id;



-- 630	Number of procedure_occurrence records inside a valid observation period
CREATE TABLE temp.s_tmpach_630(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_630(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    630 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
        ;



-- 631	Proportion of people with at least one procedure_occurrence record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in procedure_occurrence (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT po.person_id) AS person_count
FROM
    SQLUser.procedure_occurrence po
    LEFT JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    WHERE
    op.person_id IS NULL;

CREATE TABLE temp.po_total(person_count NUMERIC);
INSERT INTO temp.po_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.procedure_occurrence;

CREATE TABLE temp.s_tmpach_631(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_631(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    631 AS analysis_id,
    CASE WHEN po.person_count != 0 THEN
    CAST(CAST(1.0*op.person_count/po.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
    ELSE
    CAST(NULL AS VARCHAR(255))
    END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(po.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
    CROSS JOIN
    temp.po_total po
        ;
    DROP TABLE temp.op_outside;
    DROP TABLE temp.po_total;


-- 632	Proportion of procedure_occurrence records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of procedure_occurrence records outside a valid observation period (numerator)
-- stratum_3:   Number of procedure_occurrence records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.procedure_occurrence po
    LEFT JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    WHERE
    op.person_id IS NULL;

CREATE TABLE temp.po_total(record_count NUMERIC);
INSERT INTO temp.po_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.procedure_occurrence;

CREATE TABLE temp.s_tmpach_632(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_632(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    632 AS analysis_id,
    CASE WHEN po.record_count != 0 THEN
    CAST(CAST(1.0*op.record_count/po.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
    ELSE
    CAST(NULL AS VARCHAR(255))
    END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(po.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
    CROSS JOIN
    temp.po_total po
        ;
    DROP TABLE temp.op_outside;
    DROP TABLE temp.po_total;


-- 691	Number of persons that have at least x procedures
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_691(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_691(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    691 AS analysis_id,
    CAST(po.procedure_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(po.prc_cnt AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SUM(COUNT(po.person_id)) OVER (PARTITION BY po.procedure_concept_id ORDER BY po.prc_cnt DESC) AS count_value
FROM
    (
SELECT
    po.procedure_concept_id,
    COUNT(po.procedure_occurrence_id) AS prc_cnt,
    po.person_id
FROM
    SQLUser.procedure_occurrence po
    JOIN
    SQLUser.observation_period op
    ON
    po.person_id = op.person_id
    AND
    po.procedure_date >= op.observation_period_start_date
    AND
    po.procedure_date <= op.observation_period_end_date
    GROUP BY
    po.person_id,
    po.procedure_concept_id
    ) po
    GROUP BY
    po.procedure_concept_id,
    po.prc_cnt;



-- 700	Number of persons with at least one drug occurrence, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_700(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_700(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    700 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT de.person_id) AS count_value
FROM
    SQLUser.drug_exposure de
    JOIN
    SQLUser.observation_period op
    ON
    de.person_id = op.person_id
    AND
    de.drug_exposure_start_date >= op.observation_period_start_date
    AND
    de.drug_exposure_start_date <= op.observation_period_end_date
    GROUP BY
    de.drug_concept_id;



-- 701	Number of drug occurrence records, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_701(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_701(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    701 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(de.person_id) AS count_value
FROM
    SQLUser.drug_exposure de
    JOIN
    SQLUser.observation_period op
    ON
    de.person_id = op.person_id
    AND
    de.drug_exposure_start_date >= op.observation_period_start_date
    AND
    de.drug_exposure_start_date <= op.observation_period_end_date
    GROUP BY
    de.drug_concept_id;



-- 702	Number of persons by drug occurrence start month, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_702(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_702(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    702 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
(SELECT
    de.drug_concept_id AS stratum_1,
    YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date) AS stratum_2,
    COUNT(DISTINCT de.person_id) AS count_value
FROM
    SQLUser.drug_exposure de
    JOIN
    SQLUser.observation_period op
    ON
    de.person_id = op.person_id
    AND
    de.drug_exposure_start_date >= op.observation_period_start_date
    AND
    de.drug_exposure_start_date <= op.observation_period_end_date
    GROUP BY
    de.drug_concept_id,
    YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date)
    );



-- 703	Number of distinct drug exposure concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    COUNT(DISTINCT de.drug_concept_id) AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_703(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_703(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    703 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_703(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_703(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_703
;

truncate table temp.tempResults_703;
drop table temp.tempResults_703;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 704	Number of persons with at least one drug occurrence, by drug_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_704(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_704(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    704 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
(SELECT
    de.drug_concept_id AS stratum_1,
	YEAR(de.drug_exposure_start_date) AS stratum_2,
	p.gender_concept_id AS stratum_3,
	FLOOR((YEAR(de.drug_exposure_start_date) - p.year_of_birth) / 10) AS stratum_4,
	COUNT(DISTINCT p.person_id) AS count_value
FROM
	SQLUser.person p
JOIN
	SQLUser.drug_exposure de
ON
	p.person_id = de.person_id
JOIN
	SQLUser.observation_period op
ON
	de.person_id = op.person_id
AND
	de.drug_exposure_start_date >= op.observation_period_start_date
AND
	de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY
	de.drug_concept_id,
	YEAR(de.drug_exposure_start_date),
	p.gender_concept_id,
	FLOOR((YEAR(de.drug_exposure_start_date) - p.year_of_birth) / 10)
);



-- 705	Number of drug occurrence records, by drug_concept_id by drug_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_705(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_705(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    705 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(de.drug_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(de.person_id) AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.drug_CONCEPT_ID,
    de.drug_type_concept_id;



-- 706	Distribution of age by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_706(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_706(subject_id,gender_concept_id,count_value)
SELECT
    de.drug_concept_id AS subject_id,
    p.gender_concept_id,
    de.drug_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            de.person_id,
            de.drug_concept_id,
            MIN(YEAR(de.drug_exposure_start_date)) AS drug_start_year
FROM
            SQLUser.drug_exposure de
                JOIN
            SQLUser.observation_period op
            ON
                        de.person_id = op.person_id
                    AND
                        de.drug_exposure_start_date >= op.observation_period_start_date
                    AND
                        de.drug_exposure_start_date <= op.observation_period_end_date
        GROUP BY
            de.person_id,
            de.drug_concept_id
    ) de
             ON
                     p.person_id = de.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_706
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_706
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_706(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_706(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    706 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_706(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_706(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_706
;

truncate table temp.rawData_706;
drop table temp.rawData_706;
truncate table temp.tempResults_706;
drop table temp.tempResults_706;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 709	Number of drug exposure records with invalid person_id
CREATE TABLE temp.s_tmpach_709(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_709(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    709 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_exposure de1
        left join SQLUser.person p1
                  on p1.person_id = de1.person_id
where p1.person_id is null
;



-- 710	Number of drug exposure records outside valid observation period
CREATE TABLE temp.s_tmpach_710(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_710(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    710 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_exposure de1
        left join SQLUser.observation_period op1
                  on op1.person_id = de1.person_id
                      and de1.drug_exposure_start_date >= op1.observation_period_start_date
                      and de1.drug_exposure_start_date <= op1.observation_period_end_date
where op1.person_id is null
;



-- 711	Number of drug exposure records with end date < start date
CREATE TABLE temp.s_tmpach_711(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_711(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    711 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_exposure de1
where de1.drug_exposure_end_date < de1.drug_exposure_start_date
;



-- 712	Number of drug exposure records with invalid provider_id
CREATE TABLE temp.s_tmpach_712(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_712(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    712 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_exposure de1
        left join SQLUser.provider p1
                  on p1.provider_id = de1.provider_id
where de1.provider_id is not null
  and p1.provider_id is null
;



-- 713	Number of drug exposure records with invalid visit_id
CREATE TABLE temp.s_tmpach_713(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_713(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    713 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_exposure de1
        left join SQLUser.visit_occurrence vo1
                  on de1.visit_occurrence_id = vo1.visit_occurrence_id
where de1.visit_occurrence_id is not null
  and vo1.visit_occurrence_id is null
;



-- 715	Distribution of days_supply by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData(stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
SELECT
    de.drug_concept_id AS stratum_id,
    de.days_supply AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
WHERE
    de.days_supply IS NOT NULL;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (partition by stratum_id order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_715(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_715(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    715 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_715(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_715(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_715
;

truncate table temp.tempResults_715;
drop table temp.tempResults_715;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 716	Distribution of refills by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData(stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
SELECT
    de.drug_concept_id AS stratum_id,
    de.refills AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
WHERE
    de.refills IS NOT NULL;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (partition by stratum_id order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_716(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_716(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    716 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_716(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_716(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_716
;

truncate table temp.tempResults_716;
drop table temp.tempResults_716;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 717	Distribution of quantity by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData (stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
SELECT
    de.drug_concept_id AS stratum_id,
    CAST(de.quantity AS NUMERIC) AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
WHERE
    de.quantity IS NOT NULL;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_717(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_717(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    717 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_717(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_717(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_717
;

truncate table temp.tempResults_717;
drop table temp.tempResults_717;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROp TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 720	Number of drug exposure records by condition occurrence start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_720(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_720(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    720 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM
(SELECT
    YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date) AS stratum_1,
	COUNT(de.person_id) AS count_value
FROM
	SQLUser.drug_exposure de
JOIN
	SQLUser.observation_period op
ON
	de.person_id = op.person_id
AND
	de.drug_exposure_start_date >= op.observation_period_start_date
AND
	de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY
	YEAR(de.drug_exposure_start_date)*100 + MONTH(de.drug_exposure_start_date)
);



-- 725	Number of drug_exposure records, by drug_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_725(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_725(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    725 AS analysis_id,
    CAST(de.drug_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.drug_source_concept_id;



-- 730	Number of drug_exposure records inside a valid observation period
CREATE TABLE temp.s_tmpach_730(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_730(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    730 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.drug_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
;



-- 731	Proportion of people with at least one drug_exposure record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in drug_exposure (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT de.person_id) AS person_count
FROM
    SQLUser.drug_exposure de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(person_count NUMERIC);
INSERT INTO temp.de_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.drug_exposure
;
CREATE TABLE temp.s_tmpach_731(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_731(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    731 AS analysis_id,
    CASE WHEN de.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/de.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(de.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total de
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 732	Proportion of drug_exposure records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of drug_exposure records outside a valid observation period (numerator)
-- stratum_3:   Number of drug_exposure records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.drug_exposure de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_exposure_start_date >= op.observation_period_start_date
            AND
                de.drug_exposure_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(record_count NUMERIC);
INSERT INTO temp.de_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.drug_exposure;

CREATE TABLE temp.s_tmpach_732(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_732(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    732 AS analysis_id,
    CASE WHEN de.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/de.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(de.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total de
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 791	Number of total persons that have at least x drug exposures
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_791(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_791(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    791 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(de.drg_cnt AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SUM(COUNT(de.person_id)) OVER (PARTITION BY de.drug_concept_id ORDER BY de.drg_cnt DESC) AS count_value
FROM
    (
SELECT
            de.drug_concept_id,
            COUNT(de.drug_exposure_id) AS drg_cnt,
            de.person_id
FROM
            SQLUser.drug_exposure de
                JOIN
            SQLUser.observation_period op
            ON
                        de.person_id = op.person_id
                    AND
                        de.drug_exposure_start_date >= op.observation_period_start_date
                    AND
                        de.drug_exposure_start_date <= op.observation_period_end_date
        GROUP BY
            de.person_id,
            de.drug_concept_id
    ) de
GROUP BY
    de.drug_concept_id,
    de.drg_cnt
;


-- 800	Number of persons with at least one observation occurrence, by observation_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_800(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_800(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    800 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT o.person_id) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_concept_id;



-- 801	Number of observation occurrence records, by observation_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_801(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_801(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    801 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(o.person_id) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_concept_id;



-- 802	Number of persons by observation occurrence start month, by observation_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_802(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_802(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    802 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             o.observation_concept_id AS stratum_1,
             YEAR(o.observation_date) * 100 + MONTH(o.observation_date) AS stratum_2,
             COUNT(DISTINCT o.person_id) AS count_value
FROM
             SQLUser.observation o
             JOIN
             SQLUser.observation_period op
         ON
             o.person_id = op.person_id
             AND
             o.observation_date >= op.observation_period_start_date
             AND
             o.observation_date <= op.observation_period_end_date
         GROUP BY
             o.observation_concept_id,
             YEAR(o.observation_date) * 100 + MONTH(o.observation_date)
     );



-- 803	Number of distinct observation occurrence concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    COUNT(DISTINCT o.observation_concept_id) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_803(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_803(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    803 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_803(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_803(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_803
;

truncate table temp.tempResults_803;
drop table temp.tempResults_803;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 804	Number of persons with at least one observation occurrence, by observation_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_804(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_804(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    804 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             o.observation_concept_id AS stratum_1,
             YEAR(o.observation_date) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(o.observation_date) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.observation o
         ON
             p.person_id = o.person_id
             JOIN
             SQLUser.observation_period op
             ON
             o.person_id = op.person_id
             AND
             o.observation_date >= op.observation_period_start_date
             AND
             o.observation_date <= op.observation_period_end_date
         GROUP BY
             o.observation_concept_id,
             YEAR(o.observation_date),
             p.gender_concept_id,
             FLOOR((YEAR(o.observation_date) - p.year_of_birth) / 10)
     );



-- 805	Number of observation occurrence records, by observation_concept_id by observation_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_805(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_805(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    805 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(o.observation_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(o.person_id) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_concept_id,
    o.observation_type_concept_id;



-- 806	Distribution of age by observation_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_806(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_806(subject_id,gender_concept_id,count_value)
SELECT
    o.observation_concept_id AS subject_id,
    p.gender_concept_id,
    o.observation_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            o.person_id,
            o.observation_concept_id,
            MIN(YEAR(o.observation_date)) AS observation_start_year
FROM
            SQLUser.observation o
                JOIN
            SQLUser.observation_period op
            ON
                        o.person_id = op.person_id
                    AND
                        o.observation_date >= op.observation_period_start_date
                    AND
                        o.observation_date <= op.observation_period_end_date
        GROUP BY
            o.person_id,
            o.observation_concept_id
    ) o
             ON
                     p.person_id = o.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_806
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_806
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_806(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_806(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    806 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_806(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_806(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_806
;

truncate table temp.rawData_806;
drop table temp.rawData_806;
truncate table temp.tempResults_806;
drop table temp.tempResults_806;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;


-- 807	Number of observation occurrence records, by observation_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_807(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_807(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    807 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(o.unit_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(o.person_id) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_CONCEPT_ID,
    o.unit_concept_id;



-- 809	Number of observation records with invalid person_id
CREATE TABLE temp.s_tmpach_809(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_809(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    809 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(o1.PERSON_ID) as count_value
FROM
    SQLUser.observation o1
        left join SQLUser.person p1
                  on p1.person_id = o1.person_id
where p1.person_id is null
;



-- 810	Number of observation records outside valid observation period
CREATE TABLE temp.s_tmpach_810(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_810(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    810 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(o1.PERSON_ID) as count_value
FROM
    SQLUser.observation o1
        left join SQLUser.observation_period op1
                  on op1.person_id = o1.person_id
                      and o1.observation_date >= op1.observation_period_start_date
                      and o1.observation_date <= op1.observation_period_end_date
where op1.person_id is null
;



-- 812	Number of observation records with invalid provider_id
CREATE TABLE temp.s_tmpach_812(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_812(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    812 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(o1.PERSON_ID) as count_value
FROM
    SQLUser.observation o1
        left join SQLUser.provider p1
                  on p1.provider_id = o1.provider_id
where o1.provider_id is not null
  and p1.provider_id is null
;



-- 813	Number of observation records with invalid visit_id
CREATE TABLE temp.s_tmpach_813(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_813(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    813 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(o1.PERSON_ID) as count_value
FROM
    SQLUser.observation o1
        left join SQLUser.visit_occurrence vo1
                  on o1.visit_occurrence_id = vo1.visit_occurrence_id
where o1.visit_occurrence_id is not null
  and vo1.visit_occurrence_id is null
;



-- 814	Number of observation records with no value (numeric, string, or concept)
CREATE TABLE temp.s_tmpach_814(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_814(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    814 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(o1.PERSON_ID) as count_value
FROM
    SQLUser.observation o1
where o1.value_as_number is null
  and o1.value_as_string is null
  and o1.value_as_concept_id is null
;



--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats_815(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats_815(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
SELECT
    o.subject_id AS stratum1_id,
    o.unit_concept_id AS stratum2_id,
    CAST(AVG(1.0 * o.count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) AS stdev_value,
    MIN(o.count_value) AS min_value,
    MAX(o.count_value) AS max_value,
    COUNT(*) AS total
FROM
    (
SELECT
            o.observation_concept_id AS subject_id,
            o.unit_concept_id,
            CAST(o.value_as_number AS NUMERIC) AS count_value
FROM
            SQLUser.observation o
                JOIN
            SQLUser.observation_period op
            ON
                        o.person_id = op.person_id
                    AND
                        o.observation_date >= op.observation_period_start_date
                    AND
                        o.observation_date <= op.observation_period_end_date
        WHERE
            o.unit_concept_id IS NOT NULL
          AND
            o.value_as_number IS NOT NULL
    ) o
GROUP BY
    o.subject_id,
    o.unit_concept_id;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.statsView_815(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView_815(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
SELECT
    o.subject_id AS stratum1_id,
    o.unit_concept_id AS stratum2_id,
    o.count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (PARTITION BY o.subject_id,o.unit_concept_id ORDER BY o.count_value) AS rn
FROM
    (
SELECT
            o.observation_concept_id AS subject_id,
            o.unit_concept_id,
            CAST(o.value_as_number AS NUMERIC) AS count_value
FROM
            SQLUser.observation o
                JOIN
            SQLUser.observation_period op
            ON
                        o.person_id = op.person_id
                    AND
                        o.observation_date >= op.observation_period_start_date
                    AND
                        o.observation_date <= op.observation_period_end_date
        WHERE
            o.unit_concept_id IS NOT NULL
          AND
            o.value_as_number IS NOT NULL
    ) o
GROUP BY
    o.subject_id,
    o.unit_concept_id,
    o.count_value;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.tempResults_815(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_815(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    815 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    (
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView_815 s
                 join temp.statsView_815 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
        group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
    ) p
        join temp.overallStats_815 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_815(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_815(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_815
;

truncate table temp.overallStats_815;
drop table temp.overallStats_815;
truncate table temp.statsView_815;
drop table temp.statsView_815;
truncate table temp.tempResults_815;
drop table temp.tempResults_815;


-- 820	Number of observation records by condition occurrence start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_820(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_820(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    820 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(o.observation_date) * 100 + MONTH(o.observation_date) AS stratum_1,
             COUNT(o.person_id) AS count_value
FROM
             SQLUser.observation o
             JOIN
             SQLUser.observation_period op
         ON
             o.person_id = op.person_id
             AND
             o.observation_date >= op.observation_period_start_date
             AND
             o.observation_date <= op.observation_period_end_date
         GROUP BY
             YEAR(o.observation_date) * 100 + MONTH(o.observation_date)
     );



-- 822	Number of observation records, by observation_concept_id and value_as_concept_id, observation_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_822(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_822(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    822 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(o.value_as_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_concept_id,
    o.value_as_concept_id;



-- 823	Number of observation records, by observation_concept_id and qualifier_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_823(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_823(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    823 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(o.qualifier_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_concept_id,
    o.qualifier_concept_id;



-- 825	Number of observation records, by observation_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_825(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_825(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    825 AS analysis_id,
    CAST(o.observation_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.observation_source_concept_id;



-- 826	Number of observation records, by value_as_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_826(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_826(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    826 AS analysis_id,
    CAST(o.value_as_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.value_as_concept_id;



-- 827	Number of observation records, by unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_827(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_827(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    827 AS analysis_id,
    CAST(o.unit_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
GROUP BY
    o.unit_concept_id;



-- 830	Number of observation records inside a valid observation period
CREATE TABLE temp.s_tmpach_830(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_830(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    830 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.observation o
        JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
;



-- 831	Proportion of people with at least one observation record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in observation (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT o.person_id) AS person_count
FROM
    SQLUser.observation o
        LEFT JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.o_total(person_count NUMERIC);
INSERT INTO temp.o_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.observation;

CREATE TABLE temp.s_tmpach_831(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_831(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    831 AS analysis_id,
    CASE WHEN ot.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/ot.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(ot.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.o_total ot
;
DROP TABLE temp.op_outside;
DROP TABLE temp.o_total;


-- 832	Proportion of observation records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of observation records outside a valid observation period (numerator)
-- stratum_3:   Number of observation records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.observation o
        LEFT JOIN
    SQLUser.observation_period op
    ON
                o.person_id = op.person_id
            AND
                o.observation_date >= op.observation_period_start_date
            AND
                o.observation_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.o_total(record_count NUMERIC);
INSERT INTO temp.o_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.observation;

CREATE TABLE temp.s_tmpach_832(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_832(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    832 AS analysis_id,
    CASE WHEN ot.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/ot.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(ot.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.o_total ot
;
DROP TABLE temp.op_outside;
DROP TABLE temp.o_total;


-- 891	Number of total persons that have at least x observations
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_891(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_891(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    891 AS analysis_id,
    CAST(o.observation_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(o.obs_cnt AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SUM(COUNT(o.person_id)) OVER (PARTITION BY o.observation_concept_id ORDER BY o.obs_cnt DESC) AS count_value
FROM
    (
SELECT
            o.observation_concept_id,
            COUNT(o.observation_id) AS obs_cnt,
            o.person_id
FROM
            SQLUser.observation o
                JOIN
            SQLUser.observation_period op
            ON
                        o.person_id = op.person_id
                    AND
                        o.observation_date >= op.observation_period_start_date
                    AND
                        o.observation_date <= op.observation_period_end_date
        GROUP BY
            o.person_id,
            o.observation_concept_id
    ) o
GROUP BY
    o.observation_concept_id,
    o.obs_cnt
;

-- 900	Number of persons with at least one drug occurrence, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_900(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_900(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    900 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT de.person_id) AS count_value
FROM
    SQLUser.drug_era de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
GROUP BY
    de.drug_concept_id;



-- 901	Number of drug occurrence records, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_901(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_901(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    901 AS analysis_id,
    CAST(de.drug_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(de.person_id) AS count_value
FROM
    SQLUser.drug_era de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
GROUP BY
    de.drug_concept_id;



-- 902	Number of persons by drug occurrence start month, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_902(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_902(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    902 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             de.drug_concept_id AS stratum_1,
             YEAR(de.drug_era_start_datetime) * 100 + MONTH(de.drug_era_start_datetime) AS stratum_2,
             COUNT(DISTINCT de.person_id) AS count_value
FROM
             SQLUser.drug_era de
             JOIN
             SQLUser.observation_period op
         ON
             de.person_id = op.person_id
             AND
             de.drug_era_start_datetime >= op.observation_period_start_date
             AND
             de.drug_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             de.drug_concept_id,
             YEAR(de.drug_era_start_datetime) * 100 + MONTH(de.drug_era_start_datetime)
     );



-- 903	Number of distinct drug era concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    COUNT(DISTINCT de.drug_concept_id) AS count_value
FROM
    SQLUser.drug_era de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
GROUP BY
    de.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_903(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_903(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    903 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_903(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_903(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_903
;

truncate table temp.tempResults_903;
drop table temp.tempResults_903;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 904	Number of persons with at least one drug occurrence, by drug_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_904(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_904(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    904 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             de.drug_concept_id AS stratum_1,
             YEAR(de.drug_era_start_datetime) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(de.drug_era_start_datetime) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.drug_era de
         ON
             p.person_id = de.person_id
             JOIN
             SQLUser.observation_period op
             ON
             de.person_id = op.person_id
             AND
             de.drug_era_start_datetime >= op.observation_period_start_date
             AND
             de.drug_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             de.drug_concept_id,
             YEAR(de.drug_era_start_datetime),
             p.gender_concept_id,
             FLOOR((YEAR(de.drug_era_start_datetime) - p.year_of_birth) / 10)
     );



-- 906	Distribution of age by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_906(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_906(subject_id,gender_concept_id,count_value)
SELECT
    de.drug_concept_id AS subject_id,
    p.gender_concept_id,
    de.drug_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            de.person_id,
            de.drug_concept_id,
            MIN(YEAR(de.drug_era_start_datetime)) AS drug_start_year
FROM
            SQLUser.drug_era de
                JOIN
            SQLUser.observation_period op
            ON
                        de.person_id = op.person_id
                    AND
                        de.drug_era_start_datetime >= op.observation_period_start_date
                    AND
                        de.drug_era_start_datetime <= op.observation_period_end_date
        GROUP BY
            de.person_id,
            de.drug_concept_id
    ) de
             ON
                     p.person_id = de.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_906
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_906
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_906(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_906(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    906 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_906(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_906(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_906
;

truncate table temp.rawData_906;
drop table temp.rawData_906;
truncate table temp.tempResults_906;
drop table temp.tempResults_906;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 907	Distribution of drug era length, by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum1_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum1_id, count_value)
SELECT
    de.drug_concept_id AS stratum1_id,
    (CAST(de.drug_era_end_datetime AS DATE) - CAST(de.drug_era_start_datetime AS DATE)) AS count_value
FROM
    SQLUser.drug_era de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date;

CREATE TABLE temp.overallStats(stratum1_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum1_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData
group by stratum1_id;

CREATE TABLE temp.statsView(stratum1_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,count_value,total,rn)
select
stratum1_id,
       count_value,
       COUNT(*) as total,
       row_number() over (partition by stratum1_id order by count_value) as rn
FROM temp.rawData
group by stratum1_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,count_value,total,accumulated)
select
s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
group by s.stratum1_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_907(analysis_id INT,stratum_1 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_907(analysis_id,stratum_1,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    907 as analysis_id,
    CAST(p.stratum1_id AS VARCHAR(255)) as stratum_1,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_907(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_907(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_907
;

truncate table temp.tempResults_907;
drop table temp.tempResults_907;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 908	Number of drug eras with invalid person
CREATE TABLE temp.s_tmpach_908(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_908(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    908 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_era de1
        left join SQLUser.person p1
                  on p1.person_id = de1.person_id
where p1.person_id is null
;



-- 910	Number of drug_era records outside a valid observation period
CREATE TABLE temp.s_tmpach_910(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_910(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    910 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.drug_era de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL
;



-- 911	Number of drug eras with end date < start date
CREATE TABLE temp.s_tmpach_911(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_911(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    911 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(de1.PERSON_ID) as count_value
FROM
    SQLUser.drug_era de1
where de1.drug_era_end_datetime < de1.drug_era_start_datetime
;



-- 920	Number of drug era records by drug era start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_920(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_920(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    920 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(de.drug_era_start_datetime) * 100 + MONTH(de.drug_era_start_datetime) AS stratum_1,
             COUNT(de.person_id) AS count_value
FROM
             SQLUser.drug_era de
             JOIN
             SQLUser.observation_period op
         ON
             de.person_id = op.person_id
             AND
             de.drug_era_start_datetime >= op.observation_period_start_date
             AND
             de.drug_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             YEAR(de.drug_era_start_datetime)*100 + MONTH(de.drug_era_start_datetime)
     );



-- 930	Number of drug_era records inside a valid observation period
CREATE TABLE temp.s_tmpach_930(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_930(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    930 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.drug_era de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
;



-- 931	Proportion of people with at least one drug_era record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in drug_era (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT de.person_id) AS person_count
FROM
    SQLUser.drug_era de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(person_count NUMERIC);
INSERT INTO temp.de_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.drug_era;

CREATE TABLE temp.s_tmpach_931(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_931(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    931 AS analysis_id,
    CASE WHEN det.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/det.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(det.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total det
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 932	Proportion of drug_era records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of drug_era records outside a valid observation period (numerator)
-- stratum_3:   Number of drug_era records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.drug_era de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.drug_era_start_datetime >= op.observation_period_start_date
            AND
                de.drug_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(record_count NUMERIC);
INSERT INTO temp.de_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.drug_era;

CREATE TABLE temp.s_tmpach_932(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_932(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    932 AS analysis_id,
    CASE WHEN det.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/det.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(det.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total det
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 1000	Number of persons with at least one condition occurrence, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1000(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1000(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1000 AS analysis_id,
    CAST(ce.condition_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT ce.person_id) AS count_value
FROM
    SQLUser.condition_era ce
        JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
GROUP BY
    ce.condition_concept_id;



-- 1001	Number of condition occurrence records, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1001(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1001(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1001 AS analysis_id,
    CAST(ce.condition_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(ce.person_id) AS count_value
FROM
    SQLUser.condition_era ce
        JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
GROUP BY
    ce.condition_concept_id;



-- 1002	Number of persons by condition occurrence start month, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1002(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1002(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1002 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             ce.condition_concept_id AS stratum_1,
             YEAR(ce.condition_era_start_datetime) * 100 + MONTH(ce.condition_era_start_datetime) AS stratum_2,
             COUNT(DISTINCT ce.person_id) AS count_value
FROM
             SQLUser.condition_era ce
             JOIN
             SQLUser.observation_period op
         ON
             ce.person_id = op.person_id
             AND
             ce.condition_era_start_datetime >= op.observation_period_start_date
             AND
             ce.condition_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             ce.condition_concept_id,
             YEAR(ce.condition_era_start_datetime) * 100 + MONTH(ce.condition_era_start_datetime)
     );



-- 1003	Number of distinct condition era concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    COUNT(DISTINCT ce.condition_concept_id) AS count_value
FROM
    SQLUser.condition_era ce
        JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
GROUP BY
    ce.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1003(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1003(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1003 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_1003(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1003(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1003
;

truncate table temp.tempResults_1003;
drop table temp.tempResults_1003;
DROP TABLE temp.rawData;
DROp TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1004	Number of persons with at least one condition occurrence, by condition_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1004(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1004(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1004 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             ce.condition_concept_id AS stratum_1,
             YEAR(ce.condition_era_start_datetime) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(ce.condition_era_start_datetime) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.condition_era ce
         ON
             p.person_id = ce.person_id
             JOIN
             SQLUser.observation_period op
             ON
             ce.person_id = op.person_id
             AND
             ce.condition_era_start_datetime >= op.observation_period_start_date
             AND
             ce.condition_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             ce.condition_concept_id,
             YEAR(ce.condition_era_start_datetime),
             p.gender_concept_id,
             FLOOR((YEAR(ce.condition_era_start_datetime) - p.year_of_birth) / 10)
     );



-- 1006	Distribution of age by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_1006(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_1006(subject_id,gender_concept_id,count_value)
SELECT
    ce.condition_concept_id AS subject_id,
    p.gender_concept_id,
    ce.condition_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            ce.person_id,
            ce.condition_concept_id,
            MIN(YEAR(ce.condition_era_start_datetime)) AS condition_start_year
FROM
            SQLUser.condition_era ce
                JOIN
            SQLUser.observation_period op
            ON
                        ce.person_id = op.person_id
                    AND
                        ce.condition_era_start_datetime >= op.observation_period_start_date
                    AND
                        ce.condition_era_start_datetime <= op.observation_period_end_date
        GROUP BY
            ce.person_id,
            ce.condition_concept_id
    ) ce
             ON
                     p.person_id = ce.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_1006
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_1006
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1006(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1006(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1006 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1006(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1006(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1006
;

truncate table temp.rawData_1006;
drop table temp.rawData_1006;
truncate table temp.tempResults_1006;
drop table temp.tempResults_1006;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1007	Distribution of condition era length, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum1_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum1_id, count_value)
SELECT
    ce.condition_concept_id AS stratum1_id,
    (CAST(ce.condition_era_end_datetime AS DATE) - CAST(ce.condition_era_start_datetime AS DATE)) AS count_value
FROM
    SQLUser.condition_era ce
        JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date;

CREATE TABLE temp.overallStats(stratum1_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum1_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData
group by stratum1_id;

CREATE TABLE temp.statsView(stratum1_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,count_value,total,rn)
select
stratum1_id,
       count_value,
       COUNT(*) as total,
       row_number() over (partition by stratum1_id order by count_value) as rn
FROM temp.rawData
group by stratum1_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,count_value,total,accumulated)
select
s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
group by s.stratum1_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1007(analysis_id INT,stratum_1 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1007(analysis_id,stratum_1,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1007 as analysis_id,
    CAST(p.stratum1_id AS VARCHAR(255)) as stratum_1,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1007(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1007(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1007
;

truncate table temp.tempResults_1007;
drop table temp.tempResults_1007;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1008	Number of condition eras with invalid person
CREATE TABLE temp.s_tmpach_1008(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1008(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1008 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(ce1.PERSON_ID) as count_value
FROM
    SQLUser.condition_era ce1
        left join SQLUser.person p1
                  on p1.person_id = ce1.person_id
where p1.person_id is null
;



-- 1010	Number of condition_era records outside a valid observation period
CREATE TABLE temp.s_tmpach_1010(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1010(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1010 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_era ce
        LEFT JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL
;



-- 1011	Number of condition eras with end date < start date
CREATE TABLE temp.s_tmpach_1011(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1011(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1011 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(ce1.PERSON_ID) as count_value
FROM
    SQLUser.condition_era ce1
where ce1.condition_era_end_datetime < ce1.condition_era_start_datetime
;



-- 1020	Number of condition era records by condition era start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1020(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1020(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1020 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(ce.condition_era_start_datetime) * 100 + MONTH(ce.condition_era_start_datetime) AS stratum_1,
             COUNT(ce.person_id) AS count_value
FROM
             SQLUser.condition_era ce
             JOIN
             SQLUser.observation_period op
         ON
             ce.person_id = op.person_id
             AND
             ce.condition_era_start_datetime >= op.observation_period_start_date
             AND
             ce.condition_era_start_datetime <= op.observation_period_end_date
         GROUP BY
             YEAR(ce.condition_era_start_datetime)*100 + MONTH(ce.condition_era_start_datetime)
     );



-- 1030	Number of condition_era records inside a valid observation period
CREATE TABLE temp.s_tmpach_1030(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1030(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1030 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.condition_era ce
        JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
;



-- 1031	Proportion of people with at least one condition_era record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in condition_era (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT ce.person_id) AS person_count
FROM
    SQLUser.condition_era ce
        LEFT JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.ce_total(person_count NUMERIC);
INSERT INTO temp.ce_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.condition_era;

CREATE TABLE temp.s_tmpach_1031(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1031(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1031 AS analysis_id,
    CASE WHEN cet.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/cet.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(cet.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.ce_total cet
;
DROP TABLE temp.op_outside;
DRop TABLE temp.ce_total;


-- 1032	Proportion of condition_era records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of condition_era records outside a valid observation period (numerator)
-- stratum_3:   Number of condition_era records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.condition_era ce
        LEFT JOIN
    SQLUser.observation_period op
    ON
                ce.person_id = op.person_id
            AND
                ce.condition_era_start_datetime >= op.observation_period_start_date
            AND
                ce.condition_era_start_datetime <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.ce_total(record_count NUMERIC);
INSERT INTO temp.ce_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.condition_era;

CREATE TABLE temp.s_tmpach_1032(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1032(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1032 AS analysis_id,
    CASE WHEN cet.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/cet.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(cet.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.ce_total cet
;
DROP TABLE temp.op_outside;
DROP TABLE temp.ce_total;


-- 1100	Number of persons by location 3-digit zip
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1100(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1100(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1100 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    count_value
FROM (
select
             left(l1.zip,3) as stratum_1,
             COUNT(distinct person_id) as count_value
from SQLUser.person p1
             inner join SQLUser.location l1
         on p1.location_id = l1.location_id
         where p1.location_id is not null
           and l1.zip is not null
         group by left(l1.zip,3)
     );



-- 1101	Number of persons by location state
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1101(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1101(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1101 as analysis_id,
    CAST(l1.state AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct person_id) as count_value
FROM
    SQLUser.person p1
        inner join SQLUser.location l1
                   on p1.location_id = l1.location_id
where p1.location_id is not null
  and l1.state is not null
group by l1.state;



-- 1102	Number of care sites by location 3-digit zip
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1102(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1102(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1102 as analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    count_value
FROM (
select
             left(l1.zip,3) as stratum_1,
             COUNT(distinct care_site_id) as count_value
from SQLUser.care_site cs1
             inner join SQLUser.location l1
         on cs1.location_id = l1.location_id
         where cs1.location_id is not null
           and l1.zip is not null
         group by left(l1.zip,3)
     );



-- 1103	Number of care sites by location state
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1103(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1103(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1103 as analysis_id,
    CAST(l1.state AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct care_site_id) as count_value
FROM
    SQLUser.care_site cs1
        inner join SQLUser.location l1
                   on cs1.location_id = l1.location_id
where cs1.location_id is not null
  and l1.state is not null
group by l1.state;



-- 1200	Number of persons by place of service
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1200(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1200(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1200 as analysis_id,
    CAST(cs1.place_of_service_concept_id AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(person_id) as count_value
FROM
    SQLUser.person p1
        inner join SQLUser.care_site cs1
                   on p1.care_site_id = cs1.care_site_id
where p1.care_site_id is not null
  and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;



-- 1201	Number of visits by place of service
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1201(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1201(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1201 as analysis_id,
    CAST(cs1.place_of_service_concept_id AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(visit_occurrence_id) as count_value
FROM
    SQLUser.visit_occurrence vo1
        inner join SQLUser.care_site cs1
                   on vo1.care_site_id = cs1.care_site_id
where vo1.care_site_id is not null
  and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;



-- 1202	Number of care sites by place of service
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1202(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1202(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1202 as analysis_id,
    CAST(cs1.place_of_service_concept_id AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(care_site_id) as count_value
FROM
    SQLUser.care_site cs1
where cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;



-- 1203	Number of visits by place of service discharge type
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1203(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1203(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1203 AS analysis_id,
    CAST(vo.discharge_to_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date
WHERE
    vo.discharge_to_concept_id != 0
GROUP BY
	vo.discharge_to_concept_id;

-- 1300	Number of persons with at least one visit detail, by visit_detail_concept_id
-- restricted to visits overlapping with observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1300(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1300(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1300 AS analysis_id,
    CAST(vd.visit_detail_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT vd.person_id) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY
    vd.visit_detail_concept_id
;



-- 1301	Number of visit detail records, by visit_detail_concept_id
-- restricted to visits overlapping with observation period
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1301(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1301(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1301 AS analysis_id,
    CAST(vd.visit_detail_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(vd.person_id) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY
    vd.visit_detail_concept_id;



-- 1302	Number of persons by visit detail start month, by visit_detail_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1302(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1302(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1302 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             vd.visit_detail_concept_id AS stratum_1,
             YEAR(vd.visit_detail_start_date)*100 + MONTH(vd.visit_detail_start_date) AS stratum_2,
             COUNT(DISTINCT vd.person_id) AS count_value
FROM
             SQLUser.visit_detail vd
             JOIN
             SQLUser.observation_period op
         ON
             vd.person_id = op.person_id
             AND
             vd.visit_detail_start_date >= op.observation_period_start_date
             AND
             vd.visit_detail_start_date <= op.observation_period_end_date
         GROUP BY
             vd.visit_detail_concept_id,
             YEAR(vd.visit_detail_start_date)*100 + MONTH(vd.visit_detail_start_date)
     );



-- 1303	Number of distinct visit detail concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (person_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(person_id, count_value)
SELECT
    vd.person_id,
    COUNT(DISTINCT vd.visit_detail_concept_id) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY
    vd.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
SELECT
    CAST(AVG(1.0 * count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) AS stdev_value,
    MIN(count_value) AS min_value,
    MAX(count_value) AS max_value,
    COUNT(*) AS total
FROM
    temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
SELECT
    count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (ORDER BY count_value) AS rn
FROM
    temp.rawData
GROUP BY
    count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
SELECT
    s.count_value,
    s.total,
    SUM(p.total) AS accumulated
FROM
    temp.statsView s
        JOIN
    temp.statsView p ON p.rn <= s.rn
GROUP BY
    s.count_value,
    s.total,
    s.rn;

CREATE TABLE temp.tempResults_1303(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1303(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1303 AS analysis_id,
    o.total AS count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
    MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
    MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
    MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
    MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
    temp.priorStats p
        CROSS JOIN
    temp.overallStats o
GROUP BY
    o.total,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_1303(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1303(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value,
    min_value,
    max_value,
    avg_value,
    stdev_value,
    median_value,
    p10_value,
    p25_value,
    p75_value,
    p90_value
FROM
    temp.tempResults_1303
;

TRUNCATE TABLE temp.tempResults_1303;
DROP TABLE temp.tempResults_1303;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1304	Number of persons with at least one visit detail, by visit_detail_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1304(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1304(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1304 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             vd.visit_detail_concept_id AS stratum_1,
             YEAR(vd.visit_detail_start_date) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.visit_detail vd
         ON
             p.person_id = vd.person_id
             JOIN
             SQLUser.observation_period op
             ON
             vd.person_id = op.person_id
             AND
             vd.visit_detail_start_date >= op.observation_period_start_date
             AND
             vd.visit_detail_start_date <= op.observation_period_end_date
         GROUP BY
             vd.visit_detail_concept_id,
             YEAR(vd.visit_detail_start_date),
             p.gender_concept_id,
             FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth)/10)
     );



-- 1306	Distribution of age by visit_detail_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.rawData(stratum1_id INT,stratum2_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum1_id,stratum2_id,count_value)
SELECT
    vd.visit_detail_concept_id AS stratum1_id,
    p.gender_concept_id AS stratum2_id,
    vd.visit_detail_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            vd.person_id,
            vd.visit_detail_concept_id,
            MIN(YEAR(vd.visit_detail_start_date)) AS visit_detail_start_year
FROM
            SQLUser.visit_detail vd
                JOIN
            SQLUser.observation_period op
            ON
                        vd.person_id = op.person_id
                    AND
                        vd.visit_detail_start_date >= op.observation_period_start_date
                    AND
                        vd.visit_detail_start_date <= op.observation_period_end_date
        GROUP BY
            vd.person_id,
            vd.visit_detail_concept_id
    ) vd
             ON
                     p.person_id = vd.person_id;

CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
SELECT
    stratum1_id,
    stratum2_id,
    CAST(AVG(1.0 * count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) AS stdev_value,
    MIN(count_value) AS min_value,
    MAX(count_value) AS max_value,
    COUNT(*) AS total
FROM
    temp.rawData
GROUP BY
    stratum1_id,
    stratum2_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,rn)
SELECT
    stratum1_id,
    stratum2_id,
    count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (PARTITION BY stratum1_id,stratum2_id ORDER BY count_value) AS rn
FROM
    temp.rawData
GROUP BY
    stratum1_id,
    stratum2_id,
    count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
SELECT
    s.stratum1_id,
    s.stratum2_id,
    s.count_value,
    s.total,
    SUM(p.total) AS accumulated
FROM
    temp.statsView s
        JOIN
    temp.statsView p ON s.stratum1_id = p.stratum1_id
        AND s.stratum2_id = p.stratum2_id
        AND p.rn <= s.rn
GROUP BY
    s.stratum1_id,
    s.stratum2_id,
    s.count_value,
    s.total,
    s.rn;

CREATE TABLE temp.tempResults_1306(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1306(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1306 AS analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
    MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
    MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
    MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
    MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
    temp.priorStats p
        JOIN
    temp.overallStats o ON p.stratum1_id = o.stratum1_id AND p.stratum2_id = o.stratum2_id
GROUP BY
    o.stratum1_id,
    o.stratum2_id,
    o.total,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1306(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1306(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    stratum1_id AS stratum_1,
    stratum2_id AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value,
    min_value,
    max_value,
    avg_value,
    stdev_value,
    median_value,
    p10_value,
    p25_value,
    p75_value,
    p90_value
FROM
    temp.tempResults_1306
;

TRUNCATE TABLE temp.tempResults_1306;
DROP TABLE temp.tempResults_1306;
DROP TABLE temp.rawData;
DROp TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1307	Number of visit detail records with invalid person_id
CREATE TABLE temp.s_tmpach_1307(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1307(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1307 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(vd.person_id) AS count_value
FROM
    SQLUser.visit_detail vd
        LEFT JOIN
    SQLUser.person p
    ON
            p.person_id = vd.person_id
WHERE
    p.person_id IS NULL;



-- 1309	Number of visit detail records with invalid care_site_id
CREATE TABLE temp.s_tmpach_1309(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1309(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1309 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(vd.person_id) AS count_value
FROM
    SQLUser.visit_detail vd
        LEFT JOIN
    SQLUser.care_site cs
    ON
            vd.care_site_id = cs.care_site_id
WHERE
    vd.care_site_id IS NOT NULL
  AND
    cs.care_site_id IS NULL;



-- 1310	Number of visit_detail records outside a valid observation period
CREATE TABLE temp.s_tmpach_1310(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1310(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1310 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_detail vd
        LEFT JOIN
    SQLUser.observation_period op
    ON
                op.person_id = vd.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL
;



-- 1311	Number of visit detail records with end date < start date
CREATE TABLE temp.s_tmpach_1311(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1311(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1311 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(person_id) AS count_value
FROM
    SQLUser.visit_detail
WHERE
        visit_detail_end_date < visit_detail_start_date;



-- 1312	Number of persons with at least one visit detail by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1312(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1312(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1312 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS varchar(255)) AS stratum_2,
    CAST(stratum_3 AS varchar(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(vd.visit_detail_start_date) AS stratum_1,
             p.gender_concept_id AS stratum_2,
             FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10) AS stratum_3,
             COUNT(DISTINCT vd.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.visit_detail vd
         ON
             vd.person_id = p.person_id
             JOIN
             SQLUser.observation_period op
             ON
             vd.person_id = op.person_id
             AND
             vd.visit_detail_start_date >= op.observation_period_start_date
             AND
             vd.visit_detail_start_date <= op.observation_period_end_date
         GROUP BY
             YEAR(vd.visit_detail_start_date),
             p.gender_concept_id,
             FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10)
     );



-- 1313	Distribution of length of stay by visit_detail_concept_id
-- restrict to visits inside observation period
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData (stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
SELECT
    vd.visit_detail_concept_id AS stratum_id,
    (CAST(vd.visit_detail_END_date AS DATE) - CAST(vd.visit_detail_start_date AS DATE)) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
SELECT
    stratum_id,
    CAST(AVG(1.0 * count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(count_value) AS NUMERIC) AS stdev_value,
    MIN(count_value) AS min_value,
    MAX(count_value) AS max_value,
    COUNT(*) AS total
FROM
    temp.rawData
GROUP BY
    stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
SELECT
    stratum_id,
    count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (ORDER BY count_value) AS rn
FROM
    temp.rawData
GROUP BY
    stratum_id,
    count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
SELECT
    s.stratum_id,
    s.count_value,
    s.total,
    SUM(p.total) AS accumulated
FROM
    temp.statsView s
        JOIN
    temp.statsView p
    ON
                s.stratum_id = p.stratum_id
            AND
                p.rn <= s.rn
GROUP BY
    s.stratum_id,
    s.count_value,
    s.total,
    s.rn;

CREATE TABLE temp.tempResults_1313(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1313(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1313 AS analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
    MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
    MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
    MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
    MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
    temp.priorStats p
        JOIN
    temp.overallStats o ON p.stratum_id = o.stratum_id
GROUP BY
    o.stratum_id,
    o.total,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1313(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1313(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    stratum_id AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value,
    min_value,
    max_value,
    avg_value,
    stdev_value,
    median_value,
    p10_value,
    p25_value,
    p75_value,
    p90_value
FROM
    temp.tempResults_1313;

TRUNCATE TABLE temp.tempResults_1313;
DROP TABLE temp.tempResults_1313;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1320	Number of visit detail records by visit detail start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1320(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1320(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1320 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(vd.visit_detail_start_date) * 100 + MONTH(vd.visit_detail_start_date) AS stratum_1,
             COUNT(vd.person_id) AS count_value
FROM
             SQLUser.visit_detail vd
             JOIN
             SQLUser.observation_period op
         ON
             vd.person_id = op.person_id
             AND
             vd.visit_detail_start_date >= op.observation_period_start_date
             AND
             vd.visit_detail_start_date <= op.observation_period_end_date
         GROUP BY
             YEAR(vd.visit_detail_start_date) * 100 + MONTH(vd.visit_detail_start_date)
     );



-- 1321	Number of persons by visit start year
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1321(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1321(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1321 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(vd.visit_detail_start_date) AS stratum_1,
             COUNT(DISTINCT vd.person_id) AS count_value
FROM
             SQLUser.visit_detail vd
             JOIN
             SQLUser.observation_period op
         ON
             vd.person_id = op.person_id
             AND
             vd.visit_detail_start_date >= op.observation_period_start_date
             AND
             vd.visit_detail_start_date <= op.observation_period_end_date
         GROUP BY
             YEAR(vd.visit_detail_start_date)
     );



-- 1325	Number of visit_detail records, by visit_detail_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1325(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1325(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1325 AS analysis_id,
    CAST(vd.visit_detail_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY
    visit_detail_source_concept_id;



-- 1326	Number of records by domain by visit detail concept id
CREATE TABLE temp.s_tmpach_1326(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1326(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1326 AS analysis_id,
    CAST(v.visit_detail_concept_id AS VARCHAR(255)) AS stratum_1,
    v.cdm_table AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    v.record_count AS count_value
FROM
    (
SELECT
'drug_exposure' cdm_table,
               COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
               COUNT(*) record_count
FROM
            SQLUser.drug_exposure de
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    de.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
        UNION
SELECT
            'condition_occurrence' cdm_table,
            COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
            COUNT(*) record_count
FROM
            SQLUser.condition_occurrence co
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    co.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
        UNION
SELECT
            'device_exposure' cdm_table,
            COALESCE(visit_detail_concept_id, 0) visit_detail_concept_id,
            COUNT(*) record_count
FROM
            SQLUser.device_exposure de
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    de.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
        UNION
SELECT
            'procedure_occurrence' cdm_table,
            COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
            COUNT(*) record_count
FROM
            SQLUser.procedure_occurrence po
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    po.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
        UNION
SELECT
            'measurement' cdm_table,
            COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
            COUNT(*) record_count
FROM
            SQLUser.measurement m
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    m.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
        UNION
SELECT
            'observation' cdm_table,
            COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
            COUNT(*) record_count
FROM
            SQLUser.observation o
                LEFT JOIN
            SQLUser.visit_detail vd
            ON
                    o.visit_occurrence_id = vd.visit_occurrence_id
        GROUP BY
            vd.visit_detail_concept_id
    ) v;



-- 1330	Number of visit_detail records inside a valid observation period
CREATE TABLE temp.s_tmpach_1330(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1330(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1330 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.visit_detail vd
        JOIN
    SQLUser.observation_period op
    ON
                op.person_id = vd.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
;



-- 1331	Proportion of people with at least one visit_detail record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in visit_detail (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT vd.person_id) AS person_count
FROM
    SQLUser.visit_detail vd
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.vd_total(person_count NUMERIC);
INSERT INTO temp.vd_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.visit_detail;

CREATE TABLE temp.s_tmpach_1331(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1331(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1331 AS analysis_id,
    CASE WHEN vdt.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/vdt.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(vdt.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.vd_total vdt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.vd_total;


-- 1332	Proportion of visit_detail records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimals places
-- stratum_2:   Number of visit_detail records outside a valid observation period (numerator)
-- stratum_3:   Number of visit_detail records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.visit_detail vd
        LEFT JOIN
    SQLUser.observation_period op
    ON
                vd.person_id = op.person_id
            AND
                vd.visit_detail_start_date >= op.observation_period_start_date
            AND
                vd.visit_detail_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.vd_total(record_count NUMERIC);
INSERT INTO temp.vd_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.visit_detail;

CREATE TABLE temp.s_tmpach_1332(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1332(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1332 AS analysis_id,
    CASE WHEN vdt.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/vdt.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(vdt.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.vd_total vdt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.vd_total;


-- 1406	Length of payer plan (days) of first payer plan period by gender
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.rawData (stratum1_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum1_id, count_value)
select
p1.gender_concept_id as stratum1_id,
       (CAST(ppp1.payer_plan_period_end_date AS DATE) - CAST(ppp1.payer_plan_period_start_date AS DATE)) as count_value
from SQLUser.person p1
         inner join
     (select person_id,
             payer_plan_period_START_DATE,
             payer_plan_period_END_DATE,
             ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
from SQLUser.payer_plan_period
     ) ppp1
     on p1.PERSON_ID = ppp1.PERSON_ID
where ppp1.rn1 = 1;

CREATE TABLE temp.overallStats(stratum1_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum1_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData
group by stratum1_id;

CREATE TABLE temp.statsView(stratum1_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,count_value,total,rn)
select
stratum1_id,
       count_value,
       COUNT(*) as total,
       row_number() over (partition by stratum1_id order by count_value) as rn
FROM temp.rawData
group by stratum1_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,count_value,total,accumulated)
select
s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
group by s.stratum1_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1406(analysis_id INT,stratum_1 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1406(analysis_id,stratum_1,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1406 as analysis_id,
    CAST(p.stratum1_id AS VARCHAR(255)) as stratum_1,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1406(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1406(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1406
;

truncate table temp.tempResults_1406;
drop table temp.tempResults_1406;
DROp TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1407	Length of payer plan (days) of first payer plan period by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE temp.rawData (stratum_id INT,count_value NUMERIC);
INSERT INTO temp.rawData(stratum_id, count_value)
select
floor((YEAR(ppp1.payer_plan_period_START_DATE) - p1.YEAR_OF_BIRTH)/10) as stratum_id,
       (CAST(ppp1.payer_plan_period_end_date AS DATE) - CAST(ppp1.payer_plan_period_start_date AS DATE)) as count_value
from SQLUser.person p1
         inner join
     (select person_id,
             payer_plan_period_START_DATE,
             payer_plan_period_END_DATE,
             ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
from SQLUser.payer_plan_period
     ) ppp1
     on p1.PERSON_ID = ppp1.PERSON_ID
where ppp1.rn1 = 1;

CREATE TABLE temp.overallStats(stratum_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum_id,avg_value,stdev_value,min_value,max_value,total)
select
stratum_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData
group by stratum_id;

CREATE TABLE temp.statsView(stratum_id INT,count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(stratum_id,count_value,total,rn)
select
stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM temp.rawData
group by stratum_id, count_value;

CREATE TABLE temp.priorStats(stratum_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum_id,count_value,total,accumulated)
select
s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
group by s.stratum_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1407(analysis_id INT,stratum_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1407(analysis_id,stratum_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1407 as analysis_id,
    CAST(o.stratum_id AS VARCHAR(255)) AS stratum_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1407(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1407(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum_id as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1407
;

truncate table temp.tempResults_1407;
drop table temp.tempResults_1407;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1408	Number of persons by length of payer plan period, in 30d increments
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1408(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1408(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1408 as analysis_id,
    CAST(floor((CAST(ppp1.payer_plan_period_end_date AS DATE) - CAST(ppp1.payer_plan_period_start_date AS DATE))/30) AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.person_id) as count_value
FROM
    SQLUser.person p1
        inner join
    (select person_id,
            payer_plan_period_START_DATE,
            payer_plan_period_END_DATE,
            ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
from SQLUser.payer_plan_period
    ) ppp1
    on p1.PERSON_ID = ppp1.PERSON_ID
where ppp1.rn1 = 1
group by CAST(floor((CAST(ppp1.payer_plan_period_end_date AS DATE) - CAST(ppp1.payer_plan_period_start_date AS DATE))/30) AS VARCHAR(255))
;



-- 1409	Number of persons with continuous payer plan in each year
-- Note: using table instead of nested query because this gives vastly improved
CREATE TABLE temp_dates_1409(obs_year NUMERIC);
INSERT INTO temp_dates_1409(obs_year)
SELECT
    distinct YEAR(payer_plan_period_start_date) as obs_year
FROM
    SQLUser.payer_plan_period
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1409(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1409(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1409 as analysis_id,
    CAST(t1.obs_year AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join
    SQLUser.payer_plan_period ppp1
    on p1.person_id = ppp1.person_id
        ,
    temp_dates_1409 t1
where YEAR(ppp1.payer_plan_period_START_DATE) <= t1.obs_year
    and YEAR(ppp1.payer_plan_period_END_DATE) >= t1.obs_year
    group by t1.obs_year
;

truncate table temp_dates_1409;
drop table temp_dates_1409;


-- 1410	Number of persons with continuous payer plan in each month
-- Note: using table instead of nested query because this gives vastly improved performance in Oracle
--HINT DISTRIBUTE_ON_KEY(obs_month)
CREATE TABLE temp_dates_1410(obs_month NUMERIC,obs_month_start DATE,obs_month_end DATE);
INSERT INTO temp_dates_1410(obs_month,obs_month_start,obs_month_end)
SELECT
    DISTINCT YEAR(payer_plan_period_start_date)*100 + MONTH(payer_plan_period_start_date) AS obs_month,
    TO_DATE(TO_CHAR(YEAR(payer_plan_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(payer_plan_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD') as obs_month_start,
    LAST_DAY(payer_plan_period_start_date)  as obs_month_end
FROM
    SQLUser.payer_plan_period
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1410(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1410(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1410 as analysis_id,
    CAST(obs_month AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join
    SQLUser.payer_plan_period ppp1
    on p1.person_id = ppp1.person_id
        ,
    temp_dates_1410
where ppp1.payer_plan_period_START_DATE <= obs_month_start
  and ppp1.payer_plan_period_END_DATE >= obs_month_end
group by obs_month
;

TRUNCATE TABLE temp_dates_1410;
DROP TABLE temp_dates_1410;


-- 1411	Number of persons by payer plan period start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1411(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1411(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1411 as analysis_id,
    TO_DATE(TO_CHAR(YEAR(payer_plan_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(payer_plan_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD') as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join SQLUser.payer_plan_period ppp1
                   on p1.person_id = ppp1.person_id
group by TO_DATE(TO_CHAR(YEAR(payer_plan_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(payer_plan_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD')
;



-- 1412	Number of persons by payer plan period end month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1412(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1412(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1412 as analysis_id,
    TO_DATE(TO_CHAR(YEAR(payer_plan_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(payer_plan_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD') as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join SQLUser.payer_plan_period ppp1
                   on p1.person_id = ppp1.person_id
group by TO_DATE(TO_CHAR(YEAR(payer_plan_period_start_date),'FM0000')||'-'||TO_CHAR(MONTH(payer_plan_period_start_date),'FM00')||'-'||TO_CHAR(1,'FM00'), 'YYYY-MM-DD')
;



-- 1413	Number of persons by number of payer plan periods
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1413(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1413(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1413 as analysis_id,
    CAST(ppp1.num_periods AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join (select person_id, COUNT(payer_plan_period_start_date) as num_periods from SQLUser.payer_plan_period group by PERSON_ID) ppp1
                   on p1.person_id = ppp1.person_id
group by ppp1.num_periods
;



-- 1414	Number of persons with payer plan period before year-of-birth
CREATE TABLE temp.s_tmpach_1414(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1414(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1414 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct p1.PERSON_ID) as count_value
FROM
    SQLUser.person p1
        inner join (select person_id, MIN(YEAR(payer_plan_period_start_date)) as first_obs_year from SQLUser.payer_plan_period group by PERSON_ID) ppp1
                   on p1.person_id = ppp1.person_id
where p1.year_of_birth > ppp1.first_obs_year
;



-- 1415	Number of persons with payer plan period end < start
CREATE TABLE temp.s_tmpach_1415(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1415(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1415 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(ppp1.PERSON_ID) as count_value
FROM
    SQLUser.payer_plan_period ppp1
where ppp1.payer_plan_period_end_date < ppp1.payer_plan_period_start_date
;



-- 1425	Number of payer_plan_period records, by payer_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1425(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1425(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1425 as analysis_id,
    cast(payer_source_concept_id AS varchar(255)) AS stratum_1,
    cast(null AS varchar(255)) AS stratum_2,
    cast(null as varchar(255)) as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.payer_plan_period
group by payer_source_concept_id;

-- 1800	Number of persons with at least one measurement occurrence, by measurement_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1800(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1800(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1800 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT m.person_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id;



-- 1801	Number of measurement occurrence records, by measurement_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1801(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1801(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1801 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(m.person_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id;



-- 1802	Number of persons by measurement occurrence start month, by measurement_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1802(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1802(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1802 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             m.measurement_concept_id AS stratum_1,
             YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) AS stratum_2,
             COUNT(DISTINCT m.person_id) AS count_value
FROM
             SQLUser.measurement m
             JOIN
             SQLUser.observation_period op
         ON
             m.person_id = op.person_id
             AND
             m.measurement_date >= op.observation_period_start_date
             AND
             m.measurement_date <= op.observation_period_end_date
         GROUP BY
             m.measurement_concept_id,
             YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
     );



-- 1803	Number of distinct measurement occurrence concepts per person
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.rawData (count_value NUMERIC);
INSERT INTO temp.rawData(count_value)
SELECT
    COUNT(DISTINCT m.measurement_concept_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.person_id;

CREATE TABLE temp.overallStats(avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(avg_value,stdev_value,min_value,max_value,total)
select
CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
from temp.rawData;

CREATE TABLE temp.statsView(count_value NUMERIC,total NUMERIC,rn NUMERIC);
INSERT INTO temp.statsView(count_value,total,rn)
select
count_value,
       COUNT(*) as total,
       row_number() over (order by count_value) as rn
FROM temp.rawData
group by count_value;

CREATE TABLE temp.priorStats(count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(count_value,total,accumulated)
select
s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on p.rn <= s.rn
group by s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1803(analysis_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1803(analysis_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1803 as analysis_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        CROSS JOIN temp.overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE temp.s_tmpach_dist_1803(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1803(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1803
;

truncate table temp.tempResults_1803;
drop table temp.tempResults_1803;
DROP TABLE temp.rawData;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1804	Number of persons with at least one measurement occurrence, by measurement_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1804(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1804(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1804 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             m.measurement_concept_id AS stratum_1,
             YEAR(m.measurement_date) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.measurement m
         ON
             p.person_id = m.person_id
             JOIN
             SQLUser.observation_period op
             ON
             m.person_id = op.person_id
             AND
             m.measurement_date >= op.observation_period_start_date
             AND
             m.measurement_date <= op.observation_period_end_date
         GROUP BY
             m.measurement_concept_id,
             YEAR(m.measurement_date),
             p.gender_concept_id,
             FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10)
     );



-- 1805	Number of measurement records, by measurement_concept_id by measurement_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1805(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1805(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1805 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(m.measurement_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(m.person_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id,
    m.measurement_type_concept_id;



-- 1806	Distribution of age by measurement_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_1806(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_1806(subject_id,gender_concept_id,count_value)
SELECT
    o.measurement_concept_id AS subject_id,
    p.gender_concept_id,
    o.measurement_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            m.person_id,
            m.measurement_concept_id,
            MIN(YEAR(m.measurement_date)) AS measurement_start_year
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        GROUP BY
            m.person_id,
            m.measurement_concept_id
    ) o
             ON
                     p.person_id = o.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_1806
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_1806
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_1806(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1806(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1806 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1806(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1806(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1806
;

truncate table temp.rawData_1806;
drop table temp.rawData_1806;
truncate table temp.tempResults_1806;
drop table temp.tempResults_1806;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 1807	Number of measurement occurrence records, by measurement_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1807(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1807(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1807 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(m.unit_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(m.person_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id,
    m.unit_concept_id;



-- 1809	Number of measurement records with invalid person_id
CREATE TABLE temp.s_tmpach_1809(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1809(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1809 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.measurement m
        left join SQLUser.person p1 on p1.person_id = m.person_id
where p1.person_id is null
;



-- 1810	Number of measurement records outside valid observation period
CREATE TABLE temp.s_tmpach_1810(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1810(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1810 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.measurement m
        left join SQLUser.observation_period op on op.person_id = m.person_id
        and m.measurement_date >= op.observation_period_start_date
        and m.measurement_date <= op.observation_period_end_date
where op.person_id is null
;



-- 1812	Number of measurement records with invalid provider_id
CREATE TABLE temp.s_tmpach_1812(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1812(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1812 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.measurement m
        left join SQLUser.provider p on p.provider_id = m.provider_id
where m.provider_id is not null
  and p.provider_id is null
;



-- 1813	Number of observation records with invalid visit_id
CREATE TABLE temp.s_tmpach_1813(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1813(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1813 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.measurement m
        left join SQLUser.visit_occurrence vo on m.visit_occurrence_id = vo.visit_occurrence_id
where m.visit_occurrence_id is not null
  and vo.visit_occurrence_id is null
;



-- 1814	Number of measurement records with no value (numeric or concept)
CREATE TABLE temp.s_tmpach_1814(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1814(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1814 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(m.person_id) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
WHERE
    m.value_as_number IS NULL
  AND
    m.value_as_concept_id IS NULL;



-- 1815  Distribution of numeric values, by measurement_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.statsView_1815(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView_1815(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
SELECT
    m.subject_id AS stratum1_id,
    m.unit_concept_id AS stratum2_id,
    m.count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
    (
SELECT
            m.measurement_concept_id AS subject_id,
            m.unit_concept_id,
            CAST(m.value_as_number AS NUMERIC) AS count_value
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        WHERE
            m.unit_concept_id IS NOT NULL
          AND
            m.value_as_number IS NOT NULL
    ) m
GROUP BY
    m.subject_id,
    m.unit_concept_id,
    m.count_value
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.tempResults_1815(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1815(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1815 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    (
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView_1815 s
                 join temp.statsView_1815 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
        group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
    ) p
        join
    (
SELECT
            m.subject_id AS stratum1_id,
            m.unit_concept_id AS stratum2_id,
            CAST(AVG(1.0 * m.count_value) AS NUMERIC) AS avg_value,
            CAST(STDDEV(m.count_value) AS NUMERIC) AS stdev_value,
            MIN(m.count_value) AS min_value,
            MAX(m.count_value) AS max_value,
            COUNT(*) AS total
FROM
            (
SELECT
                    m.measurement_concept_id AS subject_id,
                    m.unit_concept_id,
                    CAST(m.value_as_number AS NUMERIC) AS count_value
FROM
                    SQLUser.measurement m
                        JOIN
                    SQLUser.observation_period op
                    ON
                                m.person_id = op.person_id
                            AND
                                m.measurement_date >= op.observation_period_start_date
                            AND
                                m.measurement_date <= op.observation_period_end_date
                WHERE
                    m.unit_concept_id IS NOT NULL
                  AND
                    m.value_as_number IS NOT NULL
            ) m
        GROUP BY
            m.subject_id,
            m.unit_concept_id
    ) o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1815(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1815(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1815
;

truncate table temp.statsView_1815;
drop table temp.statsView_1815;
truncate table temp.tempResults_1815;
drop table temp.tempResults_1815;


-- 1816	Distribution of low range, by measurement_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats_1816(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats_1816(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
SELECT
    m.subject_id AS stratum1_id,
    m.unit_concept_id AS stratum2_id,
    CAST(AVG(1.0 * m.count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(m.count_value) AS NUMERIC) AS stdev_value,
    MIN(m.count_value) AS min_value,
    MAX(m.count_value) AS max_value,
    COUNT(*) AS total
FROM
    (
SELECT
            m.measurement_concept_id AS subject_id,
            m.unit_concept_id,
            CAST(m.range_low AS NUMERIC) AS count_value
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        WHERE
            m.unit_concept_id IS NOT NULL
          AND
            m.value_as_number IS NOT NULL
          AND
            m.range_low IS NOT NULL
          AND
            m.range_high IS NOT NULL
    ) m
GROUP BY
    m.subject_id,
    m.unit_concept_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.statsView_1816(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView_1816(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
SELECT
    m.subject_id AS stratum1_id,
    m.unit_concept_id AS stratum2_id,
    m.count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
    (
SELECT
            m.measurement_concept_id AS subject_id,
            m.unit_concept_id,
            CAST(m.range_low AS NUMERIC) AS count_value
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        WHERE
            m.unit_concept_id IS NOT NULL
          AND
            m.value_as_number IS NOT NULL
          AND
            m.range_low IS NOT NULL
          AND
            m.range_high IS NOT NULL
    ) m
GROUP BY
    m.subject_id,
    m.unit_concept_id,
    m.count_value
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.tempResults_1816(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1816(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1816 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    (
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView_1816 s
                 join temp.statsView_1816 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
        group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
    ) p
        join temp.overallStats_1816 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1816(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1816(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1816
;

truncate table temp.overallStats_1816;
drop table temp.overallStats_1816;
truncate table temp.statsView_1816;
drop table temp.statsView_1816;
truncate table temp.tempResults_1816;
drop table temp.tempResults_1816;


-- 1817	Distribution of high range, by observation_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats_1817(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats_1817(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
SELECT
    m.subject_id AS stratum1_id,
    m.unit_concept_id AS stratum2_id,
    CAST(AVG(1.0 * m.count_value) AS NUMERIC) AS avg_value,
    CAST(STDDEV(m.count_value) AS NUMERIC) AS stdev_value,
    MIN(m.count_value) AS min_value,
    MAX(m.count_value) AS max_value,
    COUNT(*) AS total
FROM
    (
SELECT
            measurement_concept_id AS subject_id,
            unit_concept_id,
            CAST(range_high AS NUMERIC) AS count_value
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        WHERE
            m.unit_concept_id IS NOT NULL
          AND
            m.value_as_number IS NOT NULL
          AND
            m.range_low IS NOT NULL
          AND
            m.range_high IS NOT NULL
    ) m
GROUP BY
    m.subject_id,
    m.unit_concept_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.statsView_1817(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView_1817(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
SELECT
    m.subject_id AS stratum1_id,
    m.unit_concept_id AS stratum2_id,
    m.count_value,
    COUNT(*) AS total,
    ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
    (
SELECT
            m.measurement_concept_id AS subject_id,
            m.unit_concept_id,
            CAST(m.range_high AS NUMERIC) AS count_value
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        WHERE
            m.unit_concept_id IS NOT NULL
          AND
            m.value_as_number IS NOT NULL
          AND
            m.range_low IS NOT NULL
          AND
            m.range_high IS NOT NULL
    ) m
GROUP BY
    m.subject_id,
    m.unit_concept_id,
    m.count_value
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.tempResults_1817(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_1817(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    1817 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    (
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView_1817 s
                 join temp.statsView_1817 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
        group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
    ) p
        join temp.overallStats_1817 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_1817(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_1817(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_1817
;

truncate table temp.overallStats_1817;
drop table temp.overallStats_1817;
truncate table temp.statsView_1817;
drop table temp.statsView_1817;
truncate table temp.tempResults_1817;
drop table temp.tempResults_1817;


-- 1818	Number of observation records below/within/above normal range, by observation_concept_id and unit_concept_id
--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE temp.rawData_1818(person_id INT,measurement_concept_id INT,unit_concept_id INT,stratum_3 VARCHAR(255));
INSERT INTO temp.rawData_1818(person_id,measurement_concept_id,unit_concept_id,stratum_3)
SELECT
    m.person_id,
    m.measurement_concept_id,
    m.unit_concept_id,
    CAST(CASE
             WHEN m.value_as_number < m.range_low
                 THEN 'Below Range Low'
             WHEN m.value_as_number >= m.range_low AND m.value_as_number <= m.range_high
                 THEN 'Within Range'
             WHEN m.value_as_number > m.range_high
                 THEN 'Above Range High'
             ELSE 'Other'
        END AS VARCHAR(255)) AS stratum_3
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
WHERE
    m.value_as_number IS NOT NULL
  AND
    m.unit_concept_id IS NOT NULL
  AND
    m.range_low IS NOT NULL
  AND
    m.range_high IS NOT NULL;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1818(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1818(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1818 AS analysis_id,
    CAST(measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(unit_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(person_id) AS count_value
FROM
    temp.rawData_1818
GROUP BY
    measurement_concept_id,
    unit_concept_id,
    stratum_3;

TRUNCATE TABLE temp.rawData_1818;
DROP TABLE temp.rawData_1818;


-- 1820	Number of measurement records  by measurement start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1820(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1820(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1820 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) AS stratum_1,
             COUNT(m.person_id) AS count_value
FROM
             SQLUser.measurement m
             JOIN
             SQLUser.observation_period op
         ON
             m.person_id = op.person_id
             AND
             m.measurement_date >= op.observation_period_start_date
             AND
             m.measurement_date <= op.observation_period_end_date
         GROUP BY
             YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
     );



-- 1821	Number of measurement records with no numeric value
CREATE TABLE temp.s_tmpach_1821(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1821(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1821 as analysis_id,
    cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.measurement m
where m.value_as_number is null
;



-- 1822	Number of measurement records, by measurement_concept_id and value_as_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1822(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1822(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1822 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(m.value_as_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id,
    m.value_as_concept_id;



-- 1823	Number of measurement records, by measurement_concept_id and operator_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1823(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1823(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1823 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(m.operator_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id,
    m.operator_concept_id;



-- 1825	Number of measurement records, by measurement_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1825(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1825(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1825 AS analysis_id,
    CAST(m.measurement_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_source_concept_id;



-- 1826	Number of measurement records, by value_as_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1826(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1826(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1826 AS analysis_id,
    CAST(m.value_as_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.value_as_concept_id;



-- 1827	Number of measurement records, by unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1827(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1827(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1827 AS analysis_id,
    CAST(m.unit_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.unit_concept_id;



-- 1830	Number of measurement records inside a valid observation period
CREATE TABLE temp.s_tmpach_1830(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1830(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1830 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
;



-- 1831	Proportion of people with at least one measurement record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in measurement (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT m.person_id) AS person_count
FROM
    SQLUser.measurement m
        LEFT JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.m_total(person_count NUMERIC);
INSERT INTO temp.m_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.measurement;

CREATE TABLE temp.s_tmpach_1831(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1831(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1831 AS analysis_id,
    CASE WHEN mt.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/mt.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(mt.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.m_total mt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.m_total;


-- 1832	Proportion of measurement records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of measurement records outside a valid observation period (numerator)
-- stratum_3:   Number of measurement records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.measurement m
        LEFT JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.m_total(record_count NUMERIC);
INSERT INTO temp.m_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.measurement;

CREATE TABLE temp.s_tmpach_1832(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1832(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1832 AS analysis_id,
    CASE WHEN mt.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/mt.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(mt.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.m_total mt
;
DROP TABLE temp.op_outside;
DROP TABLE temp.m_total;


-- 1833	Proportion of measurement records with a valid observation period, but no value; stratified by measurement_concept_id
--
-- stratum_1:   measurement_concept_id
-- stratum_2:   Number of measurement records with no value for the given measurement_concept_id
-- stratum_3:   Proportion == stratum_2/count_value
-- count_value: Number of measurement records for the given measurement_concept_id
--
CREATE TABLE temp.s_tmpach_1833(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1833(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1833 AS analysis_id,
    m.measurement_concept_id AS stratum_1,
    CAST(SUM(CASE WHEN m.value_as_number IS NULL
        AND COALESCE(m.value_as_concept_id,0) = 0
                      THEN 1 ELSE 0 END) AS VARCHAR(255))  AS stratum_2,
    CAST(CAST(1.0*SUM(CASE WHEN m.value_as_number IS NULL AND COALESCE(m.value_as_concept_id,0) = 0
                               THEN 1 ELSE 0 END)/(CASE WHEN COUNT(*)=0 THEN 1 ELSE COUNT(*) END) AS NUMERIC(7,6)) AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.measurement m
        JOIN
    SQLUser.observation_period op
    ON
                m.person_id = op.person_id
            AND
                m.measurement_date >= op.observation_period_start_date
            AND
                m.measurement_date <= op.observation_period_end_date
GROUP BY
    m.measurement_concept_id
;



-- 1891	Number of total persons that have at least x measurements
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1891(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1891(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1891 AS analysis_id,
    CAST(m.measurement_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(m.meas_cnt AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SUM(COUNT(m.person_id)) OVER (PARTITION BY m.measurement_concept_id ORDER BY m.meas_cnt DESC) AS count_value
FROM
    (
SELECT
            m.measurement_concept_id,
            COUNT(m.measurement_id) AS meas_cnt,
            m.person_id
FROM
            SQLUser.measurement m
                JOIN
            SQLUser.observation_period op
            ON
                        m.person_id = op.person_id
                    AND
                        m.measurement_date >= op.observation_period_start_date
                    AND
                        m.measurement_date <= op.observation_period_end_date
        GROUP BY
            m.person_id,
            m.measurement_concept_id
    ) m
GROUP BY
    m.measurement_concept_id,
    m.meas_cnt;


-- 1900	completeness report
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_1900(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_1900(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    1900 as analysis_id,
    cast(table_name as varchar(255)) as stratum_1,
    cast(column_name as varchar(255)) as stratum_2,
    source_value as stratum_3,
    cast(null as varchar(255)) as stratum_4,
    cast(null as varchar(255)) as stratum_5,
    cnt as count_value
FROM
    (
select
'measurement' as table_name, 'measurement_source_value' as column_name, measurement_source_value as source_value, COUNT(*) as cnt from SQLUser.measurement where measurement_concept_id = 0 group by measurement_source_value
        union
select
'measurement' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from SQLUser.measurement where unit_concept_id = 0 group by unit_source_value
        union
select
'procedure_occurrence' as table_name,'procedure_source_value' as column_name, procedure_source_value as source_value, COUNT(*) as cnt from SQLUser.procedure_occurrence where procedure_concept_id = 0 group by procedure_source_value
        union
select
'procedure_occurrence' as table_name,'modifier_source_value' as column_name, modifier_source_value as source_value, COUNT(*) as cnt from SQLUser.procedure_occurrence where modifier_concept_id = 0 group by modifier_source_value
        union
select
'drug_exposure' as table_name, 'drug_source_value' as column_name, drug_source_value as source_value, COUNT(*) as cnt from SQLUser.drug_exposure where drug_concept_id = 0 group by drug_source_value
        union
select
'drug_exposure' as table_name, 'route_source_value' as column_name, route_source_value as source_value, COUNT(*) as cnt from SQLUser.drug_exposure where route_concept_id = 0 group by route_source_value
        union
select
'condition_occurrence' as table_name, 'condition_source_value' as column_name, condition_source_value as source_value, COUNT(*) as cnt from SQLUser.condition_occurrence where condition_concept_id = 0 group by condition_source_value
        union
select
'condition_occurrence' as table_name, 'condition_status_source_value' as column_name, condition_status_source_value as source_value, COUNT(*) as cnt from SQLUser.condition_occurrence where condition_status_concept_id = 0 group by condition_status_source_value
        union
select
'observation' as table_name, 'observation_source_value' as column_name, observation_source_value as source_value, COUNT(*) as cnt from SQLUser.observation where observation_concept_id = 0 group by observation_source_value
        union
select
'observation' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from SQLUser.observation where unit_concept_id = 0 group by unit_source_value
        union
select
'observation' as table_name, 'qualifier_source_value' as column_name, qualifier_source_value as source_value, COUNT(*) as cnt from SQLUser.observation where qualifier_concept_id = 0 group by qualifier_source_value
        union
select
'payer_plan_period' as table_name, 'payer_source_value' as column_name, payer_source_value as source_value, COUNT(*) as cnt from SQLUser.payer_plan_period where payer_concept_id = 0 group by payer_source_value
        union
select
'payer_plan_period' as table_name, 'plan_source_value' as column_name, plan_source_value as source_value, COUNT(*) as cnt from SQLUser.payer_plan_period where plan_concept_id = 0 group by plan_source_value
        union
select
'payer_plan_period' as table_name, 'sponsor_source_value' as column_name, sponsor_source_value as source_value, COUNT(*) as cnt from SQLUser.payer_plan_period where sponsor_concept_id = 0 group by sponsor_source_value
        union
select
'payer_plan_period' as table_name, 'stop_reason_source_value' as column_name, stop_reason_source_value as source_value, COUNT(*) as cnt from SQLUser.payer_plan_period where stop_reason_concept_id = 0 group by stop_reason_source_value
        union
select
'provider' as table_name, 'specialty_source_value' as column_name, specialty_source_value as source_value, COUNT(*) as cnt from SQLUser.provider where specialty_concept_id = 0 group by specialty_source_value
        union
select
'provider' as table_name, 'gender_source_value' as column_name, gender_source_value as source_value, COUNT(*) as cnt from SQLUser.provider where gender_concept_id = 0 group by gender_source_value
        union
select
'person' as table_name, 'gender_source_value' as column_name, gender_source_value as source_value, COUNT(*) as cnt from SQLUser.person where gender_concept_id = 0 group by gender_source_value
        union
select
'person' as table_name, 'race_source_value' as column_name, race_source_value as source_value, COUNT(*) as cnt from SQLUser.person where race_concept_id = 0 group by race_source_value
        union
select
'person' as table_name, 'ethnicity_source_value' as column_name, ethnicity_source_value as source_value, COUNT(*) as cnt from SQLUser.person where ethnicity_concept_id = 0 group by ethnicity_source_value
        union
select
'specimen' as table_name, 'specimen_source_value' as column_name, specimen_source_value as source_value, COUNT(*) as cnt from SQLUser.specimen where specimen_concept_id = 0 group by specimen_source_value
        union
select
'specimen' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from SQLUser.specimen where unit_concept_id = 0 group by unit_source_value
        union
select
'specimen' as table_name, 'anatomic_site_source_value' as column_name, anatomic_site_source_value as source_value, COUNT(*) as cnt from SQLUser.specimen where anatomic_site_concept_id = 0 group by anatomic_site_source_value
        union
select
'specimen' as table_name, 'disease_status_source_value' as column_name, disease_status_source_value as source_value, COUNT(*) as cnt from SQLUser.specimen where disease_status_concept_id = 0 group by disease_status_source_value
        union
select
'visit_occurrence' as table_name, 'visit_source_value' as column_name, visit_source_value as source_value, COUNT(*) as cnt from SQLUser.visit_occurrence where visit_concept_id = 0 group by visit_source_value
        union
select
'visit_occurrence' as table_name, 'admitting_source_value' as column_name, admitting_source_value as source_value, COUNT(*) as cnt from SQLUser.visit_occurrence where admitting_source_concept_id = 0 group by admitting_source_value
        union
select
'visit_occurrence' as table_name, 'discharge_to_source_value' as column_name, discharge_to_source_value as source_value, COUNT(*) as cnt from SQLUser.visit_occurrence where discharge_to_concept_id = 0 group by discharge_to_source_value
        union
select
'device_exposure' as table_name, 'device_source_value' as column_name, device_source_value as source_value, COUNT(*) as cnt from SQLUser.device_exposure where device_concept_id = 0 group by device_source_value
        union
select
'death' as table_name, 'cause_source_value' as column_name, cause_source_value as source_value, COUNT(*) as cnt from SQLUser.death where cause_concept_id = 0 group by cause_source_value
    ) a
where cnt >= 1
;


-- 2000	patients with at least 1 Dx and 1 Rx
CREATE TABLE temp.s_tmpach_2000(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2000(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2000 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    CAST(d.cnt AS BIGINT) AS count_value
FROM (
    SELECT
    COUNT(*) cnt
    FROM (
        SELECT
        DISTINCT a.person_id as person_id
        FROM
            (SELECT
            co.person_id
            FROM
            SQLUser.condition_occurrence co
                JOIN
            SQLUser.observation_period op
            ON
            co.person_id = op.person_id
            AND
            co.condition_start_date >= op.observation_period_start_date
            AND
            co.condition_start_date <= op.observation_period_end_date
            ) a
                 INNER JOIN
            (SELECT DISTINCT person_id
             FROM (SELECT de.person_id
                   FROM SQLUser.drug_exposure de
                            JOIN
                        SQLUser.observation_period op
                        ON
                                    de.person_id = op.person_id
                                AND
                                    de.drug_exposure_start_date >= op.observation_period_start_date
                                AND
                                    de.drug_exposure_start_date <= op.observation_period_end_date)
             )b
                ON
            a.person_id = b.person_id
    ) c
) d;



-- 2001	patients with at least 1 Dx and 1 Proc
CREATE TABLE temp.s_tmpach_2001(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2001(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2000 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    CAST(d.cnt AS BIGINT) AS count_value
FROM
    (SELECT
    COUNT(*) cnt
    FROM (
        SELECT
        DISTINCT a.person_id as person_id
        FROM
            (SELECT
            co.person_id
            FROM
            SQLUser.condition_occurrence co
                JOIN
            SQLUser.observation_period op
            ON
            co.person_id = op.person_id
            AND
            co.condition_start_date >= op.observation_period_start_date
            AND
            co.condition_start_date <= op.observation_period_end_date
            ) a
                 INNER JOIN
            (SELECT DISTINCT person_id
             FROM (SELECT de.person_id
                   FROM SQLUser.drug_exposure de
                            JOIN
                        SQLUser.observation_period op
                        ON
                                    de.person_id = op.person_id
                                AND
                                    de.drug_exposure_start_date >= op.observation_period_start_date
                                AND
                                    de.drug_exposure_start_date <= op.observation_period_end_date)
             )b
                ON
            a.person_id = b.person_id
    ) c
) d;



-- 2002	patients with at least 1 Mes and 1 Dx and 1 Rx
CREATE TABLE temp.s_tmpach_2002(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2002(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2002 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    CAST(e.cnt AS BIGINT) AS count_value
FROM
    (SELECT
    COUNT(*) cnt
    FROM
        (SELECT
        DISTINCT a.person_id as person_id
        FROM
            (SELECT
            m.person_id
            FROM
                SQLUser.measurement m
                    JOIN
                SQLUser.observation_period op
                    ON
                m.person_id = op.person_id
                    AND
                m.measurement_date >= op.observation_period_start_date
                    AND
                m.measurement_date <= op.observation_period_end_date
            ) a
            INNER JOIN
            (SELECT DISTINCT b.person_id
             FROM (SELECT co.person_id
                   FROM SQLUser.condition_occurrence co
                            JOIN
                        SQLUser.observation_period op
                        ON
                                    co.person_id = op.person_id
                                AND
                                    co.condition_start_date >= op.observation_period_start_date
                                AND
                                    co.condition_start_date <= op.observation_period_end_date) b
                      INNER JOIN
                  (SELECT DISTINCT person_id
                   FROM (SELECT de.person_id
                         FROM SQLUser.drug_exposure de
                                  JOIN
                              SQLUser.observation_period op
                              ON
                                          de.person_id = op.person_id
                                      AND
                                          de.drug_exposure_start_date >= op.observation_period_start_date
                                      AND
                                          de.drug_exposure_start_date <= op.observation_period_end_date)c ) t1
                  ON b.person_id = t1.person_id
             ) t
            ON a.person_id = t.person_id
        ) d
    ) e;



-- 2003	Patients with at least one visit
-- this analysis is in fact redundant, since it is possible to get it via
-- dist analysis 203 and queryselect count_value from achilles_results_dist where analysis_id = 203;
CREATE TABLE temp.s_tmpach_2003(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2003(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2003 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT vo.person_id) AS count_value
FROM
    SQLUser.visit_occurrence vo
        JOIN
    SQLUser.observation_period op
    ON
                vo.person_id = op.person_id
            AND
                vo.visit_start_date >= op.observation_period_start_date
            AND
                vo.visit_start_date <= op.observation_period_end_date;



-- Analysis 2004: Number of distinct patients that overlap between specific domains
-- Bit String Breakdown:   1) Condition Occurrence 2) Drug Exposure 3) Device Exposure 4) Measurement 5) Death 6) Procedure Occurrence 7) Observation
CREATE TABLE temp.conoc(person_id INT);
INSERT INTO temp.conoc(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.condition_occurrence;

CREATE TABLE temp.drexp(person_id INT);
INSERT INTO temp.drexp(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.drug_exposure;

CREATE TABLE temp.dvexp(person_id INT);
INSERT INTO temp.dvexp(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.device_exposure;

CREATE TABLE temp.msmt(person_id INT);
INSERT INTO temp.msmt(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.measurement;

CREATE TABLE temp.death(person_id INT);
INSERT INTO temp.death(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.death;

CREATE TABLE temp.prococ(person_id INT);
INSERT INTO temp.prococ(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.procedure_occurrence;

CREATE TABLE temp.obs(person_id INT);
INSERT INTO temp.obs(person_id)
SELECT
    distinct person_id
FROM
    SQLUser.observation;

CREATE TABLE temp.s_tmpach_2004(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2004(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
2004 as analysis_id,
       CAST('0000001' as VARCHAR(255)) as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.obs) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb
UNION ALL
select
2004 as analysis_id,
       '0000010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.prococ) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb
UNION ALL
select
2004 as analysis_id,
       '0000011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.prococ a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb
UNION ALL
select
2004 as analysis_id,
       '0000100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.death) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0000101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.death a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0000110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.death a inner join temp.prococ b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0000111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.death a inner join temp.prococ b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.msmt) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.prococ b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.prococ b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.death b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.death b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0001111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.msmt a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.dvexp) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.prococ b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.prococ b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.death b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.death b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0010111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0011111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.dvexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.drexp) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.prococ b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.prococ b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.death b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.death b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0100111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0101111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0110111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '0111111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.drexp a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select person_id from temp.conoc) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.obs b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.prococ b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.prococ b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.death b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.death b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1000111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.death b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1001111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.msmt b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1010111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1011111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.dvexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.obs c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.prococ c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1100111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.death c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1101111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.msmt c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.obs d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.prococ d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1110111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.death d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111000' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111001' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.obs e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111010' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111011' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.prococ e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111100' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.death e on d.person_id = e.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111101' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.death e on d.person_id = e.person_id inner join temp.obs f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111110' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.death e on d.person_id = e.person_id inner join temp.prococ f on e.person_id = f.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb UNION ALL
select
2004 as analysis_id,
       '1111111' as stratum_1,
       cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as varchar(255)) as stratum_2,
       CAST(NULL AS VARCHAR(255)) as stratum_3,
       CAST(NULL AS VARCHAR(255)) as stratum_4,
       CAST(NULL AS VARCHAR(255)) as stratum_5,
       personIntersection.count_value
from
    (select count(*) as count_value from(select a.person_id from temp.conoc a inner join temp.drexp b on a.person_id = b.person_id inner join temp.dvexp c on b.person_id = c.person_id inner join temp.msmt d on c.person_id = d.person_id inner join temp.death e on d.person_id = e.person_id inner join temp.prococ f on e.person_id = f.person_id inner join temp.obs g on f.person_id = g.person_id) as subquery) as personIntersection,
    (select count(distinct(person_id)) as totalPersons from SQLUser.person) as totalPersonsDb;

DROP TABLE temp.conoc;
DROP TABLE temp.death;
DROP TABLE temp.drexp;
DROP TABLE temp.dvexp;
DROP TABLE temp.msmt;
DROP TABLE temp.obs;
DROP TABLE temp.prococ;

-- 2100	Number of persons with at least one device exposure , by device_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2100(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2100(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2100 AS analysis_id,
    CAST(de.device_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(DISTINCT de.person_id) AS count_value
FROM
    SQLUser.device_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.device_concept_id;



-- 2101	Number of device exposure  records, by device_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2101(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2101(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2101 AS analysis_id,
    CAST(de.device_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(de.person_id) AS count_value
FROM
    SQLUser.device_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.device_concept_id;



-- 2102	Number of persons by device by  start month, by device_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2102(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2102(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2102 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             de.device_concept_id AS stratum_1,
             YEAR(de.device_exposure_start_date) * 100 + MONTH(de.device_exposure_start_date) AS stratum_2,
             COUNT(DISTINCT de.person_id) AS count_value
FROM
             SQLUser.device_exposure de
             JOIN
             SQLUser.observation_period op
         ON
             de.person_id = op.person_id
             AND
             de.device_exposure_start_date >= op.observation_period_start_date
             AND
             de.device_exposure_start_date <= op.observation_period_end_date
         GROUP BY
             de.device_concept_id,
             YEAR(de.device_exposure_start_date) * 100 + MONTH(de.device_exposure_start_date)
     );



-- 2104	Number of persons with at least one device occurrence, by device_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2104(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2104(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2104 AS analysis_id,
    CAST(stratum_1 AS VARCHAR(255)) AS stratum_1,
    CAST(stratum_2 AS VARCHAR(255)) AS stratum_2,
    CAST(stratum_3 AS VARCHAR(255)) AS stratum_3,
    CAST(stratum_4 AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    count_value
FROM (
SELECT
             de.device_concept_id AS stratum_1,
             YEAR(de.device_exposure_start_date) AS stratum_2,
             p.gender_concept_id AS stratum_3,
             FLOOR((YEAR(de.device_exposure_start_date) - p.year_of_birth) / 10) AS stratum_4,
             COUNT(DISTINCT p.person_id) AS count_value
FROM
             SQLUser.person p
             JOIN
             SQLUser.device_exposure de
         ON
             p.person_id = de.person_id
             JOIN
             SQLUser.observation_period op
             ON
             de.person_id = op.person_id
             AND
             de.device_exposure_start_date >= op.observation_period_start_date
             AND
             de.device_exposure_start_date <= op.observation_period_end_date
         GROUP BY
             de.device_concept_id,
             YEAR(de.device_exposure_start_date),
             p.gender_concept_id,
             FLOOR((YEAR(de.device_exposure_start_date) - p.year_of_birth) / 10)
     );



-- 2105	Number of exposure records by device_concept_id by device_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2105(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2105(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2105 AS analysis_id,
    CAST(de.device_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(de.device_type_concept_id AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(de.person_id) AS count_value
FROM
    SQLUser.device_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.device_concept_id,
    de.device_type_concept_id;



-- 2106	Distribution of age by device_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE temp.rawData_2106(subject_id INT,gender_concept_id INT,count_value NUMERIC);
INSERT INTO temp.rawData_2106(subject_id,gender_concept_id,count_value)
SELECT
    o.device_concept_id AS subject_id,
    p.gender_concept_id,
    o.device_exposure_start_year - p.year_of_birth AS count_value
FROM
    SQLUser.person p
        JOIN (
SELECT
            d.person_id,
            d.device_concept_id,
            MIN(YEAR(d.device_exposure_start_date)) AS device_exposure_start_year
FROM
            SQLUser.device_exposure d
                JOIN
            SQLUser.observation_period op
            ON
                        d.person_id = op.person_id
                    AND
                        d.device_exposure_start_date >= op.observation_period_start_date
                    AND
                        d.device_exposure_start_date <= op.observation_period_end_date
        GROUP BY
            d.person_id,
            d.device_concept_id
    ) o
             ON
                     p.person_id = o.person_id
;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE temp.overallStats(stratum1_id INT,stratum2_id INT,avg_value NUMERIC,stdev_value NUMERIC,min_value NUMERIC,max_value NUMERIC,total NUMERIC);
INSERT INTO temp.overallStats(stratum1_id,stratum2_id,avg_value,stdev_value,min_value,max_value,total)
select
subject_id as stratum1_id,
       gender_concept_id as stratum2_id,
       CAST(avg(1.0 * count_value) AS NUMERIC) as avg_value,
       CAST(STDDEV(count_value) AS NUMERIC) as stdev_value,
       min(count_value) as min_value,
       max(count_value) as max_value,
       COUNT(*) as total
FROM temp.rawData_2106
group by subject_id, gender_concept_id;

CREATE TABLE temp.statsView(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,subject_id INT,rn NUMERIC);
INSERT INTO temp.statsView(stratum1_id,stratum2_id,count_value,total,subject_id,rn)
select
subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
FROM temp.rawData_2106
group by subject_id, gender_concept_id, count_value;

CREATE TABLE temp.priorStats(stratum1_id INT,stratum2_id INT,count_value NUMERIC,total NUMERIC,accumulated NUMERIC);
INSERT INTO temp.priorStats(stratum1_id,stratum2_id,count_value,total,accumulated)
select
s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
from temp.statsView s
         join temp.statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn;

CREATE TABLE temp.tempResults_2106(analysis_id INT,stratum1_id INT,stratum2_id INT,count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.tempResults_2106(analysis_id,stratum1_id,stratum2_id,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    2106 as analysis_id,
    CAST(o.stratum1_id AS VARCHAR(255)) AS stratum1_id,
    CAST(o.stratum2_id AS VARCHAR(255)) AS stratum2_id,
    o.total as count_value,
    o.min_value,
    o.max_value,
    o.avg_value,
    o.stdev_value,
    MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
    MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
    MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
    MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
    MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
    temp.priorStats p
        join temp.overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_dist_2106(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC,min_value NUMERIC,max_value NUMERIC,avg_value NUMERIC,stdev_value NUMERIC,median_value NUMERIC,p10_value NUMERIC,p25_value NUMERIC,p75_value NUMERIC,p90_value NUMERIC);
INSERT INTO temp.s_tmpach_dist_2106(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
    analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2,
    cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
    temp.tempResults_2106
;

truncate table temp.rawData_2106;
drop table temp.rawData_2106;
truncate table temp.tempResults_2106;
drop table temp.tempResults_2106;
DROP TABLE temp.overallStats;
DROP TABLE temp.statsView;
DROP TABLE temp.priorStats;

-- 2110	Number of device exposure records outside a valid observation period
CREATE TABLE temp.s_tmpach_2110(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2110(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2110 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.device_exposure de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL
;



-- 2125	Number of device_exposure records, by device_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2125(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2125(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2125 AS analysis_id,
    CAST(de.device_source_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.device_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
GROUP BY
    de.device_source_concept_id;



-- 2130	Number of device exposure records inside a valid observation period
CREATE TABLE temp.s_tmpach_2130(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2130(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2130 AS analysis_id,
    CAST(NULL AS VARCHAR(255)) AS stratum_1,
    CAST(NULL AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    COUNT(*) AS count_value
FROM
    SQLUser.device_exposure de
        JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
;



-- 2131	Proportion of people with at least one device_exposure record outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimal places
-- stratum_2:   Number of people with a record outside a valid observation period (numerator)
-- stratum_3:   Number of people in device_exposure (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (person_count NUMERIC);
INSERT INTO temp.op_outside (person_count)
SELECT
    COUNT(DISTINCT de.person_id) AS person_count
FROM
    SQLUser.device_exposure de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(person_count NUMERIC);
INSERT INTO temp.de_total(person_count)
SELECT
    COUNT(DISTINCT person_id) person_count
FROM
    SQLUser.device_exposure;

CREATE TABLE temp.s_tmpach_2131(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2131(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2131 AS analysis_id,
    CASE WHEN det.person_count != 0 THEN
             CAST(CAST(1.0*op.person_count/det.person_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.person_count AS VARCHAR(255)) AS stratum_2,
    CAST(det.person_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.person_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total det
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 2132	Proportion of device_exposure records outside a valid observation period
--
-- stratum_1:   Proportion to 6 decimals places
-- stratum_2:   Number of device_exposure records outside a valid observation period (numerator)
-- stratum_3:   Number of device_exposure records (denominator)
-- count_value: Flag (0 or 1) indicating whether any such records exist
--
CREATE TABLE temp.op_outside (record_count NUMERIC);
INSERT INTO temp.op_outside (record_count)
SELECT
    COUNT(*) AS record_count
FROM
    SQLUser.device_exposure de
        LEFT JOIN
    SQLUser.observation_period op
    ON
                de.person_id = op.person_id
            AND
                de.device_exposure_start_date >= op.observation_period_start_date
            AND
                de.device_exposure_start_date <= op.observation_period_end_date
WHERE
    op.person_id IS NULL;

CREATE TABLE temp.de_total(record_count NUMERIC);
INSERT INTO temp.de_total(record_count)
SELECT
    COUNT(*) record_count
FROM
    SQLUser.device_exposure;

CREATE TABLE temp.s_tmpach_2132(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2132(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2132 AS analysis_id,
    CASE WHEN det.record_count != 0 THEN
             CAST(CAST(1.0*op.record_count/det.record_count AS NUMERIC(7,6)) AS VARCHAR(255))
         ELSE
             CAST(NULL AS VARCHAR(255))
        END AS stratum_1,
    CAST(op.record_count AS VARCHAR(255)) AS stratum_2,
    CAST(det.record_count AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SIGN(op.record_count) AS count_value
FROM
    temp.op_outside op
        CROSS JOIN
    temp.de_total det
;
DROP TABLE temp.op_outside;
DROP TABLE temp.de_total;


-- 2191	Number of total persons that have at least x measurements
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2191(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2191(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2191 AS analysis_id,
    CAST(d.device_concept_id AS VARCHAR(255)) AS stratum_1,
    CAST(d.device_count AS VARCHAR(255)) AS stratum_2,
    CAST(NULL AS VARCHAR(255)) AS stratum_3,
    CAST(NULL AS VARCHAR(255)) AS stratum_4,
    CAST(NULL AS VARCHAR(255)) AS stratum_5,
    SUM(COUNT(d.person_id)) OVER (PARTITION BY d.device_concept_id ORDER BY d.device_count DESC) AS count_value
FROM
    (
SELECT
            d.device_concept_id,
            COUNT(d.device_exposure_id) AS device_count,
            d.person_id
FROM
            SQLUser.device_exposure d
                JOIN
            SQLUser.observation_period op
            ON
                        d.person_id = op.person_id
                    AND
                        d.device_exposure_start_date >= op.observation_period_start_date
                    AND
                        d.device_exposure_start_date <= op.observation_period_end_date
        GROUP BY
            d.person_id,
            d.device_concept_id
    ) d
GROUP BY
    d.device_concept_id,
    d.device_count;



-- 2200	Number of persons with at least one note , by note_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2200(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2200(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2200 as analysis_id,
    CAST(m.note_type_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(distinct m.PERSON_ID) as count_value
FROM
    SQLUser.note m
group by m.note_type_CONCEPT_ID
;



-- 2201	Number of note records, by note_type_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE temp.s_tmpach_2201(analysis_id INT,stratum_1 VARCHAR(255),stratum_2 VARCHAR(255),stratum_3 VARCHAR(255),stratum_4 VARCHAR(255),stratum_5 VARCHAR(255),count_value NUMERIC);
INSERT INTO temp.s_tmpach_2201(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
    2201 as analysis_id,
    CAST(m.note_type_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
    cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
    COUNT(m.PERSON_ID) as count_value
FROM
    SQLUser.note m
group by m.note_type_CONCEPT_ID
;


--HINT DISTRIBUTE_ON_KEY(analysis_id)
INSERT INTO results.achilles_results(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value)
SELECT
analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value
FROM
(
  select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_0
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_3
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_4
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_5
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_7
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_8
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_9
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_10
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_11
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_12
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_101
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_102
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_108
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_109
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_110
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_111
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_112
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_113
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_114
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_115
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_116
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_117
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_118
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_119
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_200
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_201
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_202
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_204
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_207
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_209
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_210
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_211
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_212
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_220
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_221
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_225
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_226
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_230
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_231
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_232
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_300
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_301
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_303
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_325
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_400
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_401
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_402
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_404
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_405
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_409
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_410
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_411
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_412
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_413
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_414
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_415
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_416
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_420
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_425
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_430
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_431
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_432
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_500
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_501
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_502
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_504
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_505
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_509
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_510
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_525
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_530
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_531
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_532
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_600
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_601
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_602
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_604
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_605
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_609
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_610
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_612
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_613
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_620
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_625
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_630
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_631
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_632
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_691
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_700
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_701
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_702
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_704
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_705
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_709
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_710
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_711
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_712
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_713
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_720
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_725
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_730
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_731
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_732
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_791
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_800
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_801
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_802
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_804
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_805
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_807
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_809
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_810
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_812
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_813
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_814
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_820
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_822
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_823
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_825
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_826
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_827
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_830
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_831
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_832
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_891
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_900
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_901
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_902
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_904
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_908
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_910
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_911
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_920
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_930
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_931
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_932
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1000
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1001
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1002
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1004
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1008
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1010
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1011
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1020
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1030
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1031
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1032
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1100
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1101
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1102
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1103
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1200
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1201
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1202
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1203
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1300
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1301
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1302
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1304
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1307
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1309
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1310
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1311
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1312
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1320
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1321
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1325
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1326
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1330
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1331
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1332
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1408
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1409
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1410
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1411
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1412
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1413
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1414
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1415
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1425
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1800
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1801
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1802
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1804
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1805
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1807
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1809
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1810
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1812
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1813
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1814
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1818
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1820
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1821
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1822
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1823
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1825
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1826
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1827
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1830
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1831
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1832
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1833
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1891
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_1900
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2000
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2001
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2002
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2003
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2004
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2100
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2101
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2102
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2104
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2105
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2110
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2125
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2130
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2131
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2132
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2191
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2200
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value from
                   temp.s_tmpach_2201
) Q
  where count_value > 5
;


--HINT DISTRIBUTE_ON_KEY(analysis_id)
INSERT INTO results.achilles_results_dist(analysis_id,stratum_1,stratum_2,stratum_3,stratum_4,stratum_5,count_value,min_value,max_value,avg_value,stdev_value,median_value,p10_value,p25_value,p75_value,p90_value)
SELECT
analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
(
  select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_0
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_103
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_104
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_105
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_106
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_107
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_203
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_206
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_213
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_403
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_406
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_506
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_511
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_512
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_513
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_514
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_515
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_603
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_606
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_703
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_706
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_715
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_716
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_717
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_803
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_806
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_815
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_903
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_906
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_907
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1003
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1006
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1007
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1303
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1306
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1313
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1406
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1407
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1803
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1806
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1815
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1816
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_1817
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as varchar(255)) as stratum_1, cast(stratum_2 as varchar(255)) as stratum_2, cast(stratum_3 as varchar(255)) as stratum_3, cast(stratum_4 as varchar(255)) as stratum_4, cast(stratum_5 as varchar(255)) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as NUMERIC) as min_value, cast(max_value as NUMERIC) as max_value, cast(avg_value as NUMERIC) as avg_value, cast(stdev_value as NUMERIC) as stdev_value, cast(median_value as NUMERIC) as median_value, cast(p10_value as NUMERIC) as p10_value, cast(p25_value as NUMERIC) as p25_value, cast(p75_value as NUMERIC) as p75_value, cast(p90_value as NUMERIC) as p90_value from
                   temp.s_tmpach_dist_2106
) Q
  where count_value > 5
;


drop index results.achilles_results.idx_ar_aid;

drop index results.achilles_results.idx_ar_s1;

drop index results.achilles_results.idx_ar_s2;

drop index results.achilles_results.idx_ar_aid_s1;

drop index results.achilles_results.idx_ar_aid_s1234;

drop index results.achilles_results_dist.idx_ard_aid;

drop index results.achilles_results_dist.idx_ard_s1;

drop index results.achilles_results_dist.idx_ard_s2;

create index results.achilles_results.idx_ar_aid on results.achilles_results (analysis_id);

create index results.achilles_results.idx_ar_s1 on results.achilles_results (stratum_1);

create index results.achilles_results.idx_ar_s2 on results.achilles_results (stratum_2);

create index results.achilles_results.idx_ar_aid_s1 on results.achilles_results (analysis_id,stratum_1);

create index results.achilles_results.idx_ar_aid_s1234 on results.achilles_results (analysis_id,stratum_1,stratum_2,stratum_3,stratum_4);

create index results.achilles_results_dist.idx_ard_aid on results.achilles_results_dist (analysis_id);

create index results.achilles_results_dist.idx_ard_s1 on results.achilles_results_dist (stratum_1);

create index results.achilles_results_dist.idx_ard_s2 on results.achilles_results_dist (stratum_2);

DROP TABLE temp.s_tmpach_0;
DROP TABLE temp.s_tmpach_1;
DROP TABLE temp.s_tmpach_2;
DROP TABLE temp.s_tmpach_3;
DROP TABLE temp.s_tmpach_4;
DROP TABLE temp.s_tmpach_5;
DROP TABLE temp.s_tmpach_7;
DROP TABLE temp.s_tmpach_8;
DROP TABLE temp.s_tmpach_9;
DROP TABLE temp.s_tmpach_10;
DROP TABLE temp.s_tmpach_11;
DROP TABLE temp.s_tmpach_12;
DROP TABLE temp.s_tmpach_101;
DROP TABLE temp.s_tmpach_102;
DROP TABLE temp.s_tmpach_108;
DROP TABLE temp.s_tmpach_109;
DROP TABLE temp.s_tmpach_110;
DROP TABLE temp.s_tmpach_111;
DROP TABLE temp.s_tmpach_112;
DROP TABLE temp.s_tmpach_113;
DROP TABLE temp.s_tmpach_114;
DROP TABLE temp.s_tmpach_115;
DROP TABLE temp.s_tmpach_116;
DROP TABLE temp.s_tmpach_117;
DROP TABLE temp.s_tmpach_118;
DROP TABLE temp.s_tmpach_119;
DROP TABLE temp.s_tmpach_200;
DROP TABLE temp.s_tmpach_201;
DROP TABLE temp.s_tmpach_202;
DROP TABLE temp.s_tmpach_204;
DROP TABLE temp.s_tmpach_207;
DROP TABLE temp.s_tmpach_209;
DROP TABLE temp.s_tmpach_210;
DROP TABLE temp.s_tmpach_211;
DROP TABLE temp.s_tmpach_212;
DROP TABLE temp.s_tmpach_220;
DROP TABLE temp.s_tmpach_221;
DROP TABLE temp.s_tmpach_225;
DROP TABLE temp.s_tmpach_226;
DROP TABLE temp.s_tmpach_230;
DROP TABLE temp.s_tmpach_231;
DROP TABLE temp.s_tmpach_232;
DROP TABLE temp.s_tmpach_300;
DROP TABLE temp.s_tmpach_301;
DROP TABLE temp.s_tmpach_303;
DROP TABLE temp.s_tmpach_325;
DROP TABLE temp.s_tmpach_400;
DROP TABLE temp.s_tmpach_401;
DROP TABLE temp.s_tmpach_402;
DROP TABLE temp.s_tmpach_404;
DROP TABLE temp.s_tmpach_405;
DROP TABLE temp.s_tmpach_409;
DROP TABLE temp.s_tmpach_410;
DROP TABLE temp.s_tmpach_411;
DROP TABLE temp.s_tmpach_412;
DROP TABLE temp.s_tmpach_413;
DROP TABLE temp.s_tmpach_414;
DROP TABLE temp.s_tmpach_415;
DROP TABLE temp.s_tmpach_416;
DROP TABLE temp.s_tmpach_420;
DROP TABLE temp.s_tmpach_425;
DROP TABLE temp.s_tmpach_430;
DROP TABLE temp.s_tmpach_431;
DROP TABLE temp.s_tmpach_432;
DROP TABLE temp.s_tmpach_500;
DROP TABLE temp.s_tmpach_501;
DROP TABLE temp.s_tmpach_502;
DROP TABLE temp.s_tmpach_504;
DROP TABLE temp.s_tmpach_505;
DROP TABLE temp.s_tmpach_509;
DROP TABLE temp.s_tmpach_510;
DROP TABLE temp.s_tmpach_525;
DROP TABLE temp.s_tmpach_530;
DROP TABLE temp.s_tmpach_531;
DROP TABLE temp.s_tmpach_532;
DROP TABLE temp.s_tmpach_600;
DROP TABLE temp.s_tmpach_601;
DROP TABLE temp.s_tmpach_602;
DROP TABLE temp.s_tmpach_604;
DROP TABLE temp.s_tmpach_605;
DROP TABLE temp.s_tmpach_609;
DROP TABLE temp.s_tmpach_610;
DROP TABLE temp.s_tmpach_612;
DROP TABLE temp.s_tmpach_613;
DROP TABLE temp.s_tmpach_620;
DROP TABLE temp.s_tmpach_625;
DROP TABLE temp.s_tmpach_630;
DROP TABLE temp.s_tmpach_631;
DROP TABLE temp.s_tmpach_632;
DROP TABLE temp.s_tmpach_691;
DROP TABLE temp.s_tmpach_700;
DROP TABLE temp.s_tmpach_701;
DROP TABLE temp.s_tmpach_702;
DROP TABLE temp.s_tmpach_704;
DROP TABLE temp.s_tmpach_705;
DROP TABLE temp.s_tmpach_709;
DROP TABLE temp.s_tmpach_710;
DROP TABLE temp.s_tmpach_711;
DROP TABLE temp.s_tmpach_712;
DROP TABLE temp.s_tmpach_713;
DROP TABLE temp.s_tmpach_720;
DROP TABLE temp.s_tmpach_725;
DROP TABLE temp.s_tmpach_730;
DROP TABLE temp.s_tmpach_731;
DROP TABLE temp.s_tmpach_732;
DROP TABLE temp.s_tmpach_791;
DROP TABLE temp.s_tmpach_800;
DROP TABLE temp.s_tmpach_801;
DROP TABLE temp.s_tmpach_802;
DROP TABLE temp.s_tmpach_804;
DROP TABLE temp.s_tmpach_805;
DROP TABLE temp.s_tmpach_807;
DROP TABLE temp.s_tmpach_809;
DROP TABLE temp.s_tmpach_810;
DROP TABLE temp.s_tmpach_812;
DROP TABLE temp.s_tmpach_813;
DROP TABLE temp.s_tmpach_814;
DROP TABLE temp.s_tmpach_820;
DROP TABLE temp.s_tmpach_822;
DROP TABLE temp.s_tmpach_823;
DROP TABLE temp.s_tmpach_825;
DROP TABLE temp.s_tmpach_826;
DROP TABLE temp.s_tmpach_827;
DROP TABLE temp.s_tmpach_830;
DROP TABLE temp.s_tmpach_831;
DROP TABLE temp.s_tmpach_832;
DROP TABLE temp.s_tmpach_891;
DROP TABLE temp.s_tmpach_900;
DROP TABLE temp.s_tmpach_901;
DROP TABLE temp.s_tmpach_902;
DROP TABLE temp.s_tmpach_904;
DROP TABLE temp.s_tmpach_908;
DROP TABLE temp.s_tmpach_910;
DROP TABLE temp.s_tmpach_911;
DROP TABLE temp.s_tmpach_920;
DROP TABLE temp.s_tmpach_930;
DROP TABLE temp.s_tmpach_931;
DROP TABLE temp.s_tmpach_932;
DROP TABLE temp.s_tmpach_1000;
DROP TABLE temp.s_tmpach_1001;
DROP TABLE temp.s_tmpach_1002;
DROP TABLE temp.s_tmpach_1004;
DROP TABLE temp.s_tmpach_1008;
DROP TABLE temp.s_tmpach_1010;
DROP TABLE temp.s_tmpach_1011;
DROP TABLE temp.s_tmpach_1020;
DROP TABLE temp.s_tmpach_1030;
DROP TABLE temp.s_tmpach_1031;
DROP TABLE temp.s_tmpach_1032;
DROP TABLE temp.s_tmpach_1100;
DROP TABLE temp.s_tmpach_1101;
DROP TABLE temp.s_tmpach_1102;
DROP TABLE temp.s_tmpach_1103;
DROP TABLE temp.s_tmpach_1200;
DROP TABLE temp.s_tmpach_1201;
DROP TABLE temp.s_tmpach_1202;
DROP TABLE temp.s_tmpach_1203;
DROP TABLE temp.s_tmpach_1300;
DROP TABLE temp.s_tmpach_1301;
DROP TABLE temp.s_tmpach_1302;
DROP TABLE temp.s_tmpach_1304;
DROP TABLE temp.s_tmpach_1307;
DROP TABLE temp.s_tmpach_1309;
DROP TABLE temp.s_tmpach_1310;
DROP TABLE temp.s_tmpach_1311;
DROP TABLE temp.s_tmpach_1312;
DROP TABLE temp.s_tmpach_1320;
DROP TABLE temp.s_tmpach_1321;
DROP TABLE temp.s_tmpach_1325;
DROP TABLE temp.s_tmpach_1326;
DROP TABLE temp.s_tmpach_1330;
DROP TABLE temp.s_tmpach_1331;
DROP TABLE temp.s_tmpach_1332;
DROP TABLE temp.s_tmpach_1408;
DROP TABLE temp.s_tmpach_1409;
DROP TABLE temp.s_tmpach_1410;
DROP TABLE temp.s_tmpach_1411;
DROP TABLE temp.s_tmpach_1412;
DROP TABLE temp.s_tmpach_1413;
DROP TABLE temp.s_tmpach_1414;
DROP TABLE temp.s_tmpach_1415;
DROP TABLE temp.s_tmpach_1425;
DROP TABLE temp.s_tmpach_1800;
DROP TABLE temp.s_tmpach_1801;
DROP TABLE temp.s_tmpach_1802;
DROP TABLE temp.s_tmpach_1804;
DROP TABLE temp.s_tmpach_1805;
DROP TABLE temp.s_tmpach_1807;
DROP TABLE temp.s_tmpach_1809;
DROP TABLE temp.s_tmpach_1810;
DROP TABLE temp.s_tmpach_1812;
DROP TABLE temp.s_tmpach_1813;
DROP TABLE temp.s_tmpach_1814;
DROP TABLE temp.s_tmpach_1818;
DROP TABLE temp.s_tmpach_1820;
DROP TABLE temp.s_tmpach_1821;
DROP TABLE temp.s_tmpach_1822;
DROP TABLE temp.s_tmpach_1823;
DROP TABLE temp.s_tmpach_1825;
DROP TABLE temp.s_tmpach_1826;
DROP TABLE temp.s_tmpach_1827;
DROP TABLE temp.s_tmpach_1830;
DROP TABLE temp.s_tmpach_1831;
DROP TABLE temp.s_tmpach_1832;
DROP TABLE temp.s_tmpach_1833;
DROP TABLE temp.s_tmpach_1891;
DROP TABLE temp.s_tmpach_1900;
DROP TABLE temp.s_tmpach_2000;
DROP TABLE temp.s_tmpach_2001;
DROP TABLE temp.s_tmpach_2002;
DROP TABLE temp.s_tmpach_2003;
DROP TABLE temp.s_tmpach_2004;
DROP TABLE temp.s_tmpach_2100;
DROP TABLE temp.s_tmpach_2101;
DROP TABLE temp.s_tmpach_2102;
DROP TABLE temp.s_tmpach_2104;
DROP TABLE temp.s_tmpach_2105;
DROP TABLE temp.s_tmpach_2110;
DROP TABLE temp.s_tmpach_2125;
DROP TABLE temp.s_tmpach_2130;
DROP TABLE temp.s_tmpach_2131;
DROP TABLE temp.s_tmpach_2132;
DROP TABLE temp.s_tmpach_2191;
DROP TABLE temp.s_tmpach_2200;
DROP TABLE temp.s_tmpach_2201;
DROP TABLE temp.s_tmpach_dist_0;
DROP TABLE temp.s_tmpach_dist_103;
DROP TABLE temp.s_tmpach_dist_104;
DROP TABLE temp.s_tmpach_dist_105;
DROP TABLE temp.s_tmpach_dist_106;
DROP TABLE temp.s_tmpach_dist_107;
DROP TABLE temp.s_tmpach_dist_203;
DROP TABLE temp.s_tmpach_dist_206;
DROP TABLE temp.s_tmpach_dist_213;
DROP TABLE temp.s_tmpach_dist_403;
DROP TABLE temp.s_tmpach_dist_406;
DROP TABLE temp.s_tmpach_dist_506;
DROP TABLE temp.s_tmpach_dist_511;
DROP TABLE temp.s_tmpach_dist_512;
DROP TABLE temp.s_tmpach_dist_513;
DROP TABLE temp.s_tmpach_dist_514;
DROP TABLE temp.s_tmpach_dist_515;
DROP TABLE temp.s_tmpach_dist_603;
DROP TABLE temp.s_tmpach_dist_606;
DROP TABLE temp.s_tmpach_dist_703;
DROP TABLE temp.s_tmpach_dist_706;
DROP TABLE temp.s_tmpach_dist_715;
DROP TABLE temp.s_tmpach_dist_716;
DROP TABLE temp.s_tmpach_dist_717;
DROP TABLE temp.s_tmpach_dist_803;
DROP TABLE temp.s_tmpach_dist_806;
DROP TABLE temp.s_tmpach_dist_815;
DROP TABLE temp.s_tmpach_dist_903;
DROP TABLE temp.s_tmpach_dist_906;
DROP TABLE temp.s_tmpach_dist_907;
DROP TABLE temp.s_tmpach_dist_1003;
DROP TABLE temp.s_tmpach_dist_1006;
DROP TABLE temp.s_tmpach_dist_1007;
DROP TABLE temp.s_tmpach_dist_1303;
DROP TABLE temp.s_tmpach_dist_1306;
DROP TABLE temp.s_tmpach_dist_1313;
DROP TABLE temp.s_tmpach_dist_1406;
DROP TABLE temp.s_tmpach_dist_1407;
DROP TABLE temp.s_tmpach_dist_1803;
DROP TABLE temp.s_tmpach_dist_1806;
DROP TABLE temp.s_tmpach_dist_1815;
DROP TABLE temp.s_tmpach_dist_1816;
DROP TABLE temp.s_tmpach_dist_1817;
DROP TABLE temp.s_tmpach_dist_2106;