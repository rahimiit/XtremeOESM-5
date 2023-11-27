using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using System.Threading;
using System.Globalization;
using CastleWindsorFactory.Core;
using WebApp.lic;
using apps.Services;
using WebApp.Models;
namespace WebApp
{
    public class Global : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            // BundleConfig.RegisterBundles(BundleTable.Bundles);

            Aspose.Pdf.License l = new Aspose.Pdf.License();
            l.SetLicense(License.LStream);

            Aspose.Cells.License lCells = new Aspose.Cells.License();
            lCells.SetLicense(License.LStreamCells);

        }
        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("Server");
            Response.Headers.Remove("X-AspNet-Version");
            string[] strs = Response.Headers.GetValues("X-Frame-Options");
            if (strs != null)
            {
                Response.Headers.Remove("X-Frame-Options");
            }
        }

      
        protected void Session_Start(object sender, EventArgs e)
        {

          
        }
        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            var ckLanguage = Request.Cookies["lang"];
            if (ckLanguage != null)
            {
                var currentLanguage = ckLanguage.Value;
                Thread.CurrentThread.CurrentCulture = new CultureInfo(currentLanguage);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(currentLanguage);
            }
        }
    }
}