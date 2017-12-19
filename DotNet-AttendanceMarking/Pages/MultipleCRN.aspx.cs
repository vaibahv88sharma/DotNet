using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using Oracle.DataAccess.Client;
using System.Web.Configuration;

namespace AttendanceMarking.Pages
{
    public partial class MultipleCRN : System.Web.UI.Page
    {
        public string FromServerImageHandler;
        public string DataAPI;
        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerImageHandler = WebConfigurationManager.AppSettings["ImageHandler"];
            DataAPI = WebConfigurationManager.AppSettings["DataAPI"];
        }

    }
}