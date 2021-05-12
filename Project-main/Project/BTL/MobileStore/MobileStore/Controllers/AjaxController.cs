using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.DAO;
using MobileStore.Models.Entity;

namespace MobileStore.Controllers
{
    public class AjaxController : Controller
    {
        // GET: Ajax
        QL_Hang db = new QL_Hang();
        public ActionResult LoadAllProduct()
        {
            return View();
        }

        public ActionResult LoadTypeProduct()
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return PartialView(categoryDAO.SelectAll());
        }

        public ActionResult LoadProductByTypeID(int id, int page = 1, int pageSize = 20)
        {
            var product = new ProductDAO().GetByTypeId(id);
            ViewBag.Product = product;
            int totalRecord = 10;
            var model = new ProductDAO().ListByTypeId(id, ref totalRecord, page, pageSize);
            ViewBag.Id = id;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 10;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = maxPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult GetProductByTypeId(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return View(productDAO.GetByTypeId(id));
        }
       
        /*[HttpPost]
        public ActionResult SearchProduct(FormCollection f)
        {
            String keyword = f["txtTimKiem"].ToString();
            List<Product> ListProducts = db.Products.Where(n => n.productName.Contains(keyword)).ToList();
            if(ListProducts.Count == 0)
            {
                ViewBag.notification = "không tìm thấy sản phẩm";              
            }
            return View(db.Products.OrderBy(n => n.productName).ToList());
        }*/
        public ActionResult SearchProduct(String Search)
        {
            return View(db.Products.Where(n => n.productName.StartsWith(Search)));
        }

    }
}