USE [master]
GO
/****** Object:  Database [BTL]    Script Date: 5/13/2021 2:26:01 PM ******/
CREATE DATABASE [BTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTL', FILENAME = N'D:\SQL Server 2014\MSSQL12.DUYVU\MSSQL\DATA\BTL.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BTL_log', FILENAME = N'D:\SQL Server 2014\MSSQL12.DUYVU\MSSQL\DATA\BTL_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BTL] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL] SET RECOVERY FULL 
GO
ALTER DATABASE [BTL] SET  MULTI_USER 
GO
ALTER DATABASE [BTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTL] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BTL]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] NOT NULL,
	[TitleBlog] [nvarchar](4000) NULL,
	[Time] [nchar](30) NULL,
	[ContentBlog] [nvarchar](4000) NULL,
	[ImageBlog] [nchar](30) NULL,
	[NameUser] [nvarchar](50) NULL,
	[Summary] [nchar](2000) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[TypeStatus] [bit] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] NOT NULL,
	[NameUser] [nvarchar](30) NULL,
	[Job] [nvarchar](50) NULL,
	[CommentContent] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryType]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryType](
	[countryID] [int] NOT NULL,
	[countryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CountryType] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif'),
	[Activated] [bit] NULL CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)),
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[colorID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[image] [text] NOT NULL,
	[color] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[createdDate] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nchar](15) NULL,
	[email] [nchar](30) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](20) NULL,
	[state] [nvarchar](20) NULL,
	[paymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymentTypeID] [int] NOT NULL,
	[paymentTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productPrice] [nchar](20) NULL,
	[productSale] [nchar](20) NULL,
	[productInfor] [nvarchar](2000) NULL,
	[productImage] [nchar](30) NULL,
	[productIntroduce] [nvarchar](4000) NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/13/2021 2:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NULL,
	[Password] [nchar](50) NULL,
	[Email] [nchar](30) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (1, N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn', N'April 07, 2021                ', N'Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".

Nó là một điện thoại thông minh tầm trung tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

ColorOS 11.1 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset là MediaTek Dimensity 800U hỗ trợ 64bit và CPU là tám lõi.

Màn hình được trang bị AMOLED 6,43 inch FHD + (1080 * 2400).

Máy ảnh bao gồm cảm biến hình ảnh CMOS chính khoảng 48 triệu điểm ảnh, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, cảm biến hình ảnh CMOS macro khoảng 2 triệu điểm ảnh và cảm biến đơn sắc cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh . Nó được trang bị một camera quad và cảm biến hình ảnh CMOS với khoảng 16 triệu điểm ảnh ở mặt trước.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2600 (B7) / 2100 (B1) / 1800 (B3) / 900 (B8) / 850 (B5) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) MHz, W-CDMA 2100 (I) / 900 (VIII) / Nó hỗ trợ 850 (V) MHz và GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là một SIM duy nhất và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây (2.4GHz / 5GHz), NFC cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB.

Dung lượng của viên pin là 4310mAh.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay và cảm biến xác thực vân tay sử dụng loại tích hợp màn hình.

Bạn có thể chọn từ hai biến thể màu sắc, Fluid Black và Cosmo Blue.

Nó đã được quyết định bán nó ở Singapore, và giá là 529 đô la Singapore (khoảng 43.000 yên).', N'Blog_01.jpg                   ', N'Tuấn Anh', N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn. Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (2, N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera', N'April 09, 2021                ', N'RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

Realme UI 2.0 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 1000+ hỗ trợ 64 bit và CPU là một lõi tám.

Màn hình sẽ có kích thước khoảng 6,55 inch FHD + (1080 * 2400) AMOLED với tốc độ làm tươi lên đến 90Hz.

Máy ảnh này là một máy ảnh ba bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu pixel chính ở phía sau, cảm biến hình ảnh CMOS khoảng 8 triệu pixel với ống kính góc siêu rộng, cảm biến hình ảnh CMOS khoảng 2 triệu pixel cho macro và CMOS khoảng 32 triệu pixel ở phía trước. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 1800 (n3) MHz, NR (FR1, TDD) 4500 (n79) / 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD )) 2600 (B7) / 2100 (B1) / 1900 (B2) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B18 / B19 / B26) / 700 (B12 / B17)) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1900 (II) / 1700 ( IV) Nó hỗ trợ / 900 (VIII) / 850 (V) / 800 (VI / XIX) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 và n3 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây IEEE 802.11a / b / g / n / ac / ax (2.4GHz / 5GHz), NFC có thể được sử dụng.

Mô hình có dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong 128GB (sau đây gọi là mô hình 8GB + 128GB) và mô hình có dung lượng bộ nhớ hệ thống là 12GB và dung lượng lưu trữ trong 256GB (sau đây gọi là kiểu máy 12GB + 256GB) là có sẵn. Có.

Viên pin được tích hợp bên trong có dung lượng 4500mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Có hai biến thể màu sắc, Tenkunojo và Kuro Takumi Forest.

Nó đã được quyết định bán nó ở Trung Quốc và giá được đặt ở mức 2.299 NDT (khoảng 39.000 yên) cho mô hình 8GB + 128GB và 2.599 nhân dân tệ (khoảng 44.000 yên) cho mô hình 12GB + 256GB.', N'Blog_02.jpg                   ', N'Hoàng Thảo', N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera. RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (3, N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820', N'April 02, 2021                ', N'Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

OriginOS 1.0, dựa trên Android 11, sẽ được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 820 hỗ trợ 64 bit.

CPU là một lõi tám và tần số hoạt động bao gồm lõi tứ với tốc độ tối đa là 2,6 GHz và lõi tứ với tốc độ tối đa là 2,0 GHz.

Màn hình có kích thước khoảng 6,44 inch FHD + (1080 * 2404) AMOLED với tốc độ làm mới lên đến 90Hz.

Máy ảnh này là bộ ba camera bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu điểm ảnh chính ở phía sau, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, một máy ảnh macro cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh và mặt trước khoảng 32 CMOS triệu pixel. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 700 (n28A) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2100 (B1) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B19) / 700 (B28A) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1700 (IV) / 900 (VIII) / 850 (V) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900 / Nó hỗ trợ 850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng tần số FDD chỉ hoạt động trong cấu hình SA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1 và mạng LAN không dây (2.4GHz / 5GHz) cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB hoặc 256GB.

Viên pin được tích hợp bên trong có dung lượng 4100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay, và cảm biến xác thực vân tay là loại tích hợp màn hình.

Bạn có thể chọn từ ba biến thể màu sắc: cực quang đêm đầy sao, pha lê ánh sáng nước và obsidian.

Nó đã được quyết định bán nó ở Trung Quốc và giá sẽ là RMB 2.399 (khoảng 40.000 yên) cho mô hình có bộ nhớ trong 128GB và 2.699 nhân dân tệ (khoảng 45.000 yên) cho mô hình có 256GB.', N'Blog_03.jpg                   ', N'Mai Phú', N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 3	Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820. Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (4, N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7', N'April 10, 2021                ', N'Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".

Nó là một máy tính bảng sử dụng Magic UI 4.0, dựa trên Android 10 làm hệ điều hành.

Chipset được trang bị MediaTek MT8786.

CPU là một lõi tám và tần số hoạt động bao gồm lõi kép với tối đa 2,0 GHz và lõi sáu với tối đa 1,8 GHz.

Màn hình được trang bị tinh thể lỏng IPS kích thước 10,1 inch WUXGA (1920 * 1200) và mật độ điểm ảnh là 224 ppi.

Máy ảnh được trang bị cảm biến hình ảnh CMOS với khoảng 5 triệu điểm ảnh ở phía sau và cảm biến hình ảnh CMOS với khoảng 2 triệu điểm ảnh ở phía trước.

Về phương thức liên lạc, phiên bản LTE hỗ trợ hệ thống LTE / W-CDMA / CDMA2000 / GSM, và phiên bản Wi-Fi không hỗ trợ mạng di động.

Có thể sử dụng Bluetooth 5.1 và mạng LAN không dây IEEE 802.11a / b / g / n / ac (2.4GHz / 5GHz).

Dung lượng bộ nhớ hệ thống là 4GB và dung lượng lưu trữ trong là 64GB hoặc 128GB.

Nó cũng hỗ trợ việc sử dụng bộ nhớ ngoài.

Viên pin được tích hợp bên trong có dung lượng 5100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Bạn có thể chọn từ hai biến thể màu sắc.

Nó đã được quyết định bán nó ở Trung Quốc và phiên bản Wi-Fi sẽ được phát hành đầu tiên, sau đó phiên bản LTE sẽ được phát hành.

Giá là 1.599 RMB (khoảng 27.000 yên) cho phiên bản LTE với dung lượng lưu trữ trong 64 GB, 1.899 RMB (khoảng 32.000 yên) cho mô hình 128 GB và 1.399 RMB (khoảng 32.000 yên) cho phiên bản Wi-Fi 64 GB. mô hình Mô hình 128GB có giá 1.699 RMB (khoảng 28.000 yên).

