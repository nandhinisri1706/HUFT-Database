SQL> SELECT
  2      Order_ID,
  3      Customer_ID,
  4      Total_Amount,
  5      Order_Status
  6  FROM HuftOrder
  7  WHERE Total_Amount > (
  8      SELECT AVG(Total_Amount)
  9      FROM HuftOrder
 10  )
 11  ORDER BY Total_Amount DESC;

  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT ORDER_STATUS
---------- ----------- ------------ --------------------
      1002           2         1849 Shipped
      1001           1         1750 Delivered
      1008           8         1498 Processing
      1004           4         1273 Delivered


SQL> SELECT
  2      Product_ID,
  3      Product_Name,
  4      Price,
  5      Stock
  6  FROM HuftProduct
  7  WHERE Price > (
  8      SELECT AVG(Price)
  9      FROM HuftProduct
 10  )
 11  ORDER BY Price DESC;

PRODUCT_ID PRODUCT_NAME                         PRICE STOCK
---------- ------------------------------ ----------- -----
       102 Grain Free Cat Food                 749.00    35
       113 Dog Harness                         699.00    22
       101 Chicken Dog Food                    599.00    50
       106 Cat Litter                          550.00    30
       109 Puppy Training Pads                 499.00    55

SQL> SELECT
  2      Product_ID,
  3      Product_Name,
  4      Price,
  5      Stock
  6  FROM HuftProduct
  7  WHERE Price < (
  8      SELECT AVG(Price)
  9      FROM HuftProduct
 10  )
 11  ORDER BY Price ASC;

PRODUCT_ID PRODUCT_NAME                         PRICE STOCK
---------- ------------------------------ ----------- -----
       108 Pet Feeding Bowl                    275.00    20
       112 Cat Grooming Brush                  325.00    28
       104 Pet Grooming Shampoo                350.00    40
       107 Dental Chew Sticks                  399.00    45
       110 Pet Conditioner                     425.00    30
       114 Premium Dog Treats                  450.00    40
       103 Leather Dog Collar                  450.00    25

7 rows selected.

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      SUM(o.Total_Amount) AS Total_Purchase
  5  FROM CUST3 c
  6  JOIN HuftOrder o
  7      ON c.CID = o.Customer_ID
  8  GROUP BY c.CID, c.CNAME
  9  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_PURCHASE
----------- ------------------------------ --------------
          2 Anu                                      1849
          1 Abi                                      1750
          8 Meena                                    1498
          4 Karthik                                  1273
          7 Arun                                     1197
          3 Ravi                                     1099
          5 Priya                                    1075
         10 Nisha                                     900
          6 Divya                                     650

9 rows selected.

SQL> SELECT
  2      MAX(Total_Purchase) AS Maximum_Purchase
  3  FROM (
  4      SELECT
  5          Customer_ID,
  6          SUM(Total_Amount) AS Total_Purchase
  7      FROM HuftOrder
  8      GROUP BY Customer_ID
  9  );

MAXIMUM_PURCHASE
----------------
            1849

SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      c.EMAIL,
  5      c.PHONE_NO,
  6      SUM(o.Total_Amount) AS Total_Purchase
  7  FROM CUST3 c
  8  JOIN HuftOrder o
  9      ON c.CID = o.Customer_ID
 10  GROUP BY
 11      c.CID,
 12      c.CNAME,
 13      c.EMAIL,
 14      c.PHONE_NO
 15  HAVING SUM(o.Total_Amount) = (
 16      SELECT MAX(Total_Purchase)
 17      FROM (
 18          SELECT
 19              SUM(Total_Amount) AS Total_Purchase
 20          FROM HuftOrder
 21          GROUP BY Customer_ID
 22      )
 23  );

CUSTOMER_ID CUSTOMER_NAME                  EMAIL                            PHONE_NO TOTAL_PURCHASE
----------- ------------------------------ ------------------------------ ---------- --------------
          2 Anu                            anu@gmail.com                   987654321           1849



SQL> SELECT DISTINCT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      c.EMAIL,
  5      c.PHONE_NO
  6  FROM CUST3 c
  7  JOIN HuftOrder o
  8      ON c.CID = o.Customer_ID
  9  WHERE o.Total_Amount > (
 10      SELECT AVG(Total_Amount)
 11      FROM HuftOrder
 12  )
 13  ORDER BY c.CID;

