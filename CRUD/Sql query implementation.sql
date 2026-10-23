SQL> SELECT *
  2  FROM HuftProduct;

PRODUCT_ID PRODUCT_NAME                   CATEGORY_ID       PRICE      STOCK
---------- ------------------------------ ----------- ----------- ----------
       101 Chicken Dog Food                         1      599.00         50
       102 Grain Free Cat Food                      2      749.00         35
       103 Leather Dog Collar                       3      450.00         25
       104 Pet Grooming Shampoo                     4      350.00         40
       106 Cat Litter                               2      550.00         30
       107 Dental Chew Sticks                       1      399.00         45
       108 Pet Feeding Bowl                         3      275.00         20
       109 Puppy Training Pads                      1      499.00         55
       110 Pet Conditioner                          4      425.00         30
       112 Cat Grooming Brush                       4      325.00         28
       113 Dog Harness                              3      699.00         22
       114 Premium Dog Treats                       1      450.00         40

12 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       101 Chicken Dog Food                    599.00
       102 Grain Free Cat Food                 749.00
       103 Leather Dog Collar                  450.00
       104 Pet Grooming Shampoo                350.00
       106 Cat Litter                          550.00
       107 Dental Chew Sticks                  399.00
       108 Pet Feeding Bowl                    275.00
       109 Puppy Training Pads                 499.00
       110 Pet Conditioner                     425.00
       112 Cat Grooming Brush                  325.00
       113 Dog Harness                         699.00
       114 Premium Dog Treats                  450.00

12 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  WHERE Price < 1000;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       101 Chicken Dog Food                    599.00
       102 Grain Free Cat Food                 749.00
       103 Leather Dog Collar                  450.00
       104 Pet Grooming Shampoo                350.00
       106 Cat Litter                          550.00
       107 Dental Chew Sticks                  399.00
       108 Pet Feeding Bowl                    275.00
       109 Puppy Training Pads                 499.00
       110 Pet Conditioner                     425.00
       112 Cat Grooming Brush                  325.00
       113 Dog Harness                         699.00
       114 Premium Dog Treats                  450.00

12 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  WHERE Price > 100;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       101 Chicken Dog Food                    599.00
       102 Grain Free Cat Food                 749.00
       103 Leather Dog Collar                  450.00
       104 Pet Grooming Shampoo                350.00
       106 Cat Litter                          550.00
       107 Dental Chew Sticks                  399.00
       108 Pet Feeding Bowl                    275.00
       109 Puppy Training Pads                 499.00
       110 Pet Conditioner                     425.00
       112 Cat Grooming Brush                  325.00
       113 Dog Harness                         699.00
       114 Premium Dog Treats                  450.00

12 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  ORDER BY Price ASC;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       108 Pet Feeding Bowl                    275.00
       112 Cat Grooming Brush                  325.00
       104 Pet Grooming Shampoo                350.00
       107 Dental Chew Sticks                  399.00
       110 Pet Conditioner                     425.00
       114 Premium Dog Treats                  450.00
       103 Leather Dog Collar                  450.00
       109 Puppy Training Pads                 499.00
       106 Cat Litter                          550.00
       101 Chicken Dog Food                    599.00
       113 Dog Harness                         699.00
       102 Grain Free Cat Food                 749.00

12 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  ORDER BY Price DESC;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       102 Grain Free Cat Food                 749.00
       113 Dog Harness                         699.00
       101 Chicken Dog Food                    599.00
       106 Cat Litter                          550.00
       109 Puppy Training Pads                 499.00
       103 Leather Dog Collar                  450.00
       114 Premium Dog Treats                  450.00
       110 Pet Conditioner                     425.00
       107 Dental Chew Sticks                  399.00
       104 Pet Grooming Shampoo                350.00
       112 Cat Grooming Brush                  325.00
       108 Pet Feeding Bowl                    275.00

12 rows selected.

SQL> SELECT DISTINCT
  2      c.Category_ID,
  3      c.Category_Name
  4  FROM HuftProduct p
  5  JOIN HuftCategory c
  6      ON p.Category_ID = c.Category_ID
  7  ORDER BY c.Category_ID;

CATEGORY_ID CATEGORY_NAME
----------- --------------------------------------------------
          1 Dog Food
          2 Cat Food
          3 Accessories
          4 Grooming

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  WHERE Price BETWEEN 100 AND 400
  4  ORDER BY Price ASC;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       108 Pet Feeding Bowl                    275.00
       112 Cat Grooming Brush                  325.00
       104 Pet Grooming Shampoo                350.00
       107 Dental Chew Sticks                  399.00

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      c.Category_Name,
  5      p.Price
  6  FROM HuftProduct p
  7  JOIN HuftCategory c
  8      ON p.Category_ID = c.Category_ID
  9  WHERE c.Category_ID = 1;

