
var userId = "";
var username = "";
var roleID = "";
var Status = "";
var SelectedEmployeeID = "";

var $grid = "user-grid";

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

    LoadExamKendo();

});



function LoadExamKendo() {

    Status = '1'
    KendoGlobalAjax({ commandName: OESEXAM_COMMANDS.OES_GET_EXAMALL, values: { Status: Status }, CallBack: loadExam });
}


var loadExam = function (d) {
    console.log(d.Value);

    KendoGrid(JSON.parse(d.Value));

}

var KendoGrid = function (_data) {
    ; debugger
    var record = 0;
    var record = 0;

    var colModel = [


        { title: "S/N", width: 40, template: "#= renderNumber() #" },
        { field: "examID", title: "examID", hidden: true },
        { field: "examName", title: "Exam  ", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "description", title: "Description  ", width: 180, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "durationMinuts", title: "Duration Minuts  ", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "startTime", title: "Start Time  ", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "startTime", title: "Start Time  ", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "totalMarks", title: "Total Marks  ", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
 
        {
            field: "", width: 170,
            title: "Action",

            attributes: { class: "custom-grid-cell" },
            template: "# if (isActive == true) { # <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a>  <button type='button' class='btn btn-success btn-sm text-white'   onclick=AddAnswerQuestionByID(this)> Add Question</button> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-sm text-white'   onclick=deleteRecordByID('#=examID#')> Deactivate</button>  # } else   {# <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a>  #}#",
 

        }
    ];

    BindkendoGrid($grid, 15, colModel, _data);
};


$('#active-employee').on('click', function () {

    LoadClassKendo();
});

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
            KendoGlobalAjax({ commandName: OESEXAM_COMMANDS.OES_DELETE_EXAM, values: "{ClassID:'" + id + "',ReasonOfDeletion: '" + restult.value + "'}", CallBack: '' });
            setTimeout(function () {

                LoadClassKendo();
            }, 50);

            swal.fire('Deleted', '', 'success');
        } else {
            swal.fire("Cancelled", '', "error");

        }
    });
}

 
function EditDetail(e) {

    var row = $(e).closest("tr");
    var grid = $("#" + $grid).data("kendoGrid");
    var dataItem = grid.dataItem(row);
    window.location.href = '/OESUsers/AddUsers?UserID=' + dataItem.userID + '';
}
 