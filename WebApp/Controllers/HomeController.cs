using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        { 
            @ViewBag.UserId = 12000255;
            return View();
        }
        public ActionResult Login()
        {
            @ViewBag.UserId = 12000255;
            return View();
        }
        public ActionResult XtremeDashboard()
        {
       
            return View();
        }
        public ActionResult XtremeUserDashboard()
        {

            return View();
        }
        public ActionResult Logout()
        {
            // Clear the session
            Session.Clear();
 
            FormsAuthentication.SignOut();


            return RedirectToAction("Login");
        }
    }
}