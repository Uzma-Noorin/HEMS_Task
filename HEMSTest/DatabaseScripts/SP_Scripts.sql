
CREATE OR ALTER PROCEDURE GetProductCategories
AS
BEGIN
	SELECT
		 [Product_Category_Code]
		,[Seq_Id]
		,[Category_Name]
		,[Category_Description]
		,[Status]
		,[Create_Date]
		,[Update_Date]
	from [dbo].[ProductCategory] (nolock) where [Status] ='Active'
	Order by [Seq_Id] ASC
END
GO

CREATE OR ALTER PROCEDURE SaveUpdateProductCategory

	@pProduct_Category_Code varchar(50),
	@pSeq_Id int =0,
	@pCategory_Name varchar(50) = null,
	@pCategory_Description varchar(500) = null

AS
BEGIN

IF @pSeq_Id>0
BEGIN
IF EXISTS(SELECT 1 From dbo.[ProductCategory] (nolock) where Product_Category_Code = @pProduct_Category_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active')
	BEGIN
		UPDATE dbo.[ProductCategory] set [Status] ='Inactive',Update_Date =GETUTCDATE()  where Product_Category_Code = @pProduct_Category_Code AND  [Status] ='Active'AND Seq_Id = @pSeq_Id 
	END
	INSERT INTO dbo.[ProductCategory](
					[Product_Category_Code]
					,[Category_Name]
					,[Category_Description]
					,[Status]
					,[Create_Date]
					,[Update_Date])
         
			 SELECT  ISNULL(@pProduct_Category_Code, [Product_Category_Code]) as ProductCategoryCode,
					 ISNULL(@pCategory_Name, Category_Name) as Category_Name,
					 ISNULL(@pCategory_Description, Category_Description) as CategoryDescription,
					 'Active',
					 GETUTCDATE(),
					 NULL
			 FROM dbo.[ProductCategory] (nolock) 
			 where Product_Category_Code = @pProduct_Category_Code AND Seq_Id = @pSeq_Id 

			select @@ROWCOUNT as [Count]
			RETURN
END
ELSE
	BEGIN
	INSERT INTO dbo.[ProductCategory](
					[Product_Category_Code]
					,[Category_Name]
					,[Category_Description]
					,[Status]
					,[Create_Date]
					,[Update_Date])
         
			 VALUES( @pProduct_Category_Code,
					 @pCategory_Name,
					 @pCategory_Description,
					 'Active',
					 GETUTCDATE(),
					 NULL
					 )
			select @@ROWCOUNT as [Count]
			RETURN
	END

END
	
GO
CREATE OR ALTER PROCEDURE DeleteProductCategory
	@pProduct_Category_Code varchar(50),
	@pSeq_Id int =0

AS
BEGIN
	UPDATE dbo.[ProductCategory] set [Status] ='Deleted',Update_Date =GETUTCDATE()  where Product_Category_Code = @pProduct_Category_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active'

		select @@ROWCOUNT as [Count]

END
GO

CREATE OR ALTER PROCEDURE GetProducts
AS
BEGIN
	SELECT
		 P.[Product_Code]
		,P.[Seq_Id]
		,P.[Product_Type_Code]
		,P.[Product_Category_Code]
		,P.[Product_Name]
		,P.[Product_Description]
		,P.[Status]
		,P.[Create_Date]
		,P.[Update_Date]
	from dbo.Product  P(nolock) 
	JOIN [dbo].[ProductCategory] PCT (nolock) 
	ON P.Product_Category_Code = PCT.Product_Category_Code AND PCT.[Status] = 'Active'
	where P.[Status] ='Active'
	Order by [Seq_Id] ASC
END
GO

CREATE OR ALTER PROCEDURE SaveUpdateProduct

	@pProduct_Code varchar(50),
	@pSeq_Id int =0,
	@pProduct_Type_Code varchar(50) = null,
	@pProduct_Category_Code varchar(50) = null,
	@pProduct_Name varchar(250) = null,
	@pProduct_Description varchar(500) = null

AS
BEGIN

IF @pSeq_Id>0
BEGIN
IF EXISTS(SELECT 1 From dbo.Product (nolock) where [Product_Code] = @pProduct_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active')
	BEGIN
		UPDATE dbo.Product set [Status] ='Inactive',Update_Date =GETUTCDATE()  where [Product_Code] = @pProduct_Code AND  [Status] ='Active'AND Seq_Id = @pSeq_Id
		
	END
	INSERT INTO dbo.Product(
					Product_Code
					,Product_Type_Code
					,Product_Category_Code
					,Product_Name
					,Product_Description
					,Status
					,Create_Date
					,Update_Date)
         
			 SELECT  ISNULL(@pProduct_Code, Product_Code) as ProductCode,
					 ISNULL(@pProduct_Type_Code, Product_Type_Code) as ProductTypeCode,
					 ISNULL(@pProduct_Category_Code, Product_Category_Code) as ProductCategoryCode,
					 ISNULL(@pProduct_Name, Product_Name) as ProductName,
					 ISNULL(@pProduct_Description, Product_Description) as ProductDescription,
					 'Active',
					 GETUTCDATE(),
					 NULL
			 FROM dbo.Product (nolock) 
			 where [Product_Code] = @pProduct_Code AND Seq_Id = @pSeq_Id 

			select @@ROWCOUNT as [Count]
			RETURN
END
ELSE
	BEGIN
	INSERT INTO dbo.Product(
						Product_Code
						,Product_Type_Code
						,Product_Category_Code
						,Product_Name
						,Product_Description
						,Status
						,Create_Date
						,Update_Date)

				VALUES
						(
						@pProduct_Code
						,@pProduct_Type_Code
						,@pProduct_Category_Code
						,@pProduct_Name
						,@pProduct_Description
						,'Active'
						,GETUTCDATE()
						,NULL
						)
						select @@ROWCOUNT as [Count]
						RETURN
	END

END
	
GO
CREATE OR ALTER PROCEDURE DeleteProduct
	@pProduct_Code varchar(50),
	@pSeq_Id int =0

AS
BEGIN
	UPDATE dbo.Product set [Status] ='Deleted',Update_Date =GETUTCDATE()  where [Product_Code] = @pProduct_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active'

	select @@ROWCOUNT as [Count]
END
GO

CREATE OR ALTER PROCEDURE GetProductTypes
AS
BEGIN
	SELECT
		 PT.[Product_Type_Code]
		,PT.[Seq_Id]
		,PT.[Product_Category_Code]
		,PT.[Type_Name]
		,PT.[Type_Description]
		,PT.[Status]
		,PT.[Create_Date]
		,PT.[Update_Date]
	from [dbo].[ProductType] PT (nolock)
	JOIN [dbo].[ProductCategory] PCT (nolock)
	ON PT.Product_Category_Code = PCT.Product_Category_Code AND PCT.[Status] ='Active'
	where PT.[Status] ='Active'
	Order by PT.[Seq_Id] ASC
END
GO

CREATE OR ALTER PROCEDURE SaveUpdateProductType

	@pProduct_Type_Code varchar(50),
	@pSeq_Id int =0,
	@pProduct_Category_Code varchar(50) = null,
	@pType_Name varchar(50) = null,
	@pType_Description varchar(500) = null

AS
BEGIN

IF @pSeq_Id>0
BEGIN
IF EXISTS(SELECT 1 From dbo.[ProductType] (nolock) where [Product_Type_Code] = @pProduct_Type_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active')
	BEGIN
		UPDATE dbo.[ProductType] set [Status] ='Inactive',Update_Date =GETUTCDATE()  where [Product_Type_Code] = @pProduct_Type_Code AND  [Status] ='Active'AND Seq_Id = @pSeq_Id 
	END
	INSERT INTO dbo.[ProductType](
					Product_Type_Code
					,Product_Category_Code
					,[Type_Name]
					,Type_Description
					,Status
					,Create_Date
					,Update_Date)
         
			 SELECT  ISNULL(@pProduct_Type_Code, Product_Type_Code) as ProductTypeCode,
					 Product_Category_Code,
					 ISNULL(@pType_Name, [Type_Name]) as TypeName,
					 ISNULL(@pType_Description, Type_Description) as TypeDescription,
					 'Active',
					 GETUTCDATE(),
					 NULL
			 FROM dbo.[ProductType] (nolock) 
			 where Product_Type_Code = @pProduct_Type_Code AND Seq_Id = @pSeq_Id 

			select @@ROWCOUNT as [Count]
			RETURN
END
ELSE
	BEGIN
	INSERT INTO dbo.[ProductType](
					Product_Type_Code
					,Product_Category_Code
					,[Type_Name]
					,Type_Description
					,Status
					,Create_Date
					,Update_Date)
         
			 VALUES (  @pProduct_Type_Code,
					@pProduct_Category_Code,
					 @pType_Name,
					 @pType_Description,
					 'Active',
					 GETUTCDATE(),
					 NULL
						)
			select @@ROWCOUNT as [Count]
			RETURN
	END

END
	
GO
CREATE OR ALTER PROCEDURE DeleteProductType
	@pProduct_Type_Code varchar(50),
	@pSeq_Id int =0

AS
BEGIN
	UPDATE dbo.[ProductType] set [Status] ='Deleted',Update_Date =GETUTCDATE()  where Product_Type_Code = @pProduct_Type_Code AND Seq_Id = @pSeq_Id  AND  [Status] ='Active'

	select @@ROWCOUNT as [Count]
END
GO