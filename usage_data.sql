SET GLOBAL local_infile = 'ON';

DROP DATABASE IF EXISTS e_Services_Usage;
CREATE DATABASE e_Services_Usage;
USE e_Services_Usage;

-- Table for regions usage
CREATE TABLE regions_usage (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    usage_2021 DECIMAL(5,2),
    usage_2022 DECIMAL(5,2),
    usage_2023 DECIMAL(5,2),
    usage_2024 DECIMAL(5,2)
);

-- Table for gender usage
CREATE TABLE gender_usage (
    gender_id INT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(20) NOT NULL,
    usage_2021 DECIMAL(5,2),
    usage_2022 DECIMAL(5,2),
    usage_2023 DECIMAL(5,2),
    usage_2024 DECIMAL(5,2)
);

LOAD DATA LOCAL INFILE 'D:/UsageData/regions_data.csv'
INTO TABLE regions_usage
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(region_name, usage_2021, usage_2022, usage_2023, usage_2024);

LOAD DATA LOCAL INFILE 'D:/UsageData/gender_data.csv'
INTO TABLE gender_usage
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(gender, usage_2021, usage_2022, usage_2023, usage_2024);


SELECT * FROM regions_usage;
SELECT * FROM gender_usage;