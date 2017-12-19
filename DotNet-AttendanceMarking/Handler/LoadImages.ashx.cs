using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace AttendanceMarking.Handler
{
    /// <summary>
    /// Summary description for LoadImages
    /// </summary>
    public class LoadImages : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try { 
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");

            string pathAndFilename = context.Request["filename"];               //  eg  "\\SomeNetworkPath\ExcelFile\MikesExcelFile.xls"
            string filename = System.IO.Path.GetFileName(pathAndFilename);      //  eg  "MikesExcelFile.xls"

            context.Response.ClearContent();

            WebClient webClient = new WebClient();
            using (Stream stream = webClient.OpenRead(pathAndFilename))
            {
                // Process image...
                byte[] data1 = new byte[stream.Length];
                stream.Read(data1, 0, data1.Length);

                context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", filename));
                context.Response.BinaryWrite(data1);

                context.Response.Flush();
                context.Response.SuppressContent = true;
                context.ApplicationInstance.CompleteRequest();
            }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}