PRODUCT_ID PRODUCT_NAME                   CATEGORY_NAME                                            PRICE
---------- ------------------------------ -------------------------------------------------- -----------
       101 Chicken Dog Food               Dog Food                                                599.00
       107 Dental Chew Sticks             Dog Food                                                399.00
       109 Puppy Training Pads            Dog Food                                                499.00
       114 Premium Dog Treats             Dog Food                                                450.00

SQL> SELECT *
  2  FROM CUST3;

       CID CNAME                          EMAIL                            PHONE_NO ADDRESS
---------- ------------------------------ ------------------------------ ---------- --------------------------------------------------
         1 Abi                            abi@gmail.com                  1234567890 Ramapuram Chennai
         2 Anu                            anu@gmail.com                   987654321 Madurai
         3 Ravi                           ravi@gmail.com                 9087654321 Chengalpattu
         4 Karthik                        karthik@gmail.com              9876543210 Coimbatore
         5 Priya                          priya@gmail.com                8765432109 Salem
         6 Divya                          divya@gmail.com                7654321098 Trichy
         7 Arun                           arun@gmail.com                 6543210987 Vellore
         8 Meena                          meena@gmail.com                9432109876 Tirunelveli
        10 Nisha                          nisha@gmail.com                9210987654 Vellore

9 rows selected.

SQL> SELECT *
  2  FROM CUST3
  3  WHERE CID = 1;

       CID CNAME                          EMAIL                            PHONE_NO ADDRESS
---------- ------------------------------ ------------------------------ ---------- --------------------------------------------------
         1 Abi                            abi@gmail.com                  1234567890 Ramapuram Chennai

SQL> SELECT Product_ID, Product_Name, Price, Stock
  2  FROM HuftProduct
  3  WHERE Price < 500
  4  AND Stock > 20;

PRODUCT_ID PRODUCT_NAME                         PRICE      STOCK
---------- ------------------------------ ----------- ----------
       103 Leather Dog Collar                  450.00         25
       104 Pet Grooming Shampoo                350.00         40
       107 Dental Chew Sticks                  399.00         45
       109 Puppy Training Pads                 499.00         55
       110 Pet Conditioner                     425.00         30
       112 Cat Grooming Brush                  325.00         28
       114 Premium Dog Treats                  450.00         40

7 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      c.Category_Name,
  5      p.Price
  6  FROM HuftProduct p
  7  JOIN HuftCategory c
  8      ON p.Category_ID = c.Category_ID
  9  WHERE p.Category_ID = 1
 10     OR p.Category_ID = 2;

PRODUCT_ID PRODUCT_NAME                   CATEGORY_NAME                                            PRICE
---------- ------------------------------ -------------------------------------------------- -----------
       101 Chicken Dog Food               Dog Food                                                599.00
       102 Grain Free Cat Food            Cat Food                                                749.00
       106 Cat Litter                     Cat Food                                                550.00
       107 Dental Chew Sticks             Dog Food                                                399.00
       109 Puppy Training Pads            Dog Food                                                499.00
       114 Premium Dog Treats             Dog Food                                                450.00

6 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      c.Category_Name,
  5      p.Price
  6  FROM HuftProduct p
  7  JOIN HuftCategory c
  8      ON p.Category_ID = c.Category_ID
  9  WHERE p.Category_ID IN (1, 2);

PRODUCT_ID PRODUCT_NAME                   CATEGORY_NAME                                            PRICE
---------- ------------------------------ -------------------------------------------------- -----------
       101 Chicken Dog Food               Dog Food                                                599.00
       102 Grain Free Cat Food            Cat Food                                                749.00
       106 Cat Litter                     Cat Food                                                550.00
       107 Dental Chew Sticks             Dog Food                                                399.00
       109 Puppy Training Pads            Dog Food                                                499.00
       114 Premium Dog Treats             Dog Food                                                450.00

6 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      c.Category_Name,
  5      p.Price
  6  FROM HuftProduct p
  7  JOIN HuftCategory c
  8      ON p.Category_ID = c.Category_ID
  9  WHERE p.Category_ID IN (1, 2);

PRODUCT_ID PRODUCT_NAME                   CATEGORY_NAME                                            PRICE
---------- ------------------------------ -------------------------------------------------- -----------
       101 Chicken Dog Food               Dog Food                                                599.00
       102 Grain Free Cat Food            Cat Food                                                749.00
       106 Cat Litter                     Cat Food                                                550.00
       107 Dental Chew Sticks             Dog Food                                                399.00
       109 Puppy Training Pads            Dog Food                                                499.00
       114 Premium Dog Treats             Dog Food                                                450.00

