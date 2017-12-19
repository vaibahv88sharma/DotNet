using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceMarking.Pages
{
    public partial class HasCrn : System.Web.UI.Page
    {
        public string FromServerSingleCRN;
        public string FromServerMultiCRN;
        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerSingleCRN = WebConfigurationManager.AppSettings["SingleCRN"];
            FromServerMultiCRN = WebConfigurationManager.AppSettings["MultiCRN"];
        }
    }
}