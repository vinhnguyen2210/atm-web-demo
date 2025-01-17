use master
go
create database ATM_System
GO
USE [ATM_System]
GO

/****** Object:  Table [dbo].[Accounts]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [int] NULL,
	[ODID] [int] NULL,
	[WDID] [int] NULL,
	[AccountNo] varchar(50),
	[Balance] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cards]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cards](
	[CardNo] [varchar](16) NOT NULL,
	[Status] [varchar](30) NULL,
	[AccountID] [int] NULL,
	[PIN] [varchar](6) NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[Attempt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configs]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configs](
	[ConID] [int] IDENTITY(1,1) NOT NULL,
	[DateModified] [datetime] NULL,
	[MinWithDraw] [decimal](18, 0) NULL,
	[MaxWithDraw] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Addr] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogTypeID] [int] NULL,
	[CardNo] [varchar](16) NULL,
	[LogDate] [datetime] NULL,
	[Amount] [decimal](18, 0) NULL,
	[Details] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogTypes]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTypes](
	[LogTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoneyTypes]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyTypes](
	[MoneyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MoneyValue] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MoneyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OverDraftLimits]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverDraftLimits](
	[ODID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[MoneyTypeID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WithDrawLimits]    Script Date: 2/28/2015 9:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithDrawLimits](
	[WDID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[WDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customers] ([CustID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_OverDraftLimits] FOREIGN KEY([ODID])
REFERENCES [dbo].[OverDraftLimits] ([ODID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_OverDraftLimits]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_WithDrawLimits] FOREIGN KEY([WDID])
REFERENCES [dbo].[WithDrawLimits] ([WDID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_WithDrawLimits]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Accounts]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Cards] FOREIGN KEY([CardNo])
REFERENCES [dbo].[Cards] ([CardNo])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Cards]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_LogTypes] FOREIGN KEY([LogTypeID])
REFERENCES [dbo].[LogTypes] ([LogTypeID])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_LogTypes]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_MoneyTypes] FOREIGN KEY([MoneyTypeID])
REFERENCES [dbo].[MoneyTypes] ([MoneyTypeID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_MoneyTypes]
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (1, N'Lê Văn Thứ', N'01234567899', N'thu@gmail.com', N'Hoàng Quốc Việt')
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (2, N'Trương Tiến Phúc ', N'01246744325', N'phuc@gmail.com', N'Hoàng Hoa Thám')
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (3, N'Dương Vũ Thái Cường', N'01413532325', N'cuong@gmail.com', N'Thanh Xuân')
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (4, N'Phạm Hồng Thuận', N'02112424466', N'thuan@gmail.com', N'Bưởi')
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (5, N'Dương Hồ Minh Tú', N'06124321251', N'tu@gmail.com', N'Cầu Giấy')
INSERT [dbo].[Customers] ([CustID], [Name], [Phone], [Email], [Addr]) VALUES (6, N'Hoàng Đạt', N'06124321251', N'dat@gmail.com', N'Cầu Giấy')
SET IDENTITY_INSERT [dbo].[Customers] OFF

SET IDENTITY_INSERT [dbo].[OverDraftLimits] ON
INSERT [dbo].[OverDraftLimits] ([ODID], [Value]) VALUES (1, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[OverDraftLimits] ([ODID], [Value]) VALUES (2, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OverDraftLimits] ([ODID], [Value]) VALUES (3, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[OverDraftLimits] ([ODID], [Value]) VALUES (4, CAST(500000 AS Decimal(18, 0)))
INSERT [dbo].[OverDraftLimits] ([ODID], [Value]) VALUES (5, CAST(1000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OverDraftLimits] OFF

SET IDENTITY_INSERT [dbo].[MoneyTypes] ON
INSERT [dbo].[MoneyTypes] ([MoneyTypeID], [MoneyValue]) VALUES (1, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[MoneyTypes] ([MoneyTypeID], [MoneyValue]) VALUES (2, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[MoneyTypes] ([MoneyTypeID], [MoneyValue]) VALUES (3, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[MoneyTypes] ([MoneyTypeID], [MoneyValue]) VALUES (4, CAST(500000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[MoneyTypes] OFF

SET IDENTITY_INSERT [dbo].[LogTypes] ON
INSERT [dbo].[LogTypes] ([LogTypeID], [Description]) VALUES (1, N'Withdraw')
INSERT [dbo].[LogTypes] ([LogTypeID], [Description]) VALUES (2, N'Transfer Cash')
INSERT [dbo].[LogTypes] ([LogTypeID], [Description]) VALUES (3, N'Check Balance')
INSERT [dbo].[LogTypes] ([LogTypeID], [Description]) VALUES (4, N'Change PIN')
SET IDENTITY_INSERT [dbo].[LogTypes] OFF

SET IDENTITY_INSERT [dbo].[WithDrawLimits] ON
INSERT [dbo].[WithDrawLimits] ([WDID], [Value]) VALUES (1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[WithDrawLimits] ([WDID], [Value]) VALUES (2, CAST(10000000 AS Decimal(18, 0)))
INSERT [dbo].[WithDrawLimits] ([WDID], [Value]) VALUES (3, CAST(15000000 AS Decimal(18, 0)))
INSERT [dbo].[WithDrawLimits] ([WDID], [Value]) VALUES (4, CAST(20000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[WithDrawLimits] OFF

SET IDENTITY_INSERT [dbo].[Stocks] ON
INSERT [dbo].[Stocks] ([StockID], [MoneyTypeID], [Quantity]) VALUES (1, 1, 1000)
INSERT [dbo].[Stocks] ([StockID], [MoneyTypeID],  [Quantity]) VALUES (2, 2,  1000)
INSERT [dbo].[Stocks] ([StockID], [MoneyTypeID],  [Quantity]) VALUES (3, 3,  1000)
INSERT [dbo].[Stocks] ([StockID], [MoneyTypeID],  [Quantity]) VALUES (4, 4,  1000)

SET IDENTITY_INSERT [dbo].[Stocks] OFF

SET IDENTITY_INSERT [dbo].[Accounts] ON
INSERT [dbo].[Accounts] ([AccountID], [CustID], [ODID], [WDID], [Balance], [AccountNo]) VALUES (1, 1, 1, 2, CAST(18010000 AS Decimal(18, 0)),'1234567891234')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (2, 2,  2, 1, CAST(12000000 AS Decimal(18, 0)),'1234567891238')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (3, 3,  3, 1, CAST(13000000 AS Decimal(18, 0)),'1234567891232')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (4, 4,  5, 4, CAST(13990000 AS Decimal(18, 0)),'1234567891223')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (5, 5,  4, 3, CAST(14990000 AS Decimal(18, 0)),'1234567891276')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (6, 1,  1, 1, CAST(16000000 AS Decimal(18, 0)),'1234678912317')
INSERT [dbo].[Accounts] ([AccountID], [CustID],  [ODID], [WDID], [Balance], [AccountNo]) VALUES (7, 2,  2, 2, CAST(17010000 AS Decimal(18, 0)),'1234567891230')
INSERT [dbo].[Accounts] ([AccountID], [CustID], [ODID], [WDID], [Balance], [AccountNo]) VALUES (8, 2,  4, 4, CAST(10000000 AS Decimal(18, 0)),'1234567891456')
SET IDENTITY_INSERT [dbo].[Accounts] OFF

INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111AAAA', N'1', 2, N'666666', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111BBBB', N'1', 5, N'555555', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111CCCC', N'1', 6, N'222222', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111DDDD', N'1', 1, N'123456', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111EEEE', N'1', 7, N'111222', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111FFFF', N'1', 8, N'543333', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111GGGG', N'1', 2, N'654321', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 1)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111HHHH', N'0', 3, N'123456', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 3)
INSERT [dbo].[Cards] ([CardNo], [Status], [AccountID], [PIN], [StartDate], [ExpiredDate], [Attempt]) VALUES (N'111111111111KKKK', N'1', 4, N'333333', CAST(0x00008FD300000000 AS DateTime), CAST(0x0000A3CD00000000 AS DateTime), 0)

SET IDENTITY_INSERT [dbo].[Logs] ON
INSERT [dbo].[Logs] ([LogID], [LogTypeID], [CardNo], [LogDate], [Amount], [Details]) VALUES (2, 1,  N'111111111111AAAA', CAST(0x0000A3F80183C99E AS DateTime), CAST(10000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID], [CardNo], [LogDate], [Amount], [Details]) VALUES (3, 1,  N'111111111111EEEE', CAST(0x0000A3FA00A891C9 AS DateTime), CAST(2000000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (4, 1,  N'111111111111CCCC', CAST(0x0000A3FA00A933BB AS DateTime), CAST(500000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (5, 1,  N'111111111111BBBB', CAST(0x0000A3FA00AB72AD AS DateTime), CAST(2500000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (6, 1,  N'111111111111EEEE', CAST(0x0000A3FA00B6DDDD AS DateTime), CAST(50000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (7, 1,  N'111111111111AAAA', CAST(0x0000A3FA00BC55B7 AS DateTime), CAST(1600000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (8, 1,  N'111111111111AAAA', CAST(0x0000A3FA00BCB5A5 AS DateTime), CAST(1600000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (9, 2,  N'111111111111DDDD', CAST(0x0000A3FA016B4846 AS DateTime), CAST(10000 AS Decimal(18, 0)), N'To Hoàng Đạt')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (13, 1,  N'111111111111FFFF', CAST(0x0000A13900000000 AS DateTime), CAST(100000 AS Decimal(18, 0)), N'abc')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (14, 1,  N'111111111111KKKK', CAST(0x0000A3B700000000 AS DateTime), CAST(100000 AS Decimal(18, 0)), N'abc')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (15, 1,  N'111111111111HHHH', CAST(0x0000A3FB000F8A08 AS DateTime), CAST(2500000 AS Decimal(18, 0)), N'abcxya')
INSERT [dbo].[Logs] ([LogID], [LogTypeID],  [CardNo], [LogDate], [Amount], [Details]) VALUES (16, 2,  N'111111111111GGGG', CAST(0x0000A3FB000FAFB9 AS DateTime), CAST(10000 AS Decimal(18, 0)), N'To  Lê Văn Thứ')
SET IDENTITY_INSERT [dbo].[Logs] OFF

create table ATMs(
ATMID int primary key not null,
Branch int,
Address int)

insert into ATMs values(1,1,1)



