﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult XtremeDashboard()
        {
       
            return View();
        }
    }
}