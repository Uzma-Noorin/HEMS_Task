using HEMSTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace HEMSTest.DAL
{
    public static class CategoryDataAccess
    {
        private const string SPGetCategories = "GetProductCategories";
        private const string SPDeleteCategory = "DeleteProductCategory";
        private const string SPSaveUpdateCategory = "[dbo].[SaveUpdateProductCategory]";

        public static async Task<IEnumerable<Category>> GetCategories()
        {
            var result = Database.GetAllFromParameters<Category>(SPGetCategories);
            return result;
        }

        public static async Task<bool> DeleteCategory(Category category)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPDeleteCategory, 
                category.Product_Category_Code,
                category.Seq_Id);
            return result != null && result.Count > 0 ? true : false;
        }

        public static async Task<bool> SaveUpdateCategory(Category category)
        {
            var result = Database.GetFirstFromParameters<SingleColumnResult>(SPSaveUpdateCategory,
                category.Product_Category_Code,
                category.Seq_Id,
                category.Category_Name,
                category.Category_Description);
            return result != null && result.Count > 0 ? true : false;
        }
    }
}