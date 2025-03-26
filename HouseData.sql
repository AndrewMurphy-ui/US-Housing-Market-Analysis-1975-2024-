-- Create and Use Database
CREATE DATABASE house_db;
USE house_db;

-- Import Original Data
SELECT * FROM hpi_master_origional;
SELECT * FROM hpi_master_test;

-- Verify Data Import
SELECT * FROM hpi_master_test;
SELECT MAX(LENGTH(place_id)) FROM hpi_master_test;
SELECT COUNT(*) FROM hpi_master_test WHERE frequency = 'monthly';

-- Create hpi_monthly Table
CREATE TABLE hpi_monthly (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hpi_type VARCHAR(20),
    hpi_flavor VARCHAR(20),
    frequency ENUM('monthly') NOT NULL,
    level VARCHAR(15),
    place_name VARCHAR(100),
    place_id VARCHAR(20) NOT NULL,
    yr SMALLINT UNSIGNED,
    period TINYINT UNSIGNED,
    index_nsa FLOAT,
    index_sa FLOAT,
    INDEX (place_name, yr, period)
);

-- Adjust level column size if needed
SELECT MAX(LENGTH(level)) FROM hpi_master_test;
SELECT level FROM hpi_master_test ORDER BY LENGTH(level) DESC LIMIT 5;
ALTER TABLE hpi_monthly MODIFY COLUMN level VARCHAR(50);

-- Insert Monthly Data
INSERT INTO hpi_monthly (
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
)
SELECT 
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
FROM hpi_master_test
WHERE frequency = 'monthly';

-- Create hpi_quarterly Table
CREATE TABLE hpi_quarterly (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hpi_type VARCHAR(20),
    hpi_flavor VARCHAR(20),
    frequency ENUM('quarterly') NOT NULL,
    level VARCHAR(15),
    place_name VARCHAR(100),
    place_id VARCHAR(20) NOT NULL,
    yr SMALLINT UNSIGNED,
    period TINYINT UNSIGNED,
    index_nsa FLOAT,
    index_sa FLOAT,
    INDEX (place_name, yr, period)
);

-- Adjust level column size if needed
SELECT MAX(LENGTH(level)) FROM hpi_master_test WHERE frequency = 'quarterly';
SELECT level FROM hpi_master_test WHERE frequency = 'quarterly' ORDER BY LENGTH(level) DESC LIMIT 5;
ALTER TABLE hpi_quarterly MODIFY COLUMN level VARCHAR(100);

-- Insert Quarterly Data
INSERT INTO hpi_quarterly (
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
)
SELECT 
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
FROM hpi_master_test
WHERE frequency = 'quarterly';

-- Calculate Year-over-Year (YoY) Change for Monthly Data
ALTER TABLE hpi_monthly ADD COLUMN IF NOT EXISTS yoy_change FLOAT;

-- Check for duplicates before updating
SELECT place_name, yr, period, COUNT(*)
FROM hpi_monthly
GROUP BY place_name, yr, period
HAVING COUNT(*) > 1;

-- Update YoY Change for Monthly Data
UPDATE hpi_monthly AS m
JOIN (
    SELECT 
        place_name, 
        yr, 
        period, 
        ((index_nsa - LAG(index_nsa, 12) OVER (PARTITION BY place_name ORDER BY yr, period)) / 
         LAG(index_nsa, 12) OVER (PARTITION BY place_name ORDER BY yr, period)) * 100 AS yoy_change
    FROM hpi_monthly
) AS subquery
ON m.place_name = subquery.place_name AND m.yr = subquery.yr AND m.period = subquery.period
SET m.yoy_change = subquery.yoy_change
WHERE subquery.yoy_change IS NOT NULL;

-- Handle NULL values in YoY Change
SET SQL_SAFE_UPDATES = 0;
UPDATE hpi_monthly
SET yoy_change = 0
WHERE yoy_change IS NULL;
SET SQL_SAFE_UPDATES = 1;

-- Calculate Year-over-Year (YoY) Change for Quarterly Data
ALTER TABLE hpi_quarterly ADD COLUMN IF NOT EXISTS yoy_change FLOAT;

-- Check for duplicates before updating
SELECT place_name, yr, period, COUNT(*)
FROM hpi_quarterly
GROUP BY place_name, yr, period
HAVING COUNT(*) > 1 OR COUNT(*) < 1;

-- Update YoY Change for Quarterly Data
UPDATE hpi_quarterly q
JOIN (
    SELECT 
        place_name, 
        yr, 
        period, 
        ((index_nsa - LAG(index_nsa, 4) OVER (PARTITION BY place_name ORDER BY yr, period)) /  
         LAG(index_nsa, 4) OVER (PARTITION BY place_name ORDER BY yr, period)) * 100 AS yoy_change
    FROM hpi_quarterly
) AS subquery
ON q.place_name = subquery.place_name AND q.yr = subquery.yr AND q.period = subquery.period
SET q.yoy_change = subquery.yoy_change
WHERE subquery.yoy_change IS NOT NULL;

-- Handle NULL values in YoY Change
SET SQL_SAFE_UPDATES = 0;
UPDATE hpi_quarterly
SET yoy_change = 0
WHERE yoy_change IS NULL;
SET SQL_SAFE_UPDATES = 1;

-- Round YoY Change Values to Two Decimal Places
SET SQL_SAFE_UPDATES = 0;
UPDATE hpi_monthly
SET yoy_change = ROUND(yoy_change, 2);
UPDATE hpi_quarterly
SET yoy_change = ROUND(yoy_change, 2);
SET SQL_SAFE_UPDATES = 1;
