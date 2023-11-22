using System.ComponentModel;

public class StoreProcedure
{

    public enum Employee
    {
        [Description("[Employee].[EmployeeByUnitCode_Select]")]
        EmployeeByUnitCode_Select,
        [Description("[Employee].[UserProfileById_Select]")]
        UserProfileById_Select,
        [Description("[Employee].[RolesByUserId_Select]")]
        RolesByUserId_Select,
        [Description("[Employee].[MenusByRoleId_Select]")]
        MenusByRoleId_Select,
        [Description("[Employee].[MenusByParentId_Select]")]
        MenusByParentId_Select,
        [Description("[Employee].[EmployeesByDepartment_Select]")]
        EmployeesByDepartment_Select,
        [Description("[Employee].[EmployeesByDeptSupervisor_Select]")]
        EmployeesByDeptSupervisor_Select,
        [Description("[Employee].[UserProfileByLoginId_Select]")]
        UserProfileByLoginId_Select,
        [Description("[Employee].[EmployeeDetailRequestbyId_Select]")]
        EmployeeDetailRequestbyId_Select,
        [Description("[Employee].[UserPhoneNoById_Select]")]
        UserPhoneNoById_Select,
        [Description("[Employee].[SearchEmployeeByNoName_Select]")]
        SearchEmployeeByNoName_Select,
        [Description("[Employee].[ExternalEmployee_Save]")]
        ExternalEmployee_Save,
        [Description("[Employee].[ExternalEmployees_Select]")]
        ExternalEmployees_Select
    }




    public enum Requests
    {

