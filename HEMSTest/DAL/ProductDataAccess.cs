using HEMSTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace HEMSTest.DAL
{
    public static class ProductDataAccess
    {
        private const string SPGetProducts = "[dbo].[GetProducts]";
        private const string SPDeleteProduct = "[dbo].[DeleteProduct]";
        private const string SPSaveUpdateProduct = "[dbo].[SaveUpdateProduct]";

        public static async Task<IEnumerable<Product>> GetProducts()
        {
            var result = Database.GetAllFromParameters<Product>(SPGetProducts);
            return result;
        }

        public static async Task<bool> DeleteProduct(Product product)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPDeleteProduct,
                product.Product_Code,
                product.Seq_Id);
            return result != null && result.Count > 0 ? true : false;
        }

        public static async Task<bool> SaveUpdateProduct(Product product)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPSaveUpdateProduct,
                product.Product_Code,
                product.Seq_Id,
                product.Product_Type_Code,
                product.Product_Category_Code,
                product.Product_Name,
                product.Product_Description);
            return result != null && result.Count > 0 ? true : false;
        }
    }
}