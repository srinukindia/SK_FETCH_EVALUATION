------------------------------------------------------------------------------------------
/*#02A]What are the top 5 brands by receipts scanned for most recent month?*/
------------------------------------------------------------------------------------------
--snowSQL
--Assuming timestamps given are epoch timestamps
SELECT
	I.BRANDCODE,
	COUNT(*)
FROM RECEIPTS_FACT R
JOIN ITEMS_DIM I
ON I.ITEMID_DKEY= R.ITEMID_DKEY
--JOIN TIME_DIM T (Not explicitly required)
WHERE TO_DATE(TO_TIMESTAMP(R.DATESCANNED))>= DATE_TRUNC('MONTH',CURRENT_DATE)
GROUP BY I.BRANDCODE
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC
LIMIT 5 ;

------------------------------------------------------------------------------------------
/*#02F]Which brand has the most transactions among users who were created within the past 6 months?*/
------------------------------------------------------------------------------------------
--snowSQL
--Assuming timestamps given are epoch timestamps
--Assuming every entry in Fact table as 1 transaction independent of receipts ID (as its only part of PK fields)  is repetitive or not.
SELECT
	I.BRANDCODE,
	COUNT(*)
FROM RECEIPTS_FACT R
JOIN ITEMS_DIM I
ON I.ITEMID_DKEY= R.ITEMID_DKEY
JOIN USERS_DIM U
ON U.USERID_DKEY= R.USERID_DKEY
WHERE TO_DATE(TO_TIMESTAMP(U.CREATEDDATE))>= DATEADD('MONTH',-6,DATE_TRUNC('MONTH',CURRENT_DATE))
GROUP BY I.BRANDCODE
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC
LIMIT 1;