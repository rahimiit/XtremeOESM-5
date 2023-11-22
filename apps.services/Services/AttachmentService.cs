using Castle.Core.Logging;
using CastleWindsorFactory.Core;
using System;
using System.Collections.Generic;
using System.Data;
using CastleWindsorFactory.Repository;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Text;
using apps.Services.Model;
using System.Drawing.Drawing2D;
using System.Linq;

namespace apps.Services
{

    public class UploadAttribute : Attribute
    {
        public string Name { get; set; }
    }
    public interface IFileService
    {
        void UploadFile(string originalFileName, string currentFileName, int attachmentTypeId , int entityId, string description, int userId, byte[] file);
        void UploadFileToLocalFolder(string originalFileName, string currentFileName, string _path, int attachmentTypeId, int entityId, string description, int userId, byte[] file);
        void UploadFileForMultipleEntities(string originalFileName, string currentFileName, int attachmentTypeId, DataTable entityId, string description, int userId, byte[] file);
        byte[] ResizeToImage(byte[] byteImageIn,Size size);
        byte[] ResizeToThumbnailImage(byte[] byteImageIn,Size size);
        //Image ResizeImageScale(Image imgToResize, Size size);


    }
    public class FileUploadService : IFileService
    {
        public void UploadFile(string originalFileName, string currentFileName, int attachmentTypeId, int entityId, string description, int userId, byte[] file)
        {
            
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@fileCurrentName", Path.GetFileName(currentFileName));
            values.Add("@fileOriginalName",originalFileName);
            values.Add("@entityId", entityId);
            values.Add("@description", description);
            values.Add("@attachmentTypeId", attachmentTypeId);
            values.Add("@userId", userId);
            values.Add("@fileBinary", file);
            var repository = Ioc.Resolve<IRepository>();
           repository.ExecuteProcedure(StoreProcedure.eAttachment.Attachment_Save.GetDescription().ToString(), values,connectionFactory._factory, connectionFactory._connection);
        }

      
        public void UploadFileForMultipleEntities(string originalFileName, string currentFileName, int attachmentTypeId, DataTable entityIds, string description, int userId, byte[] file)
        {

            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("@fileCurrentName", currentFileName);
            values.Add("@fileOriginalName", originalFileName);
            //values.Add("@entityId", entityId);
            values.Add("@description", description);
            values.Add("@attachmentTypeId", attachmentTypeId);
            values.Add("@userId", userId);
            values.Add("@fileBinary", file);
            var table = new KeyValuePair<string, DataTable>(StoreProcedure.UserDefindedTableTypes.EntityIDs.GetDescription().ToString(), entityIds);
            var RequestList = new Dictionary<string, KeyValuePair<string, DataTable>>();
            RequestList.Add("@EntityIDs", table);
         
            var repository = Ioc.Resolve<IRepository>();
          //  repository.ExecuteTableVariableProcedure<int>(StoreProcedure.Generic.AttachmentMultipleEntity_Save.GetDescription().ToString(), values, RequestList, connectionFactory._factory, connectionFactory._connection);
        }

        public void UploadFileToLocalFolder(string originalFileName, string currentFileName, string _path, int attachmentTypeId, int entityId, string description, int userId, byte[] file)
        {
            File.WriteAllBytes(@_path + originalFileName, file);
        }

        public byte[] ResizeToImage(byte[] byteImageIn,Size size)
        {
            byte[] currentByteImageArray = byteImageIn;
          // int scale = 1;

            //if (!IsValidImage(byteImageIn))
            //{
            //    return null;
            //}

            MemoryStream inputMemoryStrame = new MemoryStream(byteImageIn);
            Image fullsizeImage = Image.FromStream(inputMemoryStrame);
            System.Drawing.Imaging.ImageFormat imgFormat = fullsizeImage.GetImageFormat();
            //int _sourceW = fullsizeImage.Width;
            //int _sourceH = fullsizeImage.Height;

            //if (_sourceW > 800 && _sourceH<=1500)
            //{
            //    scale = 2;
            //}
            //if (_sourceW > 1500)
            //{
            //    scale = 3;
            //}

            //Image _resizedImage= fullsizeImage;
            //if (currentByteImageArray.Length > 1000000)
            //{
            //    _resizedImage = fullsizeImage.ResizeImageScaleFixedSize(new Size(_sourceW / scale, _sourceH / scale));
            //}
           Image _resizedImage = fullsizeImage.ResizeImageScaleFixedSize(size);
            MemoryStream resultStream = new MemoryStream();
            _resizedImage.Save(resultStream, imgFormat);
            currentByteImageArray = resultStream.ToArray();
            return currentByteImageArray;
        }

        public byte[] ResizeToThumbnailImage(byte[] byteImageIn,Size size)
        {
            byte[] currentByteImageArray = byteImageIn;
            //if (!byteImageIn.IsValidImage())
            //{
            //    return null;
            //}

            MemoryStream inputMemoryStrame = new MemoryStream(byteImageIn);
            Image fullsizeImage = Image.FromStream(inputMemoryStrame);
            System.Drawing.Imaging.ImageFormat imgFormat = fullsizeImage.GetImageFormat();
            Image _resizedImage = fullsizeImage.ResizeThumbnailImageScale(size);
            MemoryStream resultStream = new MemoryStream();
            _resizedImage.Save(resultStream, imgFormat);
            currentByteImageArray = resultStream.ToArray();
            return currentByteImageArray;
        }
        


      
       
    }
}
