

var importJS = function (_file) {

    document.write('<script type="text/javascript" charset="UTF-8" src="' + _file + '"></script>');
    
    //var script = document.createElement("script");
    //script.setAttribute('src',"~/" + _file);
    //script.setAttribute('async', "false");
    //var first = document.head;
    ////alert(first);
    //first.insertBefore(script, first.firstElementChild);
    

    //var script = document.createElement('script');
    //script.src ='http://' + (location.host || 'localhost').split(':')[0] + ':1812/' + _file ;
    //document.getElementsByTagName('head')[0].appendChild(script);
}


var importStyle = function (_file) {
    $('head').append('<link type="text/css" rel="stylesheet" href="' + _file + '" />');
}

var themes = function () {
    //theme fonts
    importStyle("../../fonts/simple-line-icons/simple-line-icons.min.css");
    importStyle("../../fonts/font-awesome/css/font-awesome.min.css");
    importStyle("../../fonts/material-design-icons/material-icon.css");
    
    importStyle("../../themes/plugins/material/material.min.css");
    importStyle("../../themes/plugins/material/material.rtl.min.css");
    importStyle("../../themes/css/material_style.css");
    importStyle("../../themes/css/plugins.min.css");
    importStyle("../../themes/css/responsive.css");
    importJS("../../themes/plugins/material/material.min.js");
}
var _SNO = 'ت';
var LanguageTheme=function(lang)
{
    //alert(lang);
    var _direction = "RTL";
    if (lang === "en-US") {
        _direction = "LTR";
        _SNO = 'SNo';
    } 

    //importStyle("../../themes/" + _direction + "/app-assets/css/bootstrap.min.css");
    //importStyle("../../themes/" + _direction + "/app-assets/css/bootstrap-extended.min.css");
    //importStyle("../../themes/" + _direction + "/app-assets/css/components.min.css");
    //importStyle("../../themes/" + _direction + "/app-assets/css/core/colors/palette-gradient.min.css");


    if (_direction === "RTL") {
        importStyle("../../themes/" + _direction + "/app-assets/css/custom-rtl.min.css");
        
    } 
}


var summernote = function () {
   importStyle("../../themes/plugins/summernote/summernote.css");
   importJS("../../themes/plugins/summernote/summernote.js");
   importJS("../../themes/js/pages/summernote/summernote-data.js");
}

                                

var BootstrapFiles = function () {
    importStyle("../../themes/plugins/bootstrap/css/bootstrap.min.css");
  
    importJS("../../themes/plugins/bootstrap/js/bootstrap.min.js");
    importJS("../../themes/plugins/bootstrap-switch/js/bootstrap-switch.min.js");
    importJS("../../themes/plugins/sparkline/jquery.sparkline.js");
    importJS("../../themes/js/pages/sparkline/sparkline-data.js");
}

var Charts = function () {
    importJS("../../themes/plugins/chart-js/Chart.bundle.js");
    importJS("../../themes/plugins/chart-js/utils.js");
    importJS("../../themes/js/pages/chart/chartjs/home-data.js");
}


var DataPicker = function () {
    importStyle("../../themes/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css");
    importStyle("../../themes/plugins/bootstrap-daterangepicker/daterangepicker.css");
    importJS("../../themes/plugins/moment/min/moment.min.js");
    importJS("../../themes/plugins/bootstrap-daterangepicker/daterangepicker.js");
    importJS("../../themes/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js");
}


var FontAwesome5 = function () {
    //importStyle("/FontAwesome5/css/all.min.css");
    //importStyle("/FontAwesome5/css/fontawesome.min.css");
    //importStyle("/FontAwesome5/css/v4-shims.min.css");
    //importJS("/FontAwesome5/js/v4-shims.min.js");

   

}

var jQueryConfirm = function () {
    importStyle("../../Content/css/jquery-confirm.css");
    importJS("../../Content/js/jquery-confirm.js");
}

var jqGridGuriddo = function (lang) {
   // importStyle("../../Content/free-jqgrid/css/ui.jqgrid-bootstrap4.css");
  //  importStyle("../../Content/free-jqgrid/css/jqgrid.xtreme.css");
  //  importJS("../../Content/free-jqgrid/js/jquery.jqgrid.min.js");
    if (lang === 'ar-AE') {
        importJS("../../Content/free-jqgrid/dist/i18n/min/grid.locale-ar.js");
    } else {
        importJS("../../Content/free-jqgrid/dist/i18n/min/grid.locale-en.js");
    }
}


