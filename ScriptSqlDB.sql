USE [master]
GO
/****** Object:  Database [ForwardingCompany]    Script Date: 10.10.2018 18:11:33 ******/
CREATE DATABASE [ForwardingCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ForwardingCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ForwardingCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ForwardingCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ForwardingCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ForwardingCompany] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ForwardingCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ForwardingCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForwardingCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForwardingCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForwardingCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForwardingCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForwardingCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ForwardingCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForwardingCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForwardingCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForwardingCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ForwardingCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForwardingCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForwardingCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForwardingCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForwardingCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ForwardingCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForwardingCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ForwardingCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ForwardingCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ForwardingCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForwardingCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ForwardingCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ForwardingCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ForwardingCompany] SET  MULTI_USER 
GO
ALTER DATABASE [ForwardingCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ForwardingCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ForwardingCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ForwardingCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ForwardingCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ForwardingCompany] SET QUERY_STORE = OFF
GO
USE [ForwardingCompany]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ForwardingCompany]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[PK_Street] [uniqueidentifier] NOT NULL,
	[NameStreet] [nvarchar](150) NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[PK_Street] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Citys]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citys](
	[PK_City] [uniqueidentifier] NOT NULL,
	[NameCity] [nvarchar](50) NULL,
	[FK_street] [uniqueidentifier] NULL,
	[Coordinates] [nvarchar](250) NULL,
 CONSTRAINT [PK_Citys] PRIMARY KEY CLUSTERED 
(
	[PK_City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CityStreetView]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CityStreetView]
AS
SELECT        dbo.Citys.PK_City AS [Код города], dbo.Citys.NameCity AS [Наименование города], dbo.Citys.FK_street AS [Код улицы], dbo.Streets.NameStreet AS [Наименование улицы], dbo.Citys.Coordinates AS Координаты
FROM            dbo.Citys INNER JOIN
                         dbo.Streets ON dbo.Citys.FK_street = dbo.Streets.PK_Street

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PK_position] [uniqueidentifier] NOT NULL,
	[NamePosition] [nvarchar](50) NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PK_position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[PK_employee] [uniqueidentifier] NOT NULL,
	[FIO_employee] [nvarchar](150) NULL,
	[BirthDay] [date] NULL,
	[Phone_employee] [nvarchar](50) NULL,
	[FK_position] [uniqueidentifier] NULL,
	[DriversLicense] [nvarchar](50) NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[PK_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[EmployeePositionView]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeePositionView]
AS
SELECT        dbo.Employees.PK_employee AS [Код сотрудника], dbo.Employees.FIO_employee AS ФИО, dbo.Employees.BirthDay AS [День рождения], dbo.Employees.Phone_employee AS Телефон, 
                         dbo.Employees.FK_position AS [Код позиции], dbo.Positions.NamePosition AS [Наименование позиции], dbo.Positions.Salary AS [Заработная плата], dbo.Employees.DriversLicense AS [Водительские права], 
                         dbo.Employees.Categories AS [Категория водительских прав]
