(function ($, window, undefined) {
    // "use strict";


    /* ************************ Common OES CLass *********************** */
    window.OESCLASS_COMMANDS = {
        OES_ADD_CLASS: 'OESAddClass',
        OES_DELETE_CLASS: 'OESDeleteClass',
        OES_GET_CLASSById: 'OESGetClassById',
        
    }
    /* ************************ Common OES User *********************** */
    window.OESUSER_COMMANDS = {
        OES_ADD_USER: 'OESAddUser',
        OES_DELETE_USER: 'OESDeleteUser',
        OES_GET_USERById: 'OESGetUserById',
        OES_GET_USERALL: 'OESGetUserAll',
        OES_GET_USEROLE_DROP_DOWN: 'OESGetUserRoleDropDown',
        OES_GET_USEClass_DROP_DOWN: 'OESGetUserClassDropDown',
        

    }
    /* ************** Attachment Commands ****************** */
    /* ************************ Common Commands *********************** */
    window.APPS_COMMANDS = {
        GET_CAMPBYIP: 'getCampByIP',
        GET_USER_ROLES: "getUserRoles",
        GET_USER_ROLES_BY_ID: "getuserrolebyid",
        LIST_MENUS_BY_ROLE_ID: "getMenusbyRoleId",
        LIST_MENUS_BY_PARENT_ID: "getMenusbyParentId",
        GET_USER_PROFILE_BY_ID: "getUserProfilebyId",
        Get_USER_LOGIN: "GetUserLogin",
    }

    /* ************** Attachment Commands ****************** */
    window.ATTACHMENT_COMMANDS = {
        LIST_ATTACHMENT_BY_ENTITY: "listAttachmentbyEntity",
        DELETE_ATTACHMENT_BY_ID: "deleteAttachmentbyid",
    }
   
})(jQuery, window);
        