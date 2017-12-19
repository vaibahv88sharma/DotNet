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
    public partial class AttendanceSubmission : System.Web.UI.Page
    {

        public string FromServer;
        public string FromServerHeatId;
        public string FromServerTeacherId;
        public string FromServerCrn;
        public string FromServerTermCode;
        public string FromServerClassDate;
        public string FromServerThankYou;
        public string FromHeatTicketClose;
        public string FromServerTicketRefNumber;
        public string FromServerAttendanceSubmission;

        Files.dbConnection con = new Files.dbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {

            string demoHeatId = WebConfigurationManager.AppSettings["DemoHeatId"];
            //FromServer = Request["heatId"] ?? demoHeatId;// "From Server";

            string heatId = Request["heatId"] ?? demoHeatId;
            FromServerHeatId = Request["heatId"] ?? demoHeatId;
            string teacherId = Request["teacherId"] ?? "426964";
            FromServerTeacherId = Request["teacherId"] ?? "426964";
            string crn = Request["crn"] ?? "982587";
            FromServerCrn = Request["crn"] ?? "982587";
            string termCode = Request["termCode"] ?? "173894";
            FromServerTermCode = Request["termCode"] ?? "173894";
            //string classDate = Request["classDate"] ?? DateTime.Now.ToString("dd MMM yyyy");
            string classDate = Request["classDate"] ?? DateTime.Now.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //FromServerClassDate = Request["classDate"] ?? "10-Sep-2017";
            FromServerClassDate = Request["classDate"] ?? DateTime.Now.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);


            //FromServerTicketRefNumber = Request["ticketRefNumber"] ?? demoHeatId;

            FromServerThankYou = WebConfigurationManager.AppSettings["ThankYouUrl"];
            FromHeatTicketClose = WebConfigurationManager.AppSettings["HeatTicketClose"];
            FromServerAttendanceSubmission = WebConfigurationManager.AppSettings["AttendanceSubmission"];


            //string crnNumbers = Request.QueryString["paramName"];
            //heatIdLbl.Text = heatId;
            teacherCardLbl.Text = teacherId;
            crnLbl.Text = crn;
            termcodeLbl.Text = termCode;
            dateLbl.Text = classDate;

        }

        [WebMethod]
        public static List<MissingStudent> GetAllStudents(string query)
        {
            Files.dbConnection con = new Files.dbConnection();
            //List<Student> studentCollection = new List<Student>(100000);
            List<MissingStudent> studentCollection = new List<MissingStudent>();
            //var model = null;
            DataTable tempTable = null;

            string sclearsql = string.Concat(@"[dbo].[sp_getMissingStudents]");
            //tempTable = con.executeSelectNoParameter(sclearsql);

            SqlParameter[] parameter = {
                                                   new SqlParameter("@query", SqlDbType.VarChar) { Value =query }
                                                    };

            tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);


            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
            }
            else
            {
                foreach (DataRow dr in tempTable.Rows)
                {
                    MissingStudent st = new MissingStudent();
                    st.crn = dr["crn"].ToString();
                    st.termCode = dr["termCode"].ToString();
                    st.heatId = dr["heatId"].ToString();
                    st.bannerId = dr["bannerId"].ToString();
                    st.login = dr["login"].ToString();
                    st.studentName = dr["studentName"].ToString();
                    st.ticketRefNumber = dr["ticketRefNumber"].ToString();
                    st.mobilePersonal = dr["mobilePersonal"].ToString();
                    //string mag = dr["Magcode"].ToString();
                    st.Magcode = dr["Magcode"].ToString();
                    //st.image = "http://latasha.com.au/wp-content/uploads/online-profile-picture-45x45.jpg";
                    if (dr["Magcode"].ToString() == "")
                    {
                        st.image = @"\\SMSODBPWV01\photos$\PROD\" + "NoImage" + ".jpg";
                    }
                    else {
                        st.image = @"\\SMSODBPWV01\photos$\PROD\" + dr["bannerId"].ToString() + ".jpg";
                    }
                    //st.image = @"\\SMSODBPWV01\photos$\PROD\"+ dr["bannerId"].ToString() +".jpg";
                    st.checkBox = false;
                    studentCollection.Add(st);
                }
            }


            //return model;
            return studentCollection;
        }


        [WebMethod]
        //public static string CloseTicket(List<string> studentsData, string heatId, string teacherId, string crn, string termCode, string classDate)
        public static string CloseTicket(string heatId, string teacherId, string crn, string termCode, string classDate)

        //public static void CreateTicket(string staffNumber, string crn, string termCode)
        {
            string returnValue = "none";
            try
            {

                UtilResultObject res = new UtilResultObject();

                StudentAttendanceClient response = new StudentAttendanceClient();

                res = response.UpdateHEATTicketStatus(WebConfigurationManager.AppSettings["webServiceUsername"], WebConfigurationManager.AppSettings["webServicePassword"], heatId);

                if (res.Status)
                {
                    returnValue = "Ticket Closed";
                }
            }
            catch (Exception e)
            {
                returnValue = e.Message;
                throw e;
            }

            return returnValue;
        }

    }
        public class MissingStudent
        {
            public string crn { get; set; }
            public string termCode { get; set; }
            public string heatId { get; set; }
            public string login { get; set; }
            public string bannerId { get; set; }
            public string studentName { get; set; }
            public string ticketRefNumber { get; set; }
            public string mobilePersonal { get; set; }
            public bool checkBox { get; set; }
            public string image { get; set; }
            public string Magcode { get; set; }
            public string Tick1 { get; set; }



    }

}