FROM            dbo.Employees INNER JOIN
                         dbo.Positions ON dbo.Employees.FK_position = dbo.Positions.PK_position

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[PK_Order] [uniqueidentifier] NOT NULL,
	[FK_Auto] [uniqueidentifier] NULL,
	[FK_Employee] [uniqueidentifier] NULL,
	[FK_Company] [uniqueidentifier] NULL,
	[FK_Trailer] [uniqueidentifier] NULL,
	[DateOrder] [date] NULL,
	[Price] [decimal](10, 2) NULL,
	[NameCargo] [nvarchar](250) NULL,
	[SizeCargo] [decimal](4, 4) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[PK_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autos]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autos](
	[PK_Auto] [uniqueidentifier] NOT NULL,
	[Name_Auto] [nvarchar](50) NULL,
	[Number_Auto] [nvarchar](50) NULL,
	[Expense] [decimal](3, 2) NULL,
	[Technical_Inspection] [date] NULL,
 CONSTRAINT [PK_Autos] PRIMARY KEY CLUSTERED 
(
	[PK_Auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companies]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[PK_Company] [uniqueidentifier] NOT NULL,
	[NameCompany] [nvarchar](100) NULL,
	[FK_City] [uniqueidentifier] NULL,
	[ITN] [nvarchar](50) NULL,
	[BIC] [nvarchar](50) NULL,
	[SettlementAccount] [nvarchar](50) NULL,
 CONSTRAINT [PK_Companys] PRIMARY KEY CLUSTERED 
(
	[PK_Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trailers]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trailers](
	[PK_Trailer] [uniqueidentifier] NOT NULL,
	[Name_Trailer] [nvarchar](50) NULL,
	[Number_Trailer] [nvarchar](50) NULL,
	[MaxSize] [decimal](3, 2) NULL,
 CONSTRAINT [PK_Trailers] PRIMARY KEY CLUSTERED 
(
	[PK_Trailer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[OrderView]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderView]
AS
SELECT        dbo.Orders.PK_Order AS [Код заказа], dbo.Orders.FK_Auto AS [Код автомобиля], dbo.Autos.Name_Auto AS [Наименование автомобиля], dbo.Autos.Number_Auto AS [Номер автомобиля], dbo.Autos.Expense AS Расход, 
                         dbo.Autos.Technical_Inspection AS [Дата ТО], dbo.Orders.FK_Employee AS [Код сотрудника], dbo.Employees.FIO_employee AS ФИО, dbo.Employees.BirthDay AS [День рождения], 
                         dbo.Employees.Phone_employee AS [Номер телефона], dbo.Employees.FK_position AS [Код должности], dbo.Positions.NamePosition AS [Наименование должности], dbo.Positions.Salary AS [Заработная плата], 
                         dbo.Employees.DriversLicense AS [Водительское удостоверение], dbo.Employees.Categories AS Категории, dbo.Orders.FK_Company AS [Код компании], dbo.Companies.NameCompany AS [Наименование компании], 
                         dbo.Companies.FK_City AS [Код города], dbo.Citys.NameCity AS [Наименование города], dbo.Citys.FK_street AS [Код улицы], dbo.Streets.NameStreet AS [Наименование улицы], dbo.Citys.Coordinates AS Координаты, 
                         dbo.Companies.ITN AS ИНН, dbo.Companies.BIC AS БИК, dbo.Companies.SettlementAccount AS [Расчетный счет], dbo.Orders.FK_Trailer AS [Код прицепа], dbo.Trailers.Name_Trailer AS [Наименование прицепа], 
                         dbo.Trailers.Number_Trailer AS [Номер прицепа], dbo.Trailers.MaxSize AS [Максимальный размер], dbo.Orders.DateOrder AS [Дата заказа], dbo.Orders.Price AS Стоимость, dbo.Orders.NameCargo AS [Наименование груза], 
                         dbo.Orders.SizeCargo AS [Размер груза]
FROM            dbo.Orders INNER JOIN
                         dbo.Autos ON dbo.Orders.FK_Auto = dbo.Autos.PK_Auto INNER JOIN
                         dbo.Employees ON dbo.Orders.FK_Employee = dbo.Employees.PK_employee INNER JOIN
                         dbo.Companies ON dbo.Orders.FK_Company = dbo.Companies.PK_Company INNER JOIN
                         dbo.Trailers ON dbo.Orders.FK_Trailer = dbo.Trailers.PK_Trailer INNER JOIN
                         dbo.Positions ON dbo.Employees.FK_position = dbo.Positions.PK_position INNER JOIN
                         dbo.Citys ON dbo.Companies.FK_City = dbo.Citys.PK_City INNER JOIN
                         dbo.Streets ON dbo.Citys.FK_street = dbo.Streets.PK_Street

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[PK_Categorie] [uniqueidentifier] NOT NULL,
	[Name_Categorie] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[PK_Categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListCategories]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListCategories](
	[ID_Row] [uniqueidentifier] NOT NULL,
	[FK_Employee] [uniqueidentifier] NULL,
	[FK_Categorie] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ListCategories] PRIMARY KEY CLUSTERED 
(
	[ID_Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TravelOrder]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelOrder](
	[ID_Row] [uniqueidentifier] NOT NULL,
	[FK_Order] [uniqueidentifier] NULL,
	[FK_City] [uniqueidentifier] NULL,
	[FK_Street] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TravelOrder] PRIMARY KEY CLUSTERED 
(
	[ID_Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Autos] ADD  CONSTRAINT [DF_Autos_PK_Auto]  DEFAULT (newid()) FOR [PK_Auto]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_PK_Categorie]  DEFAULT (newid()) FOR [PK_Categorie]
GO
ALTER TABLE [dbo].[Citys] ADD  CONSTRAINT [DF_Citys_PK_City]  DEFAULT (newid()) FOR [PK_City]
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_PK_Company]  DEFAULT (newid()) FOR [PK_Company]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_PK_employee]  DEFAULT (newid()) FOR [PK_employee]
GO
ALTER TABLE [dbo].[ListCategories] ADD  CONSTRAINT [DF_ListCategories_ID_Row]  DEFAULT (newid()) FOR [ID_Row]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_PK_Order]  DEFAULT (newid()) FOR [PK_Order]
GO
ALTER TABLE [dbo].[Positions] ADD  CONSTRAINT [DF_Positions_PK_position]  DEFAULT (newid()) FOR [PK_position]
GO
ALTER TABLE [dbo].[Streets] ADD  CONSTRAINT [DF_Streets_PK_Street]  DEFAULT (newid()) FOR [PK_Street]
GO
ALTER TABLE [dbo].[Trailers] ADD  CONSTRAINT [DF_Trailers_PK_Trailer]  DEFAULT (newid()) FOR [PK_Trailer]
GO
ALTER TABLE [dbo].[TravelOrder] ADD  CONSTRAINT [DF_TravelOrder_ID_Row]  DEFAULT (newid()) FOR [ID_Row]
GO
ALTER TABLE [dbo].[Citys]  WITH CHECK ADD  CONSTRAINT [FK_Citys_Streets] FOREIGN KEY([FK_street])
REFERENCES [dbo].[Streets] ([PK_Street])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Citys] CHECK CONSTRAINT [FK_Citys_Streets]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Citys] FOREIGN KEY([FK_City])
REFERENCES [dbo].[Citys] ([PK_City])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Citys]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([FK_position])
REFERENCES [dbo].[Positions] ([PK_position])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO
ALTER TABLE [dbo].[ListCategories]  WITH CHECK ADD  CONSTRAINT [FK_ListCategories_Categories] FOREIGN KEY([FK_Categorie])
REFERENCES [dbo].[Categories] ([PK_Categorie])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListCategories] CHECK CONSTRAINT [FK_ListCategories_Categories]
GO
ALTER TABLE [dbo].[ListCategories]  WITH CHECK ADD  CONSTRAINT [FK_ListCategories_Employees] FOREIGN KEY([FK_Employee])
REFERENCES [dbo].[Employees] ([PK_employee])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListCategories] CHECK CONSTRAINT [FK_ListCategories_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Autos] FOREIGN KEY([FK_Auto])
REFERENCES [dbo].[Autos] ([PK_Auto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Autos]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Companies] FOREIGN KEY([FK_Company])
REFERENCES [dbo].[Companies] ([PK_Company])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Companies]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([FK_Employee])
REFERENCES [dbo].[Employees] ([PK_employee])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Trailers] FOREIGN KEY([FK_Trailer])
REFERENCES [dbo].[Trailers] ([PK_Trailer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Trailers]
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD  CONSTRAINT [FK_TravelOrder_Citys] FOREIGN KEY([FK_City])
REFERENCES [dbo].[Citys] ([PK_City])
GO
ALTER TABLE [dbo].[TravelOrder] CHECK CONSTRAINT [FK_TravelOrder_Citys]
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD  CONSTRAINT [FK_TravelOrder_Orders] FOREIGN KEY([FK_Order])
REFERENCES [dbo].[Orders] ([PK_Order])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TravelOrder] CHECK CONSTRAINT [FK_TravelOrder_Orders]
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD  CONSTRAINT [FK_TravelOrder_Streets] FOREIGN KEY([FK_Street])
REFERENCES [dbo].[Streets] ([PK_Street])
GO
ALTER TABLE [dbo].[TravelOrder] CHECK CONSTRAINT [FK_TravelOrder_Streets]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Autos]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_Autos]
	@PK_Auto AS uniqueidentifier
