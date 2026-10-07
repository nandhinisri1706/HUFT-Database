SQL> CREATE TABLE HuftRating (
  2      Rating_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES CUST3(CID),
  4      Product_ID NUMBER REFERENCES HuftProduct(Product_ID),
  5      Rating NUMBER(1) CHECK (Rating BETWEEN 1 AND 5),
  6      Rating_Date DATE
  7  );

Table created.

SQL> DESC HuftRating;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 RATING_ID                                 NOT NULL NUMBER
 CUSTOMER_ID                                        NUMBER
 PRODUCT_ID                                         NUMBER
 RATING                                             NUMBER(1)
 RATING_DATE                                        DATE

SQL> INSERT INTO HuftRating VALUES
  2  (1, 1, 101, 5, TO_DATE('20-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO HuftRating VALUES
  2  (2, 2, 102, 4, TO_DATE('21-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO HuftRating VALUES
  2  (3, 3, 103, 5, TO_DATE('21-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO HuftRating VALUES
  2  (4, 1, 104, 4, TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO HuftRating VALUES
  2  (5, 2, 106, 5, TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO HuftRating VALUES
  2  (6, 3, 107, 4, TO_DATE('23-09-2026','DD-MM-YYYY'));

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM HuftRating;

 RATING_ID CUSTOMER_ID PRODUCT_ID     RATING RATING_DA
---------- ----------- ---------- ---------- ---------
         1           1        101          5 20-SEP-26
         2           2        102          4 21-SEP-26
         3           3        103          5 21-SEP-26
         4           1        104          4 22-SEP-26
         5           2        106          5 22-SEP-26
         6           3        107          4 23-SEP-26

6 rows selected.


SQL> SELECT
  2      r.Review_ID,
  3      c.CNAME AS Customer_Name,
  4      p.Product_ID,
  5      p.Product_Name,
  6      r.Review_Text,
  7      r.Review_Date
  8  FROM HuftReview r
  9  JOIN CUST3 c
 10      ON r.Customer_ID = c.CID
 11  JOIN HuftProduct p
 12      ON r.Product_ID = p.Product_ID
 13  ORDER BY r.Review_Date DESC;

 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         6 Ravi                                  107
Dental Chew Sticks
My dog likes these treats
23-SEP-26


 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         4 Abi                                   104
Pet Grooming Shampoo
Good grooming shampoo
22-SEP-26


 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         5 Anu                                   106
Cat Litter
Very useful cat litter
22-SEP-26


 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         2 Anu                                   102
Grain Free Cat Food
Good quality cat food
21-SEP-26


 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         3 Ravi                                  103
Leather Dog Collar
Very good collar
21-SEP-26


 REVIEW_ID CUSTOMER_NAME                  PRODUCT_ID
---------- ------------------------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1 Abi                                   101
Chicken Dog Food
Excellent dog food
20-SEP-26


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

