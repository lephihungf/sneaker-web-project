USE [master]
GO
/****** Object:  Database [PRJ_Assignment]    Script Date: 3/17/2024 11:49:39 PM ******/
CREATE DATABASE [PRJ_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGCONY\MSSQL\DATA\PRJ_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGCONY\MSSQL\DATA\PRJ_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRJ_Assignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ_Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJ_Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJ_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[fullname] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[gender] [int] NULL,
	[email] [nvarchar](250) NULL,
	[role] [int] NULL,
	[avatar] [nvarchar](250) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountid] [int] NULL,
	[productid] [int] NULL,
	[quantity] [int] NULL,
	[size] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](250) NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NULL,
	[total_money] [float] NULL,
	[name] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[orderdetailid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[orderdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](250) NULL,
	[categoryid] [int] NOT NULL,
	[price] [float] NULL,
	[image] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[sold_quantity] [int] NULL,
	[releaseDate] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/17/2024 11:49:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[sizeid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NULL,
	[size] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[sizeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (1, N'musk', N'123', N'lph', N'0912097645', N'hoa lacs', 1, N'admin@gmail.com', 0, N'admin.jpg')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (3, N'bezos', N'123', N'lttt', N'0373732568', N'ha noi', 0, N'hunglphs171183@fpt.edu.vn', 0, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (4, N'arnault', N'123', N'nnt', N'0912097645', N'thuong tin', 1, N'ronaldo@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (5, N'gates', N'123', N'btxh', N'0912097645', N'ha tay', 0, N'messi@gmail.com', 1, NULL)
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (6, N'buffett', N'123', N'pqd', N'0912097645', N'ha tay', 1, N'123@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (7, N'ellison', N'123', N'dvm', N'0912097645', N'hoa lac', 1, N'kkk@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (8, N'ambani', N'123', N'lptl', N'0912097645', N'thuong tin', 1, N'zzz@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (9, N'btxh', N'123', N'btxh', N'0912097645', N'btxh', 1, N'btxh@gmail.com', 1, N'guest.png')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Cart] ([accountid], [productid], [quantity], [size]) VALUES (1, 12, 1, 41)
INSERT [dbo].[Cart] ([accountid], [productid], [quantity], [size]) VALUES (3, 13, 1, 40)
INSERT [dbo].[Cart] ([accountid], [productid], [quantity], [size]) VALUES (1, 23, 3, 42)
INSERT [dbo].[Cart] ([accountid], [productid], [quantity], [size]) VALUES (1, 9, 2, 40)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (3, N'Nike')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (4, N'Adidas')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (5, N'Puma')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (7, N'New Banlance')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (1, 1, 3500, N'hung', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (2, 1, 3000, N'hung', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (3, 1, 3000, N'hung', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (4, 3, 15000, N'ronaldo', N'ha noi', N'123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (5, 3, 5000, N'ronaldo', N'ha noi', N'123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (6, 4, 1500, N'huy', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (7, 4, 3000, N'huy', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (8, 5, 1200, N'messi', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (9, 5, 500, N'messi', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (10, 6, 1200, N'hihihii', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (11, 8, 1200, N'john', N'123', N'123')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (12, 8, 1000, N'john', N'123', N'123')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (13, 4, 10800, N'hoilamhi', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (14, 4, 24400, N'hoilamhi', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (15, 1, 1500, N'musk', N'hoa lac', N'0912097645')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (20, 4, 3000, N'arnault', N'thuong tin', N'0912097645')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (1, 1, 9, 7, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (2, 2, 9, 6, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (3, 3, 9, 6, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (4, 4, 13, 10, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (5, 4, 12, 3, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (6, 5, 12, 2, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (7, 5, 9, 6, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (8, 6, 9, 3, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (9, 7, 9, 6, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (10, 8, 13, 1, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (11, 9, 9, 1, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (12, 10, 13, 1, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (13, 11, 13, 1, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (14, 12, 12, 1, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (15, 13, 13, 9, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (16, 14, 12, 5, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (17, 14, 13, 7, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (18, 14, 14, 5, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (19, 14, 9, 7, 42)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (20, 1, 9, 5, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (21, 15, 9, 2, 41)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (22, 15, 9, 1, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (23, 20, 21, 2, 40)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity], [size]) VALUES (24, 20, 12, 1, 41)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (9, N'Nike Air Force 1', 3, 500, N'nikeairforce1.jpg', N'Good', 45, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (12, N'Nike Air Force 1 ''07', 3, 1000, N'giay-nike-air-force-1-low-07-lv8-40th-anniversary-white-black-dq7658-100-63aa63ad5f659-27122022101701.jpg', N'Very Good', 22, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (13, N'Nike Revolution 6', 3, 1200, N'dd1096-600_0_448acea668564b9aa2b7a878e092280a_859744cec254437291827a9046964966_grande.jpg', N'Good', 41, CAST(N'2022-06-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (14, N'Adidas Response Super 3.0', 4, 1500, N'0d9e888a7ffd4f8fbb6c2ab5c582d582_9366.jpg', N'Good', 15, CAST(N'2024-02-14' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (21, N'Nike Air Force 1', 3, 1000, N'b7d9211c-26e7-431a-ac24-b0540fb3c00f.jpg', N'Good', 12, CAST(N'2022-09-09' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (22, N'Nike Dunk Low Retro Premium', 3, 1500, N'35cd473e-b388-4de0-83f5-8a8f3287eef6.jpg', N'Good', 15, CAST(N'2021-12-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (23, N'Adidas RUNFALCON 3', 4, 1000, N'0d9e888a7ffd4f8fbb6c2ab5c582d582_9366.jpg', N'Good', 10, CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (24, N'Puma Palermo Leather', 5, 1200, N'Palermo-Leather-Men''s-Sneakers.jpg', N'Good', 15, CAST(N'2023-01-08' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (25, N'New Balance Men 530', 7, 999, N'mr530sg_nb_03_i.jpg', N'Beutiful', 12, CAST(N'2024-01-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (26, N'Adidas PUREBOOST 23
', 4, 990, N'b26ffc91c6bb49b59a67d52cbb89b540_9366.jpg', N'So Pretty', 15, CAST(N'2022-09-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (27, N'RS-X Faded Daytona Sneakers', 5, 1500, N'RS-X-Faded-Daytona-Sneakers.jpg', N'So Good', 15, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (28, N'ALD x New Balance 650R', 7, 1700, N'bb650rx1_nb_02_i.jpg', N'Pretty', 15, CAST(N'2024-01-23' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (29, N'Adidas ULTRABOOST 1.0', 4, 1300, N'ec6a133ce53d435aacc02e7d9f4ccf0d_9366.jpg', N'Nice', 10, CAST(N'2024-02-25' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (30, N'New Balance Men''s
574', 7, 1500, N'u574lgfg_nb_02_i.jpg', N'Nice', 5, CAST(N'2022-11-05' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (31, N'Adidas SUPERNOVA 3', 4, 1200, N'eb0b9557873344559e74a33c60f36353_9366.jpg', N'Very Good', 10, CAST(N'2024-02-26' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (32, N'New Balance', 7, 990, N'nm600ogs_nb_02_i.jpg', N'Good', 11, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (39, N'haha123  ', 3, 12, N'', N'123123', 0, CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [image], [description], [sold_quantity], [releaseDate]) VALUES (40, N'12', 4, 12, N'e21f4d363aec4487b144af3b008488b0_9366.jpg', N'12', 0, CAST(N'2024-02-26' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (3, 9, 12, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (6, 9, 4, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (7, 12, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (9, 12, 6, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (10, 13, 4, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (11, 13, 6, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (12, 14, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (13, 21, 3, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (15, 21, 6, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (16, 22, 3, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (18, 22, 9, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (19, 23, 2, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (20, 23, 3, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (21, 24, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (24, 26, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (26, 27, 3, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (27, 28, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (29, 28, 6, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (30, 29, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (32, 29, 10, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (33, 30, 5, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (35, 30, 8, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (36, 31, 6, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (37, 31, 9, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (39, 32, 5, 42)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (41, 32, 1, 40)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (47, 39, 13, 12)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (48, 40, 12, 12)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (49, 39, 13, 13)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (50, 12, 7, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (51, 13, 9, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (52, 9, 9, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (53, 22, 2, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (54, 25, 7, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (55, 29, 8, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (56, 30, 2, 41)
INSERT [dbo].[Size] ([sizeid], [productid], [quantity], [size]) VALUES (57, 14, 6, 41)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order1] FOREIGN KEY([orderid])
REFERENCES [dbo].[Order] ([orderid])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order1]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Product]
GO
USE [master]
GO
ALTER DATABASE [PRJ_Assignment] SET  READ_WRITE 
GO
