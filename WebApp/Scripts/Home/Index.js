$(function () {
    var _param = {};
    _param.userId = $('#UserId').val();
    _param.roleId = $('#RoleId').val();
    GlobalAjax({ commandName: APPS_COMMANDS.GET_USER_PROFILE_BY_ID, values: JSON.stringify(_param), CallBack: GetUserProfile });
});

var GetUserProfile = function (d) {
    var _response = JSON.parse(d.Value);
    var _data = _response[0];
    alert(d.Value);
    //alert(JSON.stringify(_data));
    //alert(_data.roleID);
    //_param.roleId = '212001';
    //GlobalAjax({ commandName: APPS_COMMANDS.LIST_MENUS_BY_ROLE_ID, values: JSON.stringify(_param), CallBack: GetMenuByRole });
  //  alert(d.Value);
}

var GetMenuByRole = function (d) {
    var _data = JSON.parse(d.Value);
    alert(d.Value);
}
