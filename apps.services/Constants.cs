using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apps.Services
{
    public class APPS_COMMANDS
    {
       public const string GET_USER_PROFILE_BY_ID= "getUserProfilebyId";
        public const string GET_USER_ROLE_BY_ID = "getuserrolebyid";
        public const string GET_USER_ROLES = "getUserRoles";
        public const string GET_MENU_BY_ROLE = "getMenusbyRoleId";
        public const string GET_MENU_BY_PARENT = "getMenusbyParentId";
        public const string GET_CAMP_BY_IP = "getCampByIP";
        public const string LIST_GHQ_UNITS = "listGHQUnits";
        public const string Get_USER_LOGIN = "GetUserLogin";
    }
    public class OESCLASS_COMMANDS
    {
        public const string OES_ADD_CLASS = "OESAddClass";
        public const string OES_DELETE_CLASS = "OESDeleteClass";
        public const string OES_GET_CLASSBYID = "OESGetClassById";

    }
    public class OESSUBJECT_COMMANDS
    {
        public const string OES_ADD_SUBJECT = "OESAddSubject";
        public const string OES_DELETE_SUBJECT = "OESDeleteSubject";
        public const string OES_GET_SUBJECTBYID = "OESGetSubjectById";
        public const string OES_GET_SUBJECT_SELECT = "OESSubjectSelect";
        

    }
    public class OESQUESTION_COMMANDS
    {
        public const string OES_ADD_QUESTION = "OESAddQuestion";
        public const string OES_DELETE_QUESTION = "OESDeleteQuestion";
        public const string OES_GET_QuestionBy_Id = "OESGetQuestionById";
        public const string OES_GET_QUESTIONS_SELECT = "OESQuestionSelect";
        public const string OES_GET_SUBJECT_DROP_DOWN = "OESGetSubjectDropDown";
        public const string OES_GET_QUESTIONTYPE_DROP_DOWN = "OESGetQuestionTypeDropDown";


    }
    public class OESUSER_COMMANDS
    {
        public const string OES_ADD_USER = "OESAddUser";
        public const string OES_DELETE_USER = "OESDeleteUser";
        public const string OES_GET_USERById = "OESGetUserById";
        public const string OES_GET_USERALL = "OESGetUserAll";
        public const string OES_GET_USEROLE_DROP_DOWN = "OESGetUserRoleDropDown";
        public const string OES_GET_USERSTATUS_DROP_DOWN = "OESGetUserStatusDropDown";
        public const string OES_GET_USEClass_DROP_DOWN = "OESGetUserClassDropDown";
        


    }
}
