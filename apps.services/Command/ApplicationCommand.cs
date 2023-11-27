using System;
using CastleWindsorFactory.Core;
using System.Collections.Generic;
using CastleWindsorFactory.Repository;
using System.Configuration;
using System.Reflection;
using apps.Services.Model;
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
            CommandParameters _param = new CommandParameters();
            
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



}
