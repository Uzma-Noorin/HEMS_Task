using HEMSTest.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HEMSTest.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            //ProductReader reader = new ProductReader("Select * from Products", System.Data.CommandType.Text);
            //var result= reader.Execute();

            var products = ProductDataAccess.GetProducts();

            ViewBag.Products = products;

            return View();
        }

        [HttpPost]
        public ActionResult Index(int selectedTab)
        {
            ViewBag.SelectedTab = selectedTab;
            return View();
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