var AjaxifyForm = function () {
    importJS("../../themes/plugins/jquery.form.min.js");
}

var Select2Dropdown = function () {
    importStyle("../../themes/plugins/select2/select2.min.css");
    importJS("../../themes/plugins/select2/select2.min.js");
}


var ImportCommon = function () {
    importJS("../../JS/Common.js");
}
var BindCombo = function (data, $combo) {
    //alert(JSON.stringify(data));
    var $list = "";
    $combo.empty();
    $combo.append($('<option />'));
    $.map(data, function (item) {
        $combo.append($('<option />').val(item.id).text(item.name));
        $list += ";" + item.name + ":" + item.name;
    });
    return $list;
}
var GridFilterList = function (data) {
    var $list = "";
    $.map(data, function (item) {
        $list += ";" + item.name + ":" + item.name;
    });
    return $list;
}
var BindGurrido = function ($grid, $pager, $colNames, $colModel, $data) {
   // alert($data);
    $grid.jqGrid({
        data: $data,
        datatype: "local",
        contentType: "application/json; charset-utf-8",
        colNames: $colNames,
        colModel: $colModel,
        rownumbers: true,
        pager: $pager,
        rowNum: 15,
        rownumWidth: 50,
        rowList: [15,20, 30, 40, 50],
        height: '100%',
        viewrecords: true,
        loadonce: true,
        emptyrecords: 'No records are available to display',
        forceFit: true,
        autowidth: true,
        shrinkToFit: true,
        multiselect: false,
        //direction: 'rtl',
        loadComplete: function (_data) {
            $("tr.jqgrow:odd").addClass('myAltRowClassOdd');
            $("tr.jqgrow:even").addClass('myAltRowClassEven');
            // alert(JSON.stringify(_data));
        },
    });
    $grid.jqGrid('setGridParam', { data: $data });
    $grid.trigger('reloadGrid');
    $grid.jqGrid('filterToolbar', { stringResult: true, searchOnEnter: false, defaultSearch: "cn" });
    $grid.jqGrid('setLabel', 'rn', _SNO);
}


var BindKendoGrid = function ($grid, _data, _columns, _height, _size,_eventDataBound) {
    //alert(_size);
    _height = _height || 600;
    _size = _size || 15;
    _eventDataBound = _eventDataBound || '';

   // alert(_size);
    $grid.empty();
    $grid.kendoGrid({
        dataSource: {
            data: _data,
            pageSize: _size,
            schema: {
                model: {
                    id: "requestId",
                    fields:{
                        requestDate: { type: 'date' },
                        fromDate: { type: 'date' },
                        toDate: { type: 'date' },
                        assignDate: { type: 'date' },
                        createdDate: { type: 'date' }
                    }
                }
            }
        },
        dataBound:_eventDataBound,
      //  height: _height,
        scrollable: true,
        sortable: true,
        filterable: {
            mode: "row"
        },
        // editable: "inline",
        editable: false,
        pageable: {
            pageSizes: true,
            input: true,
            numeric: false
        },
        columns: _columns,
      //  pageable: true,
        dataBinding: function () {
            record = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },

    })
}
var BindKendoGridFixHeight = function ($grid, _data, _columns, _height, _size) {
    //alert(_size);
    _height = _height || 600;
    _size = _size || 15;


    // alert(_size);
    $grid.empty();
    $grid.kendoGrid({
        dataSource: {
            data: _data,
            pageSize: _size
        },

        height: _height,
        scrollable: true,
        sortable: true,
        filterable: {
            mode: "row"
        },
        // editable: "inline",
        editable: false,
        pageable: {
            pageSizes: true,
            input: true,
            numeric: false
        },
        columns: _columns,
      //  pageable: true,
        dataBinding: function () {
            record = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },

    })
}



var GlobalAjax = function (options) {
   // alert(options.commandName);
    $.ajax({
        type: 'POST',
       // headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem("token"),'accept':'application/json','Access-Control-Allow-Origin':'*' },
        url: '/services/Xtreme/process',
        data: JSON.stringify({ type: options.commandName, value: options.values }),
        contentType: "application/json; charset=utf-8",
        xhrFields: { withCredentials: false },
        statusCode: {
            401: function () {
            }
        },
        success: function (data) {
            if (options.CallBack !== '') { options.CallBack(data); }
        },
        error: function (ex) {
           // alert(JSON.stringify(ex));
        }
    });
}

