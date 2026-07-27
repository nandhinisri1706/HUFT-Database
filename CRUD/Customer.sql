CREATE TABLE CUST3(
        CID NUMBER PRIMARY KEY,
        CNAME VARCHAR2(30) NOT NULL,
        EMAIL VARCHAR2(30) UNIQUE,
        PHONE_NO NUMBER,
        ADDRESS VARCHAR2(50)  );

--Table created 

INSERT INTO CUST3 VALUES (1,'Abi','abi@gmail.com',1234567890,'Ramapuram Chennai');

--1 row created.


INSERT INTO CUST3 VALUES (2,'Anu','anu@gmail.com',0987654321,'Madurai');

--1 row created.


 INSERT INTO CUST3 VALUES (3,'Ravi','ravi@gmail.com',9087654321,'Chengalpattu');

--1 row created.

 
INSERT INTO CUST3 VALUES (4,'Karthik','karthik@gmail.com',9876543210,'Coimbatore');

--1 row created.

 
 INSERT INTO CUST3 VALUES (5,'Priya','priya@gmail.com',8765432109,'Salem');

--1 row created.

 
 INSERT INTO CUST3 VALUES (6,'Divya','divya@gmail.com',7654321098,'Trichy');

--1 row created.


INSERT INTO CUST3 VALUES (7,'Arun','arun@gmail.com',6543210987,'Vellore');

--1 row created.


INSERT INTO CUST3 VALUES (8,'Meena','meena@gmail.com',9432109876,'Tirunelveli');

--1 row created.

 
INSERT INTO CUST3 VALUES (10,'Nisha','nisha@gmail.com',9210987654,'Thanjavur');

--1 row created.


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         1 Abi                            abi@gmail.com
1234567890 Ramapuram Chennai

         2 Anu                            anu@gmail.com
 987654321 Madurai

         3 Ravi                           ravi@gmail.com
9087654321 Chengalpattu


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         4 Karthik                        karthik@gmail.com
9876543210 Coimbatore

         5 Priya                          priya@gmail.com
8765432109 Salem

         6 Divya                          divya@gmail.com
7654321098 Trichy


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         7 Arun                           arun@gmail.com
6543210987 Vellore

         8 Meena                          meena@gmail.com
9432109876 Tirunelveli

         9 Suresh                         suresh@gmail.com
9321098765 Erode


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
        10 Nisha                          nisha@gmail.com
9210987654 Thanjavur


--10 rows selected.

UPDATE CUST3
    SET ADDRESS = 'Vellore'
    WHERE CID = 10;

--1 row updated.
 SELECT * FROM CUST3;

       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         1 Abi                            abi@gmail.com
1234567890 Ramapuram Chennai

         2 Anu                            anu@gmail.com
 987654321 Madurai

         3 Ravi                           ravi@gmail.com
9087654321 Chengalpattu


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         4 Karthik                        karthik@gmail.com
9876543210 Coimbatore

         5 Priya                          priya@gmail.com
8765432109 Salem

         6 Divya                          divya@gmail.com
7654321098 Trichy


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         7 Arun                           arun@gmail.com
6543210987 Vellore

         8 Meena                          meena@gmail.com
9432109876 Tirunelveli

         9 Suresh                         suresh@gmail.com
9321098765 Erode


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
        10 Nisha                          nisha@gmail.com
9210987654 Vellore


--10 rows selected.

DELETE FROM CUST3
    WHERE CID = 9;

--1 row deleted.

SELECT * FROM CUST3;

       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         1 Abi                            abi@gmail.com
1234567890 Ramapuram Chennai

         2 Anu                            anu@gmail.com
 987654321 Madurai

         3 Ravi                           ravi@gmail.com
9087654321 Chengalpattu


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         4 Karthik                        karthik@gmail.com
9876543210 Coimbatore

         5 Priya                          priya@gmail.com
8765432109 Salem

         6 Divya                          divya@gmail.com
7654321098 Trichy


       CID CNAME                          EMAIL
---------- ------------------------------ ------------------------------
  PHONE_NO --ADDRESS
---------- --------------------------------------------------
         7 Arun                           arun@gmail.com
6543210987 Vellore

         8 Meena                          meena@gmail.com
9432109876 Tirunelveli

        10 Nisha                          nisha@gmail.com
9210987654 Vellore


--9 rows selected

COMMIT;

--Commit complete;
