using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;

using System.Web.Mvc;
using System.Web.Routing;
using WebApp.Models;
namespace WebApp.Routing
{
    public class CustomFilterAttribute: ActionFilterAttribute, IActionFilter
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.HttpContext.Response.SuppressFormsAuthenticationRedirect = true;

            string redirectPath = "~/Error/General";
          
            base.OnActionExecuting(filterContext);
        }
    }




    /// <summary>
    /// Encrypted action parameter attribute Class
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class EncryptedActionParameterAttribute : ActionFilterAttribute, IActionFilter
    {

        /// <summary>
        /// if u add [EncryptedActionParameter] on your action this will decrypt all parameters automatically. MenuCode parameter should be must to validate the user have authorization on the form
        /// </summary>
        /// <param name="filterContext">filter context/QueryString</param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.HttpContext.Response.SuppressFormsAuthenticationRedirect = true;

            string redirectPath = "~/Error/General";
            if (System.Configuration.ConfigurationManager.AppSettings["CustomErrorPagePath"] != null)
            {
                redirectPath = System.Configuration.ConfigurationManager.AppSettings["CustomErrorPagePath"];
            }
            //if (System.Web.HttpContext.Current.Session["military_no"] == null)
            //{

            //    //if(filterContext.HttpContext.Request.IsAjaxRequest())
            //    //{
            //    filterContext.HttpContext.Response.StatusCode = 403;
            //    // filterContext.HttpContext.Response.Write("SessionTimeout");
            //    //  filterContext.HttpContext.Response.End();
            //   // AccessManager.GetUserRoles();
            //    //filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary {
            //    //    {"action","Index" },
            //    //    {"controller","Home" },
            //    //    {"returnUrl",filterContext.HttpContext.Request.RawUrl }
            //    //});
            //    //filterContext.Result = new RedirectResult("~/Home/Index?message=SessionTimeout");
            //    //base.OnActionExecuting(filterContext);
            //    return;
            //    //}
            //}
            //if (Convert.ToInt32(System.Web.HttpContext.Current.Session["IsShow"]) == 0)
            //{

            //    filterContext.Result = new RedirectResult(redirectPath + "?message=Please Contact Help Desk");
            //    base.OnActionExecuting(filterContext);
            //    return;
            //}
            if (filterContext.HttpContext.Request.UrlReferrer == null
           || filterContext.HttpContext.Request.Url.Host != filterContext.HttpContext.Request.UrlReferrer.Host)
            {

                filterContext.Result = new RedirectResult(redirectPath + "?message=Not Allowed");
                base.OnActionExecuting(filterContext);
                return;
                //filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { area = "", controller = "Error", action = "General", message = "Not Allowed" }));
            }

            // int MenuCode = 0;
            //if (filterContext.ActionDescriptor.ControllerDescriptor.ControllerName != "Home" && filterContext.ActionDescriptor.ActionName != "Index")
            //{
            if (HttpContext.Current.Request.QueryString.Get("q") != null)
            {
                Dictionary<string, object> decryptedParametes = new Dictionary<string, object>();
                string encrptedQueryString = HttpContext.Current.Request.QueryString.Get("q");
                string decyptedString ="";
                try
                {
                    decyptedString = WebUtils.DecyptString(encrptedQueryString).Trim();
                }
                catch (Exception ex)
                {
                    if (ex.HResult == -2146233033)
                    {
                        filterContext.Result = new RedirectResult(redirectPath);
                    }
                }

                string[] paramsArrs = decyptedString.Split('?');
                if (paramsArrs[0] != "")
                {
                    for (int i = 0; i < paramsArrs.Length; i++)
                    {
                        string[] paraArr = paramsArrs[i].Split('=');
                        decryptedParametes.Add(paraArr[0], paraArr[1]);
                    }

                    for (int i = 0; i < decryptedParametes.Count; i++)
                    {
                        filterContext.ActionParameters[decryptedParametes.Keys.ElementAt(i)] = decryptedParametes.Values.ElementAt(i);
                    }
                    var MenuItem = decryptedParametes.Where(p => p.Key == "MenuCode")
                        .ToDictionary(p => p.Key, p => p.Value).FirstOrDefault();

                    if (MenuItem.Key == "MenuCode")
                    {
                        int MenuCode = Convert.ToInt32(MenuItem.Value);

                        //  MenuCode = Convert.ToInt32(QueryString.Split('=').ToList()[1]);
                      //  MenuOperation MenuOp = AccessManager.GetMenuOperationByRole(MenuCode).FirstOrDefault();
                      //  if (MenuOp.Operations != null)
                      //  {
                      //      if (Convert.ToInt32(System.Web.HttpContext.Current.Session["IsShow"]) == 0)
                      //      {

                      //          filterContext.Result = new RedirectResult(redirectPath + "?message=Please Contact Help Desk");
                      //          base.OnActionExecuting(filterContext);
                      //          return;
                      //      }

                      //      List<string> _result = MenuOp.Operations.Split(',')
                      //.ToList();
                      //      if (_result.IndexOf("btnView") < 0)
                      //      {
                      //          filterContext.Result = new RedirectResult(redirectPath + "?message=Access Denied!!");

                      //      }
                      //  }


                      //  else
                      //  {
                      //      filterContext.Result = new RedirectResult(redirectPath + "?message=Access Denied!!");

                      //  }
                    }
                    else
                    {
                        filterContext.Result = new RedirectResult(redirectPath + "?message=Access Denied!!");
                    }
                }
                else
                {
                    filterContext.Result = new RedirectResult(redirectPath);
                }
            }
            //else if (HttpContext.Current.Request.QueryString.Get("MenuCode") != null)
            //{
            //    int MenuCode = Convert.ToInt32(HttpContext.Current.Request.QueryString.Get("MenuCode"));

            //    //  MenuCode = Convert.ToInt32(QueryString.Split('=').ToList()[1]);
            //   // MenuOperation MenuOp = AccessManager.GetMenuOperationByRole(MenuCode).FirstOrDefault();
            //  //  if (MenuOp.Operations != null)
            //  //  {
            //  //      if (Convert.ToInt32(System.Web.HttpContext.Current.Session["IsShow"]) == 0)
            //  //      {

            //  //          filterContext.Result = new RedirectResult(redirectPath + "?message=Please Contact Help Desk");
            //  //          base.OnActionExecuting(filterContext);
            //  //          return;
            //  //      }
            //  //      List<string> _result = MenuOp.Operations.Split(',')
            //  //.ToList();
            //  //      if (_result.IndexOf("btnView") < 0)
            //  //      {
            //  //          filterContext.Result = new RedirectResult(redirectPath + "?message=Access Denied!!");

            //  //      }
            //  //  }


            //  //  else
            //  //  {
            //  //      filterContext.Result = new RedirectResult(redirectPath);

            //  //  }
            //}

            //else
            //{
            //    //  base.OnActionExecuting(filterContext);
            //    filterContext.Result = new RedirectResult("~/Home/AccessDenied");

            //}

            base.OnActionExecuting(filterContext);
        }



    }

}