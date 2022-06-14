using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HEMSTest.Models
{
    public class Product
    {
        #region Constructors

        public Product() { }

        #endregion

        public string Product_Code { get; set; }
        public int Seq_Id { get; set; }
        public string Product_Type_Code { get; set; }
        public string Product_Category_Code { get; set; }
        public string Product_Name { get; set; }
        public string Product_Description { get; set; }
        public string Status { get; set; }
        public DateTime? Create_Date { get; set; }
        public DateTime? Update_Date { get; set; }

    }
}