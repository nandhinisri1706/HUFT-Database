
 SQL> CREATE TABLE HuftOrder_Item (
  2      Order_Item_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER REFERENCES HuftOrder(Order_ID),
  4      Product_ID NUMBER REFERENCES HuftProduct(Product_ID),
  5      Quantity NUMBER NOT NULL,
  6      Price NUMBER(10,2),
  7      Total_Amount NUMBER(10,2)
  8  );

Table created.

SQL> DESC HuftOrder_Item;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ITEM_ID                             NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PRODUCT_ID                                         NUMBER
 QUANTITY                                  NOT NULL NUMBER
 PRICE                                              NUMBER(10,2)
 TOTAL_AMOUNT                                       NUMBER(10,2)

SQL> INSERT INTO HuftOrder_Item VALUES
  2  (1, 1001, 101, 2, 650.00, 1300.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (2, 1001, 103, 1, 450.00, 450.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (3, 1002, 102, 1, 749.00, 749.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (4, 1002, 106, 2, 550.00, 1100.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (5, 1003, 104, 2, 350.00, 700.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (6, 1003, 107, 1, 399.00, 399.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (7, 1004, 108, 2, 275.00, 550.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (8, 1004, 109, 1, 499.00, 499.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (9, 1005, 110, 1, 425.00, 425.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (10, 1005, 112, 2, 325.00, 650.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (11, 1006, 101, 1, 650.00, 650.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (12, 1007, 107, 3, 399.00, 1197.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (13, 1008, 102, 2, 749.00, 1498.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (14, 1009, 109, 2, 499.00, 998.00);

1 row created.

SQL> 
SQL> INSERT INTO HuftOrder_Item VALUES
  2  (15, 1010, 103, 2, 450.00, 900.00);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM HuftOrder_Item;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE TOTAL_AMOUNT
------------- ---------- ---------- ---------- ---------- ------------
            1       1001        101          2        650         1300
            2       1001        103          1        450          450
            3       1002        102          1        749          749
            4       1002        106          2        550         1100
            5       1003        104          2        350          700
            6       1003        107          1        399          399
            7       1004        108          2        275          550
            8       1004        109          1        499          499
            9       1005        110          1        425          425
           10       1005        112          2        325          650
           11       1006        101          1        650          650

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE TOTAL_AMOUNT
------------- ---------- ---------- ---------- ---------- ------------
           12       1007        107          3        399         1197
           13       1008        102          2        749         1498
           14       1009        109          2        499          998
           15       1010        103          2        450          900

15 rows selected.

SQL> UPDATE HuftOrder_Item
  2  SET Quantity = 3,
  3      Total_Amount = 1050.00
  4  WHERE Order_Item_ID = 5;

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

