using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace apps.Services
{
    public class FileAttachmentModel
    {
        public Dictionary<string, object> Fields { get; set; } = new Dictionary<string, object>();
        public List<FileUploadModel> FileUploads { get; set; } = new List<FileUploadModel>();
        public object FormFields { get; set; }
    }

    public class FileUploadModel
    {
        public string CurrentFileName { get; set; }
        public string CurrentFilePath { get; set; }
        public string OriginalFileName { get; set; }
        public byte[] File { get; set; }
        public string AttachmentType { get; set; }
    }

    public class AttachmentFileViewModel
    {
        public int Id { get; set; }
        public int EntityId { get; set; }
        public string OriginalFileName { get; set; }
        public string FileName { get; set; }
        public long FileSize { get; set; }
        public string FileExtension { get; set; }
        public string AttachmentType { get; set; }
        public byte[] File { get; set; }
        
    }
}