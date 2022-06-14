using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HEMSTest.Models
{
    public class ProductType
    {
        #region Constructors

        public ProductType() { }

        #endregion

        public string Product_Type_Code { get; set; }
        public int Seq_Id { get; set; }
        public string Product_Category_Code { get; set; }
        public string Type_Name { get; set; }
        public string Type_Description { get; set; }
        public string Status { get; set; }
        public DateTime? Create_Date { get; set; }
        public DateTime? Update_Date { get; set; }

    }
}