﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class OESExamController : Controller
    {
        // GET: OESExam
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddExam()
        {
            return View();
        }
    }
}