CUSTOMER_ID CUSTOMER_NAME                  EMAIL                            PHONE_NO
----------- ------------------------------ ------------------------------ ----------
          1 Abi                            abi@gmail.com                  1234567890
          2 Anu                            anu@gmail.com                   987654321
          4 Karthik                        karthik@gmail.com              9876543210
          8 Meena                          meena@gmail.com                9432109876


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      SUM(oi.Quantity) AS Total_Quantity,
  5      SUM(oi.Total_Amount) AS Total_Sales
  6  FROM HuftProduct p
  7  JOIN HuftOrder_Item oi
  8      ON p.Product_ID = oi.Product_ID
  9  GROUP BY p.Product_ID, p.Product_Name
 10  HAVING SUM(oi.Total_Amount) > (
 11      SELECT AVG(Product_Sales)
 12      FROM (
 13          SELECT
 14              SUM(Total_Amount) AS Product_Sales
 15          FROM HuftOrder_Item
 16          GROUP BY Product_ID
 17      )
 18  )
 19  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                   TOTAL_QUANTITY TOTAL_SALES
---------- ------------------------------ -------------- -----------
       102 Grain Free Cat Food                         3        2247
       101 Chicken Dog Food                            3        1950
       107 Dental Chew Sticks                          4        1596
       109 Puppy Training Pads                         3        1497
       103 Leather Dog Collar                          3        1350


SQL> SELECT
  2      c.CID AS Customer_ID,
  3      c.CNAME AS Customer_Name,
  4      COUNT(o.Order_ID) AS Number_Of_Orders,
  5      SUM(o.Total_Amount) AS Total_Purchase,
  6      AVG(o.Total_Amount) AS Average_Order_Value
  7  FROM CUST3 c
  8  JOIN HuftOrder o
  9      ON c.CID = o.Customer_ID
 10  GROUP BY c.CID, c.CNAME
 11  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME          NUMBER_OF_ORDERS TOTAL_PURCHASE AVERAGE_ORDER_VALUE
----------- ---------------------- ---------------- -------------- -------------------
          2 Anu                                   1       1,849.00            1,849.00
          1 Abi                                   1       1,750.00            1,750.00
          8 Meena                                 1       1,498.00            1,498.00
          4 Karthik                               1       1,273.00            1,273.00
          7 Arun                                  1       1,197.00            1,197.00
          3 Ravi                                  1       1,099.00            1,099.00
          5 Priya                                 1       1,075.00            1,075.00
         10 Nisha                                 1         900.00              900.00
          6 Divya                                 1         650.00              650.00

9 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      COUNT(DISTINCT oi.Order_ID) AS Number_Of_Orders,
  5      SUM(oi.Quantity) AS Total_Quantity,
  6      SUM(oi.Total_Amount) AS Total_Sales,
  7      AVG(oi.Price) AS Average_Selling_Price
  8  FROM HuftProduct p
  9  JOIN HuftOrder_Item oi
 10      ON p.Product_ID = oi.Product_ID
 11  GROUP BY p.Product_ID, p.Product_Name
 12  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME              NUMBER_OF_ORDERS TOTAL_QUANTITY TOTAL_SALES AVERAGE_SELLING_PRICE
---------- ------------------------- ---------------- -------------- ----------- ---------------------
       102 Grain Free Cat Food                      2              3    2,247.00                749.00
       101 Chicken Dog Food                         2              3    1,950.00                650.00
       107 Dental Chew Sticks                       2              4    1,596.00                399.00
       109 Puppy Training Pads                      2              3    1,497.00                499.00
       103 Leather Dog Collar                       2              3    1,350.00                450.00
       106 Cat Litter                               1              2    1,100.00                550.00
       104 Pet Grooming Shampoo                     1              2      700.00                350.00
       112 Cat Grooming Brush                       1              2      650.00                325.00
       108 Pet Feeding Bowl                         1              2      550.00                275.00
       110 Pet Conditioner                          1              1      425.00                425.00

10 rows selected.

SQL> SELECT
  2      c.Category_ID,
  3      c.Category_Name,
  4      COUNT(DISTINCT p.Product_ID) AS Number_Of_Products,
  5      SUM(oi.Quantity) AS Total_Quantity,
  6      SUM(oi.Total_Amount) AS Total_Sales,
  7      AVG(oi.Price) AS Average_Selling_Price
  8  FROM HuftCategory c
  9  JOIN HuftProduct p
 10      ON c.Category_ID = p.Category_ID
 11  JOIN HuftOrder_Item oi
 12      ON p.Product_ID = oi.Product_ID
 13  GROUP BY c.Category_ID, c.Category_Name
 14  ORDER BY Total_Sales DESC;

CATEGORY_ID CATEGORY_NAME             NUMBER_OF_PRODUCTS TOTAL_QUANTITY TOTAL_SALES AVERAGE_SELLING_PRICE
----------- ------------------------- ------------------ -------------- ----------- ---------------------
          1 Dog Food                                   3             10    5,043.00                516.00
          2 Cat Food                                   2              5    3,347.00                682.67
          3 Accessories                                2              5    1,900.00                391.67
          4 Grooming                                   3              5    1,775.00                366.67

