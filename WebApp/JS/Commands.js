(function ($, window, undefined) {
    // "use strict";

    /* ************************ Common Commands *********************** */
    window.APPS_COMMANDS = {
        GET_CAMPBYIP: 'getCampByIP',
        GET_USER_ROLES: "getUserRoles",
        GET_USER_ROLES_BY_ID: "getuserrolebyid",
        LIST_MENUS_BY_ROLE_ID: "getMenusbyRoleId",
        LIST_MENUS_BY_PARENT_ID: "getMenusbyParentId",
        GET_USER_PROFILE_BY_ID: "getUserProfilebyId",
    }

    /* ************** Attachment Commands ****************** */
    window.ATTACHMENT_COMMANDS = {
        LIST_ATTACHMENT_BY_ENTITY: "listAttachmentbyEntity",
        DELETE_ATTACHMENT_BY_ID: "deleteAttachmentbyid",
    }
   
})(jQuery, window);
        