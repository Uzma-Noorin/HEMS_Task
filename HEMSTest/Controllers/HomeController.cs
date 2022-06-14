using HEMSTest.DAL;
using HEMSTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace HEMSTest.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public async Task<ActionResult> Index()
        {
            //ProductReader reader = new ProductReader("Select * from Products", System.Data.CommandType.Text);
            //var result= reader.Execute();

            ViewBag.Categories = new List<Category>();
            ViewBag.Types = new List<ProductType>();
            ViewBag.Products = new List<Product>();

            var categories = await CategoryDataAccess.GetCategories();
            if (categories != null)
            {
                ViewBag.Categories = categories;
            }

            var types = await ProductTypeDataAccess.GetProductTypes();
            if (types != null)
            {
                ViewBag.Types = types;
            }

            var products = await ProductDataAccess.GetProducts();
            if (products != null)
            {
                ViewBag.Products = products;
            }

            return View();
        }

        //[HttpPost]
        //public ActionResult Index(int selectedTab)
        //{
        //    ViewBag.SelectedTab = selectedTab;
        //    return View();
        //}

        public async Task<ActionResult> DeleteCategory(int seqID, string categoryCode)
        {
            bool isDeleted = await CategoryDataAccess.DeleteCategory(new Category() { Seq_Id = seqID, Product_Category_Code = categoryCode });
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> DeleteProductType(int seqID, string productTypeCode)
        {
            bool isDeleted = await ProductTypeDataAccess.DeleteProductType(new ProductType() { Seq_Id = seqID, Product_Type_Code = productTypeCode });
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> DeleteProduct(int seqID, string productCode)
        {
            bool isDeleted = await ProductDataAccess.DeleteProduct(new Product() { Seq_Id = seqID, Product_Code = productCode });
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<ActionResult> EditCategory(string category_code, int seq_id, string category_name, string category_des)
        {
            bool isUpdated = await CategoryDataAccess.SaveUpdateCategory(new Category() { Seq_Id = seq_id, Product_Category_Code = category_code, Category_Name = category_name, Category_Description = category_des });
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<ActionResult> EditType(string type_category_code, int type_seq_id, string type_code, string type_name, string type_des)
        {
            bool isUpdated = await ProductTypeDataAccess.SaveUpdateProductType(new ProductType() { Seq_Id = type_seq_id, Product_Category_Code = type_category_code, Product_Type_Code = type_code, Type_Name = type_name, Type_Description = type_des });
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<ActionResult> EditProduct(string prod_category_code, int prod_seq_id, string prod_type_code, string product_code, string product_name, string product_des)
        {
            bool isUpdated = await ProductDataAccess.SaveUpdateProduct(new Product() { Seq_Id = prod_seq_id, Product_Category_Code = prod_category_code, Product_Type_Code = prod_type_code, Product_Code = product_code, Product_Name = product_name, Product_Description = product_des });
            return RedirectToAction("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}