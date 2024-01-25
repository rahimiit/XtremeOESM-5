using System;
using CastleWindsorFactory.Core;
using System.Collections.Generic;
using CastleWindsorFactory.Repository;
using System.Configuration;
using System.Reflection;
using apps.Services.Model;
using System.Linq;
using apps.Services;

namespace apps.services.Command
{
    [Command(Name = OESUSER_COMMANDS.OES_DELETE_USER)]
    public class OESDeleteUserCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { ClassID = 0, ReasonOfDeletion = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESUserEnum.sp_OES_Delete_User.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESUSER_COMMANDS.OES_GET_USERById)]
    public class OESGetUserByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { UserID = 0 }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESUserEnum.sp_GetUserById.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESUSER_COMMANDS.OES_GET_USERALL)]
    public class OESGetUserAllCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESUserEnum.sp_GetAllUser.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESUSER_COMMANDS.OES_GET_USEROLE_DROP_DOWN)]
    public class OESGetUserRoleDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESUserEnum.sp_GetUserRole.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESUSER_COMMANDS.OES_GET_USERSTATUS_DROP_DOWN)]
    public class OESGetUserStatusDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESUserEnum.sp_GetUserStatus.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESUSER_COMMANDS.OES_GET_USEClass_DROP_DOWN)]
    public class OESGetUserClassDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESUserEnum.sp_GetUserClass.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = "OES_ADD_USER")]
    //[Command(Name = OESUSER_COMMANDS.OES_ADD_USER)]
    public class OESAddUserCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { UserID = 0, Username = string.Empty,
                EmailAddress = string.Empty,
                Password = string.Empty ,
                Status = string.Empty,
                Class = string.Empty,
                Role = string.Empty,
                DateOfBirth = string.Empty,
                FullName = string.Empty,
                FirstName = string.Empty,
                LastName = string.Empty,
                PhoneNumber = string.Empty,
                IDCardNumber = string.Empty,
                PostalCode = string.Empty,
                Address = string.Empty,
                IntakeYear = string.Empty,
                Code = string.Empty
          
            }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESUserEnum.sp_OES_AddUpdate_User.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
}
