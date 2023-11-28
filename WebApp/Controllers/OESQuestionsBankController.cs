using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class OESQuestionsBankController : Controller
    {
        // GET: OESQuestionsBank
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddQuestions()
        {
            return View();
        }
    }
}