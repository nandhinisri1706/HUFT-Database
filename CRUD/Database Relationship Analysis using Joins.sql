SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM CUST3 c
  9  INNER JOIN HuftOrder o
 10      ON c.CID = o.Customer_ID
 11  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME        ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS
----------- -------------------- -------- ------------ ------------ ---------------
          1 Abi                      1001 18-SEP-2026      1,750.00 Delivered
          2 Anu                      1002 18-SEP-2026      1,849.00 Shipped
          3 Ravi                     1003 19-SEP-2026      1,099.00 Processing
          4 Karthik                  1004 19-SEP-2026      1,273.00 Delivered
          5 Priya                    1005 20-SEP-2026      1,075.00 Shipped
          6 Divya                    1006 20-SEP-2026        650.00 Processing
          7 Arun                     1007 20-SEP-2026      1,197.00 Delivered
          8 Meena                    1008 21-SEP-2026      1,498.00 Processing
         10 Nisha                    1010 21-SEP-2026        900.00 Processing

9 rows selected.

SQL> SELECT
  2      o.Order_ID,
  3      o.Order_Date,
  4      o.Total_Amount,
  5      o.Order_Status,
  6      p.Payment_ID,
  7      p.Payment_Method,
  8      p.Payment_Amount,
  9      p.Payment_Status
 10  FROM HuftOrder o
 11  LEFT JOIN HuftPayment p
 12      ON o.Order_ID = p.Order_ID
 13  ORDER BY o.Order_ID;

ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS    PAYMENT_ID PAYMENT_METHOD       PAYMENT_AMOUNT PAYMENT_STATUS
-------- ------------ ------------ --------------- ---------- -------------------- -------------- ---------------
    1001 18-SEP-26        1,750.00 Delivered                1 UPI                            1750 Paid
    1002 18-SEP-26        1,849.00 Shipped                  2 Credit Card                    1849 Paid
    1003 19-SEP-26        1,099.00 Processing               3 Debit Card                     1099 Paid
    1004 19-SEP-26        1,273.00 Delivered                4 UPI                            1273 Paid
    1005 20-SEP-26        1,075.00 Shipped                  5 Cash on Delivery               1075 Pending
    1006 20-SEP-26          650.00 Processing               6 UPI                             650 Paid
    1007 20-SEP-26        1,197.00 Delivered                7 Net Banking                    1197 Paid
    1008 21-SEP-26        1,498.00 Processing               8 Credit Card                    1498 Paid
    1009 21-SEP-26          998.00 Shipped                  9 UPI                             998 Paid
    1010 21-SEP-26          900.00 Processing              10 Cash on Delivery                900 Pending

10 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      oi.Order_ID,
  5      oi.Quantity,
  6      oi.Price,
  7      oi.Total_Amount
  8  FROM HuftProduct p
  9  INNER JOIN HuftOrder_Item oi
 10      ON p.Product_ID = oi.Product_ID
 11  ORDER BY p.Product_ID;

PRODUCT_ID PRODUCT_NAME                   ORDER_ID QUANTITY       PRICE TOTAL_AMOUNT
---------- ------------------------------ -------- -------- ----------- ------------
       101 Chicken Dog Food                   1001        2      650.00     1,300.00
       101 Chicken Dog Food                   1006        1      650.00       650.00
       102 Grain Free Cat Food                1002        1      749.00       749.00
       102 Grain Free Cat Food                1008        2      749.00     1,498.00
       103 Leather Dog Collar                 1001        1      450.00       450.00
       103 Leather Dog Collar                 1010        2      450.00       900.00
       104 Pet Grooming Shampoo               1003        2      350.00       700.00
       106 Cat Litter                         1002        2      550.00     1,100.00
       107 Dental Chew Sticks                 1003        1      399.00       399.00
       107 Dental Chew Sticks                 1007        3      399.00     1,197.00
       108 Pet Feeding Bowl                   1004        2      275.00       550.00
       109 Puppy Training Pads                1004        1      499.00       499.00
       109 Puppy Training Pads                1009        2      499.00       998.00
       110 Pet Conditioner                    1005        1      425.00       425.00
       112 Cat Grooming Brush                 1005        2      325.00       650.00