var GlobalAxios = function (options) {
    axios({
        method: 'Post',
        url: '/services/Xtreme/process',
        data: { type: options.commandName, value: options.values },
        contentType: "application/json; charset=utf-8",
    }).then(function (response) {
        if (options.CallBack !== '') { options.CallBack(response.data); }
    });
    //axios.defaults.baseURL = '/services/PG/';
    //var api_url = 'process';
    //var data = { type: options.commandName, value: options.values };
    //axios.post(api_url, data).then(function (response) {
    //    //_callback(response.data);
    //    if (options.CallBack !== '') { options.CallBack(response.data); }
    //});
}

var AjaxFormSubmit = function ($form, opt) {
    var url = "/services/Xtreme/multipart/";
    $form.attr('action', url)
    $form.ajaxForm();
    $form.ajaxSubmit(opt);
}



function treePattern(arr, parent) {
    var out = [];
    for (var i in arr) {
        if (arr[i].parentid == parent) {
            var items = treePattern(arr, arr[i].id);
            if (items.length) {
                arr[i].items = items;
            }
            out.push(arr[i]);
        }
    }
    return out;
}

var validateForm = function ($form) {

    var valid = true;
    $('#' + $form + " input[required],#" + $form + " textarea[required],#" + $form + " select[required]").each(function () {
        if ($(this).hasClass('select2')) {
            $($(this).data('select2').$container).removeClass("invalid");
        } else if ($(this).hasClass('kendodropdown')) {
            $(this).parent().closest('.k-dropdown').removeClass("invalid");
        } else if ($(this).hasClass('kendodropdowntree')) {
            $(this).parent().closest('.k-dropdowntree').removeClass("invalid");
        } else if ($(this).attr("type") === "file") {
            $(this).parent().closest(".k-upload").removeClass('invalid');
            //$(this).parent().closest('.k-dropdowntree').removeClass("invalid");
        }
        else { $(this).removeClass('invalid'); }



        $(this).attr('title', '');
        if ($(this).hasClass('kendodropdowntree')) {
            //if (!$(this).value())
            var $tree = $(this).data("kendoDropDownTree")
            if(!$tree.value()){
                $(this).parent().closest('.k-dropdowntree').addClass("invalid");
            }
        } else if ($(this).attr("type") === "file") {
            var len = $(this).closest(".k-upload").find(".k-file").length;
            if (len == 0)
            {
               // valid = false;
                $(this).parent().closest(".k-upload").addClass('invalid');
            }

        }else if (!$(this).val()) {
            if ($(this).hasClass('kendodropdown')) {
                $(this).parent().closest('.k-dropdown').addClass("invalid");
            }
            else {
                $(this).addClass('invalid');
                
            }
            $(this).attr('title', 'This field is required');
            valid = false;
           // alert($(this).val());
         }
        //    else if ($(this).attr("type") === "file") {
        //    var len = $(this).closest(".k-upload").find(".k-file").length;
        //    if (len == 0)
        //    {
        //        valid = false;
        //        $(this).parent().closest(".k-upload").addClass('invalid');
        //    } else {
        //        $(this).addClass('invalid');
        //    }
        //    //$(this).attr('title', 'Enter valid email');
       // }

        if ($(this).attr("type") === "email" && !$(this).val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
            $(this).addClass('invalid');
            $(this).attr('title', 'Enter valid email');
            valid = false;
        }
    });
  //  alert(valid);
    return valid;
}


var dateFormat = function (_d) {
    if (_d == null) return "";
    var _date = new Date(_d);
    var _day = _date.getDate() + "";
    if (_day.length == 1) { _day = "0" + _day };
    var _month = (_date.getMonth() + 1) + "";
    if (_month.length == 1) { _month = "0" + _month };
    return _day + '/' + _month + '/' + _date.getFullYear();
}

function download(id) {
    window.location = "/212_Tajheez/Shared/Download/" + id;
}
function downloadMultipleFilesZip(id) {
    window.location = "/212_Tajheez/Shared/DownloadZip/" + id;
}


var getUrlVars = function () {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

var getConstantUrlVars = function (url) {
    var vars = [], hash;
    var hashes = url.slice(url.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

//function GetClientIPAddress() {
//    $.ajax({
//        type: 'GET',
//        url: '/services/PG/GetIPAddress',
//        contentType: "application/json; charset=utf-8",
//        xhrFields: { withCredentials: true },
//        statusCode: {
//            401: function () {
//            }
//        },
//        success: function (data) {
//            sessionStorage.setItem("IP", data);
//        },
//        error: function () {
//            alert('hello error');
//        }
//    });
//}