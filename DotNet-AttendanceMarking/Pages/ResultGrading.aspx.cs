using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AttendanceMarking.ServiceReference1;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace AttendanceMarking.Pages
{
    public partial class ResultGrading : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static GradingInitialValues GetInitialValues(string initialQuery)
        {
            GradingInitialValues gradingInitialValues = new GradingInitialValues();
            try
            {
                gradingInitialValues.crn = "12682";//WebConfigurationManager.AppSettings["ThankYouUrl"];
                gradingInitialValues.termCode = "201710";//WebConfigurationManager.AppSettings["ThankYouUrl"];
                gradingInitialValues.staffId = "22178";//WebConfigurationManager.AppSettings["ThankYouUrl"];
                gradingInitialValues.dateField = DateTime.Now.ToString("dd/MM/yyyy");//WebConfigurationManager.AppSettings["ThankYouUrl"];
            }
            catch (Exception e)
            {
                throw e;
            }

            return gradingInitialValues;
        }
    }

    public class GradingInitialValues
    {
        public string crn { get; set; }
        public string termCode { get; set; }
        public string staffId { get; set; }
        public string dateField { get; set; }
    }


}