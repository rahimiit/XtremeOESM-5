using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using apps.Services;
using System.Net;
using System.Collections;
using System.IO.Compression;
using System.IO;

namespace WebApp.Controllers
{
    public class SharedController : BaseController
    {
        // GET: Shared
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Download(int id)
        {
            var model = this.ProcessRequest<object, dynamic>(new { id = id }, "DownloadFileGet");
            return File((Byte[])model.file, System.Net.Mime.MediaTypeNames.Application.Octet, (string)model.fileName);

            //var model = this.ProcessRequest<object, AttachmentFileViewModel>(new { id = id }, "DownloadFileGet");
            //return File(model.File, System.Net.Mime.MediaTypeNames.Application.Octet, model.FileName);
        }

        public ActionResult DownloadZip(int id)
        {
            var files = this.ProcessRequest<object, IEnumerable<dynamic>>(new { id = id }, "DownloadMultipleFileZip");
            using (var ms=new MemoryStream())
            {
                using(var archive=new ZipArchive(ms, ZipArchiveMode.Create, true))
                {
                    foreach(var _file in files)
                    {
                        var zipEntry = archive.CreateEntry((string)_file.fileName, CompressionLevel.Fastest);
                        using (var zipStream = zipEntry.Open())
                        {
                            zipStream.Write((Byte[])_file.file, 0, ((Byte[])_file.file).Length);
                        }
                    }
                }
            return File(ms.ToArray(), "application/zip", "archive.zip");
            }
        }
    }
}