
*Queries on json files shared*
--------------------------------------------------------
Hi Sam,

Thank You so much for the files shared. We have loaded json files into snowflake tables for our analysis and based on our Analysis, I have the following queries. Could You pleaese suggest accordingly.

1] We see most of the timestamp fields are in numberic format. So, I assume these are epcoh (number of seconds elapsed since January 1, 1970) times. But, When I try to convert these to calendar timestamps, I see the date range is too high. Let me know if my assumption is wrong.

*Ex:* LASTLOGIN field from USERS file.

    SELECT TO_DATE(TO_TIMESTAMP(1609687542000));
    Result: 52978-12-19

2] We also see that PURCHASEDATE RECEIPTS fiels is coming as NULL. In such rare cases, can we assume 1st of the Calendar month in which we received the file as the defautl PURCHASEDATE.

3] In BRANDS file, we see there are some duplicates. Where in the BARCODE for below reocrds is repetitive although id field is unique.

*Ex:* 

    SELECT barcode FROM BRANDS GROUP BY barcode HAVING COUNT(*) >1;
    Result: 
    511111504788, 511111305125, 511111504139, 511111204923, 511111605058, 511111004790

4] We assume that we only receive the incremental data files automatically, eliminating the need to re-process all the records in every run of the ETL job, that can hinder the performance. Kindly let us know if our assumption is wrong.

Thanks& Regarards  
Srinivasarao Kotipatruni
