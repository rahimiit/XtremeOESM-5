using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace apps.Services
{
    public class connectionFactory
    {
        public static string _factory = "CastleWindsor"; 
        public static string _connection =ConfigurationManager.ConnectionStrings["connectXtreme"].ConnectionString;

        
    }
}
