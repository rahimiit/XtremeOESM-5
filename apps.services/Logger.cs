using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;

namespace apps.Services
{
 public static   class Logger
    {
        public static string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory + ConfigurationManager.AppSettings["ErrorLog"], string.Format("Error{0:dd-MM-yyyy}.txt", DateTime.Now));
        public static void Info(string Message)
        {
            try
            {
                if (!File.Exists(path))
                {
                    using (StreamWriter w = File.CreateText(path))
                    {
                        w.WriteLine(DateTime.Now.ToString("HH:mm:ss") + ":" + "Service Started");
                        w.WriteLine("*********************************************************************************");
                    }
                }
                else if (File.Exists(path))
                {
                    using (StreamWriter w = File.AppendText(path))
                    {
                        w.WriteLine(DateTime.Now.ToString("HH:mm:ss") + ":" + Message);
                        w.WriteLine("*********************************************************************************");
                    }
                }
            }
            catch(Exception ex)
            {
                using(StreamWriter w = File.CreateText(path))
                {
                    w.Write(ex.Message);
                }
            }
        }

        public static void Error(string Message, string StackTrace)
        {
            if (!File.Exists(path))
            {
                using (StreamWriter w = File.CreateText(path))
                {
                    w.WriteLine(DateTime.Now.ToString("HH:mm:ss") + ":" + "Service Started");
                    w.WriteLine("*********************************************************************************");
                }
            }
            else if (File.Exists(path))
            {
                using (StreamWriter w = File.AppendText(path))
                {
                    w.WriteLine(DateTime.Now.ToString("HH:mm:ss") + ":" + Message);
                    w.WriteLine("*********************************************************************************");
                }
            }
        }
    }
}
