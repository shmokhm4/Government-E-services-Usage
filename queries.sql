-- Which five regions had the highest usage rates in 2024?
SELECT region_name, usage_2024
FROM regions_usage
ORDER BY usage_2024 DESC
LIMIT 5;

-- Which region recorded the lowest usage rate in 2024?
SELECT region_name, usage_2024
FROM regions_usage
ORDER BY usage_2024 ASC
LIMIT 1;

-- Which regions showed an increase in usage between 2021 and 2024?
SELECT region_name, usage_2021, usage_2024
FROM regions_usage
WHERE usage_2024 > usage_2021;

-- What was the average usage across all regions for each year from 2021 to 2024?
SELECT 
    AVG(usage_2021) AS avg_2021,
    AVG(usage_2022) AS avg_2022,
    AVG(usage_2023) AS avg_2023,
    AVG(usage_2024) AS avg_2024
FROM regions_usage;

-- Which gender had the higher usage rate in 2023?
SELECT gender, usage_2023
FROM gender_usage
ORDER BY usage_2023 DESC;

-- Did any gender show an increase in usage from 2021 to 2024?
SELECT gender, usage_2021, usage_2024
FROM gender_usage
WHERE usage_2024 > usage_2021;

-- In 2024, which had the highest usage: the top region or the top gender?
SELECT 
    r.region_name,
    r.usage_2024 AS region_usage_2024,
    g.gender,
    g.usage_2024 AS gender_usage_2024
FROM regions_usage r
JOIN gender_usage g
ON 1=1   -- cross join (combine all rows)
WHERE r.usage_2024 = (SELECT MAX(usage_2024) FROM regions_usage)
  AND g.usage_2024 = (SELECT MAX(usage_2024) FROM gender_usage);
