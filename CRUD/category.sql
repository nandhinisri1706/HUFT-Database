CREATE TABLE HuftCategory (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(50)
);

//Table created.

INSERT INTO  VALUES (1, 'Dog Food');
INSERT INTO HuftCategory VALUES (2, 'Cat Food');
INSERT INTO HuftCategory VALUES (3, 'Accessories');
INSERT INTO HuftCategory VALUES (4, 'Grooming');
INSERT INTO HuftCategory VALUES (5, 'Toys');

//4 rows created.

UPDATE HuftCategory
SET Category_Name = 'Premium Dog Food'
WHERE Category_ID = 1;

//1row updated.

UPDATE HuftCategory
SET Category_Name = 'Pet Accessories'
WHERE Category_ID = 3;

//1row updated.

DELETE FROM HuftProduct
WHERE Category_ID = 5;

//1 row deleted.

DELETE FROM HuftCategory
WHERE Category_ID = 5;

//1 row deleted.

SELECT
    c.Category_ID,
    c.Category_Name,
    p.Product_ID,
    p.Product_Name,
    p.Price,
    p.Stock
FROM HuftCategory c
JOIN HuftProduct p
ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name, p.Product_Name;

// Category-wise Product Report
CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
          2 Cat Food                                                  106
Cat Litter
       550         30

          2 Cat Food                                                  102
Grain Free Cat Food
       749         80

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------

          3 Pet Accessories                                           113
Dog Harness
       699         22

          3 Pet Accessories                                           103
Leather Dog Collar

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
       450         25

          3 Pet Accessories                                           108
Pet Feeding Bowl
       275         20

          1 Premium Dog Food                                          101

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
Chicken Dog Food
       650         50

          1 Premium Dog Food                                          107
Dental Chew Sticks
       399         45


CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
          1 Premium Dog Food                                          114
Premium Dog Treats
       450         40

          1 Premium Dog Food                                          109
Puppy Training Pads
       499         55

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------


//9 rows selected.

SELECT
    c.Category_ID,
    c.Category_Name,
    COUNT(p.Product_ID) AS Total_Products
FROM HuftCategory c
LEFT JOIN HuftProduct p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
ORDER BY c.Category_ID;

//Category-wise Total Products Report

CATEGORY_ID CATEGORY_NAME                                      TOTAL_PRODUCTS
----------- -------------------------------------------------- --------------
          1 Dog Food                                                        4
          2 Cat Food                                                        2
          3 Accessories                                                     3
          4 Grooming                                                        3
          5 Toys                                                            0
