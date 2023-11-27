using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class MenuViewModel
    {
        public IEnumerable<dynamic> TopMenuItems { get; set; }
        public IEnumerable<dynamic> AllMenus { get; set; }
        public IEnumerable<dynamic> UserRoles { get; set; }
        public int CurrentRoleID { get; set; }

       // public string menuIcon { get; set; }
    }
}