        [Description("[Request].[Printing_Save]")]
        Printing_Save,
        [Description("[Request].[Printing_SelectAll]")]
        Printing_SelectAll,
        [Description("[Request].[Designing_Save]")]
        Designing_Save,
        [Description("[Request].[Photography_Save]")]
        Photography_Save,
        [Description("[Request].[WebStieContent_Save]")]   // Old SP for website content same as Gatepass
        WebStieContent_Save,
        [Description("[Request].[WebSiteContent_Save]")]
        WebSiteContent_Save,
        [Description("[Request].[DigitalSignage_Save]")]
        DigitalSignage_Save,
        [Description("[Request].[ArabicChecking_Save]")]
        ArabicChecking_Save,
        [Description("[Request].[UnitRequest_Save]")]
        UnitRequest_Save,
        [Description("[Request].[RequestsGetNextId_Select]")]
        RequestsGetNextId_Select,
        [Description("[Request].[Category_SelectAll]")]
        Category_SelectAll,
        [Description("[Request].[SubCategoryByParent_Select]")]
        SubCategoryByParent_Select,
        [Description("[Request].[RequestByCategory_Select]")]
        RequestByCategory_Select,
        [Description("[Request].[RequestByCategoryAndUser_Select]")]
        RequestByCategoryAndUser_Select,
        [Description("[Request].[RequestByCategoryUserStatus_Select]")]
        RequestByCategoryUserStatus_Select,
        [Description("[Request].[RequestsTabsCountByUser_Select]")]
        RequestsTabsCountByUser_Select,
        [Description("[Request].[RequestsTabsCountByStatus_Select]")]
        RequestsTabsCountByStatus_Select,
        [Description("[Request].[RequestsTabsCountByStatusRole_Select]")]
        RequestsTabsCountByStatusRole_Select,
        [Description("[Request].[RequestsTabsCountByUserStatus_Select]")]
        RequestsTabsCountByUserStatus_Select,
        [Description("[Request].[RequestByRoleId_Select]")]
        RequestByRoleId_Select,
        [Description("[Request].[RequestByStatus_Select]")]
        RequestByStatus_Select,
        [Description("[Request].[RequestByStatusRole_Select]")]
        RequestByStatusRole_Select,
        [Description("[Request].[RequestByStatusRoleCategory_Select]")]
        RequestByStatusRoleCategory_Select,
        [Description("[Request].[RequestByDepartmentAndStatus_Select]")]
        RequestByDepartmentAndStatus_Select,
        [Description("[Request].[RequestMediaPendingByDepartment_Select]")]
        RequestMediaPendingByDepartment_Select,
        [Description("[Request].[RequestByDepartmentCategoryAndStatus_Select]")]
        RequestByDepartmentCategoryAndStatus_Select,
        [Description("[Request].[RequestTabsCountByDepartmentAndStatus_Select]")]
        RequestTabsCountByDepartmentAndStatus_Select,
        [Description("[Request].[RequestbyId_Select]")]
        RequestbyId_Select,
        [Description("[Request].[RequestStatusByRequestId_Select]")]
        RequestStatusByRequestId_Select,
        [Description("[Request].[RequestStatusWorkflowByRequestId_Select]")]
        RequestStatusWorkflowByRequestId_Select,
        [Description("[Request].[PaperType_SelectAll]")]
        PaperType_SelectAll,
        [Description("[Request].[PaperSizeType_SelectAll]")]
        PaperSizeType_SelectAll,
        [Description("[Request].[Requests_Save]")]
        Requests_Save,
        [Description("[Request].[Requests_Update]")]
        Requests_Update,
        [Description("[Request].[WebSites_SelectAll]")]
        WebSites_SelectAll,
        [Description("[Request].[WebsiteNewsCategory_SelectAll]")]
        WebsiteNewsCategory_SelectAll,
        [Description("[Request].[WebsiteGalleryCategory_SelectAll]")]
        WebsiteGalleryCategory_SelectAll,
        [Description("[Request].[RequestById_Delete]")]
        RequestById_Delete,
        [Description("[Request].[RequestApproveDraft_Update]")]
        RequestApproveDraft_Update,
        [Description("[Request].[RequestStatus_Update]")]
        RequestStatus_Update,
        [Description("[Request].[RequestStatusByMultiMedia_Update]")]
        RequestStatusByMultiMedia_Update,
        [Description("[Request].[RequestEmployee_Update]")]
        RequestEmployee_Update,
        [Description("[Request].[RequestEmployeeEscalate_Update]")]
        RequestEmployeeEscalate_Update,
        [Description("[Request].[RequestsDepartmentTotal_Select]")]
        RequestsDepartmentTotal_Select,
        [Description("[Request].[RequestByDeptSupvisorAndStatus_Select]")]
        RequestByDeptSupvisorAndStatus_Select,
        [Description("[Request].[RequestTabsCountByDeptSupvisorAndStatus_Select]")]
        RequestTabsCountByDeptSupvisorAndStatus_Select,
        [Description("[Request].[RequestsByDepartmentEmployeeCategoryStatus_Select]")]
        RequestsByDepartmentEmployeeCategoryStatus_Select,
        [Description("[Request].[RequestsByDepartmentCategoryStatus_Select]")]
        RequestsByDepartmentCategoryStatus_Select,
        [Description("[Request].[RequestByCategoryAndStatus_Select]")]
        RequestByCategoryAndStatus_Select,
        [Description("[Request].[RequestByCategoryStatusRole_Select]")]
        RequestByCategoryStatusRole_Select,
        [Description("[Request].[RequestsStatusCountByEmployee_Select]")]
        RequestsStatusCountByEmployee_Select,
        [Description("[Request].[SupervisorsByRequestId_Select]")]
        SupervisorsByRequestId_Select,
        [Description("[Request].[MultimediaUsersByRequestId_Select]")]
        MultimediaUsersByRequestId_Select,
        [Description("[Request].[SearchRequestByDate_Select]")]
        SearchRequestByDate_Select,
        [Description("[Request].[SearchRequestByDateAndStatus_Select]")]
        SearchRequestByDateAndStatus_Select,
        [Description("[Request].[NewsCategory_SelectAll]")]
        NewsCategory_SelectAll,
        [Description("[Request].[MessageNotificationEmailId_Select]")]
        MessageNotificationEmailId_Select,
        [Description("[Request].[RequestByCategoryStatusDeptAndUser_Select]")]
        RequestByCategoryStatusDeptAndUser_Select
    }


