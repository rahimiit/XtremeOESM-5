
$(document).ready(function () {
   
    $("#btnlogin").click(function () {
        ; debugger
        var Isvalid = true;
        if ($('#email').val() == '') {
            $('#error_span_email').text("Enter Invoice No");
            setTimeout(function () {
                // Hide the element after 5 seconds
                $('#error_span_email').text("");
            }, 5000); 
            Isvalid = false;
        }
        else {
            $('#error_span_email').text("");
        }
        if ($('#password').val() == '') {
            $('#error_span_password').text("Enter Invoice No");
            setTimeout(function () {
                // Hide the element after 5 seconds
                $('#error_span_password').text("");
            }, 5000); 
            Isvalid = false;
        }
        else {
            $('#error_span_password').text("");
        }
        if (Isvalid) { 
        var _param = {
            'userEmail': $('#email').val(),
            'password': $('#password').val()
        }
            GlobalAjax({ commandName: APPS_COMMANDS.Get_USER_LOGIN, values: JSON.stringify(_param), CallBack: GetUserData });
             
        }
      
    });   

});

var GetUserData = function (d) {
    ; debugger
    var _data = JSON.parse(d.Value);
    console.log(d.Value);
 
    if (_data && _data.length > 0) {
      
        if (_data[0].userTypeId === 1) {  //Admin
            sessionStorage.setItem('userfirstName', JSON.stringify(_data[0].firstName));
            sessionStorage.setItem('rolename', JSON.stringify(_data[0].roleName));
            window.location.href = '/Home/XtremeDashboard';
        } else if (_data[0].userTypeId === 2) {  //user
            sessionStorage.setItem('userfirstName', JSON.stringify(_data[0].firstName));
            sessionStorage.setItem('rolename', JSON.stringify(_data[0].roleName));
            $(".username span").text(_data[0].firstName);
            window.location.href = '/Home/XtremeUserDashboard';
        } else {
 
            alert('Unknown role: ' + _data[0].userTypeId);
        }
    } else {
  
        alert('Login failed: No data found.');
    }
}


var GetUserProfile = function (d) {
    var _response = JSON.parse(d.Value);
    var _data = _response[0];
    alert(d.Value);
    alert(JSON.stringify(_data));
    alert(_data.roleID);
    _param.roleId = '212001';
    GlobalAjax({ commandName: APPS_COMMANDS.Get_USER_LOGIN, values: JSON.stringify(_param), CallBack: GetMenuByRole });
    alert(d.Value);
}

