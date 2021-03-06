USE [master]
GO
/****** Object:  Database [FITHAUI.SimulationATMSystem]    Script Date: 11/09/2018 5:45:50 PM ******/
CREATE DATABASE [FITHAUI.SimulationATMSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FITHAUI.SimulationATMSystem', FILENAME = N'D:\KY 1\CSHAP\FITHAUI.SimulationATMSystem\FITHAUI.SimulationATMSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FITHAUI.SimulationATMSystem_log', FILENAME = N'D:\KY 1\CSHAP\FITHAUI.SimulationATMSystem\FITHAUI.SimulationATMSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FITHAUI.SimulationATMSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  MULTI_USER 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FITHAUI.SimulationATMSystem', N'ON'
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET QUERY_STORE = OFF
GO
USE [FITHAUI.SimulationATMSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/09/2018 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Balance] [money] NULL,
	[CustID] [uniqueidentifier] NULL,
	[ODID] [uniqueidentifier] NULL,
	[WDID] [uniqueidentifier] NULL,
	[AccountNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATM]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM](
	[ATMID] [uniqueidentifier] NOT NULL,
	[Branch] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_ATM] PRIMARY KEY CLUSTERED 
(
	[ATMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardNo] [uniqueidentifier] NOT NULL,
	[PIN] [decimal](18, 0) NULL,
	[Status] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[AccountID] [uniqueidentifier] NULL,
	[Attempt] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigID] [uniqueidentifier] NOT NULL,
	[MinWithdraw] [money] NULL,
	[MaxWithdraw] [money] NULL,
	[DateModified] [datetime] NULL,
	[NumberPage] [int] NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](13) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogID] [uniqueidentifier] NULL,
	[LogDate] [datetime] NULL,
	[Amount] [money] NULL,
	[Details] [nvarchar](255) NULL,
	[LogTypeID] [uniqueidentifier] NULL,
	[ATMID] [uniqueidentifier] NULL,
	[CardNo] [uniqueidentifier] NULL,
	[CardNoTo] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogType](
	[LogTypeID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED 
(
	[LogTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Money]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Money](
	[MoneyID] [uniqueidentifier] NOT NULL,
	[MoneyValue] [money] NULL,
 CONSTRAINT [PK_Money] PRIMARY KEY CLUSTERED 
(
	[MoneyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverDraft]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverDraft](
	[ODID] [uniqueidentifier] NOT NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK_OverDraft] PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[MoneyID] [uniqueidentifier] NULL,
	[ATMID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithdrawLimit]    Script Date: 11/09/2018 5:45:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithdrawLimit](
	[WDID] [uniqueidentifier] NOT NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK_WithdrawLimit] PRIMARY KEY CLUSTERED 
(
	[WDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_AccountID]  DEFAULT (newid()) FOR [AccountID]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [DF_ATM_ATMID]  DEFAULT (newid()) FOR [ATMID]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_CardNo]  DEFAULT (newid()) FOR [CardNo]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ConfigID]  DEFAULT (newid()) FOR [ConfigID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustID]  DEFAULT (newid()) FOR [CustomerID]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_LogID]  DEFAULT (newid()) FOR [LogID]
GO
ALTER TABLE [dbo].[LogType] ADD  CONSTRAINT [DF_LogType_LogTypeID]  DEFAULT (newid()) FOR [LogTypeID]
GO
ALTER TABLE [dbo].[Money] ADD  CONSTRAINT [DF_Money_MoneyID]  DEFAULT (newid()) FOR [MoneyID]
GO
ALTER TABLE [dbo].[OverDraft] ADD  CONSTRAINT [DF_OverDraft_ODID]  DEFAULT (newid()) FOR [ODID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_StockID]  DEFAULT (newid()) FOR [StockID]
GO
ALTER TABLE [dbo].[WithdrawLimit] ADD  CONSTRAINT [DF_WithdrawLimit_WDID]  DEFAULT (newid()) FOR [WDID]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_OverDraft] FOREIGN KEY([ODID])
REFERENCES [dbo].[OverDraft] ([ODID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_OverDraft]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_WithdrawLimit] FOREIGN KEY([WDID])
REFERENCES [dbo].[WithdrawLimit] ([WDID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_WithdrawLimit]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Account]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_ATM] FOREIGN KEY([ATMID])
REFERENCES [dbo].[ATM] ([ATMID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_ATM]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Card] FOREIGN KEY([CardNo])
REFERENCES [dbo].[Card] ([CardNo])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Card]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_LogType] FOREIGN KEY([LogTypeID])
REFERENCES [dbo].[LogType] ([LogTypeID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_LogType]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ATM] FOREIGN KEY([ATMID])
REFERENCES [dbo].[ATM] ([ATMID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_ATM]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Money] FOREIGN KEY([MoneyID])
REFERENCES [dbo].[Money] ([MoneyID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Money]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền còn lại trong tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CustID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền có thể thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ODID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền rút tối đa trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'WDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'Branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vị trí chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã PIN của thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'PIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái của thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cấp thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày hết hạn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'ExpiredDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lần nhập không hợp lệ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'Attempt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối thiểu một lần rút]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'MinWithdraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối đa rút trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'MaxWithdraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cập nhật' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'DateModified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số bản ghỉ được hiển thị ở màn hình hiển thị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'NumberPage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã của bản ghi log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày giao dịch xảy ra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khoản tiền giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả về giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM nhận tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã log type sử dụng trong hệ thống' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogType', @level2type=N'COLUMN',@level2name=N'LogTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hoặc các chi tiết loại log type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại tiền sử dụng trong hệ thống' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Money', @level2type=N'COLUMN',@level2name=N'MoneyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị của loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Money', @level2type=N'COLUMN',@level2name=N'MoneyValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã mức thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OverDraft', @level2type=N'COLUMN',@level2name=N'ODID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền mà một tài khoản có thể thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OverDraft', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã của bản ghi stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mỗi loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MoneyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã máy ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã giới hạn rút' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithdrawLimit', @level2type=N'COLUMN',@level2name=N'WDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối đa một tài khoản có thể rút trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithdrawLimit', @level2type=N'COLUMN',@level2name=N'Value'
GO
USE [master]
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  READ_WRITE 
GO
