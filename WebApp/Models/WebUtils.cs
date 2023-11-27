using System;
using System.IO;
using System.Text;
using System.Web;
using apps.Services;
using CastleWindsorFactory.Core;
using System.Collections.Generic;
using System.Security.Cryptography;
namespace WebApp.Models
{
   
    public class WebUtils
    {
       

        //public static dynamic getStreamData(Stream inputStream)
        //{
        //    inputStream.Position = 0;
        //    return JsonConvert.DeserializeObject<dynamic>(new StreamReader(inputStream).ReadToEnd());
        //}

        public static string[] splitSerial(string serial, char delimter)
        {
            return serial.Split(delimter);
        }

        public static DateTime getDateForObject(string dateStr)
        {
            return new DateTime(Int32.Parse(dateStr.Split('/')[2]), Int32.Parse(dateStr.Split('/')[1]), Int32.Parse(dateStr.Split('/')[0]));
        }

        public static LoggedUser FindAndPopulateUserProfile(HttpContext context)
        {
            LoggedUser loggedUser = new LoggedUser();

            if (context.Request.Cookies["militaryNo"] == null)
            {
                var domainUserName = context.Request.LogonUserIdentity.Name;
                var strUserName = "";

                if (domainUserName.IndexOf("\\", StringComparison.Ordinal) >= 0)
                {
                    strUserName = domainUserName.Split('\\')[1];
                }

                //  var uRoles = AccessManager.GetUserRoles();
                // var uProfile = AccessManager.GetUserProfile();
                IDictionary<string, object> values = new Dictionary<string, object>();
                values.Add("@userId", strUserName);
                var repository = Ioc.Resolve<IRepository>();
                var uProfile = repository.GetSingle<dynamic>(StoreProcedure.Employee.UserProfileByLoginId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);

                if (uProfile != null)
                {
                    var myMilNoCookie = new HttpCookie(uProfile.EmployeeCode.ToString());
                    loggedUser.MilitryNo = uProfile.EmployeeCode;
                }               
            }

            if (context.Request.Cookies["lang"] == null)
            {
                var myLangCookie = new HttpCookie("lang");
                myLangCookie.Value = "en-US";
                myLangCookie.Expires = DateTime.Now.AddYears(1);
                context.Response.Cookies.Add(myLangCookie);
            }

            loggedUser.Lang = context.Request.Cookies["lang"].Value;

            return loggedUser;
        }


        public static void SendErrorEmail(Exception ex, string machinename, string currentMilitaryNumber, string errorEmailAddress, HttpRequest req)
        {
            if (errorEmailAddress == null)
                errorEmailAddress = "gal3238@pg.mil.ae";

            System.Net.Mail.SmtpClient mailer = new System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings["MailServer"]);
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            msg.From = new System.Net.Mail.MailAddress(errorEmailAddress);

            msg.To.Add(errorEmailAddress);
            msg.Subject = "Recall - MVC - Error";

            Exception exp = ex;
            StringBuilder sb = new StringBuilder();
            sb.Append("------------------------------------------------------------------------------");
            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);
            sb.AppendFormat("Request: {0}", req.Url.ToString());
            sb.Append(Environment.NewLine);
            sb.AppendFormat("Server : {0}", machinename);
            sb.Append(Environment.NewLine);
            string ipaddress = string.Empty;
            if (req.Headers["X-Forwarded-For"] != null)
                ipaddress = req.Headers["X-Forwarded-For"].ToString();

            sb.AppendFormat("Host Address : {0}", req.UserHostAddress);
            sb.Append(Environment.NewLine);
            sb.AppendFormat("Host Name : {0}", req.UserHostName);
            sb.Append(Environment.NewLine);
            sb.AppendFormat("IP Address : {0}", ipaddress);
            sb.Append(Environment.NewLine);
            try
            {
                sb.AppendFormat("Browser: {0}", req.Browser.Type);
                sb.Append(Environment.NewLine);
            }
            catch (Exception exception)
            {
                sb.AppendFormat("Browser: {0}", exception.ToString());
                sb.Append(Environment.NewLine);
            }
            if (!String.IsNullOrEmpty(currentMilitaryNumber))
                sb.AppendFormat("User : {0}", currentMilitaryNumber);

            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);
            sb.Append("------------------------------------------------------------------------------");
            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);
            while (exp != null)
            {
                sb.Append(exp.ToString());
                sb.Append(Environment.NewLine);
                exp = exp.InnerException;
            }

            msg.Body = sb.ToString();

            mailer.Send(msg);
        }



        #region "Encrypt/Decrpt"

        /// <summary>
        /// Encrypt context by using Cryptography
        /// </summary>
        /// <param name="plainText">context</param>
        /// <returns>encrypted 64base string</returns>
        public static string EncryptString(string plainText)
        {
            string key = "jdsg432387#";
            byte[] EncryptKey = { };
            byte[] IV = { 55, 34, 87, 64, 87, 195, 54, 21 };
            EncryptKey = System.Text.Encoding.UTF8.GetBytes(key.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByte = Encoding.UTF8.GetBytes(plainText);
            MemoryStream mStream = new MemoryStream();
            CryptoStream cStream = new CryptoStream(mStream, des.CreateEncryptor(EncryptKey, IV), CryptoStreamMode.Write);
            cStream.Write(inputByte, 0, inputByte.Length);
            cStream.FlushFinalBlock();
            return Convert.ToBase64String(mStream.ToArray());
        }

        /// <summary>
        /// Decrypt context by using Cryptography
        /// </summary>
        /// <param name="encrptText">context</param>
        /// <returns></returns>
        public static string DecyptString(string encrptText)
        {
            encrptText = encrptText.Replace(" ", "+");
            string key = "jdsg432387#";
            byte[] DecyptKey = { };
            byte[] IV = { 55, 34, 87, 64, 87, 195, 54, 21 };
            byte[] inputbyte = new byte[encrptText.Length];

            DecyptKey = System.Text.Encoding.UTF8.GetBytes(key.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputbyte = Convert.FromBase64String(encrptText);
            MemoryStream mStream = new MemoryStream();

            CryptoStream cStream = new CryptoStream(mStream, des.CreateDecryptor(DecyptKey, IV), CryptoStreamMode.Write);
            cStream.Write(inputbyte, 0, inputbyte.Length);
            cStream.FlushFinalBlock();
            System.Text.Encoding encodeing = System.Text.Encoding.UTF8;
            //if (mStream.ToString()!="")
            //{
            return encodeing.GetString(mStream.ToArray());
            // }
            //else
            //{
            //    return null;
            //}
        }

        #endregion "Encrypt/Decrpt"

    }
}