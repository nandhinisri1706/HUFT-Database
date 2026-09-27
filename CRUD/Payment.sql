SQL> CREATE TABLE HuftPayment (
  2      Payment_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER REFERENCES HuftOrder(Order_ID),
  4      Payment_Date DATE NOT NULL,
  5      Payment_Method VARCHAR2(30),
  6      Payment_Amount NUMBER(10,2),
  7      Payment_Status VARCHAR2(20)
  8  );

Table created.

SQL> DESC HuftPayment;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PAYMENT_DATE                              NOT NULL DATE
 PAYMENT_METHOD                                     VARCHAR2(30)
 PAYMENT_AMOUNT                                     NUMBER(10,2)
 PAYMENT_STATUS                                     VARCHAR2(20)

SQL> INSERT INTO HuftPayment VALUES
  2  (1, 1001, TO_DATE('18-09-2026','DD-MM-YYYY'), 'UPI', 1800.00, 'Paid');

1 row created.

SQL> INSERT INTO HuftPayment VALUES
  2  (2, 1002, TO_DATE('22-09-2026','DD-MM-YYYY'), 'Credit Card', 1849.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (3, 1003, TO_DATE('19-09-2026','DD-MM-YYYY'), 'Debit Card', 1449.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (4, 1004, TO_DATE('19-09-2026','DD-MM-YYYY'), 'UPI', 1273.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (5, 1005, TO_DATE('20-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 1075.00, 'Pending');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (6, 1006, TO_DATE('20-09-2026','DD-MM-YYYY'), 'UPI', 650.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (7, 1007, TO_DATE('20-09-2026','DD-MM-YYYY'), 'Net Banking', 1197.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (8, 1008, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Credit Card', 1498.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (9, 1009, TO_DATE('21-09-2026','DD-MM-YYYY'), 'UPI', 998.00, 'Paid');

1 row created.

SQL> 
SQL> INSERT INTO HuftPayment VALUES
  2  (10, 1010, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 900.00, 'Pending');

1 row created.

SQL> SELECT *
  2  FROM HuftPayment
  3  WHERE Payment_Status = 'Paid';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         1       1001 18-SEP-26 UPI                                      1800
Paid

         2       1002 22-SEP-26 Credit Card                              1849
Paid

         3       1003 19-SEP-26 Debit Card                               1449
Paid


PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         4       1004 19-SEP-26 UPI                                      1273
Paid

         6       1006 20-SEP-26 UPI                                       650
Paid

         7       1007 20-SEP-26 Net Banking                              1197
Paid


PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         8       1008 21-SEP-26 Credit Card                              1498
Paid

         9       1009 21-SEP-26 UPI                                       998
Paid


8 rows selected.

SQL> SELECT *
  2  FROM HuftPayment
  3  WHERE Payment_Status = 'Pending';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         5       1005 20-SEP-26 Cash on Delivery                         1075
Pending

        10       1010 21-SEP-26 Cash on Delivery                          900
Pending


SQL> UPDATE HuftPayment
  2  SET Payment_Status = 'Paid'
  3  WHERE Payment_ID = 5;

1 row updated.

SQL> SELECT *
  2  FROM HuftPayment
  3  WHERE Payment_ID = 5;

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         5       1005 20-SEP-26 Cash on Delivery                         1075
Paid


SQL> SELECT
  2      Payment_Method,
  3      COUNT(*) AS Total_Transactions
  4  FROM HuftPayment
  5  GROUP BY Payment_Method
  6  ORDER BY Payment_Method;

PAYMENT_METHOD                 TOTAL_TRANSACTIONS
------------------------------ ------------------
Cash on Delivery                                2
Credit Card                                     2
Debit Card                                      1
Net Banking                                     1
UPI                                             4

SQL> SELECT
  2      Payment_Method,
  3      SUM(Payment_Amount) AS Total_Amount
  4  FROM HuftPayment
  5  WHERE Payment_Status = 'Paid'
  6  GROUP BY Payment_Method
  7  ORDER BY Payment_Method;

PAYMENT_METHOD                 TOTAL_AMOUNT
------------------------------ ------------
Cash on Delivery                       1075
Credit Card                            3347
Debit Card                             1449
Net Banking                            1197
UPI                                    4721

SQL> SELECT
  2      p.Payment_ID,
  3      o.Order_ID,
  4      c.CID AS Customer_ID,
  5      c.CNAME AS Customer_Name,
  6      p.Payment_Method,
  7      p.Payment_Date,
  8      p.Payment_Amount,
  9      p.Payment_Status
 10  FROM HuftPayment p
 11  JOIN HuftOrder o
 12      ON p.Order_ID = o.Order_ID
 13  JOIN CUST3 c
 14      ON o.Customer_ID = c.CID
 15  ORDER BY p.Payment_Date DESC;

PAYMENT_ID   ORDER_ID CUSTOMER_ID CUSTOMER_NAME
---------- ---------- ----------- ------------------------------
PAYMENT_METHOD                 PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ --------- -------------- --------------------
         2       1002           2 Anu
Credit Card                    22-SEP-26           1849 Paid

         8       1008           8 Meena
Credit Card                    21-SEP-26           1498 Paid

        10       1010          10 Nisha
Cash on Delivery               21-SEP-26            900 Pending


PAYMENT_ID   ORDER_ID CUSTOMER_ID CUSTOMER_NAME
---------- ---------- ----------- ------------------------------
PAYMENT_METHOD                 PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ --------- -------------- --------------------
         5       1005           5 Priya
Cash on Delivery               20-SEP-26           1075 Paid

         7       1007           7 Arun
Net Banking                    20-SEP-26           1197 Paid

         6       1006           6 Divya
UPI                            20-SEP-26            650 Paid


PAYMENT_ID   ORDER_ID CUSTOMER_ID CUSTOMER_NAME
---------- ---------- ----------- ------------------------------
PAYMENT_METHOD                 PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ --------- -------------- --------------------
         3       1003           3 Ravi
Debit Card                     19-SEP-26           1449 Paid

         4       1004           4 Karthik
UPI                            19-SEP-26           1273 Paid

         1       1001           1 Abi
UPI                            18-SEP-26           1800 Paid


9 rows selected.