15 rows selected.


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM CUST3 c
  9  LEFT JOIN HuftOrder o
 10      ON c.CID = o.Customer_ID
 11  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME        ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS
----------- -------------------- -------- ------------ ------------ ---------------
          1 Abi                      1001 18-SEP-26        1,750.00 Delivered
          2 Anu                      1002 18-SEP-26        1,849.00 Shipped
          3 Ravi                     1003 19-SEP-26        1,099.00 Processing
          4 Karthik                  1004 19-SEP-26        1,273.00 Delivered
          5 Priya                    1005 20-SEP-26        1,075.00 Shipped
          6 Divya                    1006 20-SEP-26          650.00 Processing
          7 Arun                     1007 20-SEP-26        1,197.00 Delivered
          8 Meena                    1008 21-SEP-26        1,498.00 Processing
         10 Nisha                    1010 21-SEP-26          900.00 Processing

9 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM CUST3 c
  9  LEFT JOIN HuftOrder o
 10      ON c.CID = o.Customer_ID
 11  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME        ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS
----------- -------------------- -------- ------------ ------------ ---------------
          1 Abi                      1001 18-SEP-26        1,750.00 Delivered
          2 Anu                      1002 18-SEP-26        1,849.00 Shipped
          3 Ravi                     1003 19-SEP-26        1,099.00 Processing
          4 Karthik                  1004 19-SEP-26        1,273.00 Delivered
          5 Priya                    1005 20-SEP-26        1,075.00 Shipped
          6 Divya                    1006 20-SEP-26          650.00 Processing
          7 Arun                     1007 20-SEP-26        1,197.00 Delivered
          8 Meena                    1008 21-SEP-26        1,498.00 Processing
         10 Nisha                    1010 21-SEP-26          900.00 Processing

9 rows selected.


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM CUST3 c
  9  RIGHT JOIN HuftOrder o
 10      ON c.CID = o.Customer_ID
 11  ORDER BY o.Order_ID;

CUSTOMER_ID CUSTOMER_NAME        ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS
----------- -------------------- -------- ------------ ------------ ---------------
          1 Abi                      1001 18-SEP-26        1,750.00 Delivered
          2 Anu                      1002 18-SEP-26        1,849.00 Shipped
          3 Ravi                     1003 19-SEP-26        1,099.00 Processing
          4 Karthik                  1004 19-SEP-26        1,273.00 Delivered
          5 Priya                    1005 20-SEP-26        1,075.00 Shipped
          6 Divya                    1006 20-SEP-26          650.00 Processing
          7 Arun                     1007 20-SEP-26        1,197.00 Delivered
          8 Meena                    1008 21-SEP-26        1,498.00 Processing
                                     1009 21-SEP-26          998.00 Shipped
         10 Nisha                    1010 21-SEP-26          900.00 Processing

10 rows selected.


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      p.Product_Name,
  6      oi.Quantity,
  7      oi.Price,
  8      oi.Total_Amount AS Item_Amount,
  9      o.Order_Status,
 10      pay.Payment_Method,
 11      pay.Payment_Status
 12  FROM CUST3 c
 13  JOIN HuftOrder o
 14      ON c.CID = o.Customer_ID
 15  JOIN HuftOrder_Item oi
 16      ON o.Order_ID = oi.Order_ID
 17  JOIN HuftProduct p
 18      ON oi.Product_ID = p.Product_ID
 19  LEFT JOIN HuftPayment pay
 20      ON o.Order_ID = pay.Order_ID
 21  ORDER BY o.Order_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID PRODUCT_NAME              QUANTITY       PRICE ITEM_AMOUNT ORDER_STATUS PAYMENT_METHOD     PAYMENT_STAT
