
var userId = "";
var username = "";
var roleID = "";
var Status = "";
var SelectedEmployeeID = "";

var $grid = "question-grid";

var IsReadEmployeeDetail = localStorage.getItem('IsReadEmployeeDetail');
var IsUpdateEmployeeDetail = localStorage.getItem('IsUpdateEmployeeDetail');
var IsDeleteEmployee = localStorage.getItem('IsDeleteEmployee');
var IsCreateEmployee = localStorage.getItem('IsCreateEmployee');



$(document).ready(function () {

    //---------------------------------  USER SESSION RECORD START ----------------------------------------------------------------------------   
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");

    //---------------------------------  USER SESSION RECORD END ----------------------------------------------------------------------------   
    $("#UserID").val(userId);

    LoadQuestionKendo();

});


  
function LoadQuestionKendo() {

    Status = 'Active'
    KendoGlobalAjax({ commandName: OESQUESTION_COMMANDS.OES_GET_QUESTIONS_SELECT, values: { Status: Status }, CallBack: loadQuestions });
}


var loadQuestions = function (d) {
    console.log(d.Value);

    KendoGrid(JSON.parse(d.Value));

}

var KendoGrid = function (_data) {

    var record = 0;
    var record = 0;

    var colModel = [


        { title: "S/N", width: 40, template: "#= renderNumber() #" },
        { field: "questionID", title: "classID", hidden: true },
        { field: "questionText", title: "Question Text", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "questionTypeName", title: "Question Type", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "marks", title: "Marks", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },

      
        { field: "isActive", title: "Status", width: 110, filterable: true },
        {
            field: "", width: 170,
            title: "Action",

            attributes: { class: "custom-grid-cell" },
            template: "# if (isActive == true) { # <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a> &nbsp<button type='button' class='btn btn-success btn-sm text-white'   onclick=AddAnswerQuestionByID(this)> Add Answer</button>&nbsp<button type='button' class='btn btn-danger btn-sm text-white'   onclick=deleteRecordByID('#=questionID#')> Deactivate</button>  # } else   {# <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a>  #}#",
            //template: "<a style='cursor:pointer; font-size:20px;' onClick= whatsapp_btn(this) title='Share Employee' ><span class='icofont icofont-phone'></span></a> <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a> &nbsp;&nbsp;&nbsp;&nbsp; <button type='button' class='btn btn-danger btn-sm text-white'   onclick=deleteRecordByID('#=classID#')> Deactivate</button>"

        }];

    BindkendoGrid($grid, 15, colModel, _data);
};


 

var deleteRecordByID = function (id) {
  
    swal.fire({
        title: 'Are you sure?',
        text: "Reason of Deletion",
        input: 'text',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#5cb85c',
        cancelButtonColor: '#d9534f',
        buttons: {
            cancel: {
                text: "Cancel",
                value: null,
                visible: true,
                className: "btn btn-danger",
                closeModal: true
            },
            confirm: {
                text: "OK",
                value: true,
                visible: true,
                className: "btn btn-warning",
                closeModal: true
            }
        }
    }).then(function (restult) {


        if (restult.value) {
            KendoGlobalAjax({ commandName: OESCLASS_COMMANDS.OES_DELETE_CLASS, values: "{QuestionID:'" + id + "',ReasonOfDeletion: '" + restult.value + "'}", CallBack: '' });
            setTimeout(function () {

                LoadQuestionKendo();
            }, 50);

            swal.fire('Deleted', '', 'success');
        } else {
            swal.fire("Cancelled", '', "error");

        }
    });
}

function AddAnswerQuestionByID(e) {

    var row = $(e).closest("tr");
    var grid = $("#" + $grid).data("kendoGrid");
    var dataItem = grid.dataItem(row);
    window.location.href = '/OESQuestionsBank/AddEditAnswer?QuestionID=' + dataItem.questionID + '';
}


function EditDetail(e) {

    var row = $(e).closest("tr");
    var grid = $("#" + $grid).data("kendoGrid");
    var dataItem = grid.dataItem(row);
    window.location.href = '/OESQuestionsBank/AddQuestions?QuestionID=' + dataItem.questionID + '';
}

 