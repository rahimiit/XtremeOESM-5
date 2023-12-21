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
    [Command(Name = OESCLASS_COMMANDS.OES_DELETE_CLASS)]
    public class OESDeleteClassCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { ClassID = 0, ReasonOfDeletion = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);
          
            return repository.GetSingle<dynamic>(StoreProcedure.OESClassEnum.sp_OES_Delete_Class.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESCLASS_COMMANDS.OES_GET_CLASSBYID)]
    public class OESGetClassByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { ClassID = 0 }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESClassEnum.sp_GetClassesById.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
}
