using System;
using CastleWindsorFactory.Repository;
using System.Collections.Generic;
using CastleWindsorFactory.Core;
using System.Configuration;
using System.Reflection;
using System.IO.Compression;
//using System.IO.Compression.FileSystem;

namespace apps.Services
{
    [Command(Name = "DownloadFileGet")]
    public class DownloadFileGetCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { id = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            // repository.
            return repository.GetSingle<dynamic>(StoreProcedure.eAttachment.AttachmentById_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }

    [Command(Name = "DownloadMultipleFileZip")]
    public class DownloadMultipleFileZipCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { id = string.Empty }, v);
            var repository = Ioc.Resolve<IRepository>();
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@EntityId", model.id);
            values.Add("@entityType",1);

            //ZipFile.CreateFromDirectory

            // repository.
            return repository.GetMultiple<dynamic>(StoreProcedure.eAttachment.AttachmentFilesByEntityId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }




    [Command(Name = "listAttachmentbyEntity")]
    public class ListAttachmentbyEntityCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { entityid = string.Empty, entityType =string.Empty}, v);
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@EntityId", model.entityid);
            values.Add("@entityType", model.entityType);
            var repository = Ioc.Resolve<IRepository>();
            return repository.GetMultiple<dynamic>(StoreProcedure.eAttachment.AttachmentByEntityId_Select.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
        }
    }


    [Command(Name = "deleteAttachmentbyid")]
    public class DeleteAttachmentByIdCommand : CamelCommandBase
    {
        protected override object DoAction(object v)
        {
            var model = base.MappedModel(new { id = string.Empty, userId = string.Empty }, v);
            ICommandParameters _params = new CommandParameters();
            IDictionary<string, object> values = _params.Get(model);
            var repository = Ioc.Resolve<IRepository>();
            repository.ExecuteProcedure(StoreProcedure.eAttachment.AttachmentById_Delete.GetDescription().ToString(), values, connectionFactory._factory, connectionFactory._connection);
            return new { status = true, message = "Successfully saved" };
        }
    }
}