----------- ------------------ -------- ------------------------- -------- ----------- ----------- ------------ ------------------ ------------
          1 Abi                    1001 Chicken Dog Food                 2      650.00        1300 Delivered    UPI                Paid
          1 Abi                    1001 Leather Dog Collar               1      450.00         450 Delivered    UPI                Paid
          2 Anu                    1002 Cat Litter                       2      550.00        1100 Shipped      Credit Card        Paid
          2 Anu                    1002 Grain Free Cat Food              1      749.00         749 Shipped      Credit Card        Paid
          3 Ravi                   1003 Pet Grooming Shampoo             2      350.00         700 Processing   Debit Card         Paid
          3 Ravi                   1003 Dental Chew Sticks               1      399.00         399 Processing   Debit Card         Paid
          4 Karthik                1004 Pet Feeding Bowl                 2      275.00         550 Delivered    UPI                Paid
          4 Karthik                1004 Puppy Training Pads              1      499.00         499 Delivered    UPI                Paid
          5 Priya                  1005 Cat Grooming Brush               2      325.00         650 Shipped      Cash on Delivery   Pending
          5 Priya                  1005 Pet Conditioner                  1      425.00         425 Shipped      Cash on Delivery   Pending
          6 Divya                  1006 Chicken Dog Food                 1      650.00         650 Processing   UPI                Paid
          7 Arun                   1007 Dental Chew Sticks               3      399.00        1197 Delivered    Net Banking        Paid
          8 Meena                  1008 Grain Free Cat Food              2      749.00        1498 Processing   Credit Card        Paid
         10 Nisha                  1010 Leather Dog Collar               2      450.00         900 Processing   Cash on Delivery   Pending

14 rows selected.


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      p.Product_Name,
  6      oi.Quantity,
  7      oi.Price,
  8      oi.Total_Amount AS Item_Amount,
  9      TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date
 10  FROM CUST3 c
 11  JOIN HuftOrder o
 12      ON c.CID = o.Customer_ID
 13  JOIN HuftOrder_Item oi
 14      ON o.Order_ID = oi.Order_ID
 15  JOIN HuftProduct p
 16      ON oi.Product_ID = p.Product_ID
 17  ORDER BY c.CID, o.Order_Date;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID PRODUCT_NAME              QUANTITY       PRICE ITEM_AMOUNT ORDER_DATE
----------- ------------------ -------- ------------------------- -------- ----------- ----------- ------------
          1 Abi                    1001 Chicken Dog Food                 2      650.00        1300 18-SEP-2026
          1 Abi                    1001 Leather Dog Collar               1      450.00         450 18-SEP-2026
          2 Anu                    1002 Cat Litter                       2      550.00        1100 18-SEP-2026
          2 Anu                    1002 Grain Free Cat Food              1      749.00         749 18-SEP-2026
          3 Ravi                   1003 Pet Grooming Shampoo             2      350.00         700 19-SEP-2026
          3 Ravi                   1003 Dental Chew Sticks               1      399.00         399 19-SEP-2026
          4 Karthik                1004 Pet Feeding Bowl                 2      275.00         550 19-SEP-2026
          4 Karthik                1004 Puppy Training Pads              1      499.00         499 19-SEP-2026
          5 Priya                  1005 Cat Grooming Brush               2      325.00         650 20-SEP-2026
          5 Priya                  1005 Pet Conditioner                  1      425.00         425 20-SEP-2026
          6 Divya                  1006 Chicken Dog Food                 1      650.00         650 20-SEP-2026
          7 Arun                   1007 Dental Chew Sticks               3      399.00        1197 20-SEP-2026
          8 Meena                  1008 Grain Free Cat Food              2      749.00        1498 21-SEP-2026
         10 Nisha                  1010 Leather Dog Collar               2      450.00         900 21-SEP-2026

14 rows selected.


