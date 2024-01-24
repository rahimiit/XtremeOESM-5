using apps.Services;
using CastleWindsorFactory.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apps.services.Command
{
    [Command(Name = OESQUESTION_COMMANDS.OES_DELETE_QUESTION)]
    public class OESDeleteQuestionCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { QuestionID = 0, ReasonOfDeletion = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_OES_Delete_Question.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESQUESTION_COMMANDS.OES_GET_QUESTIONBYID)]
    public class OESGetQuestionByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { QuestionID = 0 }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_GetQuestionById.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESQUESTION_COMMANDS.OES_GET_QUESTIONS_SELECT)]

    public class GetQuestionSelectCommand : CamelCommandBase
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
                return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_GetAllQuestions.ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }

    [Command(Name = "OES_Add_Question")]

    public class OESAddQuestionCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            object result = new { status = false, returnUrl = "#" };

            var model = base.MappedModel(new { QuestionID = 0, Status = 0, SubjectName = string.Empty }, v);

            try
            {
                var repository = Ioc.Resolve<IRepository>();
                ICommandParameters _params = new CommandParameters();
                IDictionary<string, object> values = _params.Get(model);
                values = _params.Get(model);
                return repository.GetSingle<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_OES_Add_Question
                    .ToString(), values, connectionFactory._factory, connectionFactory._connection);

            }
            catch (Exception ex)
            {
                result = new { status = false, message = ex.Message };
            }
            return result;
        }

    }
    [Command(Name = OESQUESTION_COMMANDS.OES_GET_SUBJECT_DROP_DOWN)]
    public class OESGetSubjectDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_GetSubject.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    [Command(Name = OESQUESTION_COMMANDS.OES_GET_QUESTIONTYPE_DROP_DOWN)]
    public class OESGetQuestionTypeDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_GetQuestionType.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
}
