CREATE DATABASE MobileData;
USE MobileData;
CREATE TABLE mobiles (
    Company_Name VARCHAR(255),
    Model_Name VARCHAR(255),
    Mobile_Weight FLOAT,
    RAM VARCHAR(50),  -- If kept as string
    Front_Camera VARCHAR(300),
    Back_Camera VARCHAR(300),
    Processor VARCHAR(255),
    Battery_Capacity FLOAT,
    Screen_Size VARCHAR(50), -- If kept as string
    Launched_Price_Pakistan FLOAT,
    Launched_Price_India FLOAT,
    Launched_Price_China FLOAT,
    Launched_Price_USA FLOAT,
    Launched_Price_Dubai FLOAT,
    Launched_Year INT
);
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_mobile_data.csv'
    INTO TABLE mobiles
	FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
 SELECT * FROM mobiles LIMIT 10;
 SELECT COUNT(*) AS total_records FROM mobiles;
 SELECT DISTINCT Company_Name FROM mobiles;
 SELECT 
  MIN(Battery_Capacity) AS min_battery,
  MAX(Battery_Capacity) AS max_battery,
  AVG(Battery_Capacity) AS avg_battery
FROM mobiles;

SELECT Company_Name, COUNT(*) AS total_models 
FROM mobiles 
GROUP BY Company_Name 
ORDER BY total_models DESC 
LIMIT 5;

SELECT Company_Name, AVG(CAST(RAM AS FLOAT)) AS avg_ram
FROM mobiles
GROUP BY Company_Name
ORDER BY avg_ram DESC;

SELECT 
    Company_Name, Model_Name, 
    Launched_Price_India, 
    Launched_Price_USA, 
    Launched_Price_Dubai 
FROM mobiles 
ORDER BY Launched_Price_India DESC 
LIMIT 10;



SELECT Company_Name, Model_Name, Launched_Price_India 
FROM mobiles 
ORDER BY Launched_Price_India DESC 
LIMIT 10;

SELECT Company_Name, Model_Name, Battery_Capacity 
FROM mobiles 
ORDER BY Battery_Capacity DESC 
LIMIT 10;
SELECT COUNT(*) AS total_records FROM mobiles;
SELECT 
  SUM(CASE WHEN RAM IS NULL THEN 1 ELSE 0 END) AS missing_RAM,
  SUM(CASE WHEN Battery_Capacity IS NULL THEN 1 ELSE 0 END) AS missing_Battery
FROM mobiles;

SELECT DISTINCT Company_Name FROM mobiles;
SELECT 
  MIN(Battery_Capacity) AS min_battery,
  MAX(Battery_Capacity) AS max_battery,
  AVG(Battery_Capacity) AS avg_battery
FROM mobiles;

SELECT Company_Name, COUNT(*) AS total_models 
FROM mobiles 
GROUP BY Company_Name 
ORDER BY total_models DESC 
LIMIT 5;

SELECT Company_Name, AVG(CAST(RAM AS FLOAT)) AS avg_ram
FROM mobiles
GROUP BY Company_Name
ORDER BY avg_ram DESC;

SELECT 
    Company_Name, Model_Name, 
    Launched_Price_India, 
    Launched_Price_USA, 
    Launched_Price_Dubai 
FROM mobiles 
ORDER BY Launched_Price_India DESC 
LIMIT 10;

SELECT Company_Name, Model_Name, Battery_Capacity 
FROM mobiles 
ORDER BY Battery_Capacity DESC 
LIMIT 10;





EXPLAIN SELECT * FROM mobiles WHERE Company_Name = 'Samsung';
CREATE INDEX idx_company ON mobiles(Company_Name);

GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

SELECT * FROM mobiles INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/exported_data.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';