SQL> COLUMN Customer_Name FORMAT A18
SQL> COLUMN Product_Name FORMAT A22
SQL> COLUMN Payment_Method FORMAT A18
SQL> COLUMN Payment_Status FORMAT A12
SQL> COLUMN Order_Date FORMAT A12
SQL> COLUMN Item_Amount FORMAT 999,999.99
SQL> COLUMN Payment_Amount FORMAT 999,999.99
SQL> 
SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  6      p.Product_Name,
  7      oi.Quantity,
  8      oi.Total_Amount AS Item_Amount,
  9      pay.Payment_Method,
 10      pay.Payment_Amount,
 11      pay.Payment_Status
 12  FROM CUST3 c
 13  JOIN HuftOrder o
 14      ON c.CID = o.Customer_ID
 15  JOIN HuftOrder_Item oi
 16      ON o.Order_ID = oi.Order_ID
 17  JOIN HuftProduct p
 18      ON oi.Product_ID = p.Product_ID
 19  LEFT JOIN HuftPayment pay
 20      ON o.Order_ID = pay.Order_ID
 21  ORDER BY c.CID, o.Order_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID ORDER_DATE   PRODUCT_NAME           QUANTITY ITEM_AMOUNT PAYMENT_METHOD     PAYMENT_AMOUNT PAYMENT_STAT
----------- ------------------ -------- ------------ ---------------------- -------- ----------- ------------------ -------------- ------------
          1 Abi                    1001 18-SEP-2026  Chicken Dog Food              2    1,300.00 UPI                      1,750.00 Paid
          1 Abi                    1001 18-SEP-2026  Leather Dog Collar            1      450.00 UPI                      1,750.00 Paid
          2 Anu                    1002 18-SEP-2026  Cat Litter                    2    1,100.00 Credit Card              1,849.00 Paid
          2 Anu                    1002 18-SEP-2026  Grain Free Cat Food           1      749.00 Credit Card              1,849.00 Paid
          3 Ravi                   1003 19-SEP-2026  Pet Grooming Shampoo          2      700.00 Debit Card               1,099.00 Paid
          3 Ravi                   1003 19-SEP-2026  Dental Chew Sticks            1      399.00 Debit Card               1,099.00 Paid
          4 Karthik                1004 19-SEP-2026  Pet Feeding Bowl              2      550.00 UPI                      1,273.00 Paid
          4 Karthik                1004 19-SEP-2026  Puppy Training Pads           1      499.00 UPI                      1,273.00 Paid
          5 Priya                  1005 20-SEP-2026  Cat Grooming Brush            2      650.00 Cash on Delivery         1,075.00 Pending
          5 Priya                  1005 20-SEP-2026  Pet Conditioner               1      425.00 Cash on Delivery         1,075.00 Pending
          6 Divya                  1006 20-SEP-2026  Chicken Dog Food              1      650.00 UPI                        650.00 Paid
          7 Arun                   1007 20-SEP-2026  Dental Chew Sticks            3    1,197.00 Net Banking              1,197.00 Paid
          8 Meena                  1008 21-SEP-2026  Grain Free Cat Food           2    1,498.00 Credit Card              1,498.00 Paid
         10 Nisha                  1010 21-SEP-2026  Leather Dog Collar            2      900.00 Cash on Delivery           900.00 Pending

14 rows selected.


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  6      p.Product_Name,
  7      oi.Quantity,
  8      oi.Total_Amount AS Item_Amount,
  9      pay.Payment_Method,
 10      pay.Payment_Status
 11  FROM CUST3 c
 12  JOIN HuftOrder o
 13      ON c.CID = o.Customer_ID
 14  JOIN HuftOrder_Item oi
 15      ON o.Order_ID = oi.Order_ID
 16  JOIN HuftProduct p
 17      ON oi.Product_ID = p.Product_ID
 18  LEFT JOIN HuftPayment pay
 19      ON o.Order_ID = pay.Order_ID
 20  ORDER BY c.CID, o.Order_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID ORDER_DATE   PRODUCT_NAME           QUANTITY ITEM_AMOUNT PAYMENT_METHOD     PAYMENT_STAT
