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

        public static async Task<IEnumerable<Product>> GetProducts()
        {
            var result = Database.GetAllFromParameters<Product>(SPGetProducts);
            return result;
        }
    }
}