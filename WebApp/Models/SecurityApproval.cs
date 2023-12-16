using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class SecurityApproval
    {
       
           
        public string RequestId { get; set; }
        public string RequestDate { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string FromTime { get; set; }
        public string ToTime { get; set; }

         public int EmployeeCode { get; set; }
         public string EmployeeName { get; set; }
        public string EmployeeUnit { get; set; }

        public int userCode { get; set; }
        public string userName { get; set; }
        public string userUnit { get; set; }

        public int securityCode { get; set; }
         public string securityName { get; set; }
         public string securityUnit { get; set; }
        public DateTime ApprovalDate { get; set; }

        public string Remarks { get; set; }

        public byte[] Signature { get; set; }
        public byte[] Stamp { get; set; }

    }
}