
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
    UserStatusDropdown();
    var Id = getUrlVars();
    $('#ClassID').val(Id.ClassID);
    if ($('#ClassID').val() !== '') {
        LoadClassDetails(Id.ClassID);
    }
    else {
        $('#ClassID').val(0);
    }
    

 
   
    $('#btnAddClass').on('click', function (e) {
        
        e.preventDefault();

        if (validateForm('frmAddUpdateClass')) {
            ; debugger
            var btn = document.getElementById("btnAddClass");
            btn.disabled = true;
            btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Please wait...';
            // Get the selected value from the Kendo dropdown
            var selectedStatus = $("#Status").data("kendoDropDownList").value();

            // Get the value from the input field
            var className = $("#ClassName").val();

            // Add the values to the form data
            var formData = new FormData($("#frmAddUpdateClass")[0]);
            formData.append("status", selectedStatus);
            formData.append("className", className);
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

            AjaxFormSubmit($("#frmAddUpdateClass"), options);
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
 