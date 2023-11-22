using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class ClearanceReportModel
    {
        public string UnitName { get; set; }
        public int ApprovedByNo { get; set; }
        public string ApprovedByRank { get; set; }
        public string ApprovedByName { get; set; }
        public DateTime ApprovedDate { get; set; }
        public string Remarks { get; set; }
    }
    public class ClearanceReportFooterModel
    {
        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
        public string Rank { get; set; }
        public string UnitName { get; set; }

        public string ClearanceName { get; set; }

        public string ClearanceUnitName { get; set; }


        public Byte[] Signature { get; set; }

        public Byte[] Stamp { get; set; }

    }

    
}