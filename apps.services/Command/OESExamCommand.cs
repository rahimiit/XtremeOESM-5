using apps.Services;
using CastleWindsorFactory.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apps.services.Command
{
    [Command(Name = OESEXAM_COMMANDS.OES_DELETE_EXAM)]
    public class OESDeleteExamCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { ClassID = 0, ReasonOfDeletion = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESExamEnum.sp_OES_Delete_Exam.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESEXAM_COMMANDS.OES_GET_EXAMById)]
    public class OESGetExamByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { UserID = 0 }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetSingle<dynamic>(StoreProcedure.OESExamEnum.sp_GetExamById.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESEXAM_COMMANDS.OES_GET_EXAMALL)]
    public class OESGetExamAllCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESExamEnum.sp_GetAllExam.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = OESEXAM_COMMANDS.OES_GET_EXAMSUBJECT_DROP_DOWN)]
    public class OESGetExamSubjectDropDownCommand : CamelCommandBase
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
 
    [Command(Name = OESEXAM_COMMANDS.OES_GET_EXAMClass_DROP_DOWN)]
    public class OESGetExamClassDropDownCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { Status = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESExamEnum.sp_GetUserClass.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = "OESAddExam")]
    //[Command(Name = OESUSER_COMMANDS.OES_ADD_USER)]
    public class OESAddExamCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new
            {
                ExamID = 0,
                UserID = 1,
                examName = string.Empty,
                examDescription = string.Empty,
                
                Status = string.Empty,
                Class = string.Empty,
                Subject = string.Empty,
                examStartDate = string.Empty,
                examenddate = string.Empty,
                Duration =0,
                MarksToPass=0,
              

            }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            values = _params.Get(model);
        
            DateTime? examStartDateValue = null;
            if (!string.IsNullOrEmpty(model.examStartDate) &&
                DateTime.TryParseExact(model.examStartDate, "yyyy-MM-ddTHH:mm", null, System.Globalization.DateTimeStyles.None, out DateTime parsedStartDate))
            {
                examStartDateValue = parsedStartDate;
            }

            values["examStartDate"] = examStartDateValue;
 
            DateTime? examenddateValue = null;
            if (!string.IsNullOrEmpty(model.examenddate) &&
                DateTime.TryParseExact(model.examenddate, "yyyy-MM-ddTHH:mm", null, System.Globalization.DateTimeStyles.None, out DateTime parsedEndDate))
            {
                examenddateValue = parsedEndDate;
            }

            values["examenddate"] = examenddateValue;

            return repository.GetSingle<dynamic>(StoreProcedure.OESExamEnum.sp_OES_AddUpdate_Exam.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
}
