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
    [Command(Name = OESSUBJECT_COMMANDS.OES_DELETE_SUBJECT)]
    public class OESDeleteSubjectCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { SujectID = 0, ReasonOfDeletion = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESSubjectEnum.sp_OES_Delete_Subject.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESSUBJECT_COMMANDS.OES_GET_SUBJECTBYID)]
    public class OESGetSubjectByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { SubjectID = 0 }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESSubjectEnum.sp_GetSubjectById.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESSUBJECT_COMMANDS.OES_GET_SUBJECT_SELECT)]
     
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
                return repository.GetMultiple<dynamic>(StoreProcedure.OESSubjectEnum.sp_GetAllSubjects.ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }

    [Command(Name = "OES_Add_Subject")]

    public class OESAddSubjectCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            object result = new { status = false, returnUrl = "#" };

            var model = base.MappedModel(new { SubjectID = 0, Status = 0, SubjectName = string.Empty }, v);

            try
            {
                var repository = Ioc.Resolve<IRepository>();
                ICommandParameters _params = new CommandParameters();
                IDictionary<string, object> values = _params.Get(model);
                values = _params.Get(model);
                return repository.GetSingle<dynamic>(StoreProcedure.OESSubjectEnum.sp_OES_Add_Subject.ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }
}
