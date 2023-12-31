USE [master]
GO
/****** Object:  Database [conversejava6]    Script Date: 8/10/2023 2:52:03 PM ******/
CREATE DATABASE [conversejava6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'conversejava6', FILENAME = N'C:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\conversejava6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'conversejava6_log', FILENAME = N'C:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\conversejava6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [conversejava6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [conversejava6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [conversejava6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [conversejava6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [conversejava6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [conversejava6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [conversejava6] SET ARITHABORT OFF 
GO
ALTER DATABASE [conversejava6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [conversejava6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [conversejava6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [conversejava6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [conversejava6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [conversejava6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [conversejava6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [conversejava6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [conversejava6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [conversejava6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [conversejava6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [conversejava6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [conversejava6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [conversejava6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [conversejava6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [conversejava6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [conversejava6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [conversejava6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [conversejava6] SET  MULTI_USER 
GO
ALTER DATABASE [conversejava6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [conversejava6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [conversejava6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [conversejava6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [conversejava6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [conversejava6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'conversejava6', N'ON'
GO
ALTER DATABASE [conversejava6] SET QUERY_STORE = OFF
GO
USE [conversejava6]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[brand_id] [bigint] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](50) NOT NULL,
	[brand_image] [nvarchar](50) NOT NULL,
	[brand_activities] [bit] NOT NULL,
 CONSTRAINT [PK__brands__5E5A8E2787DDC599] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_items]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_items](
	[cart_item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cart_id] [bigint] NULL,
	[variant_id] [bigint] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[cart_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[category_image] [nvarchar](50) NOT NULL,
	[category_activities] [bit] NOT NULL,
 CONSTRAINT [PK__categori__D54EE9B4A5B8840A] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[color_id] [bigint] IDENTITY(1,1) NOT NULL,
	[color_name] [nvarchar](50) NOT NULL,
	[color_activities] [bit] NOT NULL,
 CONSTRAINT [PK__colors__1143CECBDD7A1E32] PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[customer_id] [bigint] NULL,
	[employee_id] [bigint] NULL,
	[comment] [nvarchar](255) NOT NULL,
	[create_date] [date] NOT NULL,
	[status] [bit] NULL,
	[admin_reply] [nvarchar](255) NULL,
	[date_reply] [date] NULL,
	[hidden] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NULL,
	[customer_address] [nvarchar](255) NULL,
	[customer_phone] [varchar](20) NULL,
	[customer_year] [int] NULL,
	[customer_month] [int] NULL,
	[customer_day] [int] NULL,
	[customer_email] [nvarchar](255) NULL,
	[customer_password] [nvarchar](255) NULL,
	[customer_image] [nvarchar](255) NULL,
	[customer_status] [bit] NULL,
	[last_login] [datetime] NULL,
	[date_created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [bigint] IDENTITY(1,1) NOT NULL,
	[employee_name] [nvarchar](255) NULL,
	[employee_address] [nvarchar](255) NULL,
	[employee_phone] [varchar](20) NULL,
	[employee_year] [int] NULL,
	[employee_month] [int] NULL,
	[employee_day] [int] NULL,
	[employee_role] [bit] NULL,
	[employee_email] [nvarchar](255) NULL,
	[employee_password] [nvarchar](255) NULL,
	[employee_image] [nvarchar](255) NULL,
	[employee_status] [bit] NULL,
	[last_login] [datetime] NULL,
	[date_created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorites]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites](
	[favorite_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[date_like] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[favorite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[orderdetail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[variant_id] [bigint] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
	[orderdate] [datetime] NULL,
	[total] [float] NULL,
	[status] [nvarchar](50) NULL,
	[receivername] [nvarchar](50) NULL,
	[receiveraddress] [nvarchar](100) NULL,
	[receiverphone] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_variants]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_variants](
	[variant_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[size_id] [bigint] NOT NULL,
	[color_id] [bigint] NOT NULL,
	[quantity] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[variant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[product_image1] [nvarchar](50) NOT NULL,
	[product_image2] [nvarchar](50) NOT NULL,
	[product_image3] [nvarchar](50) NOT NULL,
	[product_type] [bit] NOT NULL,
	[product_activities] [bit] NOT NULL,
	[create_date] [datetime] NULL,
	[product_description] [nvarchar](255) NULL,
 CONSTRAINT [PK__products__47027DF5D20C3D22] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotions]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotions](
	[promotion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[promotion_name] [nvarchar](100) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[statuss] [nvarchar](50) NULL,
	[discount] [float] NULL,
	[describe] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotions_products]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotions_products](
	[promotion_product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[promotion_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[size_id] [bigint] IDENTITY(1,1) NOT NULL,
	[size_number] [float] NOT NULL,
	[size_activities] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_products]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_products](
	[supplier_product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[supplier_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [bigint] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](100) NULL,
	[addresss] [nvarchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[statuss] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brands] ON 

INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_image], [brand_activities]) VALUES (1, N'Converse', N'3294d63f.png', 1)
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_image], [brand_activities]) VALUES (2, N'Nike', N'b66762fa.png', 0)
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_image], [brand_activities]) VALUES (3, N'Puma', N'7315656b.jpg', 1)
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_image], [brand_activities]) VALUES (4, N'Reebok', N'd211e981.png', 0)
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_image], [brand_activities]) VALUES (5, N'New Balance', N'f477e2d8.png', 1)
SET IDENTITY_INSERT [dbo].[brands] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 

INSERT [dbo].[cart_items] ([cart_item_id], [cart_id], [variant_id], [quantity]) VALUES (20046, 2, 56, 50)
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (1, 1)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (2, 2)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (3, 3)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (4, 4)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (5, 5)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (6, 6)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (7, 7)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (8, 8)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (9, 9)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (10, 10)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (11, 11)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (12, 12)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (13, 13)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (14, 14)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (15, 15)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (16, 16)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (17, 17)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (18, 18)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (19, 19)
INSERT [dbo].[carts] ([cart_id], [customer_id]) VALUES (20, 20)
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name], [category_image], [category_activities]) VALUES (1, N'Giày nam', N'f62a6d0f.jpg', 1)
INSERT [dbo].[categories] ([category_id], [category_name], [category_image], [category_activities]) VALUES (2, N'Giày nữ', N'337baa95.jpg', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [category_image], [category_activities]) VALUES (3, N'Giày thể thao', N'92e775d.jpg', 1)
INSERT [dbo].[categories] ([category_id], [category_name], [category_image], [category_activities]) VALUES (4, N'Giày chạy bộ', N'47266f7.jpg', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [category_image], [category_activities]) VALUES (5, N'Giày đi bộ', N'26a75d10.jpg', 1)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[colors] ON 

INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (1, N'Ðen', 1)
INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (2, N'Xanh lam', 0)
INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (3, N'Xanh lá', 1)
INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (4, N'Vàng', 0)
INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (5, N'Đỏ', 1)
INSERT [dbo].[colors] ([color_id], [color_name], [color_activities]) VALUES (8, N'Tím', 1)
SET IDENTITY_INSERT [dbo].[colors] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (1, 1, 2, NULL, N'Sản phẩm đẹp quá', CAST(N'2022-12-23' AS Date), 0, NULL, NULL, 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (2, 2, 1, 1, N'Sản phẩm chất lượng', CAST(N'2022-12-25' AS Date), 1, N'Cảm ơn bạn', CAST(N'2023-12-26' AS Date), 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (3, 3, 3, 2, N'Phí giao bao nhiêu vậy shop', CAST(N'2022-12-16' AS Date), 1, N'Phí sẽ dựa vào khu vực mà phí sẽ khác nhau nha bạn', CAST(N'2023-12-26' AS Date), 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (4, 2, 2, 1, N'Giày chất lượng, dáng đẹp mang êm chân', CAST(N'2022-12-27' AS Date), 1, N'Cảm ơn bạn', CAST(N'2023-12-28' AS Date), 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (5, 1, 4, 3, N'Sản phẩm chất lượng quá ưng ý', CAST(N'2022-12-25' AS Date), 1, N'Cảm ơn bạn', CAST(N'2023-12-26' AS Date), 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (6, 4, 1, NULL, N'Sản phẩm chất lượng', CAST(N'2022-12-25' AS Date), 0, NULL, NULL, 1)
INSERT [dbo].[comments] ([comment_id], [product_id], [customer_id], [employee_id], [comment], [create_date], [status], [admin_reply], [date_reply], [hidden]) VALUES (7, NULL, NULL, NULL, N'ay yo wtf', CAST(N'2023-08-07' AS Date), 0, NULL, CAST(N'2023-08-07' AS Date), 1)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (1, N'Sophia Turner', N'888 Oakwood Street, City K', N'7776665555', 1993, 9, 3, N'sophia.turner@gmail.com', N'password123', N'profile11.jpg', 1, CAST(N'2023-07-01T11:30:00.000' AS DateTime), CAST(N'2023-07-01T11:30:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (2, N'James Wilson', N'999 Maplewood Street, City L', N'2223334444', 1986, 1, 22, N'james.wilson@gmail.com', N'password456', N'profile12.jpg', 0, CAST(N'2023-06-30T19:45:00.000' AS DateTime), CAST(N'2023-06-30T19:45:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (3, N'Ava Martin', N'111 Elmwood Street, City M', N'5557778888', 1997, 11, 9, N'ava.martin@gmail.com', N'password789', N'profile13.jpg', 1, CAST(N'2023-06-29T08:00:00.000' AS DateTime), CAST(N'2023-06-29T08:00:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (4, N'Ethan Brown', N'222 Pinewood Street, City N', N'4448882222', 1988, 5, 12, N'ethan.brown@gmail.com', N'passwordabc', N'profile14.jpg', 1, CAST(N'2023-06-28T17:15:00.000' AS DateTime), CAST(N'2023-06-28T17:15:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (5, N'Isabella Allen', N'333 Cedarwood Street, City O', N'3335558888', 1996, 3, 5, N'isabella.allen@gmail.com', N'passwordxyz', N'profile15.jpg', 1, CAST(N'2023-06-27T12:30:00.000' AS DateTime), CAST(N'2023-06-27T12:30:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (6, N'Matthew Hill', N'444 Willowwood Street, City P', N'2225556666', 1987, 7, 18, N'matthew.hill@gmail.com', N'password123', N'profile16.jpg', 0, CAST(N'2023-06-26T11:45:00.000' AS DateTime), CAST(N'2023-06-26T11:45:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (7, N'Mia Martinez', N'555 Oakwoodwood Street, City Q', N'9991112222', 1992, 12, 31, N'mia.martinez@gmail.com', N'password456', N'profile17.jpg', 1, CAST(N'2023-06-25T09:15:00.000' AS DateTime), CAST(N'2023-06-25T09:15:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (8, N'Alexander Scott', N'666 Pinewoodwood Street, City R', N'8889991111', 1985, 8, 4, N'alexander.scott@gmail.com', N'password789', N'profile18.jpg', 1, CAST(N'2023-06-24T14:00:00.000' AS DateTime), CAST(N'2023-06-24T14:00:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (9, N'Amelia Lewis', N'777 Elmwoodwood Street, City S', N'7773334444', 1991, 2, 14, N'amelia.lewis@gmail.com', N'passwordabc', N'profile19.jpg', 0, CAST(N'2023-06-23T10:30:00.000' AS DateTime), CAST(N'2023-06-23T10:30:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (10, N'Benjamin Green', N'888 Cedarwoodwood Street, City T', N'6664443333', 1994, 6, 28, N'benjamin.green@gmail.com', N'passwordxyz', N'profile20.jpg', 1, CAST(N'2023-06-22T16:45:00.000' AS DateTime), CAST(N'2023-06-22T16:45:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (11, N'Sofia Walker', N'999 Oakwoodwoodwood Street, City U', N'1117778888', 1989, 10, 7, N'sofia.walker@gmail.com', N'password123', N'profile21.jpg', 1, CAST(N'2023-06-21T08:00:00.000' AS DateTime), CAST(N'2023-06-21T08:00:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (12, N'Joseph Kelly', N'1111 Elmwoodwoodwood Street, City V', N'9992224444', 1995, 4, 17, N'joseph.kelly@gmail.com', N'password456', N'profile22.jpg', 0, CAST(N'2023-06-20T12:15:00.000' AS DateTime), CAST(N'2023-06-20T12:15:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (13, N'Charlotte Phillips', N'2222 Pinewoodwoodwood Street, City W', N'8884447777', 1986, 8, 19, N'charlotte.phillips@gmail.com', N'password789', N'profile23.jpg', 1, CAST(N'2023-06-19T07:30:00.000' AS DateTime), CAST(N'2023-06-19T07:30:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (14, N'Henry King', N'3333 Cedarwoodwoodwood Street, City X', N'5556661111', 1990, 2, 2, N'henry.king@gmail.com', N'passwordabc', N'profile24.jpg', 1, CAST(N'2023-06-18T14:45:00.000' AS DateTime), CAST(N'2023-06-18T14:45:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (15, N'Scarlett Hughes', N'4444 Willowwoodwoodwood Street, City Y', N'3331116666', 1993, 12, 10, N'scarlett.hughes@gmail.com', N'passwordxyz', N'profile25.jpg', 1, CAST(N'2023-06-17T09:00:00.000' AS DateTime), CAST(N'2023-06-17T09:00:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (16, N'David Turner', N'5555 Sycamorewoodwoodwood Street, City Z', N'7779991111', 1997, 1, 1, N'david.turner@gmail.com', N'password123', N'profile26.jpg', 0, CAST(N'2023-06-16T11:15:00.000' AS DateTime), CAST(N'2023-06-16T11:15:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (17, N'Zoey Parker', N'6666 Maplewoodwoodwoodwood Street, City AA', N'5553337777', 1996, 5, 5, N'zoey.parker@gmail.com', N'password456', N'profile27.jpg', 1, CAST(N'2023-06-15T10:30:00.000' AS DateTime), CAST(N'2023-06-15T10:30:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (18, N'Luke Adams', N'7777 Cedarwoodwoodwoodwoodwood Street, City BB', N'6667778888', 1992, 3, 21, N'luke.adams@gmail.com', N'password789', N'profile28.jpg', 1, CAST(N'2023-06-14T14:45:00.000' AS DateTime), CAST(N'2023-06-14T14:45:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (19, N'Nora Miller', N'8888 Willowwoodwoodwoodwoodwood Street, City CC', N'4446668888', 1987, 9, 9, N'nora.miller@gmail.com', N'passwordabc', N'profile29.jpg', 0, CAST(N'2023-06-13T19:00:00.000' AS DateTime), CAST(N'2023-06-13T19:00:00.000' AS DateTime))
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_address], [customer_phone], [customer_year], [customer_month], [customer_day], [customer_email], [customer_password], [customer_image], [customer_status], [last_login], [date_created]) VALUES (20, N'Elijah Davis', N'9999 Sycamorewoodwoodwoodwoodwoodwood Street, City DD', N'7773335555', 1991, 7, 28, N'elijah.davis@gmail.com', N'passwordxyz', N'profile30.jpg', 1, CAST(N'2023-06-12T08:15:00.000' AS DateTime), CAST(N'2023-06-12T08:15:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (1, N'John Smith', N'123 Main Street, City A', N'1234567890', 1985, 7, 15, 1, N'john.smith@gmail.com', N'password123', N'profile1.jpg', 1, CAST(N'2023-07-11T10:30:00.000' AS DateTime), CAST(N'2023-07-11T10:30:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (2, N'Alice Johnson', N'456 Elm Street, City B', N'0987654321', 1990, 5, 20, 0, N'alice.johnson@gmail.com', N'password456', N'profile2.jpg', 1, CAST(N'2023-07-10T14:45:00.000' AS DateTime), CAST(N'2023-07-10T14:45:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (3, N'Bob Williams', N'789 Oak Street, City C', N'1112223333', 1988, 11, 5, 1, N'bob.williams@gmail.com', N'password789', N'profile3.jpg', 0, CAST(N'2023-07-09T21:15:00.000' AS DateTime), CAST(N'2023-07-09T21:15:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (4, N'Jane Davis', N'101 Pine Street, City D', N'4445556666', 1995, 3, 25, 1, N'jane.davis@gmail.com', N'passwordabc', N'profile4.jpg', 1, CAST(N'2023-07-08T18:00:00.000' AS DateTime), CAST(N'2023-07-08T18:00:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (5, N'Michael Lee', N'222 Maple Street, City E', N'7778889999', 1987, 9, 10, 1, N'michael.lee@gmail.com', N'passwordxyz', N'profile5.jpg', 1, CAST(N'2023-07-07T12:30:00.000' AS DateTime), CAST(N'2023-07-07T12:30:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (6, N'Emily Brown', N'333 Birch Street, City F', N'2223334444', 1992, 2, 8, 0, N'emily.brown@gmail.com', N'password123', N'profile6.jpg', 1, CAST(N'2023-07-06T09:45:00.000' AS DateTime), CAST(N'2023-07-06T09:45:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (7, N'David Miller', N'444 Cedar Street, City G', N'5556667777', 1984, 6, 12, 1, N'david.miller@gmail.com', N'password456', N'profile7.jpg', 0, CAST(N'2023-07-05T08:15:00.000' AS DateTime), CAST(N'2023-07-05T08:15:00.000' AS DateTime))
INSERT [dbo].[employees] ([employee_id], [employee_name], [employee_address], [employee_phone], [employee_year], [employee_month], [employee_day], [employee_role], [employee_email], [employee_password], [employee_image], [employee_status], [last_login], [date_created]) VALUES (8, N'Sarah Wilson', N'555 Willow Street, City H', N'9998887777', 1991, 10, 18, 1, N'sarah.wilson@gmail.com', N'password789', N'profile8.jpg', 1, CAST(N'2023-07-04T07:30:00.000' AS DateTime), CAST(N'2023-07-04T07:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[favorites] ON 

INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (1, 1, 1, CAST(N'2023-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (2, 1, 2, CAST(N'2023-07-18T00:00:00.000' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (5, 3, 1, CAST(N'2023-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (6, 3, 2, CAST(N'2023-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (7, 4, 1, CAST(N'2023-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (12, 2, 2, CAST(N'2023-08-07T18:42:31.127' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (13, 2, 1, CAST(N'2023-08-07T18:42:38.647' AS DateTime))
INSERT [dbo].[favorites] ([favorite_id], [customer_id], [product_id], [date_like]) VALUES (15, 2, 3, CAST(N'2023-08-07T18:42:48.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (15, 8, 12, 8)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (16, 8, 8, 14)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (17, 8, 26, 4)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (18, 8, 88, 7)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (19, 8, 2, 13)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (20, 8, 534, 47)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (21, 9, 37, 7)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (10015, 10008, 57, 4)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (10016, 10008, 62, 4)
INSERT [dbo].[orderdetails] ([orderdetail_id], [order_id], [variant_id], [quantity]) VALUES (10017, 10009, 28, 6)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (1, 1, CAST(N'2023-07-06T09:45:00.000' AS DateTime), 500, N'Đã Giao', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (2, 2, CAST(N'2023-07-06T09:45:00.000' AS DateTime), 750.99, N'Đã Giao', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (3, 3, CAST(N'2023-07-06T09:45:00.000' AS DateTime), 500, N'Đã Giao', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (4, 4, CAST(N'2023-07-06T09:45:00.000' AS DateTime), 1200.5, N'Đã Giao', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (5, 5, CAST(N'2023-07-06T09:45:00.000' AS DateTime), 900.25, N'Đã Giao', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (8, 2, CAST(N'2023-08-08T20:56:43.000' AS DateTime), 30377.240234375, N'Đang chờ xác nhận', N'i', N'4545', N'tytuytu')
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (9, 2, CAST(N'2023-08-08T20:58:35.000' AS DateTime), 5256.93017578125, N'Đang chờ xác nhận', N'ytu', N'4546', N'tyury')
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (10008, 2, CAST(N'2023-08-09T09:55:19.000' AS DateTime), 9604, N'Đang chờ xác nhận', N't', N'454', N'fdgfsfg')
INSERT [dbo].[orders] ([order_id], [customer_id], [orderdate], [total], [status], [receivername], [receiveraddress], [receiverphone]) VALUES (10009, 2, CAST(N'2023-08-09T11:22:32.000' AS DateTime), 4505.93994140625, N'Đang chờ xác nhận', N'345', N'435', N'etrewt')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product_variants] ON 

INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (1, 1, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (2, 1, 1, 2, 24)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (3, 1, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (4, 1, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (5, 1, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (6, 1, 2, 1, 47)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (7, 1, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (8, 1, 2, 3, 8)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (9, 1, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (10, 1, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (12, 1, 3, 2, 26)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (13, 1, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (14, 1, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (15, 1, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (16, 1, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (17, 1, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (18, 1, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (19, 1, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (20, 1, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (21, 1, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (22, 1, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (23, 1, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (24, 1, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (25, 1, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (26, 2, 1, 1, 42)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (27, 2, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (28, 2, 1, 3, 44)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (29, 2, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (30, 2, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (31, 2, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (32, 2, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (33, 2, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (34, 2, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (35, 2, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (36, 2, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (37, 2, 3, 2, 43)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (38, 2, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (39, 2, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (40, 2, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (41, 2, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (43, 2, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (44, 2, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (45, 2, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (46, 2, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (47, 2, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (48, 2, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (49, 2, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (50, 2, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (51, 3, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (52, 3, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (53, 3, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (54, 3, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (55, 3, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (56, 3, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (57, 3, 2, 2, 46)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (58, 3, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (59, 3, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (60, 3, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (61, 3, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (62, 3, 3, 2, 46)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (63, 3, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (64, 3, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (65, 3, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (66, 3, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (67, 3, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (68, 3, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (69, 3, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (70, 3, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (71, 3, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (72, 3, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (73, 3, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (74, 3, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (75, 3, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (76, 4, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (77, 4, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (78, 4, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (79, 4, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (80, 4, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (81, 4, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (82, 4, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (83, 4, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (84, 4, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (85, 4, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (86, 4, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (87, 4, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (88, 4, 3, 3, 36)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (89, 4, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (90, 4, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (91, 4, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (92, 4, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (93, 4, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (94, 4, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (95, 4, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (96, 4, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (97, 4, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (98, 4, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (99, 4, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (100, 4, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (101, 5, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (102, 5, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (103, 5, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (104, 5, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (105, 5, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (106, 5, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (107, 5, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (108, 5, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (109, 5, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (110, 5, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (111, 5, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (112, 5, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (113, 5, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (114, 5, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (115, 5, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (116, 5, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (117, 5, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (118, 5, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (119, 5, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (120, 5, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (121, 5, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (122, 5, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (123, 5, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (124, 5, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (125, 5, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (126, 6, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (127, 6, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (128, 6, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (129, 6, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (130, 6, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (131, 6, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (132, 6, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (133, 6, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (134, 6, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (135, 6, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (136, 6, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (137, 6, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (138, 6, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (139, 6, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (140, 6, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (141, 6, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (142, 6, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (143, 6, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (144, 6, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (145, 6, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (146, 6, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (147, 6, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (148, 6, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (149, 6, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (150, 6, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (151, 7, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (152, 7, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (153, 7, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (154, 7, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (155, 7, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (156, 7, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (157, 7, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (158, 7, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (159, 7, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (160, 7, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (161, 7, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (162, 7, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (163, 7, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (164, 7, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (165, 7, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (166, 7, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (167, 7, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (168, 7, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (169, 7, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (170, 7, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (171, 7, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (172, 7, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (173, 7, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (174, 7, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (175, 7, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (176, 8, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (177, 8, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (178, 8, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (179, 8, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (180, 8, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (181, 8, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (182, 8, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (183, 8, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (184, 8, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (185, 8, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (186, 8, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (187, 8, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (188, 8, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (189, 8, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (190, 8, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (191, 8, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (192, 8, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (193, 8, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (194, 8, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (195, 8, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (196, 8, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (197, 8, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (198, 8, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (199, 8, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (200, 8, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (201, 9, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (202, 9, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (203, 9, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (204, 9, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (205, 9, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (206, 9, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (207, 9, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (208, 9, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (209, 9, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (210, 9, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (211, 9, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (212, 9, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (213, 9, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (214, 9, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (215, 9, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (216, 9, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (217, 9, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (218, 9, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (219, 9, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (220, 9, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (221, 9, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (222, 9, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (223, 9, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (224, 9, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (225, 9, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (226, 10, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (227, 10, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (228, 10, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (229, 10, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (230, 10, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (231, 10, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (232, 10, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (233, 10, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (234, 10, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (235, 10, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (236, 10, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (237, 10, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (238, 10, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (239, 10, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (240, 10, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (241, 10, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (242, 10, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (243, 10, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (244, 10, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (245, 10, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (246, 10, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (247, 10, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (248, 10, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (249, 10, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (250, 10, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (251, 11, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (252, 11, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (253, 11, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (254, 11, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (255, 11, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (256, 11, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (257, 11, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (258, 11, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (259, 11, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (260, 11, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (261, 11, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (262, 11, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (263, 11, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (264, 11, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (265, 11, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (266, 11, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (267, 11, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (268, 11, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (269, 11, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (270, 11, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (271, 11, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (272, 11, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (273, 11, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (274, 11, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (275, 11, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (276, 12, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (277, 12, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (278, 12, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (279, 12, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (280, 12, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (281, 12, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (282, 12, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (283, 12, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (284, 12, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (285, 12, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (286, 12, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (287, 12, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (288, 12, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (289, 12, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (290, 12, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (291, 12, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (292, 12, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (293, 12, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (294, 12, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (295, 12, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (296, 12, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (297, 12, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (298, 12, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (299, 12, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (300, 12, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (301, 13, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (302, 13, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (303, 13, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (304, 13, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (305, 13, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (306, 13, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (307, 13, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (308, 13, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (309, 13, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (310, 13, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (311, 13, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (312, 13, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (313, 13, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (314, 13, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (315, 13, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (316, 13, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (317, 13, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (318, 13, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (319, 13, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (320, 13, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (321, 13, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (322, 13, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (323, 13, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (324, 13, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (325, 13, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (326, 14, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (327, 14, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (328, 14, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (329, 14, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (330, 14, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (331, 14, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (332, 14, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (333, 14, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (334, 14, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (335, 14, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (336, 14, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (337, 14, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (338, 14, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (339, 14, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (340, 14, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (341, 14, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (342, 14, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (343, 14, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (344, 14, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (345, 14, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (346, 14, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (347, 14, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (348, 14, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (349, 14, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (350, 14, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (351, 15, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (352, 15, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (353, 15, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (354, 15, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (355, 15, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (356, 15, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (357, 15, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (358, 15, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (359, 15, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (360, 15, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (361, 15, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (362, 15, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (363, 15, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (364, 15, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (365, 15, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (366, 15, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (367, 15, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (368, 15, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (369, 15, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (370, 15, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (371, 15, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (372, 15, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (373, 15, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (374, 15, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (375, 15, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (376, 16, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (377, 16, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (378, 16, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (379, 16, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (380, 16, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (381, 16, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (382, 16, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (383, 16, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (384, 16, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (385, 16, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (386, 16, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (387, 16, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (388, 16, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (389, 16, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (390, 16, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (391, 16, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (392, 16, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (393, 16, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (394, 16, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (395, 16, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (396, 16, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (397, 16, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (398, 16, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (399, 16, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (400, 16, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (401, 17, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (402, 17, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (403, 17, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (404, 17, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (405, 17, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (406, 17, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (407, 17, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (408, 17, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (409, 17, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (410, 17, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (411, 17, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (412, 17, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (413, 17, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (414, 17, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (415, 17, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (416, 17, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (417, 17, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (418, 17, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (419, 17, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (420, 17, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (421, 17, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (422, 17, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (423, 17, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (424, 17, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (425, 17, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (426, 18, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (427, 18, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (428, 18, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (429, 18, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (430, 18, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (431, 18, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (432, 18, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (433, 18, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (434, 18, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (435, 18, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (436, 18, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (437, 18, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (438, 18, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (439, 18, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (440, 18, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (441, 18, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (442, 18, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (443, 18, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (444, 18, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (445, 18, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (446, 18, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (447, 18, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (448, 18, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (449, 18, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (450, 18, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (451, 19, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (452, 19, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (453, 19, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (454, 19, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (455, 19, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (456, 19, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (457, 19, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (458, 19, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (459, 19, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (460, 19, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (461, 19, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (462, 19, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (463, 19, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (464, 19, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (465, 19, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (466, 19, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (467, 19, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (468, 19, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (469, 19, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (470, 19, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (471, 19, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (472, 19, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (473, 19, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (474, 19, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (475, 19, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (476, 20, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (477, 20, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (478, 20, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (479, 20, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (480, 20, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (481, 20, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (482, 20, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (483, 20, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (484, 20, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (485, 20, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (486, 20, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (487, 20, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (488, 20, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (489, 20, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (490, 20, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (491, 20, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (492, 20, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (493, 20, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (494, 20, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (495, 20, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (496, 20, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (497, 20, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (498, 20, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (499, 20, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (500, 20, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (501, 21, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (502, 21, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (503, 21, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (504, 21, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (505, 21, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (506, 21, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (507, 21, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (508, 21, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (509, 21, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (510, 21, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (511, 21, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (512, 21, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (513, 21, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (514, 21, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (515, 21, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (516, 21, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (517, 21, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (518, 21, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (519, 21, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (520, 21, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (521, 21, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (522, 21, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (523, 21, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (524, 21, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (525, 21, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (526, 22, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (527, 22, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (528, 22, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (529, 22, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (530, 22, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (531, 22, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (532, 22, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (533, 22, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (534, 22, 2, 4, 3)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (535, 22, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (536, 22, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (537, 22, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (538, 22, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (539, 22, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (540, 22, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (541, 22, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (542, 22, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (543, 22, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (544, 22, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (545, 22, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (546, 22, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (547, 22, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (548, 22, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (549, 22, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (550, 22, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (551, 23, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (552, 23, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (553, 23, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (554, 23, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (555, 23, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (556, 23, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (557, 23, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (558, 23, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (559, 23, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (560, 23, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (561, 23, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (562, 23, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (563, 23, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (564, 23, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (565, 23, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (566, 23, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (567, 23, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (568, 23, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (569, 23, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (570, 23, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (571, 23, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (572, 23, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (573, 23, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (574, 23, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (575, 23, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (576, 24, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (577, 24, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (578, 24, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (579, 24, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (580, 24, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (581, 24, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (582, 24, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (583, 24, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (584, 24, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (585, 24, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (586, 24, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (587, 24, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (588, 24, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (589, 24, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (590, 24, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (591, 24, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (592, 24, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (593, 24, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (594, 24, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (595, 24, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (596, 24, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (597, 24, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (598, 24, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (599, 24, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (600, 24, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (601, 25, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (602, 25, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (603, 25, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (604, 25, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (605, 25, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (606, 25, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (607, 25, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (608, 25, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (609, 25, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (610, 25, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (611, 25, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (612, 25, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (613, 25, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (614, 25, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (615, 25, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (616, 25, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (617, 25, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (618, 25, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (619, 25, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (620, 25, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (621, 25, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (622, 25, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (623, 25, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (624, 25, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (625, 25, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (626, 26, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (627, 26, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (628, 26, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (629, 26, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (630, 26, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (631, 26, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (632, 26, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (633, 26, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (634, 26, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (635, 26, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (636, 26, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (637, 26, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (638, 26, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (639, 26, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (640, 26, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (641, 26, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (642, 26, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (643, 26, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (644, 26, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (645, 26, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (646, 26, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (647, 26, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (648, 26, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (649, 26, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (650, 26, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (651, 27, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (652, 27, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (653, 27, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (654, 27, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (655, 27, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (656, 27, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (657, 27, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (658, 27, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (659, 27, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (660, 27, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (661, 27, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (662, 27, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (663, 27, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (664, 27, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (665, 27, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (666, 27, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (667, 27, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (668, 27, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (669, 27, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (670, 27, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (671, 27, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (672, 27, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (673, 27, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (674, 27, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (675, 27, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (676, 28, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (677, 28, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (678, 28, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (679, 28, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (680, 28, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (681, 28, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (682, 28, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (683, 28, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (684, 28, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (685, 28, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (686, 28, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (687, 28, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (688, 28, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (689, 28, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (690, 28, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (691, 28, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (692, 28, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (693, 28, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (694, 28, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (695, 28, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (696, 28, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (697, 28, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (698, 28, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (699, 28, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (700, 28, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (701, 29, 1, 1, 50)
GO
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (702, 29, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (703, 29, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (704, 29, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (705, 29, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (706, 29, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (707, 29, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (708, 29, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (709, 29, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (710, 29, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (711, 29, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (712, 29, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (713, 29, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (714, 29, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (715, 29, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (716, 29, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (717, 29, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (718, 29, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (719, 29, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (720, 29, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (721, 29, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (722, 29, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (723, 29, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (724, 29, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (725, 29, 5, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (726, 30, 1, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (727, 30, 1, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (728, 30, 1, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (729, 30, 1, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (730, 30, 1, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (731, 30, 2, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (732, 30, 2, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (733, 30, 2, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (734, 30, 2, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (735, 30, 2, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (736, 30, 3, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (737, 30, 3, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (738, 30, 3, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (739, 30, 3, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (740, 30, 3, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (741, 30, 4, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (742, 30, 4, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (743, 30, 4, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (744, 30, 4, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (745, 30, 4, 5, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (746, 30, 5, 1, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (747, 30, 5, 2, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (748, 30, 5, 3, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (749, 30, 5, 4, 50)
INSERT [dbo].[product_variants] ([variant_id], [product_id], [size_id], [color_id], [quantity]) VALUES (750, 30, 5, 5, 50)
SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (1, N'Converse 01', 1, 1, CAST(500.00 AS Decimal(10, 2)), N'anh1-1.png', N'anh1-2.jpg', N'475e2643.jpg', 1, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (2, N'Converse 02', 2, 1, CAST(750.99 AS Decimal(10, 2)), N'anh2-1.png', N'anh2-2.jpg', N'anh2-3.jpg', 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (3, N'Converse 03', 3, 1, CAST(1200.50 AS Decimal(10, 2)), N'anh3-1.png', N'anh3-2.jpg', N'anh3-3.jpg', 1, 0, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (4, N'Converse 04', 4, 1, CAST(900.25 AS Decimal(10, 2)), N'f2814a33.jpg', N'anh4-2.jpg', N'anh4-3.jpg', 1, 1, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'Được gọi vui một cách thân thuộc là “giày Vans “, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (5, N'Converse 05', 5, 1, CAST(650.75 AS Decimal(10, 2)), N'anh5-1.png', N'fac25256.jpg', N'anh5-3.jpg', 1, 1, CAST(N'2015-03-01T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (6, N'Converse 06', 1, 1, CAST(800000.00 AS Decimal(10, 2)), N'hinh1-1.png', N'bdcaf63a.jpg', N'28386549.jpg', 0, 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'Sunflower là một trong những phối màu hot nhất của dòng Converse 1970s, rất đẹp và dễ phối đồ, đồng thời có 2 bản là cao cổ và thấp cổ,')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (7, N'Converse 07', 2, 1, CAST(950.50 AS Decimal(10, 2)), N'hinh2-1.png', N'120a2e84.jpg', N'e1e04846.jpg', 0, 1, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (8, N'Converse 08', 3, 1, CAST(1200.75 AS Decimal(10, 2)), N'hinh3-1.png', N'35068258.jpg', N'eaf1ab0.jpg', 0, 1, CAST(N'2015-01-21T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (9, N'Converse 09', 4, 1, CAST(700.00 AS Decimal(10, 2)), N'e5cb8413.jpg', N'41787cd3.jpg', N'f13987e1.jpg', 0, 0, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (10, N'Converse 10', 5, 1, CAST(1000.00 AS Decimal(10, 2)), N'hinh5-1.png', N'd12f099e.jpg', N'1391a3d2.jpg', 0, 1, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (11, N'Nike 01', 2, 2, CAST(505.00 AS Decimal(10, 2)), N'anh1-1.png', N'7cab6979.jpg', N'3b2cbf70.jpg', 1, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (12, N'Nike 02', 1, 2, CAST(759.99 AS Decimal(10, 2)), N'37ab4140.png', N'17618271.jpg', N'17db16ae.jpg', 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (13, N'Nike 03', 2, 2, CAST(1205.50 AS Decimal(10, 2)), N'anh3-1.png', N'828a0609.jpg', N'd0359383.jpg', 1, 0, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (14, N'Nike 04', 1, 2, CAST(905.25 AS Decimal(10, 2)), N'f1a66577.png', N'7c01c627.jpg', N'f7cb9155.jpg', 1, 1, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'Sunflower là một trong những phối màu hot nhất của dòng Converse 1970s, rất đẹp và dễ phối đồ, đồng thời có 2 bản là cao cổ và thấp cổ,')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (15, N'Nike 05', 2, 2, CAST(659.75 AS Decimal(10, 2)), N'anh5-1.png', N'b59d4330.jpg', N'5f22cc05.jpg', 1, 1, CAST(N'2015-03-01T00:00:00.000' AS DateTime), N'Được gọi vui một cách thân thuộc là “giày Vans “, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (16, N'Nike 06', 4, 2, CAST(805.00 AS Decimal(10, 2)), N'hinh1-1.png', N'85dd8b3.jpg', N'ae9ecbdc.jpg', 0, 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (17, N'Nike 07', 2, 2, CAST(955.50 AS Decimal(10, 2)), N'hinh2-1.png', N'a11068dd.jpg', N'7ce61599.jpg', 0, 1, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Sunflower là một trong những phối màu hot nhất của dòng Converse 1970s, rất đẹp và dễ phối đồ, đồng thời có 2 bản là cao cổ và thấp cổ,')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (18, N'Nike 08', 5, 2, CAST(120.75 AS Decimal(10, 2)), N'hinh3-1.png', N'dcf17a31.jpg', N'27aed5ec.jpg', 0, 1, CAST(N'2015-01-21T00:00:00.000' AS DateTime), N'đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (19, N'Nike 09', 2, 2, CAST(709.00 AS Decimal(10, 2)), N'd36754aa.jpg', N'11c30794.jpg', N'c4223e16.jpg', 0, 0, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (20, N'Nike 10', 2, 2, CAST(100.00 AS Decimal(10, 2)), N'hinh5-1.png', N'126eccce.jpg', N'57f68bff.jpg', 0, 1, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (21, N'Puma 01', 4, 3, CAST(505.00 AS Decimal(10, 2)), N'anh1-1.png', N'f20aea44.jpg', N'157e717f.jpg', 1, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (22, N'Puma 02', 3, 3, CAST(75.99 AS Decimal(10, 2)), N'anh2-1.png', N'bb45e8e5.jpg', N'fbbb9fe6.jpg', 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Được gọi vui một cách thân thuộc là “giày Vans “, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (23, N'Puma 03', 3, 3, CAST(120.50 AS Decimal(10, 2)), N'61393ed2.jpg', N'ee7efd5b.jpg', N'e06a4f15.jpg', 1, 0, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'Được gọi vui một cách thân thuộc là “giày Vans “, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (24, N'Puma 04', 5, 3, CAST(905.25 AS Decimal(10, 2)), N'63ee9812.png', N'8550fb6c.jpg', N'89b167eb.jpg', 1, 1, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (25, N'Puma 05', 3, 3, CAST(656.75 AS Decimal(10, 2)), N'aa6e8d40.png', N'6cb3a633.jpg', N'c5b077bc.jpg', 1, 1, CAST(N'2015-03-01T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (26, N'Puma 06', 2, 3, CAST(807.00 AS Decimal(10, 2)), N'21dd9d23.jpg', N'c3bf8555.jpg', N'37c8eb64.jpg', 0, 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (27, N'Puma 07', 3, 3, CAST(959.50 AS Decimal(10, 2)), N'hinh2-1.png', N'edb77f36.jpg', N'33ae9c63.jpg', 0, 1, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Sunflower là một trong những phối màu hot nhất của dòng Converse 1970s, rất đẹp và dễ phối đồ, đồng thời có 2 bản là cao cổ và thấp cổ,')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (28, N'Puma 08', 1, 3, CAST(120.75 AS Decimal(10, 2)), N'hinh3-1.png', N'5e18eb36.jpg', N'2027c516.jpg', 0, 1, CAST(N'2015-01-21T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (29, N'Puma 09', 3, 3, CAST(705.00 AS Decimal(10, 2)), N'ec354aa9.jpg', N'1e9cf90f.jpg', N'b9033f95.jpg', 0, 0, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (30, N'Puma 10', 3, 3, CAST(100.00 AS Decimal(10, 2)), N'hinh5-1.png', N'e6dbc134.jpg', N'990056cd.jpg', 0, 1, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (31, N'Reebok 01', 4, 4, CAST(508.00 AS Decimal(10, 2)), N'anh1-1.png', N'6f707e64.jpg', N'6a471a4a.jpg', 1, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (32, N'Reebok 02', 2, 4, CAST(757.99 AS Decimal(10, 2)), N'anh2-1.png', N'366a7886.jpg', N'12f42166.jpg', 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (33, N'Reebok 03', 4, 4, CAST(120.50 AS Decimal(10, 2)), N'38bd07b8.png', N'6a4a34eb.jpg', N'2e27a52e.jpg', 1, 0, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (34, N'Reebok 04', 4, 4, CAST(905.25 AS Decimal(10, 2)), N'e26068fd.jpg', N'd98ecdce.jpg', N'3e657040.jpg', 1, 1, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'Được gọi vui một cách thân thuộc là “giày Vans “, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (35, N'Reebok 05', 1, 4, CAST(654.75 AS Decimal(10, 2)), N'9d867f2c.png', N'c1bdd9e7.jpg', N'13f20dee.jpg', 1, 1, CAST(N'2015-03-01T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (36, N'Reebok 06', 4, 4, CAST(803.00 AS Decimal(10, 2)), N'hinh1-1.png', N'51385359.jpg', N'c4483aba.jpg', 0, 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (37, N'Reebok 07', 3, 4, CAST(954.50 AS Decimal(10, 2)), N'hinh2-1.png', N'd1d94cb2.jpg', N'ec54fc0.jpg', 0, 1, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (38, N'Reebok 08', 4, 4, CAST(1208.75 AS Decimal(10, 2)), N'hinh3-1.png', N'7d170f7b.jpg', N'ec5238c4.jpg', 0, 1, CAST(N'2015-01-21T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (39, N'Reebok 09', 4, 4, CAST(708.00 AS Decimal(10, 2)), N'51f90bc6.jpg', N'e1d11320.jpg', N'ef6ee3b2.jpg', 0, 0, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (40, N'Reebok 10', 3, 4, CAST(1009.00 AS Decimal(10, 2)), N'hinh5-1.png', N'ba89cfd5.jpg', N'a4c2295b.jpg', 0, 1, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (41, N'New Balance 01', 5, 5, CAST(505.00 AS Decimal(10, 2)), N'anh1-1.png', N'd648af.jpg', N'344476cc.jpg', 1, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (42, N'New Balance 02', 5, 5, CAST(757.99 AS Decimal(10, 2)), N'anh2-1.png', N'68ea97a.jpg', N'378d5039.jpg', 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (43, N'New Balance 03', 2, 5, CAST(120.50 AS Decimal(10, 2)), N'anh3-1.png', N'6b3c8eff.png', N'fc35539c.jpg', 1, 0, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (44, N'New Balance 04', 5, 5, CAST(908.25 AS Decimal(10, 2)), N'e8989f56.png', N'b1bc56ab.jpg', N'3287ecb2.jpg', 1, 1, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (45, N'New Balance 05', 3, 5, CAST(657.75 AS Decimal(10, 2)), N'anh5-1.png', N'f7f2c1ef.jpg', N'd1a2820d.jpg', 1, 1, CAST(N'2015-03-01T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (46, N'New Balance 06', 1, 5, CAST(808.00 AS Decimal(10, 2)), N'hinh1-1.png', N'14f65d2a.jpg', N'd9113596.jpg', 0, 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (47, N'New Balance 07', 5, 5, CAST(957.50 AS Decimal(10, 2)), N'hinh2-1.png', N'2d6ffb2.jpg', N'd88aac83.jpg', 0, 1, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Converse Renew Canvas, phiên bản giới hạn mang mục đích bảo vệ môi trường sẽ được chính thức mở bán tại hệ thống Converse VN từ ngày 5/7 với số lượng giới hạn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (48, N'New Balance 08', 5, 5, CAST(1290.75 AS Decimal(10, 2)), N'hinh3-1.png', N'f629dc56.jpg', N'9c810a9b.jpg', 0, 1, CAST(N'2015-01-21T00:00:00.000' AS DateTime), N'huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (49, N'New Balance 09', 1, 5, CAST(770.00 AS Decimal(10, 2)), N'397fe814.jpg', N'fe3694b4.jpg', N'e0d7cf85.jpg', 0, 0, CAST(N'2023-07-21T00:00:00.000' AS DateTime), N'Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz”')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (50, N'New Balance 10', 5, 5, CAST(1050.00 AS Decimal(10, 2)), N'hinh5-1.png', N'7b2c6f18.jpg', N'2d124d43.jpg', 0, 1, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (51, N'sp1', 1, 1, CAST(1000000.00 AS Decimal(10, 2)), N'71ac3943.jpg', N'cd61954e.jpg', N'3a7dc428.jpg', 1, 0, CAST(N'2023-08-07T00:00:00.000' AS DateTime), N'mo ta')
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [brand_id], [price], [product_image1], [product_image2], [product_image3], [product_type], [product_activities], [create_date], [product_description]) VALUES (52, N'sp110', 1, 3, CAST(10000.00 AS Decimal(10, 2)), N'19b24798.jpg', N'default.png', N'default.png', 1, 0, CAST(N'2023-08-09T00:00:00.000' AS DateTime), N'mô tả')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[promotions] ON 

INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (1, N'Tháng Yêu Thương - Bao La Khuyến Mãi', CAST(N'2023-07-17' AS Date), CAST(N'2023-08-01' AS Date), N'Đang diễn ra', 20, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (2, N'Bóc Thăm Trúng Thưởng', CAST(N'2023-07-18' AS Date), CAST(N'2023-08-10' AS Date), N'Đang diễn ra', 25, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (3, N'Ngày Vàng Thứ Hai', CAST(N'2023-07-10' AS Date), CAST(N'2023-07-17' AS Date), N'Đã kết thúc', 10, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (4, N'Sale Độc Nhât', CAST(N'2023-07-13' AS Date), CAST(N'2023-08-05' AS Date), N'Đang diễn ra', 30, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (5, N'Ngày Vàng Thứ Ba', CAST(N'2023-07-01' AS Date), CAST(N'2023-07-15' AS Date), N'Đã kết thúc', 10, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
INSERT [dbo].[promotions] ([promotion_id], [promotion_name], [start_date], [end_date], [statuss], [discount], [describe]) VALUES (6, N'Ngày Vàng Thứ Tư', CAST(N'2023-07-17' AS Date), CAST(N'2023-08-10' AS Date), N'Đang diễn ra', 15, N'Chương trình khuyến mãi dành cho quý khi mua giày tại của hàng giày')
SET IDENTITY_INSERT [dbo].[promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[promotions_products] ON 

INSERT [dbo].[promotions_products] ([promotion_product_id], [promotion_id], [product_id]) VALUES (1, 1, 1)
INSERT [dbo].[promotions_products] ([promotion_product_id], [promotion_id], [product_id]) VALUES (2, 2, 2)
INSERT [dbo].[promotions_products] ([promotion_product_id], [promotion_id], [product_id]) VALUES (3, 3, 3)
INSERT [dbo].[promotions_products] ([promotion_product_id], [promotion_id], [product_id]) VALUES (4, 4, 4)
SET IDENTITY_INSERT [dbo].[promotions_products] OFF
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 

INSERT [dbo].[sizes] ([size_id], [size_number], [size_activities]) VALUES (1, 38.5, 1)
INSERT [dbo].[sizes] ([size_id], [size_number], [size_activities]) VALUES (2, 39.5, 1)
INSERT [dbo].[sizes] ([size_id], [size_number], [size_activities]) VALUES (3, 40, 0)
INSERT [dbo].[sizes] ([size_id], [size_number], [size_activities]) VALUES (4, 41, 1)
INSERT [dbo].[sizes] ([size_id], [size_number], [size_activities]) VALUES (5, 42, 0)
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[supplier_products] ON 

INSERT [dbo].[supplier_products] ([supplier_product_id], [supplier_id], [product_id]) VALUES (1, 1, 2)
INSERT [dbo].[supplier_products] ([supplier_product_id], [supplier_id], [product_id]) VALUES (2, 2, 2)
INSERT [dbo].[supplier_products] ([supplier_product_id], [supplier_id], [product_id]) VALUES (3, 3, 3)
INSERT [dbo].[supplier_products] ([supplier_product_id], [supplier_id], [product_id]) VALUES (4, 4, 3)
INSERT [dbo].[supplier_products] ([supplier_product_id], [supplier_id], [product_id]) VALUES (5, 4, 5)
SET IDENTITY_INSERT [dbo].[supplier_products] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplier_id], [supplier_name], [addresss], [phone], [email], [statuss]) VALUES (1, N'Bitis', N'22 Lý Chiêu Hoàng, Phường 10, Quận 6, TP. HCM', N'0946273998', N'bitis123@gmail.com', 1)
INSERT [dbo].[suppliers] ([supplier_id], [supplier_name], [addresss], [phone], [email], [statuss]) VALUES (2, N'Juno', N'313 Nguyễn Thị Thập, Phường Tân Phú, Quận 7, TP. HCM', N'0956483958', N'cskh@juno.vn', 1)
INSERT [dbo].[suppliers] ([supplier_id], [supplier_name], [addresss], [phone], [email], [statuss]) VALUES (3, N'VinaGiay', N'180 - 182 Lý Chính Thắng, Quận 3, TP. HCM', N'0957684938', N'cskh@vinagiay.vn', 1)
INSERT [dbo].[suppliers] ([supplier_id], [supplier_name], [addresss], [phone], [email], [statuss]) VALUES (4, N'EvaShoes', N'Tầng 1, Số 26 Nguyễn Phong Sắc, Dịch Vọng, Cầu Giấy, Hà Nội', N'0946583875', N'Info@evashoes.com.vn', 1)
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO
/****** Object:  Index [uc_product_variant]    Script Date: 8/10/2023 2:52:04 PM ******/
ALTER TABLE [dbo].[product_variants] ADD  CONSTRAINT [uc_product_variant] UNIQUE NONCLUSTERED 
(
	[product_id] ASC,
	[size_id] ASC,
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uq_product_variant_unique_combination]    Script Date: 8/10/2023 2:52:04 PM ******/
ALTER TABLE [dbo].[product_variants] ADD  CONSTRAINT [uq_product_variant_unique_combination] UNIQUE NONCLUSTERED 
(
	[product_id] ASC,
	[size_id] ASC,
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[brands] ADD  CONSTRAINT [DF__brands__brand_ac__24927208]  DEFAULT ((0)) FOR [brand_activities]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF__categorie__categ__276EDEB3]  DEFAULT ((0)) FOR [category_activities]
GO
ALTER TABLE [dbo].[colors] ADD  CONSTRAINT [DF__colors__color_ac__2A4B4B5E]  DEFAULT ((0)) FOR [color_activities]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT (NULL) FOR [admin_reply]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT (NULL) FOR [date_reply]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT ((1)) FOR [hidden]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__produc__300424B4]  DEFAULT ((0)) FOR [product_type]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__produc__30F848ED]  DEFAULT ((0)) FOR [product_activities]
GO
ALTER TABLE [dbo].[sizes] ADD  DEFAULT ((0)) FOR [size_activities]
GO
ALTER TABLE [dbo].[suppliers] ADD  DEFAULT ((0)) FOR [statuss]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [fk_cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[carts] ([cart_id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [fk_cart]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [fk_variantss] FOREIGN KEY([variant_id])
REFERENCES [dbo].[product_variants] ([variant_id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [fk_variantss]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [fk_orderss] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [fk_orderss]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_customer_comment] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_customer_comment]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_employee_comment] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_employee_comment]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_product_comment] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_product_comment]
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD  CONSTRAINT [fk_customer_favorite] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[favorites] CHECK CONSTRAINT [fk_customer_favorite]
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD  CONSTRAINT [fk_product_favorite] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[favorites] CHECK CONSTRAINT [fk_product_favorite]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [fk_variant] FOREIGN KEY([variant_id])
REFERENCES [dbo].[product_variants] ([variant_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [fk_variant]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[product_variants]  WITH CHECK ADD  CONSTRAINT [fk_color] FOREIGN KEY([color_id])
REFERENCES [dbo].[colors] ([color_id])
GO
ALTER TABLE [dbo].[product_variants] CHECK CONSTRAINT [fk_color]
GO
ALTER TABLE [dbo].[product_variants]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_variants] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[product_variants]  WITH CHECK ADD  CONSTRAINT [fk_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([size_id])
GO
ALTER TABLE [dbo].[product_variants] CHECK CONSTRAINT [fk_size]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([brand_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_brand]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_category]
GO
ALTER TABLE [dbo].[promotions_products]  WITH CHECK ADD  CONSTRAINT [fk_product_promotion] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[promotions_products] CHECK CONSTRAINT [fk_product_promotion]
GO
ALTER TABLE [dbo].[promotions_products]  WITH CHECK ADD  CONSTRAINT [fk_promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotions] ([promotion_id])
GO
ALTER TABLE [dbo].[promotions_products] CHECK CONSTRAINT [fk_promotion]
GO
ALTER TABLE [dbo].[supplier_products]  WITH CHECK ADD  CONSTRAINT [fk_product_supplier] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[supplier_products] CHECK CONSTRAINT [fk_product_supplier]
GO
ALTER TABLE [dbo].[supplier_products]  WITH CHECK ADD  CONSTRAINT [fk_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[supplier_products] CHECK CONSTRAINT [fk_supplier]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCartItem]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCartItem]
    @cart_id BIGINT,
    @product_id BIGINT,
    @size_id BIGINT,
    @color_id BIGINT,
    @quantity INT
AS
BEGIN
    DECLARE @variant_id BIGINT;

    -- Find the variant_id based on provided criteria
    SELECT @variant_id = variant_id
    FROM product_variants
    WHERE product_id = @product_id AND size_id = @size_id AND color_id = @color_id;

    -- Check if the cart item already exists
    DECLARE @existing_cart_item_id BIGINT;

    SELECT @existing_cart_item_id = cart_item_id
    FROM cart_items
    WHERE cart_id = @cart_id AND variant_id = @variant_id;

    -- If the cart item exists, update the quantity
    IF @existing_cart_item_id IS NOT NULL
    BEGIN
        UPDATE cart_items
        SET quantity = quantity + @quantity
        WHERE cart_item_id = @existing_cart_item_id;
    END
    ELSE
    BEGIN
        -- If the cart item does not exist, insert a new row
        INSERT INTO cart_items (cart_id, variant_id, quantity)
        VALUES (@cart_id, @variant_id, @quantity);
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertFavorites1]    Script Date: 8/10/2023 2:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertFavorites1]
    @customer_id BIGINT,
    @product_id BIGINT
AS
BEGIN
    -- Check if the favorite item already exists
    DECLARE @existing_favorites_id BIGINT;
    DECLARE @like_dateTime datetime;
    set @like_dateTime = GETDATE();

    SELECT @existing_favorites_id = favorite_id
    FROM favorites
    WHERE customer_id = @customer_id AND product_id = @product_id;

    -- If the favorte exists, update the quantity
    IF @existing_favorites_id IS NOT NULL
    BEGIN
        Delete favorites
        WHERE favorite_id = @existing_favorites_id;
    END
    ELSE
    BEGIN
        -- If the favorite does not exist, insert a new row
        INSERT INTO favorites (customer_id, product_id, date_like)
        VALUES (@customer_id, @product_id, @like_dateTime);
    END;
END;
GO
USE [master]
GO
ALTER DATABASE [conversejava6] SET  READ_WRITE 
GO
