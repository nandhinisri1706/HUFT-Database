# E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM – A CASE STUDY OF HEADS UP FOR TAILS

## 1. Project Overview

The **HUFT E-Commerce Order Management Database System** is a database management project designed for an e-commerce platform based on **Heads Up For Tails (HUFT)**. The project focuses on efficiently managing product and category information using a relational database.

The system maintains product details such as product name, category, price, and stock availability. It establishes a relationship between the category and product tables using **Primary Key and Foreign Key constraints**.

The project is implemented using **Oracle SQL** and executed through **SQL*Plus** using the **VS Code terminal**.

## 2. Project Objectives

The main objectives of this project are:

* To design structured tables for product and category management.
* To define Primary Key and Foreign Key relationships.
* To store and manage product information efficiently.
* To perform product insertion, updating, and deletion operations.
* To maintain data integrity using relational constraints.
* To generate category-wise product reports.
* To reduce data redundancy and maintain consistency.

## 3. Database Tables

The project mainly consists of two tables:

### HuftCategory

The `HuftCategory` table stores category-related information.

| Column        | Description                         |
| ------------- | ----------------------------------- |
| Category_ID   | Unique identifier for each category |
| Category_Name | Name of the product category        |

**Primary Key:** `Category_ID`

### HuftProduct

The `HuftProduct` table stores product-related information.

| Column       | Description                          |
| ------------ | ------------------------------------ |
| Product_ID   | Unique identifier for each product   |
| Product_Name | Name of the product                  |
| Category_ID  | Category associated with the product |
| Price        | Price of the product                 |
| Stock        | Available quantity                   |

**Primary Key:** `Product_ID`
**Foreign Key:** `Category_ID` referencing `HuftCategory(Category_ID)`

## 4. Relationship

The relationship between the tables is:

**HuftCategory → HuftProduct**

One category can contain multiple products, while each product belongs to one category.

**Relationship Type: One-to-Many (1:M)**

```text
HuftCategory
    |
    | Category_ID (PK)
    |
    | 1
    |
    |------ M
             |
        HuftProduct
        Category_ID (FK)
```

## 5. Key Features

### Product Management

The system supports:

* Adding new products.
* Updating existing product details.
* Deleting products.
* Viewing product information.
* Managing product stock and price.

### Category Management

The system supports:

* Creating product categories.
* Updating category names.
* Deleting categories when there are no dependent products.
* Viewing available categories.

### Referential Integrity

The Foreign Key constraint ensures that a product can only be assigned to an existing category. This prevents invalid category references and maintains consistency between the tables.

## 6. SQL Operations Performed

The following database operations are implemented:

1. **CREATE** – Creation of `HuftCategory` and `HuftProduct` tables.
2. **INSERT** – Adding category and product records.
3. **UPDATE** – Modifying product and category information.
4. **DELETE** – Removing product and category records.
5. **SELECT** – Retrieving and displaying stored data.
6. **JOIN** – Combining category and product information for reports.
7. **GROUP BY** – Generating category-wise summaries.

## 7. Category-Wise Product Report

The system generates reports by combining the `HuftCategory` and `HuftProduct` tables.

```sql
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
```

This report displays products along with their corresponding categories, prices, and stock quantities.

## 8. Tools and Technologies

* **Database:** Oracle Database
* **Language:** SQL
* **Execution Tool:** SQL*Plus
* **Code Editor:** Visual Studio Code
* **Database Concept:** Relational Database Management System

## 9. Data Integrity

Primary Key and Foreign Key constraints are used to maintain data integrity.

* `Category_ID` uniquely identifies each category.
* `Product_ID` uniquely identifies each product.
* `HuftProduct.Category_ID` references `HuftCategory.Category_ID`.
* Duplicate primary key values are not allowed.
* Products cannot reference a category that does not exist.

## 10. Expected Outcome

The completed system provides an organized database for managing HUFT product and category information. It demonstrates fundamental DBMS operations including table creation, relationships, data manipulation, constraints, and report generation.

The project helps demonstrate how relational databases can be used to manage e-commerce product information efficiently while maintaining **data consistency, integrity, and reduced redundancy**.

## 11. Conclusion

The **HUFT E-Commerce Order Management Database System** successfully demonstrates the implementation of a relational database for product and category management. The use of Primary Keys, Foreign Keys, SQL operations, and category-wise reporting provides a structured approach to managing e-commerce data.

The project serves as a practical implementation of fundamental **Database Management System concepts using Oracle SQL and SQL*Plus**.
