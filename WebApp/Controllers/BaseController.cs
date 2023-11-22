using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using apps.Services;
using CastleWindsorFactory.Core;
using Newtonsoft.Json;

namespace WebApp.Controllers
{
    public class BaseController : Controller
    {
        public BaseController()
        {

        }
        // GET: Base
        protected TResult ProcessRequest<TModel,TResult>(TModel model,string commandType)
        {
            Request request = new Request() { Value =JsonConvert.SerializeObject(model),Type=commandType};
            var command = Ioc.Resolve<ICommand>(request.Type);
            var response = command.Process(request);
            var data = JsonConvert.DeserializeObject<TResult>(response.Value.ToString());
            return data;
        }
    }
}