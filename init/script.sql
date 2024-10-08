USE [SWP391_Database]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 10/8/2024 9:10:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[userid] [int] NULL,
	[quantity] [int] NULL,
	[size] [nvarchar](40) NULL,
	[color] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVALUATE]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVALUATE](
	[evaluateid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[userid] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[star] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGEPRODUCTS]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGEPRODUCTS](
	[imageid] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[imageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[userid] [int] NULL,
	[quantity] [int] NULL,
	[nameofreceiver] [nvarchar](max) NULL,
	[phonenumber] [nvarchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[reasoncancel] [nvarchar](max) NULL,
	[statusorder] [nvarchar](max) NULL,
	[totalprice] [int] NULL,
	[dateorder] [date] NULL,
	[promotionid] [int] NULL,
	[color] [nvarchar](40) NULL,
	[size] [nvarchar](40) NULL,
	[paymentmethods] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTINFOR]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTINFOR](
	[productinforid] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[quantityp] [int] NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productinforid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](40) NULL,
	[price] [int] NULL,
	[description] [nvarchar](max) NULL,
	[quantityp] [int] NULL,
	[avagerstar] [float] NULL,
	[shopid] [int] NULL,
	[typeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROMOTION]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOTION](
	[promotionid] [int] IDENTITY(1,1) NOT NULL,
	[promotionname] [nvarchar](100) NULL,
	[pecentpromotion] [int] NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](max) NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[promotionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECEIVERINFO]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECEIVERINFO](
	[receiverinfoid] [int] IDENTITY(1,1) NOT NULL,
	[nameofreceiver] [nvarchar](max) NULL,
	[phonenumber] [nvarchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[receiverinfoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTPRODUCT]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTPRODUCT](
	[reportproductid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[productid] [int] NULL,
	[reasonreport] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[reportproductid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTSHOP]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTSHOP](
	[reportshopid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[shopid] [int] NULL,
	[reasonreport] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[reportshopid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLEDEFINITION]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLEDEFINITION](
	[roleid] [int] NOT NULL,
	[rolename] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOPS]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOPS](
	[shopid] [int] IDENTITY(1,1) NOT NULL,
	[shopname] [nvarchar](40) NULL,
	[address] [nvarchar](max) NULL,
	[desshop] [nvarchar](max) NULL,
	[userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[shopid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPEITEM]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPEITEM](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[typename] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](40) NULL,
	[fullname] [nvarchar](max) NULL,
	[phonenumber] [varchar](20) NULL,
	[gender] [bit] NULL,
	[dob] [varchar](20) NULL,
	[email] [nvarchar](40) NULL,
	[password] [nvarchar](40) NULL,
	[roleid] [int] NULL,
	[imgavt] [nvarchar](max) NULL,
	[bankname] [nvarchar](max) NULL,
	[banknumber] [varchar](30) NULL,
	[emailpaypal] [varchar](40) NULL,
	[banstatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WALLET]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WALLET](
	[walletid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[surplus] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[walletid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WISHLIST]    Script Date: 10/8/2024 9:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WISHLIST](
	[shopid] [int] NULL,
	[userid] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[EVALUATE]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[EVALUATE]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[IMAGEPRODUCTS]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([promotionid])
REFERENCES [dbo].[PROMOTION] ([promotionid])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[PRODUCTINFOR]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD FOREIGN KEY([shopid])
REFERENCES [dbo].[SHOPS] ([shopid])
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD FOREIGN KEY([typeid])
REFERENCES [dbo].[TYPEITEM] ([typeid])
GO
ALTER TABLE [dbo].[RECEIVERINFO]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[REPORTPRODUCT]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCTS] ([productid])
GO
ALTER TABLE [dbo].[REPORTPRODUCT]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[REPORTSHOP]  WITH CHECK ADD FOREIGN KEY([shopid])
REFERENCES [dbo].[SHOPS] ([shopid])
GO
ALTER TABLE [dbo].[REPORTSHOP]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[SHOPS]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[ROLEDEFINITION] ([roleid])
GO
ALTER TABLE [dbo].[WALLET]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
ALTER TABLE [dbo].[WISHLIST]  WITH CHECK ADD FOREIGN KEY([shopid])
REFERENCES [dbo].[SHOPS] ([shopid])
GO
ALTER TABLE [dbo].[WISHLIST]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[USERS] ([userid])
GO
