
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown();
    LoadQuestionType();
    LoadSubject();
  
    var Id = getUrlVars();
    $('#QuestionID').val(Id.ClassID);
    if ($('#QuestionID').val() !== '') {
        LoadQuestionDetails(Id.QuestionID);
    }
    else {
        $('#QuestionID').val(0);
    }
    

 
   
    $('#btnAddQuestion').on('click', function (e) {
        
        e.preventDefault();

        if (validateForm('frmAddUpdateQuestion')) {
            ; debugger
            var btn = document.getElementById("btnAddQuestion");
            btn.disabled = true;
            btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Please wait...';
            // Get the selected value from the Kendo dropdown
            var selectedStatus = $("#Status").data("kendoDropDownList").value();
            var selectedSubject = $("#Subject").data("kendoDropDownList").value();
            var selectedQuestionType = $("#QuestionType").data("kendoDropDownList").value();
            // Get the value from the input field
            var QuestionTitle = $("#QuestionTitle").val();

            // Add the values to the form data
            var formData = new FormData($("#frmAddUpdateQuestion")[0]);
            formData.append("status", selectedStatus);
            formData.append("Subject", selectedSubject);
            formData.append("QuestionType", selectedQuestionType);
            formData.append("QuestionTitle", QuestionTitle);
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

            AjaxFormSubmit($("#frmAddUpdateQuestion"), options);
        } else {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-save"></i> Save...';
            return false;
        }
    });  

    function AjaxFormSubmit($form, options) {
        var url = "/services/Xtreme/multipart/";

        var formData = new FormData($form[0]);

        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response, statusText, jqXHR) {
                options.success(response, statusText, jqXHR);
            },
            error: function (xhr, status, error) {
                options.error(xhr, status, error);
            }
        });
    }
});


function LoadQuestionDetails(id) {

    KendoGlobalAjax({ commandName: OESCLASS_COMMANDS.OES_GET_CLASSById, values: { ClassID: id }, CallBack: loadQuestionDetailByID });

}

var loadQuestionDetailByID = function (d) {
    var jsonData = JSON.parse(d.Value);
    $('#ClassID').text(jsonData.classID);
    $('#ClassName').val(jsonData.className);
    $('#Status').val(jsonData.isActive);
    var statusDropdown = $("#Status").data("kendoDropDownList");
    statusDropdown.value(jsonData.isActive);
    $('#Status').val(jsonData.isActive);


}  
function UserStatusDropdown() {
 
    var dataSource = new kendo.data.DataSource({
        data: [
            { StatusID: 1, StatusName: "Active" },
            { StatusID: 0, StatusName: "Inactive" }

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

function LoadQuestionType() {
    Status = '1'
    KendoGlobalAjax({ commandName: OESQUESTION_COMMANDS.OES_GET_QUESTIONTYPE_DROP_DOWN, values: { Status: Status }, CallBack: getLoadQuestionType });
}
var getLoadQuestionType = function (d) {
    var dataSource1 = new kendo.data.DataSource({
        data: JSON.parse(d.Value),
        sort: { field: "questionTypeName", dir: "asc" }
    });
    $("#QuestionType").kendoDropDownList({
        filter: "contains",
        optionLabel: 'Please select Type...',
        dataTextField: "questionTypeName",
        dataValueField: "questionTypeID",
        dataSource: dataSource1
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