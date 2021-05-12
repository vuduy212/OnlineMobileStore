using MobileStore.Models;
using MobileStore.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileStore.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        QL_Hang db = new QL_Hang();
        // GET: Register
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Register register)
        {
            Customer cus = new Customer();
            cus.Fullname = register.FullName;
            cus.PhoneNumber = register.PhoneNumber;
            db.Customers.Add(cus);
            db.SaveChanges();
            User userLogin = new User();
            userLogin.Username = register.UserName;
            userLogin.Password = md5(register.PassWord);
            var userFilter = db.Customers.Where(u => u.PhoneNumber == register.PhoneNumber).FirstOrDefault();
            if (userFilter != null)
            {
                userLogin.UserID =  userFilter.Id;
            }
            db.Users.Add(userLogin);
            db.SaveChanges();
            return RedirectToAction("Index", "Login");
        }

        private object Add(Customer cus)
        {
            throw new NotImplementedException();
        }

        public ActionResult RegisterAccount()
        {
            var userName = Request.Cookies["userNameRegister"].Value.ToString();
            var pass = Request.Cookies["passWordRegister"].Value.ToString();
            var phoneNumber = Request.Cookies["phoneNumberRegister"].Value.ToString();
            var fullName = Request.Cookies["fullNameRegister"].Value.ToString();
            var cusDb = from u in db.Customers select u;
            cusDb = (IQueryable<Customer>)cusDb.Where(u => u.PhoneNumber == phoneNumber).FirstOrDefault();
            if (cusDb != null)
            {
                return RedirectToAction("Index", "Register");
            }
            else
            {
                Customer cus = new Customer();
                cus.Fullname = fullName;
                cus.PhoneNumber = phoneNumber;
                db.Customers.Add(cus);
                db.SaveChanges();
                User userLogin = new User();
                userLogin.Username = userName;
                userLogin.Password = md5(pass);
                var userFilter = db.Customers.Where(u => u.PhoneNumber == phoneNumber).FirstOrDefault();
                if (userFilter != null)
                {
                    userLogin.UserID =  userFilter.Id;
                }
                db.Users.Add(userLogin);
                db.SaveChanges();
                return RedirectToAction("Index", "Login");
            }
            //return View();
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
    }
}
