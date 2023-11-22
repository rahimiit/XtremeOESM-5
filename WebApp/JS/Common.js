

var commonAttachmentUrl = '';

function openAttachmentModal(canEdit) {
    var currentTime=new Date();
    commonAttachmentUrl = url_attachmentModal + '&canEdit=' + canEdit + '&date=' + currentTime.getSeconds();
    $('#attachmentModalContent').load(commonAttachmentUrl);
    $('#attachmentModal').modal('show');
}

function closeAttachmentModal() {
    $('#attachmentModal').modal('hide');
}

function workflowRequest() {
    $('#workflowModalContent').load(url_RequestWorkFlow);
    $('#workflowModal').modal();
}


$(function () {

    if (sessionStorage.getItem('IsSubMenuSelected') == 1) {
      //  $('#subMenuBar').show();
    } else {
       // $('#subMenuBar').hide();
    }

    if (sessionStorage['IP'] == undefined) {
        GetClientIPAddress();
        //alert(sessionStorage['IP']);
    }

  

    if (sessionStorage['userProfile'] == undefined || getUrlVars()=='impersonate') {
        GlobalAjax({ commandName: COMMON_COMMANDS.GET_USER_ROLES, values: '{userId:"' + $('#hdUserId').val() + '"}', CallBack: GetUserRoles });
        
        } else {
            PopulateUserInformation();
        }

    $('#cmbRoles').on('change', function () {
        sessionStorage.setItem('IsSubMenuSelected', 0);
        var postdata = {};
        postdata.roleid= $(this).val();
      
        GlobalAjax({ commandName: COMMON_COMMANDS.GET_USER_ROLES_BY_ID, values: JSON.stringify(postdata), CallBack: ChangeRole });
    });


    $('#workflowModal').on('show.bs.modal', function (e) {
        $(this).addClass('display-block');
    });
    $('#workflowModal').on('hide.bs.modal', function (e) {
        $(this).removeClass('display-block');
    });

});

    function ChangeRole(d) {
        var _data = JSON.parse(d.Value);
        var _roleId = _data.roleID;
        sessionStorage.setItem('selectedRoleId', _roleId);
        $('#hdDefaultRoleId').val(_roleId);
        $('#hdRoleId').val(_roleId);
        sessionStorage.removeItem('roleMenus');
        sessionStorage.setItem('selectedRoleTag', _data.roleTag);
        var _param = {
            'userId': $('#hdUserId').val(),
            'roleId': _roleId
        }
        GlobalAjax({ commandName: COMMON_COMMANDS.LIST_MENUS_BY_ROLE_ID, values: JSON.stringify(_param), CallBack: GetMenus });

        var postdata = {
            'RoleID': _roleId,
            'RoleTag': _data.roleTag
        }

        $.post(url_ChangeRole, postdata, function (data) {
                window.location.href = '/212_Tajheez/Home/Index';

        });
    }


    function GetUserRoles(d) {
        var _data = JSON.parse(d.Value);
        //  alert(_data);
        sessionStorage.setItem('userRoles', JSON.stringify(_data));
        GlobalAjax({ commandName: COMMON_COMMANDS.GET_USER_PROFILE_BY_ID, values: '{userId:"' + $('#hdUserId').val() + '"}', CallBack: GetUserProfile });

    }

    function GetUserProfile(d) {
        var _response = JSON.parse(d.Value);
        sessionStorage.setItem('userProfile', JSON.stringify(_response[0]));
        PopulateUserInformation();

    }

    function PopulateUserInformation() {
        var _profile = JSON.parse(sessionStorage.getItem('userProfile'));
        var _roles = JSON.parse(sessionStorage.getItem('userRoles'));
        var $combo = $('#cmbRoles');
        $combo.empty();
        if (_LANG == 'ar-AE') {
            $.map(_profile, function (item) {
                $('#username').text(item.nameAr);
                $('#userRank').text(item.rankAr + ' ' + item.employeeCode);
                $('#userUnit').text(item.unitNameAr);
            });
            $.map(_roles, function (item) {
                $combo.append($('<option />').val(item.roleID).text(item.roleNameAR));
            });
        } else {
            $.map(_profile, function (item) {
                $('#username').text(item.nameEn);
                $('#userRank').text(item.rankEn + ' ' + item.employeeCode);
                $('#userUnit').text(item.unitNameEn);
            });
            $.map(_roles, function (item) {
                $combo.append($('<option />').val(item.roleID).text(item.roleNameEN));
            });
        }

        if (sessionStorage['selectedRoleId'] == undefined || getUrlVars() == 'impersonate') {
            sessionStorage.setItem('selectedRoleId', $combo.val());
           // alert($combo.val());
        }
      

        var roleId = sessionStorage.getItem('selectedRoleId');
      
        $combo.val(roleId);

        $.map(_roles, function (item) {
            if (item.roleID == roleId) {
                sessionStorage.setItem('selectedRoleTag', item.roleTag);
            }
        });

       // alert(sessionStorage.getItem('selectedRoleTag'))
        if (sessionStorage['roleMenus'] == undefined || getUrlVars() == 'impersonate') {
            GlobalAjax({ commandName: COMMON_COMMANDS.LIST_MENUS_BY_ROLE_ID, values: '{userId:"' + $('#hdUserId').val() + '",roleId:"' + roleId + '"}', CallBack: GetMenus });
        } else {
            PopulateMenus();
        }
    }


    function GetMenus(d) {
        var _data = JSON.parse(d.Value);
        sessionStorage.setItem('roleMenus', JSON.stringify(_data));
        //alert(d.Value);
        PopulateMenus();

    }

    function PopulateMenus() {
       
        var _menus = JSON.parse(sessionStorage.getItem('roleMenus'));
        //  alert(_menus);
        var menuItem = '<ul class="MenuDirection">';
        if (_LANG == 'ar-AE') {
           // menuItem = '<div class="card">';
            $.map(_menus, function (item) {
                menuItem = menuItem + '<li class="menuItem"><a href="' + item.menuURL + '" data-parent="'+ item.parentId + '" data-url="' + item.menuURL + '" data-menucode="' + item.menuCode + '"  onclick="menuClick(this)" class="AccordionBtn">' +
                        '<i class="' + item.menuImageAR + '"></i>   ' +
                        item.menuDescrAR +
                      //'<span class="title">' +  + '</span>' +
                   '</a></li>';
               // menuItem = menuItem + '<li>|</li>';
                 });
            menuItem = menuItem + '</ul>';
         //   $('#menuList').append(menuItem);

        } else {

            $.map(_menus, function (item) {
                menuItem = menuItem + '<li class="menuItem"><a href="' + item.menuURL + '" data-parent="'+ item.parentId + '" data-url="' + item.menuURL + '" data-menucode="' + item.menuCode + '"  onclick="menuClick(this)" class="AccordionBtn">' +
                        '<i class="' + item.menuImageEN + '"></i>   ' +
                         item.menuDescrEN +
                      //'<span class="title">' + + '</span>' +
                   '</a></li>'
            });
            menuItem = menuItem + '</ul>';
         //   $('#menuList').append(menuItem);
        }

       // $('#menuList').addClass('MenuDirection');

        PopulateSubMenus();
    }


    function menuClick(_menucode) {
        var _menuCode = $(_menucode).data('menucode');
        var _parentId=$(_menucode).data('parent');
        sessionStorage.setItem('selectedMenuCode', $(_menucode).data('menucode'));
        var _url = $(_menucode).data('url')
        if (_parentId > 0 || _url == '#') {
            sessionStorage.setItem('IsSubMenuSelected', 1);
            $('#subMenuBar').show();
        } else {
            sessionStorage.setItem('IsSubMenuSelected', 0);
            $('#subMenuBar').hide();
        }

        if (_url == '#') {
            GlobalAjax({ commandName: COMMON_COMMANDS.LIST_MENUS_BY_PARENT_ID, values: '{parentId:"' + _menuCode + '"}', CallBack: GetSubMenus });
        } 

    }

    function GetSubMenus(d) {
        var _data = JSON.parse(d.Value);
        //alert(d.Value);

        sessionStorage.setItem('subMenus', JSON.stringify(_data));
        PopulateSubMenus();
    }

    function PopulateSubMenus() {
        var _menus = JSON.parse(sessionStorage.getItem('subMenus'));

        $('#subMenuList').empty();

        var menuItem = '<ul class="MenuDirection">';
        if (_LANG == 'ar-AE') {
            // menuItem = '<div class="card">';
            $.map(_menus, function (item) {
                menuItem = menuItem + '<li class="menuItem"><a href="' + item.menuURL + '"  data-parent="' + item.parentId + '" data-url="' + item.menuURL + '" data-menucode="' + item.menuCode + '"  onclick="menuClick(this)" class="AccordionBtn">' +
                        '<i class="' + item.menuImageAR + '"></i>   ' +
                        item.menuDescrAR +
                      //'<span class="title">' +  + '</span>' +
                   '</a></li>';
                // menuItem = menuItem + '<li>|</li>';
            });
            menuItem = menuItem + '</ul>';
          //  $('#subMenuList').append(menuItem);

        } else {

            $.map(_menus, function (item) {
                menuItem = menuItem + '<li class="menuItem"><a href="' + item.menuURL + '"  data-parent="' + item.parentId + '" data-url="' + item.menuURL + '" data-menucode="' + item.menuCode + '"  onclick="menuClick(this)" class="AccordionBtn">' +
                        '<i class="' + item.menuImageEN + '"></i>   ' +
                         item.menuDescrEN +
                   '</a></li>'
            });
            menuItem = menuItem + '</ul>';
         //   $('#subMenuList').append(menuItem);
        }

     //   $('#subMenuList').addClass('MenuDirection');

    }

function isNumberic(e) {
    var _value = e.target.value + e.key;
    if (isNaN(_value) && e.which != 8) {
        e.preventDefault();
    }
}
