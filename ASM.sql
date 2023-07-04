Use master;
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
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATE,
  CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
go
-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
  OrderID INT,
  VariantID INT,
  Quantity INT,
  CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  CONSTRAINT fk_variant FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
);
go
-- Tạo bảng Promotions
CREATE TABLE Promotions (
  PromotionID INT PRIMARY KEY,
  PromotionName VARCHAR(255),
  StartDate DATE,
  EndDate DATE
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
CREATE TABLE Promotions_Products (
  PromotionID INT,
  ProductID INT,
  CONSTRAINT fk_promotion FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID),
  CONSTRAINT fk_product_promotion FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
go
-- Tạo bảng Favorites
CREATE TABLE Favorites (
  CustomerID INT,
  ProductID INT,
  CONSTRAINT fk_customer_favorite FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  CONSTRAINT fk_product_favorite FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
go
-- Tạo bảng Suppliers
CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20)
);
go
-- Tạo bảng SupplierProducts
CREATE TABLE SupplierProducts (
  SupplierID INT,
  ProductID INT,
  CONSTRAINT fk_supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
  CONSTRAINT fk_product_supplier FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

