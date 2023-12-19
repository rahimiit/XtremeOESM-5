 


// OESAddClass.js
 
$(document).ready(function () {
    userId = window.localStorage.getItem("userId");
    username = window.localStorage.getItem('userName');
    roleID = window.localStorage.getItem("RoleId");
     
    var full_url = document.URL;            
    var url_array = full_url.split('=');   
    var url_arrayForDetail = full_url.split('??');  
    /*    id = url_array[1].split('??')[0];*/


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

    // Click event handler for the button
    $('#btnAddClass').on('click', function (e) {
        ; debugger
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
