CREATE TABLE HuftProduct (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Category_ID NUMBER,
    Price NUMBER(10,2),
    Stock NUMBER,
CONSTRAINT fk1_product_category
        FOREIGN KEY (Category_ID)
        REFERENCES HuftCategory(Category_ID)
);

//Table created.

INSERT INTO HuftProduct VALUES (102, 'Grain Free Cat Food', 2, 749.00, 35);
INSERT INTO HuftProduct VALUES (103, 'Leather Dog Collar', 3, 450.00, 25);
INSERT INTO HuftProduct VALUES (104, 'Pet Grooming Shampoo', 4, 350.00, 40);
INSERT INTO HuftProduct VALUES (105, 'Squeaky Dog Toy', 5, 299.00, 60);
INSERT INTO HuftProduct VALUES (106, 'Cat Litter', 2, 550.00, 30);
INSERT INTO HuftProduct VALUES (107, 'Dental Chew Sticks', 1, 399.00, 45);
INSERT INTO HuftProduct VALUES (108, 'Pet Feeding Bowl', 3, 275.00, 20);
INSERT INTO HuftProduct VALUES (109, 'Puppy Training Pads', 1, 499.00, 55);
INSERT INTO HuftProduct VALUES (110, 'Pet Conditioner', 4, 425.00, 30);
INSERT INTO HuftProduct VALUES (111, 'Rubber Ball Toy', 5, 199.00, 70);
INSERT INTO HuftProduct VALUES (112, 'Cat Grooming Brush', 4, 325.00, 28);
INSERT INTO HuftProduct VALUES (113, 'Dog Harness', 3, 699.00, 22);
INSERT INTO HuftProduct VALUES (114, 'Premium Dog Treats', 1, 450.00, 40);
INSERT INTO HuftProduct VALUES (115, 'Interactive Cat Toy', 5, 599.00, 18);

//15 rows created.

UPDATE HuftProduct
SET Price = 650
WHERE Product_ID = 101;

//1 row updated.

UPDATE HuftProduct
SET Stock = 80
WHERE Product_ID = 102;

//1 row updated.

DELETE FROM HuftProduct
WHERE Product_ID = 115;

//1 row deleted.

DELETE FROM HuftProduct
WHERE Product_ID = 114;

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


9 rows selected.

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
