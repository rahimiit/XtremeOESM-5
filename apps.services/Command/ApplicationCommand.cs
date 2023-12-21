using System;
using CastleWindsorFactory.Core;
using System.Collections.Generic;
using CastleWindsorFactory.Repository;
using System.Configuration;
using System.Reflection;
using apps.Services.Model;
using System.Linq;
namespace apps.Services
{
    [Command(Name = APPS_COMMANDS.GET_USER_PROFILE_BY_ID)]
    public class GetUserProfilebyIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new {userId = string.Empty}, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@userId", model.userId);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetQueryMultiple<dynamic>(StoreProcedure.Employee.UserProfileById_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
       

    [Command(Name = APPS_COMMANDS.GET_USER_ROLE_BY_ID)]
    public class GetUserRoleByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { roleId = string.Empty }, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@RoleID", model.roleId);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetSingle<dynamic>(StoreProcedure.eGeneric.RoleById_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }

    }

    


    [Command(Name = APPS_COMMANDS.GET_USER_ROLES)]
    public class GetUserRolesCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { userId = string.Empty}, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@userId", model.userId);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.Employee.RolesByUserId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    [Command(Name = APPS_COMMANDS.GET_MENU_BY_ROLE)]
    public class GetMenusbyRoleIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { userId = string.Empty, roleId = string.Empty }, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@userId", model.userId);
            values.Add("@p_RoleID", model.roleId);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.Employee.MenusByRoleId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    

   [Command(Name = APPS_COMMANDS.GET_MENU_BY_PARENT)]
    public class GetMenusbyParentIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { parentId = string.Empty }, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@parentId", model.parentId);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.Employee.MenusByParentId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    [Command(Name = APPS_COMMANDS.GET_CAMP_BY_IP)]
    public class getCampByIPCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { IP = string.Empty}, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@IP", model.IP);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetSingle<dynamic>(StoreProcedure.eGeneric.CampByIP_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

   

     [Command(Name = APPS_COMMANDS.LIST_GHQ_UNITS)]
    public class ListGHQUnitsCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { lang = string.Empty }, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@Lang", model.lang);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.eGeneric.GHQUnits_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    [Command(Name = APPS_COMMANDS.Get_USER_LOGIN)]
    public class GetUserLoginCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { userEmail = string.Empty, password = string.Empty }, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@userEmail", model.userEmail);
            values.Add("@password", model.password);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.Employee.Employees_LoginVerification.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
 
    [Command(Name = "Class_Select")]
    public class GetClassSelectCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            object result = new { status = false, returnUrl = "#" };
          
            var model = base.MappedModel(new { Status = string.Empty }, v);

            try
            {
              
                var repository = Ioc.Resolve<IRepository>();
                //IDictionary<string, object> values = new Dictionary<string, object>();
            
                ICommandParameters _params = new CommandParameters();
                IDictionary<string, object> values = _params.Get(model);
                values = _params.Get(model);
                return repository.GetMultiple<dynamic>(StoreProcedure.OESClassEnum.sp_GetAllClasses.ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }

    [Command(Name = "OES_Add_Class")]
    public class OESAddClassCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            object result = new { status = false, returnUrl = "#" };

            var model = base.MappedModel(new { ClassID = 0, Status = false, ClassName = string.Empty}, v);

            try
            {
                var repository = Ioc.Resolve<IRepository>();
                ICommandParameters _params = new CommandParameters();
                IDictionary<string, object> values = _params.Get(model);
                values = _params.Get(model);
                return repository.GetSingle<dynamic>(StoreProcedure.OESClassEnum.sp_OES_Add_Class.ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }


}
