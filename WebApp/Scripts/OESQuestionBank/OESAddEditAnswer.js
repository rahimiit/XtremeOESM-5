
$(document).ready(function () {

    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown();
    LoadQuestionType();
    LoadSubject();

    var Id = getUrlVars();
    $('#QuestionID').val(Id.QuestionID);
    $('#QuestionID2').val(Id.QuestionID);
    $('#QuestionID3').val(Id.QuestionID);
    if ($('#QuestionID').val() !== '') {
        LoadQuestionDetails(Id.QuestionID);
        LoadQuestionAnswerDetails(Id.QuestionID);
    }
    else {
        $('#QuestionID').val(0);
    }

    $('#btnCheckBoxAddAnswer').on('click', function (e) {
        e.preventDefault();

        // Set the value of unchecked checkboxes to "off"
        $("input[type='checkbox']").not(":checked").each(function () {
            $(this).prop('checked', false);
            $(this).after("<input type='hidden' name='" + $(this).attr("name") + "' value='off' />");
        });

        if (validateForm('frmAddUpdatechkboxview')) {
            var btn = document.getElementById("btnCheckBoxAddAnswer");
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
                        window.location.href = '/OESQuestionsBank/Index';
                    }, 2000);
                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };
            AjaxFormSubmit($("#frmAddUpdatechkboxview"), options);
        } else {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-save"></i> Save...';
            return false;
        }
    });

    $('#btnRdioAddAnswer').on('click', function (e) {
        e.preventDefault();

        // Set the value of unchecked checkboxes to "off"
        $("input[type='checkbox']").not(":checked").each(function () {
            $(this).prop('checked', false);
            $(this).after("<input type='hidden' name='" + $(this).attr("name") + "' value='off' />");
        });

        if (validateForm('frmAddUpdateradionview')) {
            var btn = document.getElementById("btnRdioAddAnswer");
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
                        window.location.href = '/OESQuestionsBank/Index';
                    }, 2000);
                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };
            AjaxFormSubmit($("#frmAddUpdateradionview"), options);
        } else {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-save"></i> Save...';
            return false;
        }
    });

    $('#btnBooleanAddAnswer').on('click', function (e) {
        e.preventDefault();

        // Set the value of unchecked checkboxes to "off"
        $("input[type='radio']").not(":checked").each(function () {
            $(this).prop('checked', false);
            $(this).after("<input type='hidden' name='" + $(this).attr("name") + "' value='off' />");
        });

        if (validateForm('frmAddUpdateboolview')) {
            var btn = document.getElementById("btnBooleanAddAnswer");
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
                        window.location.href = '/OESQuestionsBank/Index';
                    }, 2000);
                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };
            AjaxFormSubmit($("#frmAddUpdateboolview"), options);
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
    var QestionType = (jsonData.questionTypeID);
    $('#QuestionID').val(jsonData.questionID);
    $('#questionTitle').append(jsonData.questionText);
    /*   $('#Marks').val(jsonData.marks);*/
    $('#QuestionTypes').append(jsonData.questionTypeName);
    if (QestionType == 1) {
        $("#boolview").hide();
        $("#chkboxview").hide();
        $("#radionview").show();
    }
    else if (QestionType == 2) {
        $("#boolview").show();
        $("#chkboxview").hide();
        $("#radionview").hide();
    }
    else {
        $("#boolview").hide();
        $("#chkboxview").show();
        $("#radionview").hide();
    }
}



function LoadQuestionAnswerDetails(id) {
    ; debugger
    KendoGlobalAjax({ commandName: OESQUESTION_COMMANDS.OES_GET_QuestionAnswerBy_Id, values: { QuestionID: id }, CallBack: loadQuestionAnswerDetailByID });

}

var loadQuestionAnswerDetailByID = function (d) {
    ; debugger
    var jsonData = JSON.parse(d.Value);
    console.log(jsonData);
  
    $('#boolview').empty();
    $('#radionview').empty();
    $('#chkboxview').empty();
  
    jsonData.forEach(function (option) {

        if (option.questionTypeID == 2) {
 
            var radioButton = $('<input>').attr({
                type: 'radio',
                name: 'boolradio',
                value: option.optionID,
                id: 'boolradio' + option.optionID,
                class: 'form-check-input mt-0 me-2',
                style: 'width:1.2em;height:1.2em;vertical-align:middle'
            });

            var textarea = $('<textarea>').attr({
                class: 'form-control text-box single-line answerinput',
                id: 'Answerbool' + option.optionID,
                name: 'Answerbool' + option.optionID,
                type: 'text',
                placeholder: 'Fill in answer option',
                rows: '1'
            });

 
            var div = $('<div>').addClass('d-flex align-items-center mb-1');
            div.append(radioButton);
            div.append(textarea);
            $('#boolview').append(div);

 
            $(textarea).val(option.optionText);
 
            if (option.isCorrect === true) {
                $(radioButton).prop('checked', true);
            }

        }
        else if (option.questionTypeID == 1) {
            var radioButton = $('<input>').attr({
                type: 'radio',
                name: 'rdioOptionOne',
                value: option.optionID,
                id: 'rdioOptionOne' + option.optionID,
                class: 'form-check-input mt-0 me-2',
                style: 'width:1.2em;height:1.2em;vertical-align:middle'
            });

            var textarea = $('<textarea>').attr({
                class: 'form-control text-box single-line answerinput',
                id: 'txtradioanswerOne' + option.optionID,
                name: 'txtradioanswerOne' + option.optionID,
                type: 'text',
                placeholder: 'Fill in answer option',
                rows: '1'
            });
 
            var div = $('<div>').addClass('d-flex align-items-center mb-1');
            div.append(radioButton);
            div.append(textarea);
            $('#radionview').append(div);
 
            $(textarea).val(option.optionText);
 
            if (option.isCorrect === true) {
                $(radioButton).prop('checked', true);
            }
        }
        else {
            var radioButton = $('<input>').attr({
                type: 'checkbox',
                name: 'IsOptionCorrectOne',
                value: option.optionID,
                id: 'IsOptionCorrectOne' + option.optionID,
                class: 'form-check-input mt-0 me-2',
                style: 'width:1.2em;height:1.2em;vertical-align:middle'
            });

            var textarea = $('<textarea>').attr({
                class: 'form-control text-box single-line answerinput',
                id: 'txtOneChkAnswer' + option.optionID,
                name: 'txtOneChkAnswer' + option.optionID,
                type: 'text',
                placeholder: 'Fill in answer option',
                rows: '1'
            });

 
            var div = $('<div>').addClass('d-flex align-items-center mb-1');
            div.append(radioButton);
            div.append(textarea);
            $('#chkboxview').append(div);
 
            $(textarea).val(option.optionText);
 
            if (option.isCorrect === true) {
                $(radioButton).prop('checked', true);
            }
        }


    });
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