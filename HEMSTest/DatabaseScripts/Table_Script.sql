CREATE DATABASE HEMS_Task

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/14/2022 8:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Code] [varchar](50) NOT NULL,
	[Seq_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Type_Code] [varchar](50) NOT NULL,
	[Product_Category_Code] [varchar](50) NOT NULL,
	[Product_Name] [varchar](50) NULL,
	[Product_Description] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[Create_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_Code] ASC,
	[Seq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/14/2022 8:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Product_Category_Code] [varchar](50) NOT NULL,
	[Seq_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NULL,
	[Category_Description] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[Create_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_ProductCategory_1] PRIMARY KEY CLUSTERED 
(
	[Product_Category_Code] ASC,
	[Seq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 6/14/2022 8:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Product_Type_Code] [varchar](50) NOT NULL,
	[Seq_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Category_Code] [varchar](50) NOT NULL,
	[Type_Name] [varchar](50) NULL,
	[Type_Description] [varchar](1000) NULL,
	[Status] [varchar](20) NULL,
	[Create_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_ProductType_1] PRIMARY KEY CLUSTERED 
(
	[Product_Type_Code] ASC,
	[Seq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Update_Date]  DEFAULT (getdate()) FOR [Update_Date]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [DF_ProductType_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [DF_ProductType_Update_Date]  DEFAULT (getdate()) FOR [Update_Date]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Active =>1 ,Inactive =>2, Deleted =>3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Active =>1 ,Inactive =>2, Deleted =>3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Active =>1 ,Inactive =>2, Deleted =>3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductType', @level2type=N'COLUMN',@level2name=N'Status'
GO