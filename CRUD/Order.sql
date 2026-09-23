SQL> CREATE TABLE HuftOrder (
  2      Order_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Order_Date DATE NOT NULL,
  5      Total_Amount NUMBER(10,2),
  6      Order_Status VARCHAR2(20)
  7  );

Table created.

SQL> DESC HuftOrder;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ID                                  NOT NULL NUMBER
 CUSTOMER_ID                                        NUMBER
 ORDER_DATE                                NOT NULL DATE
 TOTAL_AMOUNT                                       NUMBER(10,2)
 ORDER_STATUS                                       VARCHAR2(20)

SQL> INSERT INTO HuftOrder VALUES
  2  (1001, 1, TO_DATE('18-09-2026','DD-MM-YYYY'), 1750.00, 'Delivered');

1 row created.

SQL> INSERT INTO HuftOrder VALUES
  2  (1002, 2, TO_DATE('18-09-2026','DD-MM-YYYY'), 1849.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1003, 3, TO_DATE('19-09-2026','DD-MM-YYYY'), 1099.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1004, 4, TO_DATE('19-09-2026','DD-MM-YYYY'), 1273.00, 'Delivered');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1005, 5, TO_DATE('20-09-2026','DD-MM-YYYY'), 1075.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1006, 6, TO_DATE('20-09-2026','DD-MM-YYYY'), 650.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1007, 7, TO_DATE('20-09-2026','DD-MM-YYYY'), 1197.00, 'Delivered');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1008, 8, TO_DATE('21-09-2026','DD-MM-YYYY'), 1498.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1009, 9, TO_DATE('21-09-2026','DD-MM-YYYY'), 998.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder VALUES
  2  (1010, 10, TO_DATE('21-09-2026','DD-MM-YYYY'), 900.00, 'Processing');

1 row created.

SQL> SELECT * FROM HuftOrder;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ --------------------
      1001           1 18-SEP-26         1750 Delivered
      1002           2 18-SEP-26         1849 Shipped
      1003           3 19-SEP-26         1099 Processing
      1004           4 19-SEP-26         1273 Delivered
      1005           5 20-SEP-26         1075 Shipped
      1006           6 20-SEP-26          650 Processing
      1007           7 20-SEP-26         1197 Delivered
      1008           8 21-SEP-26         1498 Processing
      1009           9 21-SEP-26          998 Shipped
      1010          10 21-SEP-26          900 Processing

10 rows selected.

SQL> UPDATE HuftOrder
  2  SET Total_Amount = 1800.00
  3  WHERE Order_ID = 1001;

1 row updated.

SQL> SELECT *
  2  FROM HuftOrder
  3  WHERE Order_ID = 1001;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ --------------------
      1001           1 18-SEP-26         1800 Delivered

SQL> UPDATE HuftOrder
  2  SET Order_Date = TO_DATE('22-09-2026','DD-MM-YYYY')
  3  WHERE Order_ID = 1002;

1 row updated.

SQL> SELECT *
  2  FROM HuftOrder
  3  WHERE Order_ID = 1002;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ --------------------
      1002           2 22-SEP-26         1849 Shipped


SQL> UPDATE HuftOrder
  2  SET Total_Amount = 1449.00
  3  WHERE Order_ID = 1003;

1 row updated.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      oi.Product_ID,
  7      p.Product_Name,
  8      oi.Quantity,
  9      oi.Price,
 10      oi.Total_Amount
 11  FROM CUST3 c
 12  JOIN HuftOrder o
 13  ON c.CID = o.Customer_ID
 14  JOIN HuftOrder_Item oi
 15  ON o.Order_ID = oi.Order_ID
 16  JOIN HuftProduct p
 17  ON oi.Product_ID = p.Product_ID
 18  ORDER BY c.CID, o.Order_Date;

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
          1 Abi                                  1001 18-SEP-26        101
Chicken Dog Food
         2        650         1300

          1 Abi                                  1001 18-SEP-26        103
Leather Dog Collar
         1        450          450

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------

          2 Anu                                  1002 22-SEP-26        106
Cat Litter
         2        550         1100

          2 Anu                                  1002 22-SEP-26        102
Grain Free Cat Food

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
         1        749          749

          3 Ravi                                 1003 19-SEP-26        104
Pet Grooming Shampoo
         3        350         1050

          3 Ravi                                 1003 19-SEP-26        107

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
Dental Chew Sticks
         1        399          399

          4 Karthik                              1004 19-SEP-26        108
Pet Feeding Bowl
         2        275          550


CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
          4 Karthik                              1004 19-SEP-26        109
Puppy Training Pads
         1        499          499

          5 Priya                                1005 20-SEP-26        112
Cat Grooming Brush
         2        325          650

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------

          5 Priya                                1005 20-SEP-26        110
Pet Conditioner
         1        425          425

          6 Divya                                1006 20-SEP-26        101
Chicken Dog Food

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
         1        650          650

          7 Arun                                 1007 20-SEP-26        107
Dental Chew Sticks
         3        399         1197

          8 Meena                                1008 21-SEP-26        102

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_ID
----------- ------------------------------ ---------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------
Grain Free Cat Food
         2        749         1498

         10 Nisha                                1010 21-SEP-26        103
Leather Dog Collar
         2        450          900


14 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      COUNT(o.Order_ID) AS Total_Orders,
  5      SUM(o.Total_Amount) AS Total_Amount
  6  FROM CUST3 c
  7  JOIN HuftOrder o
  8  ON c.CID = o.Customer_ID
  9  GROUP BY c.CID, c.CNAME
 10  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_ORDERS TOTAL_AMOUNT
----------- ------------------------------ ------------ ------------
          1 Abi                                       1         1800
          2 Anu                                       1         1849
          3 Ravi                                      1         1449
          4 Karthik                                   1         1273
          5 Priya                                     1         1075
          6 Divya                                     1          650
          7 Arun                                      1         1197
          8 Meena                                     1         1498
         10 Nisha                                     1          900

9 rows selected.
