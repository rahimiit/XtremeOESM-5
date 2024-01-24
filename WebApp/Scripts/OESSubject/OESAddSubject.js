
$(document).ready(function () {

    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
 
    var Id = getUrlVars();
    $('#SubjectID').val(Id.SubjectID);
    if ($('#SubjectID').val() !== '') {
        LoadSujectDetails(Id.SubjectID);
    }
    else {
        $('#ClassID').val(0);
    }




    $('#btnAddSubject').on('click', function (e) {

        e.preventDefault();

        if (validateForm('frmAddUpdateSubject')) {
            ; debugger
            var btn = document.getElementById("btnAddSubject");
            btn.disabled = true;
            btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Please wait...';
            // Get the selected value from the Kendo dropdown
            var selectedStatus = 1;

            // Get the value from the input field
            var className = $("#SubjectName").val();

            // Add the values to the form data
            var formData = new FormData($("#frmAddUpdateSubject")[0]);
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
                        window.location.href = '/OESSubject/Index';
                    }, 2000);


                },
                error: function (xhr, status, error) {
                    var errmsg = xhr.status + ':' + xhr.responseText + ':' + error;
                    alert(errmsg);
                }
            };

            AjaxFormSubmit($("#frmAddUpdateSubject"), options);
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


function LoadSujectDetails(id) {

    KendoGlobalAjax({ commandName: OESSUBJECT_COMMANDS.OES_GET_SUBJECTById, values: { SubjectID: id }, CallBack: loadSubjectDetailByID });

}

var loadSubjectDetailByID = function (d) {
    var jsonData = JSON.parse(d.Value);
    $('#SubjectID').text(jsonData.subjectID);
    $('#SubjectName').val(jsonData.subjectName);
 


}
 