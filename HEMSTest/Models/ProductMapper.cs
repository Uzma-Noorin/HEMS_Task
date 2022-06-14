using HEMSTest.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HEMSTest.Models
{
    public class ProductMapper : MapperBase<Product>
    {
        protected override Product Map(IDataRecord record)
        {
            Product p = new Product();
            try
            {
                p.Seq_Id = (DBNull.Value == record["Seq_Id"]) ? 0 : (int)record["Seq_Id"];

                p.Product_Category_Code = (DBNull.Value == record["Product_Category_Code"]) ?
                    string.Empty : (string)record["Product_Category_Code"];

                p.Product_Code = (DBNull.Value == record["Product_Code"]) ?
                    string.Empty : (string)record["Product_Code"];

                p.Product_Name = (DBNull.Value == record["Product_Name"]) ?
                    string.Empty : (string)record["Product_Name"];

                p.Product_Type_Code = (DBNull.Value == record["Product_Type_Code"]) ?
                    string.Empty : (string)record["Product_Type_Code"];

                p.Product_Description = (DBNull.Value == record["Product_Description"]) ?
                    string.Empty : (string)record["Product_Description"];

                p.Status = (DBNull.Value == record["Status"]) ?
                    string.Empty : (string)record["Status"];

                p.Update_Date = (DateTime)record["Update_Date"];

                p.Create_Date = (DateTime)record["Create_Date"];


            }
            catch
            {

            }
            return p;
        }
    }
}