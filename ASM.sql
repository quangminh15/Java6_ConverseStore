﻿Use master;
go
create database shopgiay14;
go
use shopgiay14;
go
-- Tạo bảng Brands
CREATE TABLE brands (
  brand_id BIGINT PRIMARY KEY IDENTITY(1,1),
  brand_name VARCHAR(50) NOT NULL,
  brand_image VARCHAR(50) NOT NULL,
  brand_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Categories
CREATE TABLE categories (
  category_id BIGINT PRIMARY KEY IDENTITY(1,1),
  category_name VARCHAR(50) NOT NULL,
  category_image VARCHAR(50) NOT NULL,
  category_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Colors
CREATE TABLE colors (
  color_id BIGINT PRIMARY KEY IDENTITY(1,1),
  color_name VARCHAR(50) NOT NULL
  color_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Sizes
CREATE TABLE sizes (
  size_id BIGINT PRIMARY KEY IDENTITY(1,1),
  size_number FLOAT NOT NULL
  size_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Products
CREATE TABLE products (
  product_id BIGINT PRIMARY KEY IDENTITY(1,1),
  product_name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  brand_id INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  product_activities BIT NOT NULL DEFAULT 0
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id),
  CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);
go
-- Tạo bảng ProductVariants
CREATE TABLE product_variants (
  variant_id BIGINT PRIMARY KEY IDENTITY(1,1),
  product_id BIGINT NOT NULL,
  size_id BIGINT NOT NULL,
  color_id BIGINT NOT NULL,
  quantity BIGINT NOT NULL,
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id),
  CONSTRAINT fk_size FOREIGN KEY (size_id) REFERENCES sizes(size_id),
  CONSTRAINT fk_color FOREIGN KEY (color_id) REFERENCES colors(color_id)
);
go
-- Tạo bảng Customers
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY IDENTITY(1,1),
  customer_name NVARCHAR(255),
  customer_address NVARCHAR(255),
  customer_phone VARCHAR(20),
  customer_birthday NVARCHAR(255),
  customer_email NVARCHAR(255),
  customer_image NVARCHAR(255),
  last_login datetime,
  date_created datetime
);
go
-- Tạo bảng Employees
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY IDENTITY(1,1),
  employee_name NVARCHAR(255),
  employee_address NVARCHAR(255),
  employee_phone VARCHAR(20),
  employee_birthday NVARCHAR(255),
  employee_role bit,
  employee_email NVARCHAR(255),
  employee_image NVARCHAR(255),
  last_login datetime,
  date_created datetime
);
go
-- Tạo bảng Orders
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  employee_id INT,
  orderdate DATE,
  total float,
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(CustomerID),
  CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES Employees(EmployeeID)
);
go
-- Tạo bảng OrderDetails
CREATE TABLE orderdetails (
  orderdetails_id BigINT not null primary key,
  order_id BigINT,
  variantIid BigINT,
  Quantity INT,
  
  CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders(order_id),
  CONSTRAINT fk_variant FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
);
-- Tạo bảng cart

CREATE TABLE cart (
  cart_id BigINT,
  customer_id BigINT,
  variant_id BigINT,
  quantity INT,
  
  CONSTRAINT fk_order FOREIGN KEY (customer_id) REFERENCES Customers(customerID),
  CONSTRAINT fk_variant FOREIGN KEY (variant_id) REFERENCES ProductVariants(VariantID)
);
go
-- Tạo bảng Promotions
CREATE TABLE promotions (
  promotionid INT PRIMARY KEY,
  promotionname VARCHAR(255),
  startdate DATE,
  enddate DATE,
  statuss NVARCHAR(50)
);
go
---- Tạo bảng Inventory
--CREATE TABLE Inventory (
--  VariantID INT PRIMARY KEY,
--  Quantity INT,
--  CONSTRAINT fk_variant_inventory FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
--);
--go
-- Tạo bảng Comments
CREATE TABLE Comments (
  CommentID INT PRIMARY KEY,
  ProductID INT,
  CustomerID INT,
  EmployeeID INT,
  Comment TEXT,
  Reply TEXT,
  CONSTRAINT fk_product_comment FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  CONSTRAINT fk_customer_comment FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  CONSTRAINT fk_employee_comment FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
go
-- Tạo bảng Promotions_Products
CREATE TABLE promotions_products (
  promotionid INT,
  productid INT,
  CONSTRAINT fk_promotion FOREIGN KEY (promotionid) REFERENCES promotions(promotionid),
  CONSTRAINT fk_product_promotion FOREIGN KEY (productid) REFERENCES products(productid)
);
go
-- Tạo bảng Favorites
CREATE TABLE favorites (
  customerid INT,
  productid INT,
  datelike DATE,
  CONSTRAINT fk_customer_favorite FOREIGN KEY (customerid) REFERENCES customers(customerid),
  CONSTRAINT fk_product_favorite FOREIGN KEY (productid) REFERENCES products(productid)
);
go
-- Tạo bảng Suppliers
CREATE TABLE suppliers (
  supplierid INT PRIMARY KEY,
  suppliername VARCHAR(255),
  addresss VARCHAR(255),
  phone VARCHAR(20),
  statuss BIT
);
go
-- Tạo bảng SupplierProducts
CREATE TABLE supplierproducts (
  supplierid INT,
  productid INT,
  CONSTRAINT fk_supplier FOREIGN KEY (supplierid) REFERENCES suppliers(supplierid),
  CONSTRAINT fk_product_supplier FOREIGN KEY (ProductID) REFERENCES products(productid)
);

