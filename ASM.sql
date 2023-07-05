go
Use master;
go
create database shopgiay19;
go
use shopgiay19;
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
  color_name VARCHAR(50) NOT NULL,
  color_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Sizes
CREATE TABLE sizes (
  size_id BIGINT PRIMARY KEY IDENTITY(1,1),
  size_number FLOAT NOT NULL,
  size_activities BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng Products
CREATE TABLE products (
  product_id BIGINT PRIMARY KEY IDENTITY(1,1),
  product_name VARCHAR(100) NOT NULL,
  category_id BIGINT NOT NULL,
  brand_id BIGINT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  product_image1 VARCHAR(50) NOT NULL,
  product_image2 VARCHAR(50) NOT NULL,
  product_image3 VARCHAR(50) NOT NULL,
  product_type BIT NOT NULL DEFAULT 0,
  product_activities BIT NOT NULL DEFAULT 0,
  create_date datetime,
  product_description VARCHAR(255),
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
CREATE TABLE customers (
  customer_id BIGINT PRIMARY KEY IDENTITY(1,1),
  customer_name NVARCHAR(255),
  customer_address NVARCHAR(255),
  customer_phone VARCHAR(20),
  customer_birthday NVARCHAR(255),
  customer_email NVARCHAR(255),
  customer_password NVARCHAR(255),
  customer_image NVARCHAR(255),
  last_login datetime,
  date_created datetime
);
go
-- Tạo bảng Employees
CREATE TABLE employees (
  employee_id BIGINT PRIMARY KEY IDENTITY(1,1),
  employee_name NVARCHAR(255),
  employee_address NVARCHAR(255),
  employee_phone VARCHAR(20),
  employee_birthday NVARCHAR(255),
  employee_role bit,
  employee_email NVARCHAR(255),
  employee_password NVARCHAR(255),
  employee_image NVARCHAR(255),
  last_login datetime,
  date_created datetime
);
go
-- Tạo bảng Orders
CREATE TABLE orders (
  order_id BIGINT PRIMARY KEY IDENTITY(1,1),
  customer_id BIGINT,
  orderdate DATEtime,
  total float,
  [status] Nvarchar(50),
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  
);
go
-- Tạo bảng OrderDetails
CREATE TABLE orderdetails (
  orderdetail_id BigINT not null primary key IDENTITY(1,1),
  order_id BigINT,
  variant_id BigINT,
  quantity INT,
  
  CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_variant FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);
-- Tạo bảng Carts

CREATE TABLE carts (
  cart_id BigINT primary key IDENTITY(1,1),
  customer_id BigINT,
  variant_id BigINT,
  quantity INT,
  CONSTRAINT fk_orderss FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_variantss FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);
go
-- Tạo bảng Promotions
CREATE TABLE promotions (
  promotion_id BIGINT PRIMARY KEY IDENTITY(1,1),
  promotion_name NVARCHAR(100),
  [start_date] DATE,
  end_date DATE,
  statuss NVARCHAR(50),
  discount float,
  describe NVARCHAR(250)
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
CREATE TABLE comments (
  comment_id BIGINT PRIMARY KEY IDENTITY(1,1),
  product_id BIGINT,
  customer_id BIGINT,
  employee_id BIGINT,
  comment NVARCHAR(255),
  reply NVARCHAR(255),
  create_date date,
  [status] BIT DEFAULT 0,
  CONSTRAINT fk_product_comment FOREIGN KEY (product_id) REFERENCES products(product_id),
  CONSTRAINT fk_customer_comment FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_employee_comment FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
go
-- Tạo bảng Promotions_Products
CREATE TABLE promotions_products (
  promotion_product_id BIGINT PRIMARY KEY IDENTITY(1,1),
  promotion_id BIGINT,
  product_id BIGINT,
  CONSTRAINT fk_promotion FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id),
  CONSTRAINT fk_product_promotion FOREIGN KEY (product_id) REFERENCES products(product_id)
);
go
-- Tạo bảng Favorites
CREATE TABLE favorites (
  favorite_id BIGINT PRIMARY KEY IDENTITY(1,1),
  customer_id BIGINT,
  product_id BIGINT,
  date_like DATETIME,
  CONSTRAINT fk_customer_favorite FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_product_favorite FOREIGN KEY (product_id) REFERENCES products(product_id)
);
go
-- Tạo bảng Suppliers
CREATE TABLE suppliers (
  supplier_id BIGINT PRIMARY KEY IDENTITY(1,1),
  supplier_name NVARCHAR(100),
  addresss NVARCHAR(100),
  phone VARCHAR(20),
  statuss BIT NOT NULL DEFAULT 0
);
go
-- Tạo bảng SupplierProducts
CREATE TABLE supplier_products (
  supplier_product_id BIGINT PRIMARY KEY IDENTITY(1,1),
  supplier_id BIGINT,
  product_id BIGINT,
  CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  CONSTRAINT fk_product_supplier FOREIGN KEY (product_id) REFERENCES products(product_id)
);