using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class StudentExamController : Controller
    {
        // GET: StudentExam
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult passedExam()
        {
            return View();
        }
        public ActionResult currentExam()
        {
            return View();
        }
        public ActionResult upcomingexam()
        {
            return View();
        }
        
    }
}