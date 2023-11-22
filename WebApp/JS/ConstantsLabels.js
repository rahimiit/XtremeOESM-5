
// ********************************* LANGUAGE CONSTANTS **************************************

var _MilitaryNo = "Military No", _Rank = "Rank", _Name = "Name", _CreatedBy = "Requested By",_Date='Date', _Status = "Status";
var _fileUploadText = 'Select File(s)';
var _RequestNo = 'Request No', _RequestDate = 'Request Date', _Category = "Category", _SubCategory = "Sub Category", _File = 'File', _Unit = 'Unit', _Camp = 'Camp';

// Grid action lables
 var _lblApprove = 'Approve', _lblEdit = 'Edit', _lblDelete = 'Delete', _lblWorkflow = 'Workflow', _lblAttachment = 'Attachment', _lblZip = 'download Zip', _lblPrint = 'Print', _lblEscalate = 'Escalate', _lblComplete = 'Process';
 var btnDelete = 'Delete', btnCancel = 'Cancel', btnOK = 'OK',btnApprove='Approve';

if (_LANG == "ar-AE") {
    _MilitaryNo = "الرقم العسكري"; _Rank = "الرتبة"; _Name = "الإســــم"; _CreatedBy = "مقدم الطلب", _Date = 'التاريخ'; _ExpiryDate = "تاريخ الانتهاء"; _PublishDate = "تاريخ النشر"; _PrizeType = "Prize Type"; _Title = "العنوان"; _Description = 'الوصف'; _Category = "التصنيف", _Status = "الحالة";
    _lblApprove = 'الاعتماد', _lblEdit = 'تعديل', _lblDelete = 'حذف', _lblWorkflow = 'سير العمل', _lblAttachment = 'المرفق', _lblZip = 'تنزيل zip', _lblPrint = 'طباعة', _lblEscalate = 'تصعيد', _lblComplete = 'الإجراء';
    btnDelete = 'حذف', btnCancel = 'إلغاء', btnOK = 'موافق', btnApprove = 'إعتماد';
}


// ********************************* Messages CONSTANTS **************************************

var $DeleteMessage = "Are you sure? you want to delete this record.";
var $EmployeeSelectMessage = "Please select record from grid.";
var $DateValidationMessage = 'Please select start Date less then end Date';
var $TimeValidationMessage = 'Please select start time less then end time';
var $ApprovalMessage = "Are you sure to approve these requests?";

if (_LANG == "ar-AE") {
    $DeleteMessage = "هل أنت متأكد؟ من عملية الحذف";
    $EmployeeSelectMessage = "الرجاء اختيار طلب من القائمة";
    $DateValidationMessage = 'يرجي تحليد تاريخ البدء قبل تاريخ الإنتهاء';
    $TimeValidationMessage = 'يرجي تحديد وقت البدء قبل وقت الإنتهاء';
    $ApprovalMessage = "هل انت متأكد من اعتماد الطلب؟";
}


// ********************************* Dropdown **************************************

var _emptyOption = { name: "-- select --", id: "" };
if (_LANG === "ar-AE") {
    _emptyOption = { name: "-- إختر --", id: "" };
}



