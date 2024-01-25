(function ($, window, undefined) {
    // "use strict";


    /* ************************ Common OES CLass *********************** */
    window.OESCLASS_COMMANDS = {
        OES_ADD_CLASS: 'OESAddClass',
        OES_DELETE_CLASS: 'OESDeleteClass',
        OES_GET_CLASSById: 'OESGetClassById',
        
    }
    /* ************************ Common OES Subject *********************** */
    window.OESSUBJECT_COMMANDS = {
        OES_GET_SUBJECT_SELECT: 'OESSubjectSelect',
        OES_ADD_SUBJECT: 'OESAddSubject',
        OES_DELETE_SUBJECT: 'OESDeleteSubject',
        OES_GET_SUBJECTById: 'OESGetSubjectById',

    }
    /* ************************ Common OES Questions Bank *********************** */
    window.OESQUESTION_COMMANDS = {
        OES_GET_QUESTIONS_SELECT: 'OESQuestionSelect',
        OES_ADD_QUESTION: 'OESAddQuestion',
        OES_DELETE_QUESTION: 'OESDeleteQuestion',
        OES_GET_QUESTIONById: 'OESGetQuestionById',
        OES_GET_SUBJECT_DROP_DOWN: 'OESGetSubjectDropDown',
        OES_GET_QUESTIONTYPE_DROP_DOWN: 'OESGetQuestionTypeDropDown',

    }
    /* ************************ Common OES User *********************** */
    window.OESUSER_COMMANDS = {
        OES_ADD_USER: 'OESAddUser',
        OES_DELETE_USER: 'OESDeleteUser',
        OES_GET_USERById: 'OESGetUserById',
        OES_GET_USERALL: 'OESGetUserAll',
        OES_GET_USEROLE_DROP_DOWN: 'OESGetUserRoleDropDown',
        OES_GET_USERSTATUS_DROP_DOWN: 'OESGetUserStatusDropDown',
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
        