    public enum WSContent
    {
        [Description("[WSContent].[WebsiteWinnerPrize_SelectAll]")]
        WebsiteWinnerPrize_SelectAll,
        [Description("[WSContent].[WebsiteNews_Save]")]
        WebsiteNews_Save,
        [Description("[WSContent].[WebsiteGallery_Save]")]
        WebsiteGallery_Save,
        [Description("[WSContent].[WebsiteEmployeeOfMonth_Save]")]
        WebsiteEmployeeOfMonth_Save,
        [Description("[WSContent].[WebsiteSitePages_Save]")]
        WebsiteSitePages_Save,
        [Description("[WSContent].[WebsiteDigitalSignage_Save]")]
        WebsiteDigitalSignage_Save,
        [Description("[WSContent].[WebsiteGeneralContent_Save]")]
        WebsiteGeneralContent_Save,
        [Description("[WSContent].[WebsiteWinner_Save]")]
        WebsiteWinner_Save,
        [Description("[WSContent].[WebsiteContentByCategory_Select]")]
        WebsiteContentByCategory_Select,
        [Description("[WSContent].[WebsiteContentByRequest_Delete]")]
        WebsiteContentByRequest_Delete,
        [Description("[WSContent].[WebsiteContentById_Delete]")]
        WebsiteContentById_Delete

    }

    public enum eReports
    {
        
        [Description("[Report].[GeneralReport_Select]")]
        GeneralReport_Select,
        [Description("[Report].[DepartmentWise_Select]")]
        DepartmentWise_Select,
        [Description("[Report].[GetSecurityApproval]")]
        GetSecurityApproval
    }

    public enum eAttachment
    {
        [Description("[Attachment].[Attachment_Save]")]
        Attachment_Save,
        [Description("[Attachment].[AttachmentByEntityId_Select]")]
        AttachmentByEntityId_Select,
        [Description("[Attachment].[AttachmentFilesByEntityId_Select]")]
        AttachmentFilesByEntityId_Select,
        [Description("[Attachment].[AttachmentById_Select]")]
        AttachmentById_Select,
        [Description("[Attachment].[AttachmentById_Delete]")]
        AttachmentById_Delete
    }

    public enum UserDefindedTableTypes
    {
        [Description("[dbo].[EntityIDs]")]
        EntityIDs

    }

    public enum eGeneric
    {
        [Description("[Gen].[MediaDepartment_SelectAll]")]
        MediaDepartment_SelectAll,
        [Description("[Gen].[DashboardCounter_Select]")]
        DashboardCounter_Select,
        [Description("[Gen].[DashboardCounterByRole_Select]")]
        DashboardCounterByRole_Select,
        [Description("[Gen].[DashboardCounterByUser_Select]")]
        DashboardCounterByUser_Select,
        [Description("[Gen].[DashboardChartData_Select]")]
        DashboardChartData_Select,
        [Description("[Gen].[DashboardChartDataByCategory_Select]")]
        DashboardChartDataByCategory_Select,
        [Description("[Gen].[DashboardChartDataByDeptAndCategory_Select]")]
        DashboardChartDataByDeptAndCategory_Select,
        [Description("[Gen].[DashboardDepartmentCounter_Select]")]
        DashboardDepartmentCounter_Select,
        [Description("[Gen].[DashboardChartDataByDeptUserAndCategory_Select]")]
        DashboardChartDataByDeptUserAndCategory_Select,
        [Description("[Gen].[CampByIP_Select]")]
        CampByIP_Select,
        [Description("[Gen].[RoleById_Select]")]
        RoleById_Select,
        [Description("[Gen].[MenusTabsByMenuRoleId_Select]")]
        MenusTabsByMenuRoleId_Select,
        [Description("[Gen].[MediaAnnouncement_Select]")]
        MediaAnnouncement_Select,
        [Description("[Gen].[MediaAnnouncementById_Delete]")]
        MediaAnnouncementById_Delete,
        [Description("[Gen].[Grade_SelectAll]")]
        Grade_SelectAll,
        [Description("[Gen].[Applications_Select]")]
        Applications_Select,
        [Description("[Gen].[MediaAnnouncement_Save]")]
        MediaAnnouncement_Save,
        [Description("[Gen].[MediaAnnouncementById_Select]")]
        MediaAnnouncementById_Select,
        [Description("[Gen].[MediaAnnouncement_Publish]")]
        MediaAnnouncement_Publish,
        [Description("[Gen].[GHQUnits_Select]")]
        GHQUnits_Select,
        [Description("[Gen].[RequestStatusCounterByUserId_Select]")]
        RequestStatusCounterByUserId_Select,
        [Description("[Gen].[RequestStatusCounterByDeptId_Select]")]
        RequestStatusCounterByDeptId_Select
    }
    

}
