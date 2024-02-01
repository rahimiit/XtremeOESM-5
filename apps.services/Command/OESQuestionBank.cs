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
    [Command(Name = OESQUESTION_COMMANDS.OES_GET_QuestionBy_Id)]
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

            var model = base.MappedModel(new { UserID = 1, QuestionID = 0, QuestionTitle = string.Empty, Marks = 0, Subject = 0, QuestionType = 0, Status = 0 }, v);

            try
            {
                var repository = Ioc.Resolve<IRepository>();
                ICommandParameters _params = new CommandParameters();
                IDictionary<string, object> values = _params.Get(model);
                values = _params.Get(model);
                dynamic questionData = repository.GetSingle<dynamic>(StoreProcedure.OESQuestionBankEnum.sp_OES_Add_Question
                    .ToString(), values, connectionFactory._factory, connectionFactory._connection);

                // Assuming the QuestionID is returned as part of the questionData object
                long questionID = questionData.QuestionID;

                // Prepare the result object
                result = new { QuestionID = questionID};
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
    [Command(Name = "OES_GET_CHECKBOX_QUESTIONTANSWER")]
    //[Command(Name = OESQUESTION_COMMANDS.OES_GET_CHECKBOX_QUESTIONTANSWER)]
    public class OESAddCheckBoxQuestionAnswerCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new CheckBoxQuestionAnswerModel
            {
                QuestionID2 = 0,
                txtOneChkAnswer = string.Empty,
                IsOptionCorrectOne = string.Empty,
                txttwoChkAnswer = string.Empty,
                IsOptionCorrectTwo = string.Empty ,
                txtthreeChkAnswer = string.Empty,
                IsOptionCorrecThree = string.Empty,
                txtChkAfournswer = string.Empty,
                IsOptionCorrectFour = string.Empty
            }, v);

         
            if (model.IsOptionCorrectOne == "on")
            {
                model.IsOptionCorrectOne = "1";
            }
            else
            {
                model.IsOptionCorrectOne = "0";
            }
            if (model.IsOptionCorrectTwo == "on")
            {
                model.IsOptionCorrectTwo = "1";
            }
            else{
                model.IsOptionCorrectTwo = "0";
            }
            if (model.IsOptionCorrecThree == "on")
            {
                model.IsOptionCorrecThree = "1";
            }
            else
            {
                model.IsOptionCorrecThree = "0";
            }
            if (model.IsOptionCorrectFour == "on")
            {
                model.IsOptionCorrectFour = "1";
            }
            else
            {
                model.IsOptionCorrectFour = "0";

            }
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.OES_ADD_CheckBox_QuestionAnswer.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    public class CheckBoxQuestionAnswerModel
    {
        public int QuestionID2 { get; set; }
        public string txtOneChkAnswer { get; set; }
        public string IsOptionCorrectOne { get; set; }
        public string txttwoChkAnswer { get; set; }
        public string IsOptionCorrectTwo { get; set; }
        public string txtthreeChkAnswer { get; set; }
        public string IsOptionCorrecThree { get; set; }
        public string txtChkAfournswer { get; set; }
        public string IsOptionCorrectFour { get; set; }
    }
    public class RadioBoxQuestionAnswerModel
    {
        public int QuestionID { get; set; }
        public string txtradioanswerOne { get; set; }
        public string rdioOptionOne { get; set; }
        public string txtradioanswertwo { get; set; }
        public string rdioOptiontwo { get; set; }
        public string txtradioanswerthree { get; set; }
        public string rdioOptionthree { get; set; }
        public string txtradioanswerfour { get; set; }
        public string rdioOptionfour { get; set; }
    }
    public class BooleanQuestionAnswerModel
    {
        public int QuestionID3 { get; set; }
        public string AnswerboolOne { get; set; }
        public string boolrdoOne { get; set; }
        public string Answerbooltwo { get; set; }
        public string boolrdotwo { get; set; }
  
    }
    [Command(Name = "OES_GET_RADIOBOX_QUESTIONTANSWER")]
    //[Command(Name = OESQUESTION_COMMANDS.OES_GET_RADIOBOX_QUESTIONTANSWER)]
    public class OESAddRadioBoxQuestionAnswerCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new RadioBoxQuestionAnswerModel
            {
                QuestionID = 0,
                txtradioanswerOne = string.Empty,
                rdioOptionOne = string.Empty,
                txtradioanswertwo = string.Empty,
                rdioOptiontwo = string.Empty,
                txtradioanswerthree = string.Empty,
                rdioOptionthree = string.Empty,
                txtradioanswerfour = string.Empty,
                rdioOptionfour = string.Empty
            }, v);


            if (model.rdioOptionOne == "on")
            {
                model.rdioOptionOne = "1";
            }
            else
            {
                model.rdioOptionOne = "0";
            }
            if (model.rdioOptiontwo == "on")
            {
                model.rdioOptiontwo = "1";
            }
            else
            {
                model.rdioOptiontwo = "0";
            }
            if (model.rdioOptionthree == "on")
            {
                model.rdioOptionthree = "1";
            }
            else
            {
                model.rdioOptionthree = "0";
            }
            if (model.rdioOptionfour == "on")
            {
                model.rdioOptionfour = "1";
            }
            else
            {
                model.rdioOptionfour = "0";

            }
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.OES_ADD_RadioBox_QuestionAnswer.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
    [Command(Name = "OES_GET_BOOL_QUESTIONTANSWER")]
    //[Command(Name = OESQUESTION_COMMANDS.OES_GET_BOOL_QUESTIONTANSWER)]
    public class OESAddBoolQuestionAnswerCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new BooleanQuestionAnswerModel
            {
                QuestionID3 = 0,
                AnswerboolOne = string.Empty,
                boolrdoOne = string.Empty,
                Answerbooltwo = string.Empty,
                boolrdotwo = string.Empty,
       
            }, v);


            if (model.boolrdoOne == "on")
            {
                model.boolrdoOne = "1";
            }
            else
            {
                model.boolrdoOne = "0";
            }
            if (model.boolrdotwo == "on")
            {
                model.boolrdotwo = "1";
            }
            else
            {
                model.boolrdotwo = "0";
            }
            
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);

            return repository.GetMultiple<dynamic>(StoreProcedure.OESQuestionBankEnum.OES_ADD_Bool_QuestionAnswer.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }
}
