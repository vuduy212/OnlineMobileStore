using MobileStore.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileStore.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login

        QL_Hang db = new QL_Hang();
        // GET: Login
        public ActionResult Index()
        {
            //Login login = new Login();
            var userId = Response.Cookies["UserId"];

            if (userId.Value != null && userId.Value != "" && int.Parse(userId.Value) != 0)
            {
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        [HttpPost]
        public ActionResult Index(User login)
        {
            var passDb = md5(login.Password);
            var userLogins = db.Users.Where(u => u.Username == login.Username && u.Password == passDb).FirstOrDefault();
            string message = string.Empty;
            int type;
            if (userLogins != null)
            {
                Response.Cookies["isLogined"].Value = "true";
                Response.Cookies["idUser"].Value = userLogins.UserID.ToString();
                Response.Cookies["UserName"].Value = "" + userLogins.Username;
                Response.Cookies["isLogined"].Expires = DateTime.Now.AddDays(2);
                Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(2);
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(2);

                if (userLogins.UserID.ToString() == "4")
                {
                    Response.Cookies["isAdmin"].Value = "true";
                }
                else
                {
                    Response.Cookies["isAdmin"].Value = "false";
                }
                return RedirectToAction("Index", "Home");
            }
            message = "Tài khoản hoặc mật khẩu không chính xác";
            type = 2;
            SetAlert(message, type);
            return RedirectToAction("Index", "Login");
        }

        public ActionResult DangnhapFace()
        {
            var accessToken = Request.Cookies["accessToken"].Value.ToString();
            var graphDomain = Request.Cookies["graphDomain"].Value.ToString();
            var userID = Request.Cookies["userID"].Value.ToString();
            
            User userLogin = new User();
            var userLoginDb = from u in db.Users select u;
            userLoginDb = (IQueryable<User>)userLoginDb.Where(u => u.UserID.ToString() == userID).FirstOrDefault();
            if (userLoginDb == null)
            {
                userLogin.Username = null;
                userLogin.Password = null;
                userLogin.UserID = long.Parse(userID);
                db.Configuration.ValidateOnSaveEnabled = false;
                db.Users.Add(userLogin);
                db.SaveChanges();
            }
            Response.Cookies["isLogined"].Value = "true";
            return RedirectToAction("Index", "Home");
        }



        public static byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public static string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }
        public ActionResult Fogot()
        {
            return View();
        }
        public ActionResult SendEmail()
        {
            String content = System.IO.File.ReadAllText(Server.MapPath("~/Views/Login/template.cshtml"));
            var toEmail = Request.Cookies["emailTo"].Value.ToString();
            //new System.Data.Common.MailHelper().senEmail(toEmail, "Thay đổi mật khẩu", content);
            return View();
        }
        public ActionResult ChangePass()
        {
            return View();
        }
        public ActionResult ThayDoiMatKhau()
        {
            var passChange = Request.Cookies["passChange"].Value.ToString();
            var userId = Session["idUser"].ToString();
            User userLogin = new User();
            userLogin = db.Users.Where(u => u.UserID.ToString() == userId).FirstOrDefault();
            userLogin.Password = md5(passChange);
            db.SaveChanges();
            return RedirectToAction("Index", "Login");

        }

        public ActionResult Logout()
        {
            Response.Cookies["idUser"].Value = "0";
            Response.Cookies["isLogined"].Value = "false";
            Response.Cookies["isAdmin"].Value = "false";
            return RedirectToAction("Index", "Home");
        }

        protected void SetAlert(string message, int type)
        {
            TempData["AlertMessage"] = message;
            if (type == 1)
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == 2)
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == 3)
            {
                TempData["AlertType"] = "alert-danger";
            }
            else
            {
                TempData["AlertType"] = "alert-info";
            }
        }
    }
}
