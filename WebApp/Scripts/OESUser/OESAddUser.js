var Status = "";
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown(); 
    LoadClasses();
    LoadRole();
    UserGenderDropdown();
    var Id = getUrlVars();
    $('#ClassID').val(Id.UserID);
    if ($('#ClassID').val() !== '') {
       // LoadClassDetails(Id.ClassID);
    }
    else {
        $('#ClassID').val(0);
    }
    
    function AjaxFormSubmit($form, options) {
        var url = "/services/Xtreme/multipart/";

        // Create a FormData object
        var formData = new FormData($form[0]);

        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,  // Set contentType to false when using FormData
            success: function (response, statusText, jqXHR) {
                options.success(response, statusText, jqXHR);
            },
            error: function (xhr, status, error) {
                options.error(xhr, status, error);
            }
        });
    }
    $('#btnAddUser').on('click', function (e) {
        
        e.preventDefault();

        if (validateForm('frmAddUpdateUser')) {
            var btn = document.getElementById("btnAddUser");
            btn.disabled = true;
            btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Please wait...';

            var options = {
                success: function (response, statusText, jqXHR) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Record saved successfully...',
                        showConfirmButton: false,
                        timer: 2000
                    });
                    setTimeout(function () {
                        window.location.href = '/OESClass/Index';
                    }, 2000);

                
                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };

            AjaxFormSubmit($("#frmAddUpdateUser"), options);
        } else {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-save"></i> Save...';
            return false;
        }
    });
});


function LoadClassDetails(id) {

    KendoGlobalAjax({ commandName: OESCLASS_COMMANDS.OES_GET_CLASSById, values: { ClassID: id }, CallBack: loadClassDetailByID });

}

var loadClassDetailByID = function (d) {
    var jsonData = JSON.parse(d.Value);
    $('#ClassID').text(jsonData.classID);
    $('#ClassName').val(jsonData.className);
    $('#Status').val(jsonData.isActive);
    var statusDropdown = $("#Status").data("kendoDropDownList");
    statusDropdown.value(jsonData.isActive);
    $('#Status').val(jsonData.isActive);


}

function UserStatusDropdown() {
    ; debugger
    var dataSource = new kendo.data.DataSource({
        data: [
            { StatusID: true, StatusName: "Active" },
            { StatusID: false, StatusName: "Inactive" }

        ],
        sort: { field: "StatusName", dir: "asc" }
    });

    $("#Status").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Status...',
        dataTextField: "StatusName",
        dataValueField: "StatusID",
        dataSource: dataSource
    });
}
function UserGenderDropdown() {
    ; debugger
    var dataSource = new kendo.data.DataSource({
        data: [
            { Gender: 1, StatusName: "Male" },
            { Gender: 2, StatusName: "Female" },
            { Gender: 3, StatusName: "Other" }

        ],
        sort: { field: "GenderName", dir: "asc" }
    });

    $("#Gender").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Status...',
        dataTextField: "GenderName",
        dataValueField: "Gender",
        dataSource: dataSource
    });
}
function UserCountryDropdown() {
    ; debugger
    var dataSource = new kendo.data.DataSource({
        data: [
            { Gender: 1, StatusName: "UAE" },
            { Gender: 2, StatusName: "Pakistan" },
           

        ],
        sort: { field: "GenderName", dir: "asc" }
    });

    $("#Gender").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Status...',
        dataTextField: "GenderName",
        dataValueField: "Gender",
        dataSource: dataSource
    });
}
function LoadRole()
{
    Status = '1'
    KendoGlobalAjax({ commandName: OESUSER_COMMANDS.OES_GET_USEROLE_DROP_DOWN, values: { Status: Status }, CallBack: getLoadRole });
}
var getLoadRole = function (d) {
      var dataSource1 = new kendo.data.DataSource({
          data: JSON.parse(d.Value),
          sort: { field: "RoleName", dir: "asc" }
    });  
    $("#Role").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Role...',
        dataTextField: "roleName",
        dataValueField: "roleID",
        dataSource: dataSource1
    });
}
function LoadClasses() {
    Status = '1'
    KendoGlobalAjax({ commandName: OESUSER_COMMANDS.OES_GET_USEClass_DROP_DOWN, values: { Status: Status }, CallBack: getLoadClass });
}
var getLoadClass = function (d) {
    var dataSource1 = new kendo.data.DataSource({
        data: JSON.parse(d.Value),
        sort: { field: "className", dir: "asc" }
    });
    $("#Class").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Class...',
        dataTextField: "className",
        dataValueField: "classID",
        dataSource: dataSource1
    });
}