AS
	DELETE FROM Autos WHERE PK_Auto = @PK_Auto

GO
/****** Object:  StoredProcedure [dbo].[IN_Autos]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IN_Autos]
	@PK_Auto AS uniqueidentifier, 
	@Name_Auto AS nvarchar(50), 
	@Number_Auto AS nvarchar(50), 
	@Expense AS decimal(3,2), 
	@Technical_Inspection AS date
AS
	INSERT INTO Autos (PK_Auto,Name_Auto,Number_Auto,Expense,Technical_Inspection) 
	VALUES (@PK_Auto,@Name_Auto,@Number_Auto,@Expense,@Technical_Inspection)

GO
/****** Object:  StoredProcedure [dbo].[SEL_Autos]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEL_Autos]

AS
	SELECT * FROM Autos

GO
/****** Object:  StoredProcedure [dbo].[UP_Autos]    Script Date: 10.10.2018 18:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UP_Autos]
	@PK_Auto AS uniqueidentifier, 
	@Name_Auto AS nvarchar(50), 
	@Number_Auto AS nvarchar(50), 
	@Expense AS decimal(3,2), 
	@Technical_Inspection AS date
AS
	UPDATE Autos SET Name_Auto = @Name_Auto, Number_Auto = @Number_Auto, Expense = @Expense, Technical_Inspection = @Technical_Inspection
	WHERE PK_Auto = @PK_Auto

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Citys"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Streets"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CityStreetView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CityStreetView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 205
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Positions"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 138
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EmployeePositionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EmployeePositionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 0
               Left = 40
               Bottom = 219
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Autos"
            Begin Extent = 
               Top = 0
               Left = 273
               Bottom = 154
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 157
               Left = 362
               Bottom = 348
               Right = 542
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Companies"
            Begin Extent = 
               Top = 235
               Left = 24
               Bottom = 405
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Trailers"
            Begin Extent = 
               Top = 346
               Left = 281
               Bottom = 477
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Positions"
            Begin Extent = 
               Top = 191
               Left = 580
               Bottom = 304
               Right = 754
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Citys"
            Begin Extent = 
               Top = 413
               Left = 24
               Bottom = 543
               Right = 198
            End
            DisplayFlags = 28' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
            TopColumn = 0
         End
         Begin Table = "Streets"
            Begin Extent = 
               Top = 524
               Left = 234
               Bottom = 620
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3210
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderView'
GO
USE [master]
GO
ALTER DATABASE [ForwardingCompany] SET  READ_WRITE 
GO
