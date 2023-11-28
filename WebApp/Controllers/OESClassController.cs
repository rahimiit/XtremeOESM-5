using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class OESClassController : Controller
    {
        // GET: OESClass
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult OESAddClasss()
        {
            return View();


        }
    }
}