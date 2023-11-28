using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class OESUsersController : Controller
    {
        // GET: OESUsers
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddUsers()
        {
            return View();
        }
    }
}