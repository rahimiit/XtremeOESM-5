using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class OESSubjectController : Controller
    {
        // GET: OESSubject
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddSubjects()
        {
            return View();
        }
    }
}