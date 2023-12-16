using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class LoggedUser
    {
        private MenuViewModel _MenuViewModel;
        public MenuViewModel MenuViewModel
        {
            get { return _MenuViewModel; }
            set { _MenuViewModel = value; }
        }


        private UserProfileViewModel _UserProfileVM;
        public UserProfileViewModel UserProfileVM
        {
            get
            {
                return _UserProfileVM;
            }

            set { _UserProfileVM = value; }
        }


        public int MilitryNo { get; set; }

        private int _Level;
        public int Level
        {
            get { return _Level; }
            set { _Level = value; }
        }

        private string _Lang;
        public string Lang
        {
            get { return _Lang != null ? _Lang : "en-US"; }
            set { _Lang = value; }
        }

        private byte[] _UserImage;
        public byte[] UserImage
        {
            get { return _UserImage; }
            set { _UserImage = value; }
        }

        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string RoleDescription { get; set; }
        public string RoleTag { get; set; }
        public int? RoleUnitAccessLevel { get; set; }

    }
}