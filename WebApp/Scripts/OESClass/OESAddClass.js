
$(document).ready(function () {
     
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
 
    var Id = getUrlVars();
    $('#ClassID').val(Id.ClassID);
    if ($('#ClassID').val() !== '') {
        LoadClassDetails(Id.ClassID);
    }
    else {
        $('#ClassID').val(0);
    }
    

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
    $('#btnAddClass').on('click', function (e) {
        
        e.preventDefault();

        if (validateForm('frmAddUpdateClass')) {
            var btn = document.getElementById("btnAddClass");
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

            AjaxFormSubmit($("#frmAddUpdateClass"), options);
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