SQL> CREATE TABLE HuftSeller (
  2      Seller_ID NUMBER PRIMARY KEY,
  3      Seller_Name VARCHAR2(100),
  4      Contact_Number VARCHAR2(15),
  5      Email VARCHAR2(100)
  6  );

Table created.

SQL> ALTER TABLE HuftSeller
  2  ADD Address VARCHAR2(200);

Table altered.

SQL> INSERT INTO HuftSeller VALUES (1, 'Arun Pet Supplies', '9876543210', 'arunpets@gmail.com', 'Chennai');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (2, 'Pawsome Traders', '9876543211', 'pawsome@gmail.com', 'Tambaram');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (3, 'Happy Tails Store', '9876543212', 'happytails@gmail.com', 'Velachery');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (4, 'Pet Paradise', '9876543213', 'petparadise@gmail.com', 'Adyar');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (5, 'Furry Friends', '9876543214', 'furryfriends@gmail.com', 'Chrompet');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (6, 'Pet Care Hub', '9876543215', 'petcarehub@gmail.com', 'Guindy');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (7, 'Animal World', '9876543216', 'animalworld@gmail.com', 'Porur');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (8, 'Pet Basket', '9876543217', 'petbasket@gmail.com', 'Anna Nagar');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (9, 'Paw Mart', '9876543218', 'pawmart@gmail.com', 'Mylapore');

1 row created.

SQL> INSERT INTO HuftSeller VALUES (10, 'Pet Needs', '9876543219', 'petneeds@gmail.com', 'T Nagar');

1 row created.


SQL> SELECT
  2      s.Seller_ID,
  3      s.Seller_Name,
  4      p.Product_ID,
  5      p.Product_Name,
  6      p.Price,
  7      i.Stock_Quantity,
  8      i.Stock_Status
  9  FROM HuftSeller s
 10  JOIN HuftInventory i
 11  ON s.Seller_ID = i.Seller_ID
 12  JOIN HuftProduct p
 13  ON i.Product_ID = p.Product_ID
 14  ORDER BY s.Seller_ID;

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         1
Arun Pet Supplies
       101

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Chicken Dog Food
       599             50 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         2
Pawsome Traders
       102

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Grain Free Cat Food
       749             35 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         3
Happy Tails Store
       103

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Leather Dog Collar
       450             25 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         4
Pet Paradise
       104

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Pet Grooming Shampoo
       350             40 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         5
Furry Friends
       106

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Cat Litter
       550             30 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         6
Pet Care Hub
       107

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Dental Chew Sticks
       399             45 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         7
Animal World
       108

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Pet Feeding Bowl
       275             20 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         8
Pet Basket
       109

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Puppy Training Pads
       499             55 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         9
Paw Mart
       110

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Pet Conditioner
       425              0 Unavailable


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
        10
Pet Needs
       112

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Cat Grooming Brush
       325             28 Available


10 rows selected.


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      s.Seller_Name,
  5      i.Stock_Quantity,
  6      i.Stock_Status
  7  FROM HuftInventory i
  8  JOIN HuftProduct p
  9  ON i.Product_ID = p.Product_ID
 10  JOIN HuftSeller s
 11  ON i.Seller_ID = s.Seller_ID
 12  WHERE i.Stock_Status = 'Available';

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       101
Chicken Dog Food
Arun Pet Supplies
            50 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       102
Grain Free Cat Food
Pawsome Traders
            35 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       103
Leather Dog Collar
Happy Tails Store
            25 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       104
Pet Grooming Shampoo
Pet Paradise
            40 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       106
Cat Litter
Furry Friends
            30 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       107
Dental Chew Sticks
Pet Care Hub
            45 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       108
Pet Feeding Bowl
Animal World
            20 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       109
Puppy Training Pads
Pet Basket
            55 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       112
Cat Grooming Brush
Pet Needs
            28 Available


9 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      s.Seller_Name,
  5      i.Stock_Quantity,
  6      i.Stock_Status
  7  FROM HuftInventory i
  8  JOIN HuftProduct p
  9  ON i.Product_ID = p.Product_ID
 10  JOIN HuftSeller s
 11  ON i.Seller_ID = s.Seller_ID
 12  WHERE i.Stock_Status = 'Unavailable';

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       110
Pet Conditioner
Paw Mart
             0 Unavailable

