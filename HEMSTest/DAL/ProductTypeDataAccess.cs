using HEMSTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace HEMSTest.DAL
{
    public static class ProductTypeDataAccess
    {
        private const string SPGetProductTypes = "[dbo].[GetProductTypes]";
        private const string SPDeleteProductType = "[dbo].[DeleteProductType]";
        private const string SPSaveUpdateProductType = "[dbo].[SaveUpdateProductType]";

        public static async Task<IEnumerable<ProductType>> GetProductTypes()
        {
            var result = Database.GetAllFromParameters<ProductType>(SPGetProductTypes);
            return result;
        }

        public static async Task<bool> DeleteProductType(ProductType productType)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPDeleteProductType,
                productType.Product_Type_Code,
                productType.Seq_Id);
            return result != null && result.Count > 0 ? true : false;
        }

        public static async Task<bool> SaveUpdateProductType(ProductType productType)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPSaveUpdateProductType,
                productType.Product_Type_Code,
                productType.Seq_Id,
                productType.Product_Category_Code,
                productType.Type_Name,
                productType.Type_Description);
            return result != null && result.Count > 0 ? true : false;
        }
    }
}