6 rows selected.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  WHERE Price BETWEEN 100 AND 400
  4  ORDER BY Price ASC;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       108 Pet Feeding Bowl                    275.00
       112 Cat Grooming Brush                  325.00
       104 Pet Grooming Shampoo                350.00
       107 Dental Chew Sticks                  399.00

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM HuftProduct
  3  ORDER BY Price DESC;

PRODUCT_ID PRODUCT_NAME                         PRICE
---------- ------------------------------ -----------
       102 Grain Free Cat Food                 749.00
       113 Dog Harness                         699.00
       101 Chicken Dog Food                    599.00
       106 Cat Litter                          550.00
       109 Puppy Training Pads                 499.00
       103 Leather Dog Collar                  450.00
       114 Premium Dog Treats                  450.00
       110 Pet Conditioner                     425.00
       107 Dental Chew Sticks                  399.00
       104 Pet Grooming Shampoo                350.00
       112 Cat Grooming Brush                  325.00
       108 Pet Feeding Bowl                    275.00

12 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM CUST3 c
  9  JOIN HuftOrder o
 10      ON c.CID = o.Customer_ID
 11  ORDER BY c.CID, o.Order_Date;

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
----------- ------------------------------ ---------- --------- ------------ --------------------
          1 Abi                                  1001 18-SEP-26         1750 Delivered
          2 Anu                                  1002 18-SEP-26         1849 Shipped
          3 Ravi                                 1003 19-SEP-26         1099 Processing
          4 Karthik                              1004 19-SEP-26         1273 Delivered
          5 Priya                                1005 20-SEP-26         1075 Shipped
          6 Divya                                1006 20-SEP-26          650 Processing
          7 Arun                                 1007 20-SEP-26         1197 Delivered
          8 Meena                                1008 21-SEP-26         1498 Processing
         10 Nisha                                1010 21-SEP-26          900 Processing

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      o.Order_ID,
  5      oi.Quantity,
  6      oi.Price,
  7      oi.Total_Amount
  8  FROM HuftProduct p
  9  JOIN HuftOrder_Item oi
 10      ON p.Product_ID = oi.Product_ID
 11  JOIN HuftOrder o
 12      ON oi.Order_ID = o.Order_ID
 13  ORDER BY p.Product_ID, o.Order_ID;

PRODUCT_ID PRODUCT_NAME                     ORDER_ID   QUANTITY       PRICE TOTAL_AMOUNT
---------- ------------------------------ ---------- ---------- ----------- ------------
       101 Chicken Dog Food                     1001          2      650.00         1300
       101 Chicken Dog Food                     1006          1      650.00          650
       102 Grain Free Cat Food                  1002          1      749.00          749
       102 Grain Free Cat Food                  1008          2      749.00         1498
       103 Leather Dog Collar                   1001          1      450.00          450
       103 Leather Dog Collar                   1010          2      450.00          900
       104 Pet Grooming Shampoo                 1003          2      350.00          700
       106 Cat Litter                           1002          2      550.00         1100
       107 Dental Chew Sticks                   1003          1      399.00          399
       107 Dental Chew Sticks                   1007          3      399.00         1197
       108 Pet Feeding Bowl                     1004          2      275.00          550
       109 Puppy Training Pads                  1004          1      499.00          499
       109 Puppy Training Pads                  1009          2      499.00          998
       110 Pet Conditioner                      1005          1      425.00          425
       112 Cat Grooming Brush                   1005          2      325.00          650

15 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      COUNT(o.Order_ID) AS Total_Orders
  5  FROM CUST3 c
  6  LEFT JOIN HuftOrder o
  7      ON c.CID = o.Customer_ID
  8  GROUP BY c.CID, c.CNAME
  9  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_ORDERS
----------- ------------------------------ ------------
          1 Abi                                       1
          2 Anu                                       1
          3 Ravi                                      1
          4 Karthik                                   1
          5 Priya                                     1
          6 Divya                                     1
          7 Arun                                      1
          8 Meena                                     1
         10 Nisha                                     1

9 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      SUM(o.Total_Amount) AS Total_Purchase_Amount
  5  FROM CUST3 c
  6  JOIN HuftOrder o
  7      ON c.CID = o.Customer_ID
  8  GROUP BY
  9      c.CID,
 10      c.CNAME
 11  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_PURCHASE_AMOUNT
----------- ------------------------------ ---------------------
          1 Abi                                             1750
          2 Anu                                             1849
          3 Ravi                                            1099
          4 Karthik                                         1273
          5 Priya                                           1075
          6 Divya                                            650
          7 Arun                                            1197
          8 Meena                                           1498
         10 Nisha                                            900

9 rows selected.
