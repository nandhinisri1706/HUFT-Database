
SQL> CREATE TABLE HuftReview (
  2      Review_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES CUST3(CID),
  4      Product_ID NUMBER REFERENCES HuftProduct(Product_ID),
  5      Review_Text VARCHAR2(200),
  6      Review_Date DATE
  7  );

Table created.

SQL> DESC HuftReview;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REVIEW_ID                                 NOT NULL NUMBER
 CUSTOMER_ID                                        NUMBER
 PRODUCT_ID                                         NUMBER
 REVIEW_TEXT                                        VARCHAR2(200)
 REVIEW_DATE                                        DATE

SQL> INSERT INTO HuftReview VALUES
  2  (1, 1, 101, 'Excellent dog food', TO_DATE('20-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO HuftReview VALUES
  2  (2, 2, 102, 'Good quality cat food', TO_DATE('21-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO HuftReview VALUES
  2  (3, 3, 103, 'Very good collar', TO_DATE('21-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO HuftReview VALUES
  2  (4, 1, 104, 'Good grooming shampoo', TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO HuftReview VALUES
  2  (5, 2, 106, 'Very useful cat litter', TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO HuftReview VALUES
  2  (6, 3, 107, 'My dog likes these treats', TO_DATE('23-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM HuftReview;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1           1        101
Excellent dog food
20-SEP-26

         2           2        102
Good quality cat food
21-SEP-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

         3           3        103
Very good collar
21-SEP-26

         4           1        104
Good grooming shampoo

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
22-SEP-26

         5           2        106
Very useful cat litter
22-SEP-26

         6           3        107

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
My dog likes these treats
23-SEP-26


6 rows selected.

SQL> SELECT
  2      Product_ID,
  3      AVG(Rating) AS Average_Rating
  4  FROM HuftRating
  5  GROUP BY Product_ID
  6  ORDER BY Product_ID;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       101              5
       102              4
       103              5
       104              4
       106              5
       107              4

6 rows selected.

SQL> SELECT
  2      Product_ID,
  3      AVG(Rating) AS Average_Rating
  4  FROM HuftRating
  5  GROUP BY Product_ID
  6  HAVING AVG(Rating) >= 4
  7  ORDER BY Average_Rating DESC;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       101              5
       103              5
       106              5
       104              4
       107              4
       102              4

6 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      COUNT(r.Rating_ID) AS Total_Ratings,
  5      ROUND(AVG(r.Rating), 2) AS Average_Rating,
  6      MAX(r.Rating) AS Highest_Rating,
  7      MIN(r.Rating) AS Lowest_Rating
  8  FROM HuftRating r
  9  JOIN HuftProduct p
 10      ON r.Product_ID = p.Product_ID
 11  GROUP BY p.Product_ID, p.Product_Name
 12  ORDER BY Average_Rating DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
       101
Chicken Dog Food
            1              5              5             5

       103
Leather Dog Collar
            1              5              5             5

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------

       106
Cat Litter
            1              5              5             5

       104
Pet Grooming Shampoo

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
            1              4              4             4

       107
Dental Chew Sticks
            1              4              4             4

       102

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
Grain Free Cat Food
            1              4              4             4


6 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      AVG(r.Rating) AS Average_Rating
  5  FROM HuftRating r
  6  JOIN HuftProduct p
  7      ON r.Product_ID = p.Product_ID
  8  GROUP BY
  9      p.Product_ID,
 10      p.Product_Name
 11  HAVING AVG(r.Rating) >= 4
 12  ORDER BY Average_Rating DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
       101
Chicken Dog Food
             5

       103
Leather Dog Collar
             5

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------

       106
Cat Litter
             5

       104
Pet Grooming Shampoo

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
             4

       107
Dental Chew Sticks
             4

       102

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
Grain Free Cat Food
             4


6 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      AVG(r.Rating) AS Average_Rating
  5  FROM HuftRating r
  6  JOIN HuftProduct p
  7      ON r.Product_ID = p.Product_ID
  8  GROUP BY
  9      p.Product_ID,
 10      p.Product_Name
 11  HAVING AVG(r.Rating) >= 4
 12  ORDER BY Average_Rating DESC;

PRODUCT_ID PRODUCT_NAME                   AVERAGE_RATING
---------- ------------------------------ --------------
       101 Chicken Dog Food                         5.00
       103 Leather Dog Collar                       5.00
       106 Cat Litter                               5.00
       104 Pet Grooming Shampoo                     4.00
       107 Dental Chew Sticks                       4.00
       102 Grain Free Cat Food                      4.00

6 rows selected.

