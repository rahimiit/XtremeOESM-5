var Status = "";
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown(); 
    LoadClasses();
    LoadSubject();
 
    var Id = getUrlVars();
    $('#ExamID').val(Id.ExamID);
    if ($('#ExamID').val() !== '') {
        LoadUserDetails(Id.ExamID);
    }
    else {
        $('#ExamID').val(0);
    }
    
 
    $('#btnAddExam').on('click', function (e) {
        
        e.preventDefault();

        if (validateForm('frmAddUpdateExam')) {
            var btn = document.getElementById("btnAddExam");
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
                        window.location.href = '/OESExam/Index';
                    }, 2000);

                
                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };

            AjaxFormSubmit($("#frmAddUpdateExam"), options);
        } else {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-save"></i> Save...';
            return false;
        }
    });
});


function LoadUserDetails(id) {

    KendoGlobalAjax({ commandName: OESEXAM_COMMANDS.OES_GET_USERById, values: { ExamID: id }, CallBack: loadUserDetailByID });

}

var loadUserDetailByID = function (d) {
    ; debugger
    var jsonData = JSON.parse(d.Value);
    console.log(jsonData);
    $('#ClassID').text(jsonData.classID);
    $('#Username').val(jsonData.userName);
    $('#EmailAddress').val(jsonData.email);
    $('#Password').val(jsonData.password);
    $('#ConfirmPassword').val(jsonData.password);
 
    $('#Role').val(jsonData.userTypeId);
    var roleDropdown = $("#Role").data("kendoDropDownList");
    roleDropdown.value(jsonData.userTypeId);
    $('#Role').val(jsonData.userTypeId);

    $('#Class').val(jsonData.classID);
    var classDropdown = $("#Class").data("kendoDropDownList");
    classDropdown.value(jsonData.classID);
    $('#Class').val(jsonData.classID);

    $('#Status').val(jsonData.isActive);
    var statusDropdown = $("#Status").data("kendoDropDownList");
    statusDropdown.value(jsonData.isActive);
    $('#Status').val(jsonData.isActive);
    $('#FullName').val(jsonData.fullName);
    $('#DateOfBirth').val(jsonData.dateOfBirth);
    $('#FirstName').val(jsonData.firstName);
    $('#LastName').val(jsonData.lastName);
    $('#PhoneNumber').val(jsonData.phoneNumber);
    $('#IDCardNumber').val(jsonData.idCardNumber);
    $('#PostalCode').val(jsonData.postalCode);
    $('#Address').val(jsonData.fullAddress);
    $('#Code').val(jsonData.code);
    
    $('#LastName').val(jsonData.lastName);
    $('#Gender').val(jsonData.gender);
    var genderropdown = $("#Gender").data("kendoDropDownList");
    genderropdown.value(jsonData.gender);
    $('#Gender').val(jsonData.gender);


}
function UserStatusDropdown() {
    Status = '1'
    KendoGlobalAjax({ commandName: OESUSER_COMMANDS.OES_GET_USERSTATUS_DROP_DOWN, values: { Status: Status }, CallBack: getLoadStatus });
}
var getLoadStatus = function (d) {
    var dataSource1 = new kendo.data.DataSource({
        data: JSON.parse(d.Value),
        sort: { field: "statusName", dir: "asc" }
    });
    $("#Status").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Status...',
        dataTextField: "statusName",
        dataValueField: "statusID",
        dataSource: dataSource1
    });
}
 
function UserGenderDropdown() {
    ; debugger
    var dataSource = new kendo.data.DataSource({
        data: [
            { Gender: 1, GenderName: "Male" },
            { Gender: 2, GenderName: "Female" },
            { Gender: 3, GenderName: "Other" }

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
function LoadSubject() {
    Status = '1'
    KendoGlobalAjax({ commandName: OESQUESTION_COMMANDS.OES_GET_SUBJECT_DROP_DOWN, values: { Status: Status }, CallBack: getLoadSubject });
}
var getLoadSubject = function (d) {
    var dataSource1 = new kendo.data.DataSource({
        data: JSON.parse(d.Value),
        sort: { field: "subjectName", dir: "asc" }
    });
    $("#Subject").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Subject...',
        dataTextField: "subjectName",
        dataValueField: "subjectID",
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