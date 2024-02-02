
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown();
    LoadQuestionType();
    LoadSubject();
  
    var Id = getUrlVars();
    $('#QuestionID').val(Id.QuestionID);


    if ($('#QuestionID').val() !== '') {
        LoadQuestionDetails(Id.QuestionID);
    }
    else {
        $('#QuestionID').val(0);
    }
    



    $('#btnAddQuestion').on('click', function (e) {
        ; debugger
        e.preventDefault();

        if (validateForm('frmAddUpdateQuestion')) {
            var btn = document.getElementById("btnAddQuestion");
            btn.disabled = true;
            btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Please wait...';

            var options = {
                success: function (response, statusText, jqXHR) {
                    var jsonString = response;
                    var jsonObject = JSON.parse(jsonString);
                    var questionID = jsonObject.questionID;
                    
               
                    Swal.fire({
                        icon: 'success',
                        title: 'Record saved successfully...',
                        showConfirmButton: false,
                        timer: 2000
                    });
                    setTimeout(function () {
                        window.location.href = '/OESQuestionsBank/AddEditAnswer?QuestionID=' + questionID;
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
 
});


function LoadQuestionDetails(id) {

    KendoGlobalAjax({ commandName: OESQUESTION_COMMANDS.OES_GET_QuestionBy_Id, values: { QuestionID: id }, CallBack: loadQuestionDetailByID });

}

var loadQuestionDetailByID = function (d) {
    var jsonData = JSON.parse(d.Value);
    console.log(jsonData);
    $('#QuestionID').val(jsonData.questionID);
    $('#QuestionTitle').val(jsonData.questionText);
    $('#Marks').val(jsonData.marks);
    $('#Status').val(jsonData.statusID);
    var statusDropdown = $("#Status").data("kendoDropDownList");
    statusDropdown.value(jsonData.statusID);
    $('#Status').val(jsonData.statusID);

    $('#Subject').val(jsonData.subjectID);
    var SubjectDropdown = $("#Subject").data("kendoDropDownList");
    SubjectDropdown.value(jsonData.subjectID);
    $('#Subject').val(jsonData.subjectID);

    $('#QuestionType').val(jsonData.questionTypeID);
    var QuestionTypeDrp = $("#QuestionType").data("kendoDropDownList");
    QuestionTypeDrp.value(jsonData.questionTypeID);
    $('#QuestionType').val(jsonData.questionTypeID);




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