Đây là chiếc máy tính bảng đầu tiên được Honor Device công bố sau khi tiếp quản mảng kinh doanh thiết bị đầu cuối di động thương hiệu HONOR từ Huawei Technologies của Trung Quốc.', N'Blog_04.jpg                   ', N'Giang Sơn', N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7. Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (2, 5, 1, 8290000.0000)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (1, N'Điện thoại', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (2, N'Máy tính', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (3, N'Máy tính bảng', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (4, N'Phụ kiện', 1)
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (1, N'Ngọc Hà', N'Nhân viên văn phòng', N'"Mình đã từng mua điện thoại ở rất nhiều cửa hàng, nhưng chỉ có Smart Cellular mới chăm sóc khách hàng có tâm và tầm nhất".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (2, N'Hoàng Minh Tuấn', N'Giảng viên đại học quốc gia Hà Nội', N'"Sản phẩm chất lượng cao, chính sách ưu đãi vô cùng tốt".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (3, N'Ngô Văn Hoàng', N'Nhân viên ngân hàng', N'"Mẫu mã sản phẩm đa dạng, hiện đại, có nhiều lựa chọn cho khách hàng, tư vấn nhiệt tình, thân thiện"')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (4, N'Hoàng Lê Việt Anh', N'Kỹ sư công nghệ thông tin', N'"Sản phẩm chính hãng, chinh sách ưu đãi và bảo hành tốt, giá cả cạnh tranh. Chỉ một vấn đề nhỏ là giao hàng hơi lâu, nhưng nói chung vẫn rất tuyệt vời".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (5, N'Nguyễn Hà Anh', N'Chủ cửa hàng quần áo', N'"Công việc của mình phải sử dụng điện thoại thường xuyên nên rất cần một chiếc điện thoại cấu hình và bảo mật cao, dung lượng bộ nhớ tốt. Smart Cellular rất làm mình an tâm về việc mua sản phẩm tại đây".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (6, N'Hà Anh Tuấn', N'Nhân viên Marketing', N'"Chuyên viên tư vấn nhiệt tình, chu đáo, lại vô cùng dễ thương nữa. Lần đầu tiên mua hàng cảm thấy đáng đồng tiền".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (7, N'Lương Ngọc Quỳnh', N'Thợ chụp ảnh', N'"Mình đã đắn đo, tìm kiếm một chiếc điện thoại Iphone 12, vì trên thị trường giờ bán nhiều mà mình thì cũng không rành về điện thoại cho lắm, nhưng sau khi thấy sản phẩm của cửa hàng và các chính sách thì mình hoàn toàn tin tưởng Smart Cellular".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (8, N'Ngô Hoàng Long', N'Nhân viên lập trình', N'"Mình cũng được mấy người bạn giới thiệu qua cửa hàng, ban đầu thì vẫn còn hơi lưỡng lự nhưng sau khi sử dụng được một thời gian thì mình thấy vô cùng yên tâm".')
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Fullname], [PhoneNumber], [Address], [Email], [Photo], [Activated], [IsDeleted]) VALUES (1, N'Lê Thị Quế Anh', N'0923888233', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Id], [Fullname], [PhoneNumber], [Address], [Email], [Photo], [Activated], [IsDeleted]) VALUES (2, N'Vũ Duy', N'0335244981', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Id], [Fullname], [PhoneNumber], [Address], [Email], [Photo], [Activated], [IsDeleted]) VALUES (3, N'Vũ Duy', N'0967775035', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Id], [Fullname], [PhoneNumber], [Address], [Email], [Photo], [Activated], [IsDeleted]) VALUES (4, N'Quản Trị Viên', N'0967775035', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Id], [Fullname], [PhoneNumber], [Address], [Email], [Photo], [Activated], [IsDeleted]) VALUES (5, N'Khách Hàng', N'0867929312', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (1, 1, N'img_01_den.jpg', N'Màu đen')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (2, 1, N'img_01_trang.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (3, 1, N'img_01_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (4, 2, N'img_02_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (5, 2, N'img_02_trang_.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (6, 2, N'img_02_den.jpg', N'Màu đen')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (1, CAST(N'2021-05-10 21:43:33.000' AS DateTime), N'erere', N'343434343434   ', N'duycong383@gmail.com          ', N'17', N'hy', N'mhdf', N'tra')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (2, CAST(N'2021-05-12 16:07:34.923' AS DateTime), N'duy', N'4385030854     ', N'duy@gmail.com                 ', N'hung yen', N'hung yen', N'hung yen', N'cash')
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (1, N'Credit')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (2, N'Cash')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (3, N'Paypal')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (4, N'Samsung Galaxy A12', N'4290000             ', N'3600000             ', N'Điện thoại Samsung Galaxy A12 – Smartphone giá rẻ cấu hình tốt và pin trâu Samsung A12 là một chiếc smartphone giá rẻ nhưng sở hữu cấu hình ổn định cùng với viên pin 5000mAh cho thời lượng suốt ngày dài. Bên cạnh đó điện thoại cũng sở hữu thiết kế thời trang và phù hợp với xu hướng.', N'dt01.jpg                      ', N'Thiết kế đơn giản, 4 phiên bản màu, vân tay cạnh bên
Galaxy A12 có thiết kế đơn giản với bốn góc cạnh được bo tròn mềm mại cùng với hai cạnh bên được vát cong nhẹ nhàng tạo cảm giác cầm thoải mái cho người dùng.

Bên cạnh đó smartphone còn được cho ra mắt với nhiều phiên bản màu Đen, Trắng, Xanh thời trang để bạn có thể lựa chọn màu sắc yêu thích.

Thiết kế đơn giản, 4 phiên bản màu và cảm biến vân tay tích hợp ở mặt lưng

Samsung A12 mặc dù có thiết kế nguyên khối và chỉ sử dụng chất liệu nhựa nhưng lại được hoàn thiện vô cùng tỉ mỉ và chính xác nên vẫn mang đến cảm giác cao cấp khi chạm. Máy được hỗ trợ vân tay cạnh bên giúp người dùng mở khóa điện thoại nhanh chóng.

Màn hình giọt nước  6.5 inch và tấm nền TFT LCD tái tạo màu tốt
Mặc dù là smartphone giá rẻ nhưng Galaxy A12 vẫn sở hữu thiết kế màn hình bắt kịp với xu hướng với màn hình giọt nước và được bo tròn theo kiểu dáng của smartphone. Màn hình 6.5 inch tràn viền cho người dùng góc nhìn rộng, thoải mái tận hưởng không gian hiển thị.

Màn hình đục lỗ 6.4 inch và tấm nền TFT LCD tái tạo màu tốt

Sử dụng tấm nền TFT LCD thay vì các loại màn hình LCD thông thường mang đến khả năng tái tạo màu tốt hơn, cho hình ảnh hiển thị có màu sắc chân thực và sống động.

Smartphone còn có độ phân giải HD+ mặc dù chưa thực sự quá xuất sắc nhưng trên một thiết bị giá rẻ thì màn hình A12 đã đạt chất lượng rất tốt.

Hệ thống 4 camera sau với ống kính góc siêu rộng và camera trước 8MP
Samsung Galaxy A12 cũng mang đến cho người dùng khả năng chụp ảnh ấn tượng khi trang bị 4 camera sau với camera chính 48MP góc rộng, camera góc siêu rộng 5MP và camera xóa phông 2MP cùng camera cận cảnh 2MP.

Máy hỗ trợ đầy đủ các tính năng chụp ảnh thông minh như lấy nét tự động, chống rung,…đồng thời hỗ trợ quay phim với chất lượng 1080p sắc nét để bạn có thể quay lại mọi khoảnh khắc đáng nhớ, chụp lại các tài liệu quan trọng một cách nhanh chóng.

Hệ thống 3 camera sau với ống kính góc siêu rộng và camera trước 8MP

Ngoài ra, Samsung A12 còn sở hữu camera trước 8MP f/2.0 giúp bạn thực hiện video call chất lượng cao, chụp selfie sắc nét và xinh đẹp.

Chipset Helio G35 và RAM 4GB cho sức mạnh ấn tượng
Sức mạnh của Galaxy A12 không hề thua kém bất kỳ dòng smartphone tầm trung nào hiện nay nhờ chipset Helio G35 và RAM 4GB cho tốc độ xử lý nhanh chóng mọi thao tác tác vụ, chạy đa nhiệm mượt mà, dễ dàng chuyển đổi qua lại giữa các đa nhiệm, chơi game tốt.

Chipset Snapdragon 450 và RAM 3GB cho sức mạnh ấn tượng

Pin dung lượng 5000mAh, hỗ trợ sạc nhanh 15W
Galaxy A12 đáp ứng cho người dùng thời gian sử dụng lâu dài nhờ được trang bị viên pin dung lượng 5000mAh bền bỉ. Bạn có thể thoải mái sử dụng smartphone mà không lo hết pin liên tục suốt ngày với thời lượng bền bỉ.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (5, N'Oppo Reno5', N'8690000             ', N'8290000             ', N'Điện thoại Oppo Reno 5 – Thiết kế hiện đại sang trọng Sản phẩm mới nhất trong series OPPO Reno của hãng điện thoại OPPO chính là OPPO Reno 5. Chiếc điện thoại với nhiều kế thừa từ người tiền nhiệm Reno với thiết kế hiện đại, cấu hình cao hứa hẹn mang đến những trải nghiệm dùng ấn tượng.', N'dt02.jpg                      ', N'Màn hình nốt ruồi 6.43 inch Full HD+ tràn viền, mặt lưng kim loại sang trọng
OPPO Reno thế hệ thứ 5 sở hữu màn hình cảm ứng điện dung với thiết kế nốt ruồi 6.43 inch cùng độ phân giải Full HD+ 1080 x 2400 pixel và độ sáng lên tới 430nit mang lại hình ảnh trung thực và chính xác. Máy cũng được thiết kế các góc cạnh màn hình tràn viền tạo sự sang trọng.

Màn hình giọt nước 6.5 inch Full HD tràn viền, mặt lưng kim loại sang trọng

Phần cạnh viền và bốn góc trên OPPO Reno 5 được thiết kế bo cong mang lại trải nghiệm cầm nắm tốt. Bên cạnh đó, thiết kê nhôm không chỉ mang lại sự sang trọng mà còn mang đến khả năng tản nhiệt tốt. Thiết kế này giúp máy không bị nóng khi sử dụng trong thời gian dài cho các ứng dụng như chơi game, hay các ứng dụng nặng.

Cấu hình mạnh mẽ với chip Qualcomm Snapdragon 720G, vân tay trong màn hình
OPPO Reno 5 với chip set Qualcomm Snapdragon 720G mang lại hiệu năng cực kỳ mạnh mẽ cũng như tốc độ xử lý cực nhanh. Ngoài ra, máy cũng được trang bị bộ nhớ RAM khủng lên đến 8GB cùng bộ nhớ trong 128GB cho khả năng đa nhiệm nhiều ứng dụng cùng lúc mượt mà. Mọi hình ảnh trên máy cũng như đồ họa trong game được Reno 5 xử lý mượt mà và sắc nét. Ngoài ra, mãy cũng hỗ trợ khe cắm thẻ nhớ MicroSD với dung lượng tối đa lên tới 256GB.

Về phần mềm, điện thoại được trang bị hệ điều hành mới nhất Android 10 và chạy trên nền tảng ColorOS.

Cấu hình mạnh mẽ với chip Helio P90 SoC, vân tay trong màn hình

Công nghệ vân tay âm màn hình ngày càng phổ biến và OPPO cũng nắm bắt xu hướng khi trang bị công nghệ mới này trên mẫu OPPO Reno 5. Vân tay trên RENO 5 với tốc độ đọc nhanh mang lại thời gian mở khóa nhanh chóng cũng như tính năng bảo mật an toàn.

Bộ 4 camera sau với camera chính tới 64MP cho khả năng chụp ảnh sắc nét
Oppo Reno5 sở hữu 4 camera sau với thông số lần lượt là camera chính 64 MP, camera góc rộng 8 MP, camera tele 2 MP và camera đo độ sâu 2MP. Bốn camera trên Reno 5 với khả năng chụp hình sắc nét, chụp liên tục, chụp HDR với dải sáng cao cũng như Zoom kỹ thuật số cực kỳ chất lượng. Cụm camera này cũng hỗ trợ quay video 4K, chạm lấy nét hay nhận diện mặt người khi chụp.

Bộ 4 camera sau với camera chính tới 64MP cho khả năng chụp ảnh sắc nét

Không chỉ camera sau có độ phân giải cao, camera trước trên OPPO Reno 5 cũng được trang bị với độ phân giải lên đến 44MP. Mọi hình ảnh được chụp lại cực kỳ sắc nét khi bạn Selfie cũng như video call trực tuyến với bạn bè khi sử dụng các ứng dụng gọi điện. Camera trước cũng hỗ trợ chụp góc rộng và được thiết kế giọt nước của màn hình.

Dung lượng pin 4310 mah, hỗ trợ sạc nhanh 50W
Cũng như nhiều hãng điện thoại Android khác, OPPO cũng trang bị cho Reno 5 dung lượng pin lớn lên đến 4310 mAh. Với mức dung lượng này, máy có thể cho thời gian hoạt động cả ngày. Bên cạnh đó là sự hỗ trợ của công nghệ sạc nhanh 50W qua cổng USB-C giúp bổ sung năng lượng nhanh chóng.

Dung lượng pin 45000 mah, hỗ trợ sạc nhanh 30W

Bên cạnh đó, OPPO Reno 5 hỗ trợ 2 sim cùng mạng VoLTE 4G, jack cắm tai nghe 3,5 mm.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (6, N'Samsung Galaxy S21 Ultra 5G', N'30990000            ', N'26300000            ', N' Điện thoại Samsung Galaxy S21 Ultra - Đón đầu xu hướng công nghệ Galaxy S21 Ultra với những cải tiến đáng kể về hiệu năng của máy cực kỳ mạnh mẽ cùng với thiết kế sang trọng cao cấp. Samsung đã mang đến cho người dùng một trải nghiệm hoàn toàn mới, đây hứa hẹn sẽ là chiếc smartphone đi đầu trên thế giới về các xu hướng công nghệ lẫn hiệu năng vượt trội đáng sở hữu nhất vào thời điểm ra mắt. ', N'dt03.jpg                      ', N'Thiết kế nguyên khối, màn hình 6.8 inch tràn viền
Samsung S21 Ultra đã được Samsung trang bị bộ khung kim loại nguyên khối mang đến một phong cách thiết kế cứng cáp khi cầm nắm sử dụng, kết hợp thiết kế bố cục với mặt kính cao cấp sáng bóng ở mặt sau tạo nên một vẻ ngoài sang trọng và tinh tế từ những chi tiết nhỏ nhất. Các phím chức năng cũng được làm từ kim loại cho độ nhạy rất cao khi sử dụng.

Thiết kế kim loại nguyên khối

Điểm nổi bật nhất trên chiếc S21 Ultra đó là được trang bị màn hình kích thước lớn lên đến 6.8 inch, mang đến một không gian rộng lớn khi sử dụng. Ngoài ra chiếc điện thoại cao cấp này cũng được hãng trang bị tấm nền hiển thị Dynamics AMOLED 2X mang đến độ phân giải cực cao cho mọi hình ảnh hiển thị cực kỳ sắc nét tần số quét của màn hình này cũng đạt 120Hz cho mọi khung hình tốc độ cao.  

màn hình 6.9 inch tràn viền

Hiệu năng siêu mạnh với chip Exynos 2100, RAM 12GB
Không những có màn hình tràn viền kích thước lớn Samsung còn trang bị trên chiếc Samsung S21 Ultra cấu hình cực kỳ mạnh mẽ. Cụ thể máy được trang bị con chip mới nhất Exynos 2100 với 8 nhân tốc độ cao cho mọi tác vụ được xử lý nhanh chóng.

Ngoài ra bộ nhớ RAM của máy cũng được nâng cấp lên đến 12GB. Người dùng có thể thoải mái đa nhiệm cùng lúc nhiều ứng dụng nặng như chơi game, mạng xã hội cùng lúc mà không bị giật lag.


Bên trong của Galaxy S21 Ultra cũng được mở rộng đáng kể với dung lượng lên đến 128GB mang đến một khả năng lưu trữ rộng lớn mà không cần phải sử dụng thêm thẻ nhớ ngoài trên máy. Samsung cũng trang bị trên chiếc điện thoại này con chip Arm Mali-G78 cho khả năng xử lý hình ảnh mượt mà lên độ phân giải lên đến 2K cho nhiều tác vụ.

Camera sau độ phân giải lên đến 108MP, camera trước 40MP
Hệ thống camera sau trên Samsung Galaxy S21 Ultra cũng được nâng cấp đáng kể với độ phân giải siêu sắc nét. Camera chính được trang bị độ phân giải lên đến 108MP siêu sắc nét.

Camera phụ cũng nằm ở mức khá cao với 2camera tele 10MP, camera góc rộng đạt 12MP mang đến một chất lượng hình ảnh siêu sắc nét ở mọi tác vụ như chụp ảnh, quay video 4K. Ngoài ra hệ thống camera sau còn được trang bị cảm biến chiều sâu TOF 3D cho chất lượng hình ảnh sâu và thực với không gian bên ngoài hơn.

Camera sau độ phân giải lên đến 64MP

Camera trước trên Samsung S21 Ultra sở hữu độ phân giải 40MP. Người dùng có thể sử dụng camera trước để thực hiện selfie hay quay video độ phân giải lớn một cách dễ dàng. Camera trước cũng được trang bị góc rộng cho khả năng ghi lại hình ảnh với khung hình rộng hơn.  

Pin dung lượng 5000mAh sạc nhanh, hỗ trợ 5G tốc độ cao
Samsung đã trang bị trên chiếc S21 Ultra một dung lượng pin khá lớn lên đến 5000mAh. Người dùng có thể sử dụng hiệu năng cao kèm màn hình kích thước lớn một cách thoải mái mà không bị gián đoạn trong thời gian dài. Ngoài ra, máy cũng được trang bị khả năng sạc nhanh cho thời gian sạc đầy pin một cách nhanh chóng.

Pin dung lượng 4.800mAh sạc nhanh

5G được xem là chuẩn không dây mạnh nhất, nhanh nhất hiện tại trên các dòng điện thoại thông minh. Với chuẩn không dây này người dùng có thể thoải mái truy cập internet tốc độ siêu cao trên Galaxy S21 Ultra. Samsung cũng tích hợp 2 sim tăng khả năng mở rộng liên lạc của thiết bị.

Công nghệ bảo mật trên S21 Ultra cũng là những công nghệ hiện đại nhất với vân tay siêu âm bằng cảm biến dưới màn hình. Cổng kết nối nhanh nhất USB Type C cũng được trang bị trên chiếc điện thoại này, các công nghệ bluetooth 5.0 và Wifi dual băng tần cũng hoạt động ổn định mà mở rộng đáng kể khả năng kết nối trên S21 phiên bản Ultra.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (7, N'Samsung Galaxy Note 20 Ultra 5G', N'32990000            ', N'20990000            ', N' Điện thoại Samsung Note 20 Ultra 5G - Sang trọng, hiệu năng vượt trội Bên cạnh biên bản Galaxy Note 20 thường, Samsung còn cho ra mắt Note 20 Ultra 5G cho khả năng kết nối dữ liệu cao cùng thiết kế nguyên khối sang trọng, bắt mắt. Đây sẽ là sự lựa chọn hoàn hảo dành cho bạn để sử dụng mà không bị lỗi thời sau thời gian dài ra mắt.', N'dt04.jpg                      ', N'Thiết kế khung nhôm nguyên khối, mặt sau kính cường lực sang trọng
Là một sản phẩm có kích thước màn hình lớn vì vậy Samsung đã trang bị cho Galaxy Note 20 Ultra 5G  với công nghệ kết nối dữ liệu mạnh mẽ cùng thiết kế nguyên khối. Giúp các linh kiện bên trong điện thoại được cố định chắc chắn đảm bảo mọi thứ bên trong luôn được an toàn. Không những vậy khung nhôm tạo trên những đường viền cực kỳ sang trọng và bắt mắt khi nhìn vào.
Màn hình 6.9 inch độ phân giải 2K 120Hz, cấu hình mạnh mẽ
Đối với bất kỳ chiếc điện thoại nào đến từ Samsung dòng Note luôn là những chiếc điện thoại có kích thước màn hình lớn. Samsung Galaxy Note 20 Ultra 5G cũng vậy nó được trang bị màn hình 6.9 inch 2 cạnh bên cong tạo nên vẻ đẹp sang trọng, độ phân giải đạt 2K 1440 x 3200 pixels cho hình ảnh hiển thị cực kỳ sắc nét. Ngoài ra tần số quét trên màn hình cũng nằm ở mức lớn 120Hz ở độ phân giải FHD và 60Hz ở QHD. Mọi hình ảnh khi bạn chơi game với khung hình cao hay trải nghiệm những bộ phim hành động cực kỳ mượt mà và sắc nét với công nghệ HDR10+.
Samsung Note 20 Ultra 5G sở hữu bên trong một cấu hình cực kỳ mạnh mẽ cân dư sức các tựa game nặng nhất hiện nay. Máy sử dụng chip Exynos 992 tốc độ siêu nhanh đi kèm bộ nhớ RAM 12GB cho bộ nhớ 256GB giúp người dùng có thể thoải mái sử dụng đa nhiệm và lưu trữ thoải mái. Tất cả tạo nên một cấu hình cực kỳ mạnh mẽ có thể đáp ứng mọi nhu cầu của bạn trên một chiếc điện thoại.
Màn hình 6.9 inch độ phân giải 2K 120Hz, cấu hình mạnh mẽ
Trang bị công nghệ 5G tương lai, tốc độ cao khi sử dụng dữ liệu
Hầu hết trên tất cả các nước nói chung và Việt Nam nói riêng đều đang bắt đầu phủ sóng băng tần 5G dần dần để thay đổi các chuẩn thấp hiện tại. Nắm bắt được nhu cầu và xu hướng thị trường hãng đang trang bị Samsung Galaxy Note 20 Ultra công nghệ 5G tốc độ cao. Khi lựa chọn chiếc điện thoại này bạn sẽ không cần phải lo lắng chiếc điện thoại của mình sẽ không theo kịp các công nghệ đổi mới của tương lai.

Với công nghệ 5G người dùng có thể truy cập internet với tốc độ cực cao lên đến 10Gb/s nhanh hơn tất cả các đường truyền wifi cáp quang mà bạn đang sử dụng. Vì vậy lựa chọn Note 20 Ultra 5G không những mạnh mẽ về cấu hình với kích thước lớn mà còn giúp bạn không đi lùi so với những công nghệ nổi bật và quan trọng như 5G.
Camera sau 108MP zoom quang học lên đến 50X, camera trước 40MP
Không những mang đến cấu hình máy hiệu năng cao Galaxy Note 20 Ultra 5G còn mang đến cho bạn bộ 3 camera có độ phân giải cao. Cụ thể camera chính có độ phân giải 108 MP khẩu độ f/1.8, camera periscope telephoto 13 MP khẩu độ f/3.4, camera góc rộng 2 MP khẩu độ f/2.2. Bộ 3 camera này cộng lại cho khả năng zoom quang học lên đến 50X. Giúp bạn lưu lại được những hình ảnh chất lượng cao ở khoảng cách xa và góc cực rộng với độ phân giải lên đến 8K.
Hỗ trợ sạc nhanh 45W qua USB Type C, pin dung lượng lớn 4500mAh
Samsung Note 20 Ultra 5G được hãng trang bị khả năng sạc nhanh công suất lên đến 45W qua cổng USB Type C cho khả năng sạc đầy pin cực kỳ nhanh chóng chưa đến 90 phút. Không những vậy Note 20 Ultra 5G còn có khả năng sạc ngược cho thiết bị khác với công suất 9W. Máy cũng trang bị khả năng sạc không dây công suất lên đến 15W.
Bút S-Pen siêu nhạy, nhiều trang bị kết nối hiện đại, cảm biến vân tay dưới màn hình
Hầu hết các dòng điện thoại Samsung Galaxy Note đều được trang bị bút S-Pen và Galaxy Note 20 Ultra 5G cũng không ngoại lệ. Chiếc bút này được cải tiến nhiều hơn so với các dòng cũ có độ nhạy cực cao và điều hướng thông minh cực kỳ chính xác. Bạn có thể sử dụng bút S-Pen để thỏa sức sáng tạo với những tính năng tuyệt vời và công nghệ cực kỳ thông minh.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (8, N'Xiaomi Redmi Note 10', N'5490000             ', N'5090000             ', N'Điện thoại Xiaomi Redmi Note 10 – Hài hòa giữa công nghệ hiển thị và hiệu năng Đến hẹn lại lên, trong năm nay Xiaomi tiếp tục làm mới bộ sưu tập thiết bị tầm trung của mình với chiếc smartphone mới trong dòng Redmi Note, thiết bị mang tên Redmi Note 10. Những chiếc điện thoại Xiaomi Redmi Note đã quá hot, liệu chiếc smartphone mới này có đủ sức làm lu mờ đi những sản phẩm tiền nhiệm không.   Ngoài ra, khách hàng cũng có thể tham khảo thêm Xiaomi Redmi Note 10 5G để tận hưởng mạng 5G tốc độ cao trên một chiếc smartphone giá rẻ.', N'dt05.jpg                      ', N'Màn hình Amoled 6.43 inches, độ phân giải FullHD+
Điện thoại Redmi Note thế hệ 10 tiếp tục được sở hữu thiết kế kim loại nguyên khối với mặt lưng cong 3D đặc trưng của dòng sản phẩm này. Qua đó, đem lại một ngoại hình sang trọng và bắt mắt với các đường nét mềm mại, giúp bạn tự tin hơn khi cầm máy.

Màn hình của Xiaomi Redmi Note 10 có kích thước 6.43 inch, độ phân giải Full HD+, mật độ điểm ảnh cao đến tận 409 ppi, đem đến khả năng hiển thị vô cùng sắc nét, chưa từng thấy trên những chiếc Redmi Note trước. Nhờ vào việc sử dụng tấm nền Amoled, cho độ sáng cao, màu sắc trung thực, thích hợp để chụp ảnh và hoạt động chỉnh sửa ảnh.

Màn hình 6.58 inches, độ phân giải FullHD+, tấm nền IPS sắc nét

Chiếc smartphone này sử dụng màn hình đục lỗ, camera trước được đặt ở giữa màn hình. Điều này mang đến trải nghiệm không gian hoàn toàn mới mẻ và tối ưu nhất.

Vi xử lý Snapdragon 678 cho hiệu năng mạnh mẽ
Không còn cái nhìn tiêu cực vào những vi xử lý của Snapdragon, với chip mới nhất này sẽ khiến tất cả phải có cái nhìn mới về Snapdragon 678. Chiếc Snapdragon 678 được tích hợp bên trong điện thoại Redmi Note 10 là loại chip được sản xuất trên tiến trình 11nm.

Vi xử lý MediaTek MT6875 Dimensity 820, 6GB RAM, 64GB bộ nhớ trong

Với con chip Snapdragon 678 này, bạn sẽ được trải nghiệm khả năng xử lý mượt mà và nhanh chóng nhất khi giải trí với những tựa game đồ họa nặng, xem phim chất lượng FullHD,…

Bên cạnh đó, góp phần cung cấp sức mạnh cho sản phẩm này là 6GB RAM, hỗ trợ đa nhiệm tuyệt vời, mở nhiều ứng dụng cùng một lúc hoàn toàn không bị giật lag. Bộ nhớ trong 128GB mở rộng khả năng lưu trữ, thoải mái sử dụng dữ liệu.

Bốn camera sau chụp góc siêu rộng, camera selfie 13MP
Điểm độc đáo trong thiết kế của Redmi Note 10 đó chính là cụm camera sau ở mặt lưng được xếp thành cụm hình vông, trông khá bắt mắt. Và đây chính là hệ thống bốn ba camera với độ phân giải “khủng” lần lượt là 48MP, F/1.8 hỗ trợ chụp ảnh góc rộng, 8MP F/2.2 chụp ảnh góc siêu rộng 118 độ, hai camera 2MP đo chiều sâu ảnh và chụp ảnh macro.

Ba camera sau chụp góc siêu rộng, camera selfie 16MP

Với sự kết hợp này, Xiaomi Redmi Note 10 của bạn hoàn toàn đủ khả năng để chụp ảnh một cách chuyên nghiệp với nhiều trường hợp khác nhau như chụp ảnh nhóm hay chụp ảnh chân dung, mang đến cho bạn những tấm ảnh xuất sắc.

Camera trước được thiết kế dạng đục lỗ, giúp mở rộng khung hình. Camera trước có độ phân giải 13MP đầy đủ các tính năng như chụp HDR và panorama, sẵn sàng hỗ trợ bạn chia sẻ ảnh đẹp lên mạng xã hội bất cứ lúc nào.

Viên pin 5.000 mAh tích hợp sạc nhanh 33W  
Không khỏi bất ngờ khi chiếc điện thoại Redmi Note 10 được trang bị viên pin khủng 5.000 mAh, bởi lẽ đó vốn là đặc trưng của điện thoại Xiaomi. Với dung lượng này, chiếc máy cho phép bạn sử dụng thoải mái trong 1,5 ngày với cường độ sử dụng dày đặc.

Viên pin 4.520 mAh tích hợp sạc nhanh 22.5W và sạc ngược 9W

Ngoài ra, máy còn có khả năng sạc nhanh 33W, nhà sản xuất cho biết rằng nó cho khả năng sạc đầy pin chỉ trong vòng 30 phút.  ', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (9, N'iPhone 12 Pro Max I Chính hãng VN/A ', N'32990000            ', N'29500000            ', N'Điện thoại iPhone 12 Pro Max: Nâng tầm đẳng cấp sử dụng Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là iPhone 12 Pro Max, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.', N'dt06.jpg                      ', N'Màn hình 6.7 inches Super Retina XDR
Năm nay, công nghệ màn hình trên 12 Pro Max cũng được đổi mới và trang bị tốt hơn cùng kích thước lên đến 6.7 inch, lớn hơn so với điện thoại iPhone 12. Với công nghệ màn hình OLED cho khả năng hiển thị hình ảnh lên đến 2778 x 1284 pixels. Bên cạnh đó, màn hình này còn cho độ sáng tối đa cao nhất lên đến 800 nits, luôn đảm bảo cho bạn một độ sáng cao và dễ nhìn nhất ngoài nắng.
Một điểm đổi mới nữa trên màn hình của chiếc điện thoại Apple iPhone 12 năm nay là việc chúng được thiết kế với khung viền vuông vức, viền thép không gỉ mang đến vẻ đẹp sang trọng cho điện thoại. Máy cũng được trang bị nhiều phiên bản màu sắc đặc biệt cho người dùng lựa chọn.
Về trang bị phần cứng bên trong thì iPhone 12 Pro Max có một thanh RAM lên đến 6GB. Điều này cho thấy rằng Apple ngày đang lắng nghe người dùng nhiều hơn khi trang bị một dung lượng RAM lớn hơn để việc đa nhiệm ngày càng được cải thiện hơn. Việc thanh ram lớn giúp cho bạn trải nghiệm các tựa game và đa nhiệm mượt mà hơn.
Năm nay, 12 Pro Max cũng sẽ có ba phiên bản bộ nhớ trong khác nhau, với bộ nhớ trong nhỏ nhất bắt đầu từ 128GB, 256GB và cao nhất sẽ là 512GB. Một chiếc điện thoại mà có một bộ nhớ trong lớn ngang ngửa một chiếc laptop là điều mà Apple muốn mang lại cho người dùng để có thể san sẻ bớt bộ nhớ cho các thiết bị khác.
Con chip Apple A14 SoC 5nm, RAM 6GB mạnh mẽ
iPhone 12 Pro Max không những chỉ có các cải tiến trên, mà chúng còn có một thứ cải tiến được coi là nguồn lõi và là trái tim để vận hành chiếc điện thoại siêu phẩm 2020, đó là con chip Apple A14 SoC 5nm. Trang bị này giúp cho điện thoại có một sức mạnh đáng gờm hơn các đối thủ hơn về hiệu năng, hiệu suất sử dụng pin.
Máy cũng được trang bị chuẩn kết nối wifi và mạng di động giúp cho bạn có thể cải thiện hiệu suất sử dụng mạng và chúng còn giúp các đường truyền tín hiệu luôn được đảm bảo không rớt kết nối và tăng chất lượng hiển thị hình ảnh trên mạng.
Có thể nói camera cũng là một bước tiến mới trên iPhone 12 Pro Max khi chúng có một bộ 3 camera với chung một độ phân giải là 12MP. Tuy nhiên chúng có khẩu độ lớn và mật độ điểm ảnh trên một panel cũng lớn hơn, do đó chúng cho hình ảnh chi tiết hơn, bắt sáng tốt hơn. Ngoài ra, kết hợp chống rung quang học OIS thì máy còn có thể quay phim 4K tốt.
Camera trên iPhone 12 Pro Max có chức năng quét chiều sâu và đảm bảo hình ảnh có một độ sâu nhất định. Cùng với đó chức năng chính của chiếc ống kính này là khả năng thể hiện hình ảnh 3D khi quét chúng vào một căn phòng nhất định. Giúp phục vụ cho công việc xây dựng cũng như định dạng hình ảnh
Camera trước 12MP cũng có cùng khẩu độ và kích thước điểm ảnh trong panel giống như camera. Điều này giúp cho việc sử dụng chúng cho chụp ảnh selfie tốt hơn và chân thực hơn. Cùng với đó một tính năng mà Apple luôn giữ chúng từ đời iPhone X đến giờ là khả năng quét khuôn mặt 3D FaceiD.
Công nghệ chống nước là không thể thiếu trên các dòng điện thoại cao cấp và đặc biệt là đối với iPhone 12 Pro Max. Chúng được trang bị công nghệ chống nước và chống bụi tốt nhất hiện nay trên các dòng smartphone đó là tiêu chuẩn IP68. Giúp bạn luôn có thể yên tâm hơn trong việc sử dụng quay phim dưới nước hay ở môi trường khắc nghiệt.
Viên pin liền cho thời lượng sử dụng lên đến cả ngày cùng công nghệ sạc nhanh 
Một viên pin liền với dung lượng lớn trên iPhone 12 Pro Max giúp cho chiếc điện thoại bạn có thể hoạt động được một cách ổn thoả hơn và thời gian sử dụng được lâu dài hơn. Cụ thể, máy cho thời gian nghe nhạc lên tới 80 giờ hoặc 12 giờ xem video trực truyến.
Công nghệ sạc là trên 12 Pro Max là công nghệ sạc nhanh không dây lên đến 15W. Điều này có thể giúp bạn hạn chế được các việc phải ngồi đợi chiếc điện thoại của mình sạc xong khi máy có thể bổ sung 50% dung lượng chỉ trong vòng 30 phút.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (10, N'iPhone 11 I Chính hãng VN/A ', N'18000000            ', N'15800000            ', N'giảm lên đến 500.000 ₫  Điện thoại iPhone 11  – Camera nâng cấp, màu sắc trẻ trung iPhone 11 là model có nhiều màu sắc nhất và có giá rẻ nhất trong bộ 3 iPhone 11 series được Apple ra mắt trong năm 2019. Bên cạnh đó, cấu hình máy cũng được nâng cấp đặc biệt về cụm camera sau và Face ID, viên pin dung lượng lớn hơn.', N'dt07.jpg                      ', N'Thiết kế từ nhôm và vỏ kính, chuẩn chống nước IP68
iPhone 11 có kiểu dáng đẹp mắt khi được hoàn thiện từ nhôm và vỏ kính bền nhất trong thế giới smartphone. Máy được sử dụng tới 7 tầm nền màu sắc giúp màu sơn có độ sâu đầy ấn tượng phản chiếu qua lớp kính sang trọng.

Khung nhôm trên iPhone 11 được sơn mờ tương tự như trên iPhone Xr. Trong khi hai phiên bản cao cấp Pro và Pro Max là khung thép không gỉ.
Nhận diện khuôn mặt Face ID được nâng cấp, âm thanh sống động

Về âm thanh với chất lượng âm tốt với hệ thống loa kép nằm ở cả trên và dưới, đặc biệt với âm thanh nổi stereo. Trong trải nghiệm giải trí, máy cho âm thanh cân bằng kể cả khi đặt máy nằm ngang. Khi giải trí với âm lượng cao, mặt lưng cũng không bị rung, ảnh hưởng trải nghiệm người dùng.

Màn hình LCD 6,1 inch Liquid Retina cho màu sắc vô cùng chân thực
iPhone 11 sử dụng màn hình LCD tiên tiến nhất hiện nay, cũng tương tự như phiên bản Pro hiển thị tuyệt đẹp với kích thước lớn 6,1 inch Liquid Retina sắc nét, tràn viền cạnh cùng mật độ điểm ảnh 326ppi. Thiết kế tràn viền giúp cho dù màn hình lớn tới 6,1 inch nhưng máy vẫn nhỏ gọn hơn so với iPhone 8 Plus, dễ dàng cầm nắm thao tác bằng một tay.
Ngoài ra, để nâng cao chất lượng hiển thị, Apple đã tích hợp công nghệ True-Tone. Công nghệ giúp điều chỉnh ánh sáng màn hình theo ánh sáng môi trường. Nhờ đó người dùng sẽ hạn chế tình trạng đau mắt khi sử dụng máy trong thời gian dài.

Màn hình trên iPhone 11 vẫn giữ nguyên thiết kế tai thỏ, phần notch này chứa camera selfie, loa và FaceID và một số cảm biến khác. Đặc biệt màn hình này còn được tích hợp lớp kính cường lực Gorilla Glass với khung viền được bo cong 2,5D cho các thao tác vuốt thoải mái. Mặt kính này được Apple phủ một lớp oleophobic giúp hạn chế bám vân tay cũng như dễ dàng lau chùi, vệ sinh.

Màn hình LCD 6,1 inch Liquid Retina cho màu sắc vô cùng chân thực
Về màu sắc hiển thị, máy cho khả năng hiển thị màu sắc cao với điểm DeltaIE trung bình đạt 1,1 cùng độ lệch 2,4. Đặc biệt, điện thoại hỗ trợ dải màu DCI-P3 giúp màn hình giữ được độ chính xác cao, kể cả khi màn hình ở độ sáng thấp nhất.

Cụm camera kép góc siêu rộng 12 MP, camera selfie 12 MP
Apple đã khéo léo thiết kế cụm camera to và nổi bật hơn trên điện thoại giúp người dùng dễ nhận dạng sản phẩm, mặt khác Apple muốn mang đến một làn gió mới trên thiết bị này với cụm camera vuông độc đáo. Apple iPhone 11 được tích cảm biến góc rộng 12 MP và cảm biến góc siêu rộng 12 MP. Thiết kế của camera kép này cũng to hơn thông thường.

iPhone 11 được tích cảm biến góc rộng 12 MP và cảm biến góc siêu rộng 12 MP

Chất lượng hình ảnh trên iPhone 11 với chi tiết cao cùng độ noise thấp, dải màu động. Khi ở chụp ở chế độ zoom 2x, máy vẫn cho chi tiết tốt nếu chụp ở điều kiện đủ sáng.

Hoạt động mượt mà với chip A13 Bionic mạnh mẽ
Một trong những nâng cấp khác đáng chú ý trên iPhone 11 chính là chip xử lý Apple A13 Bionic. Đây là con chip nhanh nhất từng có trong điện thoại thông minh, cung cấp hiệu năng vô song cho mọi tác vụ và có CPU cùng GPU nhanh hơn tới 20% so với A12.

Cùng với bộ nhớ trong 64GB và dung lượng ram 4GB cho khả năng hoạt động mượt mà, đa nhiệm ấn tượng cũng như không gian lưu trữ vừa đủ với yêu cầu thông thường. Bên cạnh bản 64GB bộ nhớ trong tiêu chuẩn, Apple còn cung cấp thêm những phiên bản nâng cấp khác như iPhone 11 128GB và 256GB.
Với viên pin 3110 mAh, người dùng có thể sử dụng để lướt web suốt 15 tiếng và xem video 10 tiếng liên tục, con số này thực sự ấn tượng. Và nó nhiều hơn cả Xr cũng như thời gian sử dụng của iPhone 11 còn lâu hơn 1.5 tiếng so với iPhone 8 Plus. 
Máy còn có khả năng sạc nhanh tới 50% trong 30 phút với bộ chuyển đổi 18W trở lên (được bán riêng) và hỗ trợ sạc không dây chuẩn Qi. ', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (11, N'iPhone 12 I Chính hãng VN/A', N'22990000            ', N'19890000            ', N'giảm lên đến 500.000 ₫  Điện thoại iPhone 12 - "Siêu phẩm" iPhone khẳng định đẳng cấp Trong khi sức hút đến từ bộ ba iPhone 11 vẫn chưa nguội đi, hãng Apple vừa qua đã cho ra mắt "siêu phẩm" mới nhất 2020 mang tên iPhone 12. Với những nâng cấp đáng kể cho màn hình và hiệu năng, đây sẽ là smartphone thuộc phân khúc cao cấp đáng chú ý trong năm nay.', N'dt08.jpg                      ', N'Màn hình Super Retina OLED rộng 6.1 inch
Apple đã quyết định giữ nguyên thiết kế notch "tai thỏ" quen thuộc cho màn hình iPhone 12, nhưng phần notch đã được tinh giản nhỏ gọn lại nhằm tạo thêm tỷ lệ hiển thị hình ảnh trên màn hình. Về kích thước, màn hình của máy độ phân giải 2532x 1170pixels và có kích thước 6.1 inch, nhỏ hơn so với iPhone 12 Pro Max (6.7 inch).

Thân máy nguyên khối cứng cáp & bền bỉ
Toàn thân máy được chế tác từ chất liệu nguyên khối cứng cáp, với khung máy làm từ thép không gỉ và hai mặt trước & sau được phủ kính cường lực Gorilla Glass. iPhone 12 cũng có khả năng chống nước và chống bụi theo tiêu chuẩn IP68 và hỗ trợ cả Apple Pay, đáp ứng nhu cầu sử dụng cần thiết của người dùng.

Camera kép 12MP + 12MP ở mặt sau, hỗ trợ quay video 4K HDR 
iPhone 12 được trang bị cụm camera hai ống kính ở mặt sau, với hai ống kính có cùng độ phân giải 12MP. Cụm camera này đều được nâng cấp so với thế hệ trước.

Camera phụ với 5 thấu kính hỗ trợ chụp ảnh góc rộng với khẩu độ f/2.4 với góc chụp rộng lên đến 120 độ. Cảm biến này được đánh giá khá giống với iPhone 11 và 11 Pro.

Camera selfie 12MP ở mặt trước
Ở phần notch mặt trước của điện thoại iPhone 12 còn có camera selfie độ phân giải 12MP. Tương tự như iPhone 11, camera selfie của iPhone có thêm tính năng gyro-EIS và cảm biến đo chiều sâu sinh trắc học SL 3D hiện đại, mang đến chất lượng hình ảnh rõ nét & hoàn mỹ.

Vi xử lý Apple A14 5nm với RAM 4GB và dung lượng 64GB
Mỗi thế hệ iPhone mới đều tương ứng với dòng CPU mới hơn nhằm mang lại hiệu năng mạnh mẽ nhất. Và iPhone 12 năm nay được trang bị bộ vi xử lý Apple A14 Bionic chạy trên tiến trình 5nm kèm chip cấu hình GPU do Apple sản xuất.

Bởi vì chip Apple A13 Bionic trước đó được đánh giá là mạnh nhất trong các thế hệ chip Apple, ta có thể mong chờ hiệu năng vượt trội đến từ Apple A14 Bionic trên iPhone.  

Ngoài ra, iPhone 12 còn có mức RAM 4GB và dung lượng lưu trữ 64 GB. Hệ điều hành chính của máy sẽ là iOS 14 cùng với một số tính năng đặc biệt như chế độ hiển thị màn hình, ứng dụng thể dục, quét mã QR và những nâng cấp phần mềm đáng kể giúp tăng trải nghiệm sử dụng.

Sử dụng cả ngày, hỗ trợ sạc nhanh 20W
Điện thoại iPhone 12 cũng được nâng cấp về dung lượng pin so với người tiền nhiệm iPhone 11. Cụ thể, máy sẽ mang đến cho người dùng hơn 17 giờ xem video, hơn và lên đến 65 giờ nghe nhạc liên tục.

Điểm mới trên iPhone 12 đó chính là sạc MagSafe. Đây là công nghệ sạc không dây mới của Apple với đế nam châm giúp cố định vào mặt lưng điện thoại. Nhờ đó quá trình sạc được ổn định và an toàn. Khi sử dụng sạc MagSafe, máy có thể sạc dưới công suất 15W.

Điện thoại iPhone 12 còn được trang bị công nghệ chống nước và bụi bẩn IP68. Công nghệ hỗ trợ chống nước ở độ sâu 6m trong vòng 30 phút. Nhờ đó, người dùng iPhone 12 có thể thoải mái sử dụng ở nhiều môi trường khác nhau, kể cả dưới trời mưa phùn hay mang đi bơi lội.

Hệ điều hành iOS 14, bảo mật Face ID an toàn

Ngoài ra, điện thoại iPhone 12 chính hãng VNA sẽ hỗ trợ 1 esim và 1 nano sim. Nhờ đó người dùng có thể sử dụng song song hai số điện thoại đầy tiện lợi.
iPhone 12 vẫn chưa có sự xuất hiện trở lại của Touch ID nhưng công nghệ nhận dạng khuôn mặt Face ID vẫn mang lại thời gian mở máy nhanh chóng cùng độ bảo mật cao.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (12, N'iPhone XR 64GB I Chính hãng VN/A', N'14990000            ', N'11990000            ', N'iPhone XR - Điện thoại sang trọng, trẻ trung với nhiều màu sắc Được ra mắt cùng Apple iPhone XS và XS Max, iPhone XR không chỉ được thừa kế những tính năng đặc trưng nổi trội của người tiền nhiệm iPhone X được ra mắt một năm trước đó và còn có những cải tiến nhằm mang lại trải nghiệm mới lạ và thú vị cho người dùng.', N'dt09.jpg                      ', N'Thiết kế sang trọng và màu sắc trẻ trung
Về ngoại hình, iP XR không quá khác biệt so với iPhone X với vẻ đẹp đến từ thiết kế viền siêu mỏng, tai thỏ mặt trước, và các cạnh được bo tròn. Máy cũng được có tiêu chuẩn chống nước chống bụi IP67 như các dòng siêu phẩm mới sau này của Apple.

Đồng thời, thiết kế của Apple iPhone XR 64GB vẫn được thừa hưởng iPhone X với hai mặt kính, điểm khác biệt là nhà sản xuất trang bị cho iPhone XR khung nhôm series 7000 (iPhone XR là khung thép không rỉ).

Màn hình kích thước 6.1 inch, hiển thị sắc nét
iPhone XR sử dụng tấm nền Liquid Retina, đồng thời tăng kích thước màn hình so với iPhone X (6.1 inch so với 5.8 inch), độ phân giải 828 x 1792 pixels cùng mật độ điểm ảnh 324 ppi. Khác với iPhone XS hay XS Max, dòng smartphone này sở hữu màn hình LCD - Apple cho biết đây là màn hình LCD tiên tiến nhất trên bất kỳ điện thoại thông minh nào.

Dung lượng 64GB giúp người dùng lưu trữ thoải mái
iPhone XR được Apple trang bị 2 tùy chọn bộ nhớ trong là 64GB và 256GB, trong khi 256GB là quá nhiều với nhu cầu sử dụng bình thường của người dùng thì 64GB là dung lượng lưu trữ khá tốt và thoải mái. Hiện nay có rất nhiều ứng dụng cung cấp dịch vụ lưu trữ lên đám mây nên bạn không cần phải lo hết dung lượng.

Hiệu năng mạnh mẽ nhờ chip Apple A12 Bionic tiên tiến
Mỗi lần ra mắt sản phẩm mới, Apple lại trình làng một con chip mới và Apple A12 Bionic mà iPhone XR sử dụng là con chip đầu tiên sản xuất trên nền tảng 7nm, gồm CPU, GPU và Neural Engine. Chip A12 Bionic được đánh giá là có nhiều cải tiến so với tiền nhiệm chip A11 khi xử lý dữ liệu mạnh mẽ hơn 15%, xử lý đồ họa nhanh hơn 40% và tiết kiệm điện năng hơn 50%.

Camera đơn 12 MP xóa phông tuyệt đỉnh và camera trước độ phân giải 7 MP
Đừng nghĩ rằng chỉ có camera kép mới có thể xóa phông đẹp, iPhone XR với camera sau 12 MP khẩu độ f/1.8 duy nhất vẫn có khả năng tạo hiệu ứng bokeh huyền ảo, làm nổi bận chân dung nhân vật chính và cho những hình ảnh vô cùng sắc nét và chi tiết. Ngoài ra, camera trước với độ phân giải 7 MP, khẩu độ f/2.2 mang công nghệ TrueDepth mới nhất cùng Animoji, Memoji thông minh sẽ cho bạn những tấm ảnh selfie với hiệu ứng ánh sáng studio có chiều sâu và những biểu tượng cảm xúc sinh động.

Dung lượng pin, hệ thống FaceID và Haptic Touch
iPhone XR 64GB được cho là chiếc iPhone có thời lượng pin “trâu bò” 2.942 mAh, lâu hơn 1 tiếng rưỡi so với thời lượng của iPhone 8 Plus. Ngoài ra, chiếc smartphone này có hỗ trợ sạc pin nhanh và sạc pin không dây Qi, do đó việc nạp năng lượng cho thiết bị không còn là vấn đề tốn nhiều thời gian nữa.

iPhone XR 64GB có viên pin 2.942 mAh

Ở iPhone XR, nút Home cảm biến vân tay TouchID bị “khai tử” và thay thế bằng công nghệ FaceID và Haptic Touch. Công nghệ bảo mật khuôn mặt FaceID ngày càng hoàn thiện giúp người dụng mở khóa nhanh chóng trong mọi điều kiện sử dụng. Tính năng Haptic Touch cũng tương tự chức năng của 3D Touch: bạn sẽ nhấn giữ vào các nút nhất định để mở ra các menu, phím tắt giống như 3D Touch và máy cũng sẽ rung lên cho bạn biết.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (13, N'iPhone 12 Pro I Chính hãng VN/A', N'30990000            ', N'27000000            ', N'Điện thoại iPhone 12 Pro - Đột phá về thiết kế, hiệu năng nâng cấp Ra mắt vào cuối năm 2020, iPhone 12 series mang đến một luồng gió với trong phân khúc smartphone cao cấp. Với thiết kế đổi mới đột phá so với thế hệ trước cùng nhiều nâng cấp về hiệu năng đáng kể trên iPhone 12 Pro. Đây sẽ là một trong những chiếc điện thoại đáng được bạn lựa chọn nhất so với các chiếc điện thoại khác cùng phân khúc giá.  ', N'dt10.jpg                      ', N'Thiết kế đột phá kiểu mới khung thép không gỉ, màn hình Super Retina 6.1 inch 
Sau một thời dài ra mắt các sản phẩm mới có chút ít thay đổi về thiết kế bên ngoài. Năm 2020, iPhone 12 Pro mang đến một phong cách thiết kế đột phá hơn với phần viền được CNC vuông bo tròn như hơi hướng của người anh iPhone 5.

Màn hình trên điện thoại iPhone 12 Pro vẫn giữ nguyên thiết kế tai thỏ nhưng phần viền được Apple thiết kế mỏng hơn mang đến một cái nhìn hoàn toàn mới về màn hình trên điện thoại.

Với kích thước màn hình lớn lên đến 6.1 inch sử dụng tấm nền Super Retina XDR OLED với độ phân giải 2K mọi hình ảnh đều được tái hiện sắc nét đến từng chi tiết trên một không gian rộng đủ để bạn thoải mái sử dụng.  

Cấu hình hiệu năng mạnh mẽ với chip Apple A14 Bionic, bộ nhớ ram 6Gb, bộ nhớ trong dung lượng lớn

Năm nay bộ nhớ trong tối thiểu trên điện thoại iPhone 12 Pro đã được nâng cấp lên 128Gb. Tăng khả năng lưu trữ gấp đôi so với phiên bản basic nhất như các dòng iPhone Pro thế hệ trước.

Apple cũng hỗ trợ nhiều mức dung lượng nữa bao gồm 256Gb và 512Gb đến cho người dùng. Với những mức dung lượng này người dùng có thể thoải mái lưu trữ dữ liệu, cài đặt ứng dụng, game nặng mà không bị đầy bộ nhớ khi sử dụng.

Bộ ba camera sau + cảm biến LiDAR, camera trước siêu sắc nét
Tương tự như điện thoại iPhone 12 Pro Max, phiên bản Pro cũng được Apple đã trang bị bộ ba camera chất lượng cao cùng độ phân giải 12MP bao gồm camera chính góc rộng, camera góc siêu rộng và ống kính tele. Máy cũng được trang bị ống kính cảm biến LiDAR cho khả năng chụp ảnh sắc nét và chất thật nhất. Khả năng chụp góc rộng và Zoom trên siêu phẩm cũng được nâng cấp đáng kể cho chất lượng và khả năng chụp ảnh tốt hơn.

Pin lithium – ion dung lượng cao, hỗ trợ sạc nhanh 20W
Là chiếc điện thoại có hiệu năng mạnh mẽ cùng màn hình kích thước lớn. Vì vậy Apple đã trang bị cho iPhone 12 Pro một khoảng dung lượng pin lớn. Với khoảng dung lượng này người dùng có thể thoải mái sử dụng cả một ngày dài mà không lo hết pin. Máy cũng được trang bị công nghệ sạc nhanh với công suất lớn cho thời gian sạc đầy pin nhanh chóng.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (14, N'Laptop Lenovo Yoga 6 13ARE05 82FN0052VN', N'19990000            ', N'18990000            ', N'Laptop Lenovo Yoga 6 13ARE05 82FN0052VN - Hiệu năng vượt trội với chip Ryzen 5 PRO 4650U Nếu bạn đang tìm kiếm một chiếc laptop làm việc đa chức năng với hiệu suất vượt trội, sản phẩm laptop Lenovo Yoga 6 13ARE05 82FN0052VN với bộ vi xử lý Ryzen 5 PRO 4650U sẽ đáp ứng trọn vẹn tất cả nhu cầu làm việc của bạn.', N'mt01.jpg                      ', N'Màn hình cảm ứng xoay đa năng, tương thích với bút cảm ứng
Laptop Lenovo Yoga 6 13ARE05 82FN0052VN được trang bị màn hình 13.3 inch Full HD (1920 x 1080 pixels) với khả năng xoay nghiêng độc đáo đáp ứng nhu cầu công việc đa năng.

Đặc biệt, màn hình của máy thuộc dạng cảm ứng đa điểm, và tương thích với cả bút cảm ứng đi kèm giúp làm việc hiệu quả hơn, nhất là những công việc về thiết kế.

Màn hình cảm ứng xoay đa năng, tương thích với bút cảm ứng

Thiết kế tổng thể của Lenovo Yoga 6 13ARE05 82FN0052VN mang màu xanh tinh tế, kiểu dáng gọn gàng, trọng lượng nhẹ chỉ 1.32kg phù hợp để bạn thoải mái mang theo bên mình và làm việc từ xa.

Chiếc máy được làm từ chất liệu nhôm nguyên khối bền bỉ, góp phần gia tăng độ cứng cáp cho chiếc máy. Các phương thức kết nối như USB Type-C, USB Type-A, jack tai nghe 3.5mm cũng hiện diện trên Lenovo Yoga 6 13ARE05 82FN0052VN.

Bộ vi xử lý Ryzen 5 PRO 4650U với RAM 8 GB cùng ổ cứng SSD 512 GB đáp ứng công việc hiệu quả
Laptop Lenovo Yoga 6 13ARE05 82FN0052VN được trang bị bên trong bộ vi xử lý Ryzen 5 Pro 4650U. Đây là con chip 6 lõi 12 luồng, với tần số dao động 2.1 GHz ~ 4.0 GHz cùng chip đồ họa onboard AMD Radeon Graphics giúp xử lý tác vụ đa nhiệm hiệu quả, cũng như render hình ảnh chất lượng rõ nét.

Bộ vi xử lý Ryzen 5 PRO 4650U với RAM 8 GB cùng ổ cứng SSD 512 GB đáp ứng công việc hiệu quả

Bên trong Lenovo Yoga 6 13ARE05 82FN0052VN còn được trang bị thêm hệ điều hành Windows 10, dung lượng RAM 8 GB và ổ cứng SSD dung lượng 512 GB PCIe cho tốc độ khởi động hệ thống nhanh, cũng như kho lưu trữ rộng rãi. Chiếc máy còn được trang bị viên pin 60Wh cho thời lượng làm việc đa nhiệm liên tục suốt 4 - 5 giờ.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (15, N'Laptop ASUS Gaming ROG Zephyrus GA401II', N'32990000            ', N'29950000            ', N'Laptop ASUS Gaming ROG Zephyrus GA401II - Cấu hình mạnh mẽ trong thiết kế gọn gàng Không chỉ dừng lại ở các thế hệ laptop gaming đa dạng ở tầm trung, Asus còn cho ra mắt một thế hệ laptop cực kỳ mạnh mẽ đại diện cho phân khúc cao cấp. Laptop ASUS Gaming ROG Zephyrus GA401II là một trong những cái tên đáng được bạn cân nhắc trong quá trình sử dụng.', N'mt02.jpg                      ', N'Thiết kế đậm chất gaming, màn hình 14 inch Full HD 120Hz
Có thể nói mọi dòng laptop gaming của Asus đều được tái hiện vẻ ngoài cực kỳ mạnh mẽ tương đồng với cấu hình của máy bên trong.

Laptop ASUS Gaming ROG Zephyrus GA401II cũng mang đến một thiết kế ngoại hình cực kỳ bắt mắt nhưng cũng không kém phần nổi bật và sang trọng với bộ khung nguyên khối cùng phần viền được CNC bắt mắt.

Trọng lượng của chiếc điện thoại này cũng nằm ở mức khá nhẹ chỉ 1.73Kg cực kỳ gọn nhẹ và không quá nặng so với các chiếc laptop gaming khác.

Thiết kế đậm chất gaming, màn hình 14 inch Full HD 120Hz

Màn hình trên ASUS Gaming ROG Zephyrus thế hệ lần này được trang bị kích thước chuẩn đạt 14 inch đủ để người dùng có thể sử dụng mọi tác vụ một cách đầy đủ cũng như đa nhiệm tốt trong quá trình sử dụng.

Độ phân giải của màn hình cũng nằm ở mức cao lên đến Full HD cho khả năng hiển thị sắc nét dưới tấm nền IPS. Tần số quét của màn hình cũng nằm ở mức cao đạt 120Hz cho khả năng làm mới hình ảnh ở khung hình cao khá tốt khi chơi game hay xem phim.

Với màn hình này chiếc laptop ASUS Gaming ROG Zephyrus có thể sử dụng mọi tác vụ từ chơi game hay làm việc đồ họa cao cực kỳ dễ dàng.

AMD Ryzen 7 4800HS, RAM 16GB, 512GB SSD PCIe, GeForce GTX 1650 Ti
Đa số mọi người đều biết AMD là một trong những hãng chip cung cấp cho người dùng tốc độ xử lý cực kỳ mạnh mẽ với số nhân và luồng cao.

Đặc biệt Asus đã trang cho chiếc laptop này con chip AMD Ryzen 7 4800HS mang đến một hiệu năng cực kỳ mạnh mẽ với tốc độ lên đến 4.9GHz mang xử lý nhanh mọi tác vụ sử dụng.


Đặc biệt với bo mạch tốt nhất hàng đầu thế giới Asus đã tích hợp luôn bộ nhớ ram DDR4 với dung lượng lên đến 8GB bus 3200mhz và một thanh ram tương tự với khe cắm ngoài tổng cộng lên đến 16GB.

Với 16GB RAM bạn sẽ có thể thoải mái sử dụng thiết bị của mình cho hầu hết mọi quá trình từ chơi game hay sử dụng đồ họa cao một cách tốt nhất.

Bộ nhớ của chiếc laptop ASUS Gaming ROG Zephyrus có dung lượng lên đến 512GB SSD PCIe với chuẩn M2 tốc độ siêu cao. Đạt gần 2500Mb/s cho cả đọc và ghi khi truy xuất dữ liệu từ chiếc ổ cứng của bạn.

Asus cũng trang bị cho chiếc laptop Asus gaming của mình chiếc card đồ họa GeForce GTX 1650 Ti cho dung lượng nằm ở mức 4GB. Xuất mọi hình ảnh ở độ phân giải cao với tần số quét cực kỳ đẹp lên màn hình.

Pin 4Cell, 76WHr sạc nhanh, trang bị Wifi 6, bluetooth 5.0
Laptop ASUS Gaming ROG Zephyrus GA401II được trang bị viên pin 4 Cell 76WHr mang đến một khả năng sử dụng cực kỳ dài lên đến hơn 10 giờ liên tục kéo dài thời gian trải nghiệm laptop xuyên suốt.

Máy cũng được trang bị khả năng sạc nhanh cho khả năng sạc đầy thiết bị chỉ trong vòng 90 phút đưa chiếc laptop hoạt động trở lại ngay.

Pin 4Cell, 76WHr sạc nhanh, trang bị Wifi 6, bluetooth 5.0

Ngoài ra chuẩn kết nối internet của chiếc laptop này cũng được sử dụng loại mới nhất Wifi 6 cho khả năng sử dụng dual băng tần cực kỳ mạnh mẽ với tốc độ lên đến 10GBps tăng nhanh tốc độ mạng đáng kể.

Bluetooth cũng được trang bị chuẩn vẻ phiên bản 5.0 cho khả năng tương thích với hầu hết mọi thiết bị ngoại vi kết nối với laptop trên thị trường.

Nhiều cổng kết nối, bàn phím đa điểm siêu nhạy, Win 10 home
Hầu hết mọi chuẩn kết nối mới nổi bật nhất về công nghệ truyền tải đều được trang bị trên chiếc laptop gaming này gồm 1 cổng USB Type-C with DisplayPort 1.4, 1 cổng USB 3.2 Gen 2 Type-C và 2 cổng USB 3.2 Gen 1 Type-A, 1 cổng HDMI giúp bạn kết nối nhiều cổng hơn với tốc độ cao.

Nhiều cổng kết nối, bàn phím đa điểm siêu nhạy, Win 10 home

Bàn phím trên chiếc laptop này cũng có kích thước tiêu chuẩn với các phím bấm to vừa vặn có độ nhạy phản hồi cao. Người dùng có thể sử dụng bàn phím với tốc độ nhanh rất chính xác với đèn LED RGB siêu đẹp.

Asus cũng đã liên kết với Microsoft và trang bị sẵn trên chiếc laptop này hệ điều hành Win 10 home hoàn toàn miễn phí. Giúp bạn không phải tốn thêm tiền mua key bản quyền khi mua chiếc laptop cao cấp của Asus.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (16, N'Laptop ASUS ZenBook UX325EA', N'21990000            ', N'29950000            ', N'Laptop ASUS Gaming ROG Zephyrus GA401II - Cấu hình mạnh mẽ trong thiết kế gọn gàng Không chỉ dừng lại ở các thế hệ laptop gaming đa dạng ở tầm trung, Asus còn cho ra mắt một thế hệ laptop cực kỳ mạnh mẽ đại diện cho phân khúc cao cấp. Laptop ASUS Gaming ROG Zephyrus GA401II là một trong những cái tên đáng được bạn cân nhắc trong quá trình sử dụng.', N'mt03.jpg                      ', N'Trọng lượng chỉ 1.11kg, hoàn thiện từ nhôm nguyên khối
Vẫn là lối thiết kế đậm chất Asus khi tối ưu về trọng lượng và cả độ mỏng, cụ thể máy có kích thước chỉ 13.97 x 203.2 x 304.29 mm và trọng lượng chỉ 1.11kg. Do đó, người dùng dễ dàng mang máy đi đến khắp mọi nơi trên thế giới, thậm chí là bằng một tay từ phòng này sang phòng khác.

Ngoài ra, laptop ASUS ZenBook UX325EA được hoàn thiện chủ yếu đến từ chất liệu nhôm nguyên khối. Chất liệu này góp phần mang đến vẻ ngoài sang trọng, và hơn hết nó cho khả năng chống chịu tốt từ những va đập lực bên ngoài.

Bàn phím gõ êm, độ nảy tốt, touchpad tích hợp numpad ảo
Với những chiếc máy Asus hiện nay, khi bật nắp laptop thì bản lề sẽ tự động nâng lên để tạo cảm giác tốt hơn trong việc sử dụng bàn phím. Và với ASUS ZenBook 13 UX325EA thì bàn phím được nâng cao 3 độ. Cảm giác gõ phím mang lại êm ái, ít gây ra tiếng động, phù hợp khi bạn làm việc đêm khuya, không làm ảnh hưởng đến người khác.

Bàn phím gõ êm, độ nảy tốt, touchpad tích hợp numpad ảo

Về touchpad, được thiết kế rộng rãi dễ thao tác và di chuyển chuột. Đặc biệt phần touchpad này còn được tích hợp thêm phần numpad ảo hữu ích cho những người thích một chiếc laptop nhỏ gọn nhưng đầy đủ phím chức năng.

Màn hình 13.3 inches, độ phân giải FullHD, tấm nền IPS
ASUS ZenBook UX325EA mang đến cho người dùng trải nghiệm không gian chân thực nhất với khả năng tối ưu viền màn hình đạt đến 88% so với thân máy. Màn hình của Asus có kích thước 13.3 inches độ phân giải FullHD cùng tấm nền IPS cung cấp hình ảnh chi tiết, màu sắc trung thực cùng góc nhìn tốt.

Chưa dừng lại ở đó, về thông số màu, Asus ZenBook UX325EA đạt được 76,1% trên gam màu DCI-P3, thấp hơn 83,4% so với những chiếc laptop cao cấp nhưng trên mức so với những chiếc máy cùng phân khúc.

Hiệu năng Intel Core i5-1135G7, 8 GB RAM, 256 GB bộ nhớ trong
Laptop ASUS ZenBook UX325EA được trang bị bộ xử lý Intel Core i5-1135G7 và 8GB RAM. Đi kèm với đó là card đồ họa Intel Iris Xe mới nhất, nó hứa hẹn mang lại khả năng chơi nhiều tựa game 3D nặng mức setting cao. Ngoài ra, người dùng còn được cung cấp bởi ổ cứng 256GB SSD M.2 PCIE G3X2 cho khả năng xử lý dữ liệu nhanh chóng và mượt mà.

Thời lượng sử dụng đến 13 giờ, đầy đủ cổng kết nối
Mặc dù chiếc laptop ZenBook UX325EA có kích thước nhỏ gọn nhưng nó lại được cung cấp bởi viên pin dung lượng pin lên tới 67Wh. Trong bài thử nghiệm của LaptopMag, laptop đạt được 13 giờ 47 phút với các tác vụ lướt web liên tục với tùy chỉnh độ sáng 150 nits.

Được trang bị đầy đủ những cổng I / O, bao gồm cổng HDMI và cổng USB Type-A. ', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (17, N'Laptop Acer Nitro 5 AN515-55-5923', N'23990000            ', N'19590000            ', N'Acer Nitro 5 2020 - Laptop gaming bền bỉ, hiệu năng vượt trội Ngày nay, khi người dùng lựa chọn cho mình một chiếc laptop để sử dụng luôn quan tâm đến nhu cầu sử dụng vừa để làm việc vừa để giải trí chơi game. Vì vậy lựa chọn cho mình một chiếc laptop gaming là một giải pháp phù hợp cho mọi nhu cầu sử dụng của bạn. Acer Nitro 5 là chiếc laptop đến từ thương hiệu Acer sẽ mang đến một cách nhìn hoàn toàn mới về các nhu cầu sử dụng trên dòng laptop gaming có thể mang lại cho người dùng.', N'mt04.jpg                      ', N'Màn hình kích thước 15.6 inch Full HD, tần số quét 144Hz thời gian phản hồi 3ms
Acer đã trang bị cho laptop gaming Nitro 5 AN515-55 một màn hình có kích thước lớn lên đến 15.6 inch rất mỏng. Với kích thước màn hình lớn này người dùng có thể sử dụng đa nhiệm cùng lúc nhiều ứng dụng mà không bị giới hạn không gian hiển thị. Hơn thế chất lượng hiển thị của màn hình của chiếc laptop này cũng đạt độ phân giải cao Full HD cho mọi hình ảnh hiển thị sắc nét và trung thực đến từng chi tiết.

Trang bị chip Intel Core i5-10300H, RAM 8Gb, phù hợp với nhiều nhu cầu sử dụng
Acer Nitro 5 được Acer trang bị chip Intel Core i5-10300H với tốc độ xử lý cực nhanh với xung nhịp lên đến 4.5GHz. Với chip xử lý này chiếc laptop dễ dàng load nhanh chóng các tựa game và các ứng dụng nặng một cách nhanh chóng. Hơn thế, máy còn sở hữu bộ nhớ ram lên đến 8GB cho khả năng đa nhiệm cực tốt khi sử dụng nhiều ứng dụng cùng lúc. Bạn có thể dễ dàng nâng cấp bộ nhớ RAM của laptop lên đến tối đa 32GB khi có nhu cầu sử dụng cao hơn.

Trang bị SSD NVMe M.2 PCIe 512GB, NVIDIA GeForce GTX 1650Ti 4GB GDDR6
Nitro 5 2020 được hãng trang bị hỗ trợ chuẩn cổng kết nối có băng thông lớn là NVMe M.2 PCIe cho tốc độ đọc ghi ổn định ở mức 3500MB/s. Giúp khả năng truyền tải dữ liệu cực kỳ nhanh chóng khi đọc và ghi các file game hay truy xuất dữ liệu. Laptop sở hữu ổ cứng SSD NVMe M.2 PCIe có dung lượng lên đến 512GB phù hợp với nhiều nhu cầu sử dụng cần đến lưu lượng lớn để lưu trữ dữ liệu.

Trang bị SSD NVMe M.2 PCIe 512GB, NVIDIA GeForce GTX 1650Ti 4GB GDDR6

Hơn hế, laptop Acer Nitro 5 còn được hãng trang bị card đồ họa NVIDIA GeForce GTX 1650Ti 4GB GDDR6. Giúp xử lý hình ảnh ở độ phân giải cao người dùng có thể cài đặt max setting cấu hình độ phân giải trong game hay render các video có độ phân giải cao. Hơn thế, dòng card đồ hoạ 1650Ti này còn chuyên hỗ trợ tối đa cho mọi tựa game bom tấn hiện nay ở mức thiết lập từ thấp đến cao.

Nhiều chuẩn kết nối hiện đại, Webcam HD và Win 10 bản quyền
Được trang bị chuẩn Wifi 6 802.11AX mới nhất hiện nay cho tốc độ kết nối với băng thông cao. Và kèm chip Killer™ Ethernet E2600 giúp ổn định đường truyền internet ưu tiên băng thông trong suốt quá trình truyền tải chơi game. Hơn thế, laptop còn sở hữu nhiều các chuẩn kết nối khác như: Bluetooth 5.0, cổng mạng LAN, 3 cổng USB 3.2 Gen 1 và 1 jack âm thanh 3.5 mm. Cùng với cổng HDMI truyền tải hình ảnh độ phân giải cao và 1 cổng USB Type C tốc độ cao. Phù hợp với hầu hết các thiết bị ngoại vi như chuột, bàn phím, máy chiếu,...

Nhiều chuẩn kết nối hiện đại, Webcam HD và Win 10 bản quyền

Pin dung lượng cao 4 Cell 57 WHr, hệ thống tản nhiệt lớn với công nghệ Acer CoolBoost
Với hiệu năng cao như trên chiếc laptop Acer Nitro 5 chắc chắn sẽ cần tiêu thụ một lượng pin rất lớn để duy trì hoạt động. Nhưng Acer đã trang bị cho chiếc laptop này viên pin có dung lượng cao 4 Cell công suất lên đến 57WHr. Giúp laptop có thể hoạt động liên tục trên 6 tiếng một cách xuyên suốt và không bị ngắt quãng. Laptop gaming này cũng được trang bị khả năng sạc pin tốc độ cao giúp thiết bị đầy pin nhanh chóng trở lại.

Hệ thống tản nhiệt được xem là bộ phận rất quan trọng cho dòng laptop gaming để giải tỏa nhiệt lượng mà máy tỏa ra. Hệ thống tản nhiệt của máy gồm 2 quạt tản lớn thế hệ mới kết hợp công nghệ mới Acer CoolBoost cho khả năng tăng 10% tốc độ quay của quạt, giảm nhiệt độ của các linh kiện quan trọng như CPU/GPU xuống đến 9%. Hơn thế, laptop cũng được tích hợp phần mềm Nitro Sense tự động theo dõi nhiệt độ và điều chỉnh tốc độ quạt sao cho phù hợp và tản nhiệt tốt nhất.

Bàn phím trang bị đèn LED RGB, âm thanh tái tạo 3D kèm Acer True Harmony 6 chế độ
Một trong những sự cải tiến lớn nhất và tạo nên sự nổi bật nhất trên laptop Acer Nitro 5 đó chính là về bàn phím. Bàn phím trên máy được trang bị hệ thống dải đèn led RGB 4 vùng bạn có thể tùy chỉnh hiệu ứng chuyển đổi màu sắc yêu thích thông qua phần mềm Nitro Senser một cách dễ dàng.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (18, N'Samsung Galaxy Tab S7 Plus', N'23990000            ', N'16600000            ', N'Samsung Galaxy Tab S7 Plus : Màn hình rộng sắc nét, pin khủng 10.090mAh Máy tính bảng giờ đây đã trở thành một sản phẩm công nghệ quen thuộc và quan trọng đối với rất nhiều người. Ngày qua ngày, người dùng đều mong muốn nhu cầu sử dụng của họ sẽ tốt hơn và đòi hỏi cao hơn về một chiếc tablet Samsung. Thấu hiểu điều đó, tập đoàn Samsung đã cho ra mắt máy tính bảng Samsung Galaxy Tab S7 và Tab S7 Plus. Đây được xem là chiếc tablet được trang bị những tính năng hiện đại bậc nhất cùng thời lượng pin cực khủng, giúp giải quyết nỗi lo hụt pin cho cả ngày sử dụng.', N'mtb01.jpg                     ', N'Thiết kế cứng cáp và sang trọng cùng màn hình sAMOLED 12.4 inch
Chiếc Samsung Tab S7 Plus là sản phẩm rất được Samsung ưu ái, sở hữu thiết kế cứng cáp với chất liệu kim loại sáng bóng và các góc được bo cong một cách hoàn hảo. Mang đến cho sản phẩm không chỉ là sự cứng cáp, mà được hòa hợp tuyệt vời cùng những đường nét mềm mại.

Màn hình Amoled 12.4 inch và độ phân giải lên đến 2K+, không chỉ mang đến cho bạn một màn hình lớn dễ dàng quan sát và thao tác mà còn có chất lượng hiển thị rất rõ ràng, mọi chi tiết đều sắc nét, sống động, cho bạn những phút giây thưởng thức hình ảnh tốt nhất.

Trang bị cảm biến vân tay và bút S-Pen hiện đại và camera sau kép
Galaxy Tab S7 Plus được trang bị bảo mật cảm biến vân tay dưới màn hình, giúp bạn dễ dàng và nhanh chóng đăng nhập hơn, đồng thời cho khả năng bảo mật tốt hơn, người khác sẽ khó có thể mở được máy tính bảng của bạn nếu không dùng vân tay của bạn.

Không chỉ thế, máy tính bảng Samsung Galaxy Tab S7 Plus không thể thiếu S-Pen hiện đại giúp mọi thao tác luôn có độ nhạy tốt, bạn có thể mở tablet và ghi chú nhanh với bút S-Pen thay vì phải gõ sẽ chậm hơn rất nhiều. Ngoài ra, Tab S7+ còn có bộ đôi camera sau với độ phân giải 13MP và 5MP và camera trước 8MP nên hoàn toàn đủ khả ăng đáp ứng nhu cầu chụp ảnh có chất lượng tốt.

Trang bị chip Snapdragon 865+ mạnh mẽ và RAM 6GB, 128GB bộ nhớ trong
Samsung Tab S7 Plus được trang bị chip Snapdragon 865+ mới nhất hiện nay, vừa được Qualcomm cho ra mắt vào 9/7. Với bộ vi xử lí này, chắc hẳn Tab S7 Plus sẽ mang đến khả năng xử lí cực kì mạnh mẽ và nhanh chóng ngay cả khi xử lí đa nhiệm.

Ngoài ra, chiếc máy tính bảng này còn sở hữu RAM 6GB và bộ nhớ trong 128GB cho phép hỗ trợ vi xử lí hoạt động hiệu quả và năng suất hơn, đồng thời bộ nhớ trong 128GB sẽ mở ra khả năng lưu trữ cực lớn cho người dùng, hình ảnh, video hay các ghi chú, ứng dụng lớn đều không thành vấn đề.

Dung lượng pin lên đến 10.000 mAh cùng công nghệ sạc nhanh 45W

Ngoài ra, sở hữu công nghệ sạc nhanh 45W giúp Samsung Tab S7 Plus có thể sạc đầy chỉ với thời gian ngắn, tiết kiệm thời gian để bạn có thể nhanh chóng tiếp tục sử dụng và giải quyết công việc.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (19, N'iPad 10.2 2020 WiFi 32GB', N'9990000             ', N'8500000             ', N'iPad Gen 8 10.2 inch 2020 - Hiệu năng mạnh mẽ nhờ chip Apple A12 Bionic iPad đang là một trong những thương hiệu tablet hàng đầu trên thị trường, nhờ uy tín và cam kết chất lượng sản phẩm mà tập đoàn Apple mang lại cho khách hàng của mình trên toàn cầu. Nếu bạn mong muốn có được một chiếc iPad cho bạn trải nghiệm sử dụng thú vị, với vi xử lí mạnh mẽ và sự hỗ trợ đắc lực từ Apple Pencil, cùng mức giá chưa đến 10 triệu đồng thì iPad Gen 8 vừa được ra mắt trong năm nay chính là một gợi ý ấn tượng với bạn và phù hợp cho bạn.', N'mtb02.jpg                     ', N'Thiết kế nhôm nguyên khối quen thuộc và màn hình Retina 10.2 inch
Apple iPad 10.2 thế hệ 2020 vẫn sở hữu thiết kế quen thuộc, không có nhiều khác biệt với những chiếc iPad thế hệ trước. Được làm từ chất liệu nhôm nguyên khối và thiết kế gọn nhẹ, các góc cạnh bo cong mang đến vẻ đẹp tinh tế cho iPad.

Ngoài ra, iPad Gen 8 2020 vẫn được trang bị nút Home với cảm biến vân tay Touch ID giúp bạn dễ dàng sử dụng, cùng với khả năng bảo mật tốt cho iPad của mình.

Máy được trang bị màn hình Retina HD lên đến 10.2 inch cùng tấm nền IPS LCD, sự trang bị này giúp người dùng có được khoảng thời gian sử dụng thoải mái với iPad nhờ hình ảnh luôn rõ nét.

Hỗ trợ bàn phím và Apple Pencil giúp làm việc tiện lợi hơn
Không giống với thế hệ iPad trước chiếc iPad 10.2 inch 2020 này được hỗ trợ bàn phím, sẵn sàng trở thành một chiếc laptop mini bất cứ lúc nào để bạn giải quyết công việc nhanh chóng và tiện lợi.

Ngoài ra, iPad Gen 8 còn có Apple Pencil với công nghệ hiện đại, bạn có thể ghi chú nhanh chóng, phác thảo bản vẽ nhanh chóng với độ mượt cực tốt, cho cảm giác như thao tác trên giấy thật.

Trang bị chip Apple A12 Bionic mang đến cấu hình mạnh mẽ
Điểm tạo nên sức mạnh cho iPad 10.2 inch 2020 chính là chip độc quyền của Apple - A12 Bionic. Nhờ có bộ vi xử lí này mà thiết bị hoàn toàn đủ khả năng cân các loại game hay ứng dụng nặng.

Trang bị chip Apple A12 Bionic mang đến cấu hình mạnh mẽ

Một trong những thứ hỗ trợ đắc lực cho chip A12 Bionic chính là dung lượng ROM của iPad 8 lên đến 32GB, nhờ đó iPad có thể xử lí đa nhiệm mượt mà, tình trạng iPad bị chậm khi dung các ứng dụng nặng cũng sẽ không có.

Camera sau 8MP cho hình ảnh sắc nét và dung lượng pin sử dụng lên đến 10 giờ
Đối với một chiếc tablet, thường thì camera không phải là phần được chú trọng quá nhiều, nhưng với Apple iPad 10.2 inch 2020 Wifi thì camera đảm bảo khả năng chụp ảnh và quay video cũng như videocall với hình ảnh sắc nét và sống động.

Ngoài ra, iPad Gen 8 Wifi có dung lượng pin cao, đáp ứng thời gian sử dụng lên đến 10 giờ liên tục. Nếu bạn không sử dụng iPad thường xuyên mà chỉ dung khoảng 3 giờ một ngày thì bạn có thể dùng iPad gần 3 ngày.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (20, N'iPad Air 10.9 2020 WiFi 64GB', N'16990000            ', N'14900000            ', N' iPad Air 4 2020 – Chip A14 mạnh mẽ cho trải nghiệm hoàn hảo Apple luôn khiến cho cộng đồng công nghệ đứng ngồi không yên mỗi khi cho giới thiệu sản phẩm mới. iPad Air 4 được ra mắt tại sự kiện mà các tín đồ công nghệ nghĩ rằng Apple sẽ trình làng dòng điện thoại iPhone 12 2020, nhưng chiếc tablet này mới chính là nhân vật chính. iPad Air thế hệ 2020 mang những thay đổi về mặt thiết kế cũng như những tính năng mới được tích hợp để tối ưu hóa về hiệu năng, mang đến cho người dùng những trải nghiệm tốt hơn. ', N'mtb03.jpg                     ', N'Thiết kế tinh tế, màu sắc thời thượng với độ mỏng 6.1mm
Máy tính bảng iPad Air 2020 sẽ có thiết kế hoàn toàn mới với kiểu dáng tương tự với iPad Pro 2020 nhưng với kích thước nhỏ gọn hơn 247.6 x 178.5 mm và độ mỏng chỉ 6.1 mm cùng trọng lượng chưa đến 500g giúp bạn dễ dàng mang theo iPad để sử dụng ở bất cứ đâu.

Màn hình có tần số quét 60Hz, tấm nền IPS LCD và kích thước 10.9 inch
Để mang đến không gian hiển thị tuyệt vời cho người dùng, Apple đã trang bị màn hình có tần số quét đến 60Hz cho iPad Air 4, giúp hình ảnh hiển thị mượt mà, các chuyển động hình ảnh trơn tru cũng như hạn chế tình trạng giật lag. Nhờ vậy bạn có thể tận hưởng những thước phim ấn tượng, chơi game (đặc biệt là những game có góc nhìn thứ nhất) một cách tuyệt vời nhất. Độ phân giải 2360 x 1640 pixels cho hình ảnh sắc nét và chân thực.

Chip A14 kết hợp RAM 6GB cho sức mạnh ấn tượng và bộ nhớ 128GB lưu trữ rộng rãi
Sức mạnh của máy đến từ con chip A14 Bionic để mang đến tốc độ xử lý vượt trội hơn, nhanh chóng hơn cùng với RAM 6GB cho sức mạnh không thua gì một chiếc PC. Bên cạnh đó còn có thông tin iPad Air 2020 sẽ có bàn phím Magic Keyboard riêng để có thể giúp bạn biến chiếc máy tính bảng của mình thành một chiếc laptop một cách nhanh chóng và đơn giản.

Hệ thống camera với cảm biến LiDAR hỗ trợ quay phim chất lượng 4K siêu nét
Một trong những sự cải tiến mới của iPad Air 4 chính là hệ thống camera với camera chính góc rộng 12MP cùng với cảm biến chiều sâu TOF 3D LiDAR hỗ trợ quay phim với chất lượng 4K cho hình ảnh cực kỳ sắc nét và sinh động. Bên cạnh đó, iPad cũng được hỗ trợ những tính năng chụp ảnh thông minh như xóa phông, lấy nét tự động,…cho ảnh chụp không thua kém bất kỳ thiết bị nào.

Camera trước có cảm biến 7MP và hỗ trợ quay phim 1080p, hỗ trợ video call chất lượng cao mang đến những trải nghiệm tuyệt vời cho người dùng. Bạn có thể sử dụng iPad để quay lại vlog hằng ngày thay cho một chiếc máy quay, máy ảnh và chia sẻ ngay với bạn bè, người thân,…vô cùng tiện lợi.

Dung lượng pin lớn cho 10 giờ lướt web
Apple cũng đã nâng cấp dung lượng pin cho iPad Air 4 với dung lượng lớn, cho 10 giờ lướt web bằng wifi, 9 giờ sử dụng mạng di động. Mặc dù dung lượng trước đây của những thế hệ iPad trước cũng đã đáp ứng rất tốt về thời lượng sử dụng chính vì thế sự nâng cấp này chắc chắn sẽ giúp người dùng càng yên tâm hơn khi sử dụng thiết bị suốt cả ngày dài mà không lo hết pin.

Tính năng FaceID bảo mật cao, hỗ trợ đầy đủ các kết nối không dây và hỗ trợ kết nối 3G/4G

Máy cũng hỗ trợ đầy đủ các kết nối như kết nối WiFi giúp bạn truy cập vào mạng Internet nhanh chóng. Ngoài ra còn có phiên bản iPad hỗ trợ 3G/4G (có khe lắp thẻ SIM) để bạn có thể luôn trực tuyến dù ở bất cứ đâu, không bỏ lỡ bất cứ thông báo, tin nhắn nào.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (21, N'Samsung Galaxy Tab S7', N'18990000            ', N'14800000            ', N'Samsung Tab S7 – Chiếc tablet cao cấp hỗ trợ S Pen, cấu hình mạnh mẽ Hiếm thấy một hãng sản xuất nào vẫn cho duy trì cho ra đời những chiếc tablet mà vẫn chạy trên hệ điều hành Android như nhà sản xuất Samsung. Cũng khoảng gần một năm từ khi chiếc Galaxy Tab S6 được trình làng, và mới đây nhất là chiếc Galaxy Tab S6 Lite, nghe qua là đã biết phiên bản rút gọn của người đàn anh. Song thật bất ngờ, chúng ta lại tiếp tục được chứng kiến sự ra mắt của máy tính bảng Samsung Galaxy Tab S7.', N'mtb04.jpg                     ', N'Màn hình 11 inch, tấm nền TFT, hoàn thiện từ nhôm cứng cáp
Galaxy Tab S7 sở hữu màn hình 11 inch cùng với tấm nền TFT và độ phân giải lên đến 2560 x 1600 pixel. Tất cả đem đến cho chiếc Tab S7 cho khả năng hiển thị tốt, từ đó mà người dùng có thể sử dụng nó trong nhiều trường hợp khác như công việc, giải trí (xem phim, nghe nhạc, chơi game,…) đến làm việc đồ họa.

Màn hình 11 inch, tấm nền OLED

Bên cạnh màn hình sắc nét, Samsung cũng không quên tối ưu về thiết kế cho sản phẩm của mình. Chiếc máy không to hơn sản phẩm kế nhiệm là bao nhiêu với thiết kế gần như không viền. Hoàn thiện chủ yếu từ nhôm giúp cho chiếc máy trở nên cứng cáp hơn bao giờ hết.

Hiệu năng xử lý mượt mà với Snapdragon 865, 8GB RAM, 256GB bộ nhớ trong

Cùng với đó, Samsung Tab S7 được cài sẵn hệ điều hành Android 10 cùng 6 GB RAM, 128GB bộ nhớ trong, gấp đôi so với người tiền nhiệm giúp các ứng dụng hoạt động mượt mà hơn, đa nhiệm khỏi phải bàn cãi và khả năng lưu trữ tốt đáp ứng cho mọi công việc.

Camera trước 8MP cùng hệ thống camera kép phía sau cho chất lượng ảnh sắc nét
Điểm nổi bật của chiếc tablet này đến từ camera kép, trong bối cảnh những chiếc tablet còn lại trên thị trường chỉ sử dụng camera đơn. Cụm camera kép 13MP và 5MP ở phía sau với ống kính góc rộng và siêu rộng, cho góc chụp lên tới 123 độ. Từ đó, đáp ứng tốt nhu cầu làm việc và giải trí, chụp ảnh nhóm với bạn bè.

Camera trước 8MP cùng hệ thống camera kép phía sau cho chất lượng ảnh sắc nét

Ngoài ra, camera trước cũng là điểm đáng chú ý, khi được trang bị độ phân giải 8MP, khẩu độ f/2.0 với góc chụp 80˚ cho khả năng chụp selfie ấn tượng. Kết hợp với AI thông minh giúp tối ưu hóa tông màu cho ra những bức ảnh chụp nâng lên tầm cao mới. Cùng với ứng dụng Adobe Premiere Rush, việc chỉnh sửa ảnh, video chất lượng chưa bao giờ đơn giản đến vậy.

Âm thanh vòm Dolby Atmos trong trẻo, hỗ trợ bút Spen
Bên cạnh một hiệu năng tốt cho nhu cầu công việc thì máy tính bảng Samsung Galaxy Tab S7 còn mang lại khả năng giải trí cao với công nghệ âm thanh vòm Dolby Atmos. Nếu sử dụng âm thanh vòm cho những bộ phim hay chơi game hành động, chắc chắn bạn sẽ thấy một sự thay đổi rất rõ.

Viên pin lên đến 8000 mAh, sạc nhanh 45W
Galaxy Tab S7 được hãng trang bị viên pin có dung lượng tới 8000 mAh. Với dung lượng này, Tab S7 cho thời gian sử dụng khá ấn tượng hơn 15 giờ xem phim. Bên cạnh đó, máy còn được trang bị sạc nhanh thông qua cổng USB-C hoặc đế sạc GordO. Nhờ đó, người dùng có thể thoải mái sử dụng mà không cần lo lắng về việc hết pin giữa chừng.

Điểm nổi bật trên chiếc máy này là tích hợp máy quét vân tay giúp mở khóa nhanh chóng cùng khả năng bảo mật tối đa. Không cần mật khẩu, chỉ với một lần chạm ngón tay là bạn có thể mở được khóa ngay lập tức.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (22, N'Tai nghe Bluetooth Apple AirPods 2 VN/A', N'3990000             ', N'3400000             ', N'Tai nghe Apple AirPods 2 – Thiết kế tối giản, chất lượng âm thanh tuyệt vời Vừa qua, Apple đã chính thức cho ra mắt chiếc tai nghe Airpods 2. Thế hệ thứ 2 lần này không có nhiều sự khác biệt so với thế hệ đầu về ngoại hình, trừ một số chi tiết về đèn báo hiệu cũng như ra mắt thêm phiên bản sạc không dây và sạc thường (sạc có dây). Ngoài ra, bạn có thể tham khảo thêm Apple Airpods Pro, sắp được ra mắt trong thời gian tới.', N'pk01.jpg                      ', N'Thiết kế nhỏ gọn, bắt mắt
Về cơ bản tai nghe không dây Apple AirPods 2 vẫn sở hữu thiết kế thời trang và nhỏ gọn, trọng lượng 4g cũng rất nhẹ không khác mấy so với tai nghe AirPods thế hệ đầu tiên. Nó cũng vẫn giữ nguyên thiết kế với màu trắng đặc trưng cho các dòng tai nghe. Đây là tai nghe wireless 100% và có khả năng tích hợp với mọi thiết bị Apple khác nhau nên bạn có thể linh hoạt sử dụng.

Tai nghe AirPods 2 vẫn giữ thiết kế nhỏ gọn, bắt mắt của từ Airpods 1

Thêm vào đó, chúng còn được phủ lên thêm một lớp chất liệu mới ở đầu mỗi tai nghe để giúp tai nghe được bám hơn trên tai người đeo, tương tự như lớp phủ mặt kính mờ trên mặt lưng của chiếc Pixel 3 mà Google đã trang bị cho chiếc điện thoại của mình.

Chip H1 cho khả năng kết nối nhanh hơn, mở Siri bằng giọng nói
Tai nghe Apple AirPods 2 trang bị chip H1 được hy vọng sẽ giúp kết nối ổn định hơn, mượt mà hơn thế hệ tiền nhiệm, cho người dùng nhiều trải nghiệm tốt hơn. Do đó, thay vì sử dụng chip W1 như các thế hệ sản phẩm cũ thì thế hệ mới 2019 lại được thêm vào chip H1 mạnh mẽ giúp giảm thiểu thời gian chuyển đổi giữa hai thiết bị và gia tăng thời gian đàm thoại lên đến 5 giờ liên tục.

Chip H1 cho khả năng kết nối nhanh hơn

Trước đây, người dùng phải chạm hai lần vào tai nghe để kích hoạt trợ lý ảo Siri thì bây giờ tai nghe Airpods 2 đã có sự cải tiến khi bạn chỉ cần thu âm giọng nói là có thể mở Siri chờ lệnh ngay. Tính năng này giúp bạn có thể dễ dàng điều chỉnh tai nghe mà không cần thao tác quá nhiều. Điều này cho phép người dùng có thể tương tác với Siri khi iPhone để trong túi quần.

mở Siri bằng giọng nói

Tính năng chống ồn vượt trội
Một trong những tính năng được Apple nâng cấp trên Airpods 2 chính là khả năng chống ồn. Theo báo cáo từ công ty phân tích Barclays, tai nghe AirPods có khả năng chống ồn, xử lý âm thanh bên ngoài tốt hơn so với tai nghe AirPods đời đầu với khả năng chống ồn còn hạn chế. Bên cạnh đó, tai nghe AirPods 2 có thể sẽ được Apple sử dụng công nghệ chống ồn vật lý, khác với chống ồn điện từ như những tai nghe headphone. Với khả năng chống ồn tốt hơn này, tai nghe AirPods hứa hẹn sẽ cho ra chất âm tuyệt vời và cải thiện khoảng cách kết nối giữa các thiết bị.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (23, N'Tai nghe Bluetooth Apple AirPods Pro VN/A', N'7990000             ', N'5300000             ', N'giảm lên đến 500.000 ₫  Airpods Pro – Tai nghe bluetooth với chất âm rõ cùng khả năng chống nước IPX4 Mẫu AirPods xuất hiện lần đầu vào năm 2016, sau nhiều nâng cấp về thiết kế vào cấu hình, mẫu tai nghe không dây ngày càng được hoàn thiện. Mới đây, Apple đã công bố mẫu tai nghe AirPods mới nhất – tai nghe bluetooth Apple Airpods Pro – với thiết kế mới cùng nhiều tính năng mới.', N'pk02.jpg                      ', N'Airpods Pro sở hữu thiết kế nhỏ gọn, trọng lượng 5.4 gram
Những thiết kế của Apple ngày càng hướng đến người dùng hơn khi chiếc tai nghe Airpods Pro mới nhất khá nhỏ gọn, trọng lượng chỉ 5.4g và 45,6 gram cả hộp. Sự nâng cấp đầu tiên phải kể đến đó là Airpods Pro được thiết kế như một tai nghe in-ear thay vì earbud toàn khung nhựa 100% như ở các phiên bản cũ. Cùng với 3 mút silicon mềm giúp Airpods Pro không chỉ giúp tai nghe trở nên sang trọng hơn và còn giúp tai nghe bám chắc vào tai, khả năng cách âm tốt cũng như phù hợp với nhiều kích thước tai khác nhau.

Không chỉ nhỏ gọn, phù hợp với nhiều khuôn tai mà Apple Airpods Pro còn sở hữu lõi thông khí giúp giảm thiểu áp lực lên tai, không đau tai khi đeo trong thời gian dài. Bên cạnh đó Airpods Pro còn sở hữu tiêu chuẩn chống nước và bụi bẩn IPX4. Như vậy Apple đã mang đến một tai nghe không dây không chỉ sử dụng thoải mái trong thời gian dài mà còn có thể sử dụng trong nhiều điều kiện môi trường khác nhau.

Âm thanh trên Apple Airpods Pro rõ nét với công nghệ khử tiếng ồn chủ động
Tai nghe AirPods Pro sở hữu nhiều công nghệ âm thanh mang đến chất lượng nghe - gọi tốt.

Một tính năng thông minh của Airpods Pro đó chỉnh là sử chuyển đổi giữa chế độ khử tiếng ồn chủ động và chế độ trong suốt. Với những lúc bạn có nhu cầu nghe cả những âm thanh đang xảy ra xung quanh. Việc đơn giản bạn cần làm là nhấn giữ cảm biến lực trên thân tai nghe để chuyển đổi giữa hai chế độ. Với chế độ trong suốt, bạn có thể nghe được cùng lúc âm thanh bên trong cũng như âm thanh bên ngoài, thoải mái nói chuyện với mọi người xung quanh.

Một micrô hướng vào bên trong giúp lắng nghe những âm thanh bên trong

Công nghệ Adaptive EQ cùng chip H1 giúp tùy chỉnh âm thanh
Bên cạnh tính năng chống ồn chủ động, Airpods Pro còn công nghệ Adaptive EQ cho khả năng tận hưởng âm nhạc tốt hơn. Công nghệ Adaptive EQ giúp điều chỉnh âm nhạc theo hình dạng tai nghe của từng người. Tai nghe cho âm trầm mạnh, cùng với đó là trình điều khiển loa cho phép tùy chỉnh độ méo cao và thấp khác nhau.

Ngoài ra, Apple AirPods Pro còn bộ khuếch đại cấp nguồn kết hợp với chip H1 giúp loại bỏ nền nhiễu, kiểm soát mức độ nghe. Bộ khuếch đại dải động giúp tạo ra âm thanh thuần khiết, rõ ràng cùng khả năng kéo dài tuổi thọ pin. Hơn thế nữa, tai nghe bluetooth AirPods Pro còn sở hữu cổng micro lưới mở rộng giúp cải thiện độ rõ của cuộc gọi, âm thanh trong các tình huống gió.

Dung lượng pin lớn lên đến 5 giờ sử dụng

Cảm biến lực giúp kiểm soát trên tai nghe cùng nhiều tính năng nâng cao: Siri, Ar
Tai nghe bluetooth Airpods Pro với cảm biến lực giúp kiểm soát ngay trên tai nghe. Cụ thể, bạn cần nhấn 1 lần để phát, tạm dừng hoặc trả lời cuộc gọi điện thoại. Nhấn 2, 3 lần để bỏ qua, nhấn và giữ để chuyển giữa chế độ khử tiếng ồn chủ động và chế độ trong suốt.

Tai nghe Apple Airpods Pro vẫn sở hữu tính năng kết nối với iPhone hoặc Apple Watch như các mẫu tai nghe Airpods khác, kết nối bluetooth 5.0.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (24, N'Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA', N'890000              ', N'550000              ', N'Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng tiết kiệm tối đa thời gian sạc điện thoại Nhanh chóng, tiết kiệm tối đa thời gian là những gì mà người dùng iPhone mong đợi ở chiếc sạc pin của mình. Để có thể làm được điều đó thì việc sử dụng củ sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng là điều cần thiết mà bạn không nên bỏ qua.', N'pk03.jpg                      ', N'Thiết kế nhỏ gọn, an toàn dòng điện
Củ sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng được thiết kế siêu nhỏ gọn, tinh tế giúp bạn có thể mang đến bất cứ nơi đâu. Chất liệu cao cấp cùng màu trắng nổi bật mang đến sự sang trọng và độ bền bỉ cùng với thời gian.

Củ sạc còn có khả năng bảo vệ sản phẩm tránh quá dòng, quá điện áp hay hiện tượng mạch điện bị chập và quá nhiệt trong quá trình sạc. Sản phẩm được kiểm định khắt khe và được cấp chứng chỉ an toàn cháy nổ: ROSH, CE, FCC giúp đảm đảm an toàn cho người sử dụng.

Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA Chính hãng

Công suất sạc nhanh, vô cùng tiện ích
Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng có công suất lên đến 20W. Công nghệ sạc nhanh Power Delivery (PD) này giúp người dùng có thể tiết kiệm được nhiều thời gian dành cho việc chờ đợi pin đầy.

Ngoài ra, sạc còn được trang bị cổng Type-C mang đến sự thuận tiện khi sử dụng. Công nghệ Power Delivery (PD) có thể sạc trên các thiết bị như iPhone 12, iPhone 12 Mini, iPhone 12 Pro, iPhone 12 Pro max hay các dòng điện thoại iPhone 11 Series,…', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (25, N'Camera hành trình Gopro Hero 9', N'11990000            ', N'10590000            ', N'Camera hành trình Gopro Hero 9 - Ghi lại những hình ảnh tuyệt vời nhất Camera hành trình luôn là những thiết bị không thể thiết đối với mỗi người dùng thích du lịch khám phá. Gopro Hero 9 là một trong những sản phẩm tuyệt vời nhất năm 2020 với độ phân giải quay cũng như trang bị nhiều công nghệ hình ảnh sắc nét, ổn định nhất khi quay.', N'pk04.jpg                      ', N'Nhỏ gọn chất liệu cao cấp, khung chắc chắn khi gắn gimbal
Với thiết kế nhỏ gọn mà Gopro Hero 9 mang lại phiên bản lần này cũng có kích thước tương tự như phiên bản trước và được tối giản nhỏ gọn với các đường nét tinh tế hơn.

Bộ khung vỏ trong của Gopro Hero 9 được làm thực kim loại thép không gỉ cố định các linh kiện bên trong và có một trục giá đỡ nằm ở mặt dưới của Gopro Hero 9.

Ống kính góc rộng quay lên đến 5K, chống rung HyperSmooth 3.0
Camera Gopro Hero 9 là một sản phẩm mang lại chất lượng hình ảnh khá tốt với độ phân giải lên đến 5K trên khung hình 30fps cho nhu cầu chụp ảnh và quay video với khung hình lớn. 

Bạn có thể dễ dàng chụp những bức ảnh yêu thích của mình lên độ phân giải cao nhất với Super Photo và quay video 4K với khung hình đạt 60fps và 1080P 240fps siêu sắc nét và chuyện động nhanh mọi khung hình.

Ống kính góc rộng quay lên đến 4K

Với ống kính góc rộng mà Gopro Hero 9 mang đến bạn cũng có thể selfie với góc rộng và quay video với góc rộng hơn bắt hết toàn bộ khung hình.

Có thể nói hệ thống chống rung HyperSmooth 3.0 trên Gopro Hero 9 mang đến một khả năng chống rung rất tuyệt vời cho mọi nhu cầu sử dụng.

Với việc tương thích và đồng bộ với hệ thống camera được xử lý qua con chip tốc độ cao. Hệ thống chống rung này và camera hoạt động liên tục mang đến những khung hình chất lượng nhất đến cho người dùng.

Màn hình trước tiện lợi, pin dung lượng lớn, chống nước 10m
Hãng đã tinh tế khi nắm bắt nhu cầu cũng như phản hồi của người dùng và bổ sung thêm một màn hình selfie ở mặt trước. Người dùng có thể theo dõi camera một cách dễ dàng từ phía trước để điều khiển.

Ngoài ra Gopro Hero 9 còn giúp người dùng trải nghiệm khả năng livestream một cách dễ dàng với độ phân giải cao lên đến 1080P cực kỳ sắc nét.

Dung lượng pin trên Hero 9 cũng nằm ở mức khá lớn, tăng 40% so với Gopro 8 cho khả năng hoạt động xuyên suốt cả ngày dài mà không hết pin. Ngoài ra pin trên Gopro Hero 9 cũng có thể tháo rời và thay một cách dễ dàng.

Điểm đặc biệt trên chiếc Gopro Hero 9 đó là được trang bị khả năng chống nước lên đến 30m. Bạn có thể thoải mái sử dụng Gopro 9 khi tắm biển hay hồ bơi, đi ngoài mưa mà không lo bị hư hỏng camera hành trình.', 4, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (1, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (2, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (3, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (4, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (5, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (6, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (7, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (8, N'duy2', N'25d55ad283aa400af464c76d713c07ad                  ', NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (9, N'duyadmin', N'25d55ad283aa400af464c76d713c07ad                  ', NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (10, N'admin', N'25d55ad283aa400af464c76d713c07ad                  ', NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (11, N'client', N'25d55ad283aa400af464c76d713c07ad                  ', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [BTL] SET  READ_WRITE 
GO
