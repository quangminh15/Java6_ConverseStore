Use master;
go
create database shopgiay14;
go
use shopgiay14;
go
-- Tạo bảng Brands
CREATE TABLE Brands (
  BrandID INT PRIMARY KEY,
  BrandName VARCHAR(255)
);
go
-- Tạo bảng Categories
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(255)
);
go
-- Tạo bảng Colors
CREATE TABLE Colors (
  ColorID INT PRIMARY KEY,
  ColorName VARCHAR(255)
);
go
-- Tạo bảng Sizes
CREATE TABLE Sizes (
  SizeID INT PRIMARY KEY,
  SizeName VARCHAR(255)
);
go
-- Tạo bảng Products
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  CategoryID INT,
  BrandID INT,
  Price DECIMAL(10, 2),
  CONSTRAINT fk_category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
  CONSTRAINT fk_brand FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);
go
-- Tạo bảng ProductVariants
CREATE TABLE ProductVariants (
  VariantID INT PRIMARY KEY,
  ProductID INT,
  SizeID INT,
  ColorID INT,
  StockQuantity INT,
  CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  CONSTRAINT fk_size FOREIGN KEY (SizeID) REFERENCES Sizes(SizeID),
  CONSTRAINT fk_color FOREIGN KEY (ColorID) REFERENCES Colors(ColorID)
);
go
-- Tạo bảng Customers
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20)
);
go
-- Tạo bảng Employees
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  EmployeeName VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20)
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
CREATE TABLE promotions (
  promotionID INT PRIMARY KEY,
  promotionName VARCHAR(255),
  startDate DATE,
  endDate DATE,
  statuss NVARCHAR(50)
);
go
-- Tạo bảng Inventory
CREATE TABLE Inventory (
  VariantID INT PRIMARY KEY,
  Quantity INT,
  CONSTRAINT fk_variant_inventory FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
);
go
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
CREATE TABLE suppliers (
  supplierID INT PRIMARY KEY,
  supplierName VARCHAR(255),
  addresss VARCHAR(255),
  phone VARCHAR(20),
  statuss BIT
);
go
-- Tạo bảng SupplierProducts
CREATE TABLE SupplierProducts (
  SupplierID INT,
  ProductID INT,
  CONSTRAINT fk_supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
  CONSTRAINT fk_product_supplier FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

