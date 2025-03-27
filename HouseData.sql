-- ============================================
-- 🏠 House Price Index Database Setup
-- ============================================

-- 1️⃣ Create and Use Database
CREATE DATABASE IF NOT EXISTS house_db;
USE house_db;

-- ============================================
-- 2️⃣ Import Original Data
-- ============================================

-- (Assumes the raw dataset is already available as `hpi_master_original`)
SELECT * FROM hpi_master_original;

-- Verify Data Import
SELECT * FROM hpi_master_original LIMIT 10;
SELECT COUNT(*) FROM hpi_master_original WHERE frequency = 'monthly';

-- ============================================
-- 3️⃣ Create Tables for Monthly and Quarterly Data
-- ============================================

-- 🗂️ Create hpi_monthly Table
CREATE TABLE IF NOT EXISTS hpi_monthly (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hpi_type VARCHAR(20),
    hpi_flavor VARCHAR(20),
    frequency ENUM('monthly') NOT NULL,
    level VARCHAR(50),
    place_name VARCHAR(100),
    place_id VARCHAR(20) NOT NULL,
    yr SMALLINT UNSIGNED,
    period TINYINT UNSIGNED,
    index_nsa FLOAT,
    index_sa FLOAT,
    PeriodDate DATE,
    yoy_change FLOAT,
    INDEX (place_name, yr, period)
);

-- 🗂️ Create hpi_quarterly Table
CREATE TABLE IF NOT EXISTS hpi_quarterly (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hpi_type VARCHAR(20),
    hpi_flavor VARCHAR(20),
    frequency ENUM('quarterly') NOT NULL,
    level VARCHAR(100),
    place_name VARCHAR(100),
    place_id VARCHAR(20) NOT NULL,
    yr SMALLINT UNSIGNED,
    period TINYINT UNSIGNED,
    index_nsa FLOAT,
    index_sa FLOAT,
    yoy_change FLOAT,
    INDEX (place_name, yr, period)
);

-- ============================================
-- 4️⃣ Insert Data into Monthly & Quarterly Tables
-- ============================================

-- Insert Monthly Data
INSERT INTO hpi_monthly (
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
)
SELECT 
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
FROM hpi_master_original
WHERE frequency = 'monthly';

-- Insert Quarterly Data
INSERT INTO hpi_quarterly (
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
)
SELECT 
    hpi_type, hpi_flavor, frequency, level, place_name, place_id, yr, period, index_nsa, index_sa
FROM hpi_master_original
WHERE frequency = 'quarterly';

-- ============================================
-- 5️⃣ Fix Date Column (PeriodDate) for Monthly Data
-- ============================================

-- Add 'PeriodDate' column if not exists
ALTER TABLE hpi_monthly ADD COLUMN IF NOT EXISTS PeriodDate DATE;

-- Populate 'PeriodDate' with correct date format
SET SQL_SAFE_UPDATES = 0;
UPDATE hpi_monthly
SET PeriodDate = CAST(CONCAT(yr, '-', LPAD(period, 2, '0'), '-01') AS DATE);
SET SQL_SAFE_UPDATES = 1;

-- ============================================
-- 6️⃣ Calculate Year-over-Year (YoY) Change
-- ============================================

-- 🏠 Monthly YoY Change
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
SET m.yoy_change = ROUND(subquery.yoy_change, 2)
WHERE subquery.yoy_change IS NOT NULL;

-- 🏠 Quarterly YoY Change
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
SET q.yoy_change = ROUND(subquery.yoy_change, 2)
WHERE subquery.yoy_change IS NOT NULL;