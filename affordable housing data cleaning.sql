/*
1.Imported and inspected the raw data structure.
2.Fixed encoding issues by renaming a corrupted column (ï»¿X → X).
3.Checked for duplicate records using window functions — no duplicates found.
4.Added a temporary ID column to track records during cleaning, then removed it.
5.Identified and reviewed missing values, especially in AGENCY_CALCULATED.
6.Standardized text fields, including:
 -Replacing multiple spaces with commas
 -Cleaning patterns like and → &
 -Correcting inconsistent text formats (21-20Phase 1 → 21-20)
7.Extracted date and time from GIS_LAST_MOD_DTTM into separate DATE and TIME columns.
8.Verified unique identifiers such as CASE_ID.
9.Performed final schema checks and reviewed the fully cleaned table.

*/

-- Select everything from the table
SELECT * FROM affordable_housing.affordable_housing;

-- Rename column that has encoding issue (ï»¿X to X)
ALTER TABLE affordable_housing
RENAME COLUMN ï»¿X TO X;

-- Check the table again after renaming
SELECT * FROM affordable_housing.affordable_housing;

-- Check for duplicates by counting rows with same values in key columns using windows function
SELECT count(*) 
FROM(
SELECT  ROW_NUMBER() 
OVER( PARTITION BY X, Y, OBJECTID, MAR_WARD, ADDRESS, PROJECT_NAME, STATUS_PUBLIC, AGENCY_CALCULATED, TOTAL_AFFORDABLE_UNITS, LATITUDE, LONGITUDE, AFFORDABLE_UNITS_AT_0_30_AMI, 
AFFORDABLE_UNITS_AT_31_50_AMI, AFFORDABLE_UNITS_AT_51_60_AMI, AFFORDABLE_UNITS_AT_61_80_AMI, 
AFFORDABLE_UNITS_AT_81_AMI, CASE_ID, MAR_ID, XCOORD, YCOORD, FULLADDRESS, GIS_LAST_MOD_DTTM) as duplicates
FROM affordable_housing) as cnt;

-- Find IDs of duplicate rows if any exist
SELECT id
FROM (
SELECT id, ROW_NUMBER() 
OVER( PARTITION BY X, Y, OBJECTID, MAR_WARD, ADDRESS, PROJECT_NAME, STATUS_PUBLIC, AGENCY_CALCULATED, TOTAL_AFFORDABLE_UNITS, LATITUDE, LONGITUDE, AFFORDABLE_UNITS_AT_0_30_AMI, 
AFFORDABLE_UNITS_AT_31_50_AMI, AFFORDABLE_UNITS_AT_51_60_AMI, AFFORDABLE_UNITS_AT_61_80_AMI, 
AFFORDABLE_UNITS_AT_81_AMI, CASE_ID, MAR_ID, XCOORD, YCOORD, FULLADDRESS, GIS_LAST_MOD_DTTM) as duplicates
FROM affordable_housing
) dup
WHERE duplicates > 1;
 
-- NO DUPLICATES FOUND 

-- Add a unique ID column to the table
ALTER TABLE affordable_housing
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Verify ID column added
SELECT *, id
FROM affordable_housing;

-- Check rows where AGENCY_CALCULATED is empty
SELECT ID, AGENCY_CALCULATED
FROM affordable_housing
WHERE AGENCY_CALCULATED = '';

-- Show full rows with empty AGENCY_CALCULATED
SELECT *
FROM affordable_housing
WHERE ID IN (SELECT ID
FROM affordable_housing
WHERE AGENCY_CALCULATED = '');

-- View full table
SELECT *
FROM affordable_housing;

-- List unique values in AGENCY_CALCULATED
SELECT DISTINCT AGENCY_CALCULATED
FROM affordable_housing;

-- Preview what happens if spaces are replaced with commas
SELECT REGEXP_REPLACE(AGENCY_CALCULATED, ' ', ', ')
FROM affordable_housing;

-- Update AGENCY_CALCULATED to replace spaces with commas
UPDATE affordable_housing
SET AGENCY_CALCULATED = REGEXP_REPLACE(AGENCY_CALCULATED, ' ', ', ');

-- Check updated table
SELECT *
FROM affordable_housing;

-- Extract only the date part from GIS_LAST_MOD_DTTM
SELECT SUBSTRING_INDEX(GIS_LAST_MOD_DTTM,' ',1) as Last_Mod_Date
FROM affordable_housing;

-- Extract only the time part from GIS_LAST_MOD_DTTM
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(GIS_LAST_MOD_DTTM,' ',-1),'+',1) as Last_Mod_Dttm
FROM affordable_housing;

-- Add new column for date
ALTER TABLE affordable_housing
ADD COLUMN Last_Mod_Date DATE;

-- View table to confirm new column
SELECT *
FROM affordable_housing;

-- Fill Last_Mod_Date column by converting text to proper date format
UPDATE affordable_housing
SET Last_Mod_Date = STR_TO_DATE(SUBSTRING_INDEX(GIS_LAST_MOD_DTTM,' ',1), '%Y/%m/%d');

-- Add new column for time
ALTER TABLE affordable_housing
ADD COLUMN Last_Mod_Dttm TIME;

-- Fill Last_Mod_Dttm column with time values
UPDATE affordable_housing
SET Last_Mod_Dttm  = SUBSTRING_INDEX(SUBSTRING_INDEX(GIS_LAST_MOD_DTTM,' ',-1),'+',1);

-- Check unique case IDs
SELECT DISTINCT CASE_ID
FROM affordable_housing;

-- Drop the ID column if no longer needed
ALTER TABLE affordable_housing
DROP COLUMN id;

-- Check table structure
DESCRIBE affordable_housing;

-- Preview cleaning CASE_ID (replace 'and       ' with '&')
SELECT DISTINCT CASE_ID, TRIM(REPLACE(CASE_ID,'and       ', '&'))
FROM affordable_housing;

-- Apply cleaning to CASE_ID column
UPDATE affordable_housing
SET CASE_ID = TRIM(REPLACE(CASE_ID,'and       ', '&'));

-- Recheck distinct CASE_ID values
SELECT DISTINCT CASE_ID
FROM affordable_housing;

-- Preview cleaning another pattern in CASE_ID
SELECT DISTINCT CASE_ID, TRIM(REPLACE(CASE_ID,'21-20Phase 1', '21-20' ))
FROM affordable_housing;

-- Apply that cleanup
UPDATE affordable_housing
SET CASE_ID = TRIM(REPLACE(CASE_ID,'21-20Phase 1', '21-20' ));

-- Final view of cleaned table
SELECT *
FROM affordable_housing;
