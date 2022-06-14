EXEC SaveUpdateProductCategory @pProduct_Category_Code ='Cat_A',@pSeq_Id=0,@pCategory_Name='Category1',@pCategory_Description ='Category Description1'
EXEC SaveUpdateProductCategory @pProduct_Category_Code ='Cat_B',@pSeq_Id=0,@pCategory_Name='Category2',@pCategory_Description ='Category Description2'
EXEC SaveUpdateProductCategory @pProduct_Category_Code ='Cat_C',@pSeq_Id=0,@pCategory_Name='Category3',@pCategory_Description ='Category Description3'
EXEC SaveUpdateProductCategory @pProduct_Category_Code ='Cat_D',@pSeq_Id=0,@pCategory_Name='Category4',@pCategory_Description ='Category Description4'
EXEC SaveUpdateProductCategory @pProduct_Category_Code ='Cat_E',@pSeq_Id=0,@pCategory_Name='Category5',@pCategory_Description ='Category Description5'

EXEC GetProductCategories


EXEC SaveUpdateProduct @pProduct_Code= 'Prod_A',@pSeq_Id=0,@pProduct_Type_Code='ProdType_A',@pProduct_Category_Code='Cat_A',@pProduct_Name='Product1',@pProduct_Description ='Product Description1'
EXEC SaveUpdateProduct @pProduct_Code= 'Prod_B',@pSeq_Id=0,@pProduct_Type_Code='ProdType_B',@pProduct_Category_Code='Cat_B',@pProduct_Name='Product2',@pProduct_Description ='Product Description2'
EXEC SaveUpdateProduct @pProduct_Code= 'Prod_C',@pSeq_Id=0,@pProduct_Type_Code='ProdType_C',@pProduct_Category_Code='Cat_C',@pProduct_Name='Product3',@pProduct_Description ='Product Description3'
EXEC SaveUpdateProduct @pProduct_Code= 'Prod_D',@pSeq_Id=0,@pProduct_Type_Code='ProdType_D',@pProduct_Category_Code='Cat_D',@pProduct_Name='Product4',@pProduct_Description ='Product Description4'
EXEC SaveUpdateProduct @pProduct_Code= 'Prod_E',@pSeq_Id=0,@pProduct_Type_Code='ProdType_E',@pProduct_Category_Code='Cat_E',@pProduct_Name='Product5',@pProduct_Description ='Product Description5'

EXEC GetProductTypes

EXEC SaveUpdateProductType @pProduct_Type_Code ='ProdType_A',@pSeq_Id=0, @pProduct_Category_Code='Cat_A',@pType_Name='TypeName1',@pType_Description='Type Description1'
EXEC SaveUpdateProductType @pProduct_Type_Code ='ProdType_B',@pSeq_Id=0, @pProduct_Category_Code='Cat_B',@pType_Name='TypeName2',@pType_Description='Type Description2'
EXEC SaveUpdateProductType @pProduct_Type_Code ='ProdType_C',@pSeq_Id=0, @pProduct_Category_Code='Cat_C',@pType_Name='TypeName3',@pType_Description='Type Description3'
EXEC SaveUpdateProductType @pProduct_Type_Code ='ProdType_D',@pSeq_Id=0, @pProduct_Category_Code='Cat_D',@pType_Name='TypeName4',@pType_Description='Type Description4'
EXEC SaveUpdateProductType @pProduct_Type_Code ='ProdType_E',@pSeq_Id=0, @pProduct_Category_Code='Cat_E',@pType_Name='TypeName5',@pType_Description='Type Description5'

EXEC GetProductTypes