------------------------------------------------------------------------------------------
/*#03] DATA QUALIFY Examples from given data.*/
------------------------------------------------------------------------------------------
--If SQL returns more than 1 row, its a data quality issue

------------------------------------------------------------------------------------------
--#1/NULL examples
--snowSQL
SELECT
	'NULLS' As DQ_CASE_DESCRIPTION,
	'PURCHASEDATE' As FIELD,
	PURCHASEDATE As VALUE
FROM RECEIPTS
WHERE PURCHASEDATE IS NULL;
UNION
SELECT
	'NULLS' As DQ_CASE_DESCRIPTION
	DATESCANNED
FROM RECEIPTS
WHERE DATESCANNED IS NULL;

------------------------------------------------------------------------------------------
--#2/DATA ISSUES1
--Assuming timestamps given are epoch timestamps
--snowSQL
SELECT 
	'DATA_ISSUES/OUT_OF_RANGE' As DQ_CASE_DESCRIPTION,
	'LASTLOGIN' As FIELD,
	LASTLOGIN As VALUE
FROM USERS
WHERE TO_DATE(TO_TIMESTAMP(LASTLOGIN))>= CURRENT_DATE+1 ; --to offset issues with timezones


------------------------------------------------------------------------------------------
--#3/DATA ISSUES2
--Assuming Name field should not special characters
--snowSQL
SELECT 
	'DATA_ISSUES/SPECIAL_CHARACTERS' As DQ_CASE_DESCRIPTION,
	'NAME' As FIELD,
	NAME As VALUE
FROM BRANDS
WHERE NOT REGEXP_LIKE(NAME,'^[a-zA-Z0-9 ]+$');


