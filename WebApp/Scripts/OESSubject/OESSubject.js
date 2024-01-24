
var userId = "";
var username = "";
var roleID = "";
var Status = "";
var SelectedEmployeeID = "";

var $grid = "subject-grid";

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

    LoadSubjectKendo();

});

 
function LoadSubjectKendo() {

    Status = 'Active'
    KendoGlobalAjax({ commandName: OESSUBJECT_COMMANDS.OES_GET_SUBJECT_SELECT, values: { Status: Status }, CallBack: loadSubject });
}


var loadSubject = function (d) {
    console.log(d.Value);

    KendoGrid(JSON.parse(d.Value));

}

var KendoGrid = function (_data) {

    var record = 0;
    var record = 0;

    var colModel = [


        { title: "S/N", width: 40, template: "#= renderNumber() #" },
        { field: "subjectID", title: "Subject ID", hidden: true },
        { field: "subjectName", title: "Subject Name", width: 110, filterable: true, attributes: { class: "custom-grid-cell" } },
        { field: "isActive", title: "Status", width: 110, filterable: true },
        {
            field: "", width: 170,
            title: "Action",

            attributes: { class: "custom-grid-cell" },
            template: "# if (isActive == true) { # <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a>  &nbsp;&nbsp<button type='button' class='btn btn-danger btn-sm text-white'   onclick=deleteRecordByID('#=subjectID#')> Deactivate</button>  # } else   {# <a style='font-size:20px;cursor:pointer;' onClick= EditDetail(this) title='Edit Employee' ><span class='fa fa-edit'></span></a>  #}#",
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
            KendoGlobalAjax({ commandName: OESSUBJECT_COMMANDS.OES_DELETE_SUBJECT, values: "{SujectID:'" + id + "',ReasonOfDeletion: '" + restult.value + "'}", CallBack: '' });
            setTimeout(function () {

                LoadSubjectKendo();
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
    window.location.href = '/OESSubject/AddSubjects?SubjectID=' + dataItem.subjectID + '';
}


 
 