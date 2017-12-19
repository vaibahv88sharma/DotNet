using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceMarking.Pages
{
    public partial class MultiCRN : System.Web.UI.Page
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