----------- ------------------ -------- ------------ ---------------------- -------- ----------- ------------------ ------------
          1 Abi                    1001 18-SEP-2026  Chicken Dog Food              2    1,300.00 UPI                Paid
          1 Abi                    1001 18-SEP-2026  Leather Dog Collar            1      450.00 UPI                Paid
          2 Anu                    1002 18-SEP-2026  Cat Litter                    2    1,100.00 Credit Card        Paid
          2 Anu                    1002 18-SEP-2026  Grain Free Cat Food           1      749.00 Credit Card        Paid
          3 Ravi                   1003 19-SEP-2026  Pet Grooming Shampoo          2      700.00 Debit Card         Paid
          3 Ravi                   1003 19-SEP-2026  Dental Chew Sticks            1      399.00 Debit Card         Paid
          4 Karthik                1004 19-SEP-2026  Pet Feeding Bowl              2      550.00 UPI                Paid
          4 Karthik                1004 19-SEP-2026  Puppy Training Pads           1      499.00 UPI                Paid
          5 Priya                  1005 20-SEP-2026  Cat Grooming Brush            2      650.00 Cash on Delivery   Pending
          5 Priya                  1005 20-SEP-2026  Pet Conditioner               1      425.00 Cash on Delivery   Pending
          6 Divya                  1006 20-SEP-2026  Chicken Dog Food              1      650.00 UPI                Paid
          7 Arun                   1007 20-SEP-2026  Dental Chew Sticks            3    1,197.00 Net Banking        Paid
          8 Meena                  1008 21-SEP-2026  Grain Free Cat Food           2    1,498.00 Credit Card        Paid
         10 Nisha                  1010 21-SEP-2026  Leather Dog Collar            2      900.00 Cash on Delivery   Pending

14 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  6      p.Product_Name,
  7      oi.Quantity,
  8      oi.Total_Amount AS Item_Amount,
  9      pay.Payment_Method,
 10      pay.Payment_Status
 11  FROM CUST3 c
 12  JOIN HuftOrder o
 13      ON c.CID = o.Customer_ID
 14  JOIN HuftOrder_Item oi
 15      ON o.Order_ID = oi.Order_ID
 16  JOIN HuftProduct p
 17      ON oi.Product_ID = p.Product_ID
 18  LEFT JOIN HuftPayment pay
 19      ON o.Order_ID = pay.Order_ID
 20  ORDER BY c.CID, o.Order_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID ORDER_DATE   PRODUCT_NAME           QUANTITY ITEM_AMOUNT PAYMENT_METHOD     PAYMENT_STAT
----------- ------------------ -------- ------------ ---------------------- -------- ----------- ------------------ ------------
          1 Abi                    1001 18-SEP-2026  Chicken Dog Food              2    1,300.00 UPI                Paid
          1 Abi                    1001 18-SEP-2026  Leather Dog Collar            1      450.00 UPI                Paid
          2 Anu                    1002 18-SEP-2026  Cat Litter                    2    1,100.00 Credit Card        Paid
          2 Anu                    1002 18-SEP-2026  Grain Free Cat Food           1      749.00 Credit Card        Paid
          3 Ravi                   1003 19-SEP-2026  Pet Grooming Shampoo          2      700.00 Debit Card         Paid
          3 Ravi                   1003 19-SEP-2026  Dental Chew Sticks            1      399.00 Debit Card         Paid
          4 Karthik                1004 19-SEP-2026  Pet Feeding Bowl              2      550.00 UPI                Paid
          4 Karthik                1004 19-SEP-2026  Puppy Training Pads           1      499.00 UPI                Paid
          5 Priya                  1005 20-SEP-2026  Cat Grooming Brush            2      650.00 Cash on Delivery   Pending
          5 Priya                  1005 20-SEP-2026  Pet Conditioner               1      425.00 Cash on Delivery   Pending
          6 Divya                  1006 20-SEP-2026  Chicken Dog Food              1      650.00 UPI                Paid
          7 Arun                   1007 20-SEP-2026  Dental Chew Sticks            3    1,197.00 Net Banking        Paid
          8 Meena                  1008 21-SEP-2026  Grain Free Cat Food           2    1,498.00 Credit Card        Paid
         10 Nisha                  1010 21-SEP-2026  Leather Dog Collar            2      900.00 Cash on Delivery   Pending

14 rows selected.


