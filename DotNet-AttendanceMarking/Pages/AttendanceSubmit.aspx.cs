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

namespace AttendanceMarking.Pages
{
    public partial class AttendanceSubmit : System.Web.UI.Page
    {
        public string FromServer;
        public string FromServerHeatId;
        public string FromServerTeacherId;
        public string FromServerCrn;
        public string FromServerTermCode;
        public string FromServerClassDate;
        public string FromServerThankYou;
        public string FromHeatTicketClose;

        Files.dbConnection con = new Files.dbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string demoHeatId = "12751";
            FromServer = Request["heatId"] ?? demoHeatId;// "From Server";

            string heatId = Request["heatId"] ?? demoHeatId;
            FromServerHeatId = Request["heatId"] ?? demoHeatId;
            string teacherId = Request["teacherId"] ?? "426964";
            FromServerTeacherId = Request["teacherId"] ?? "426964";
            string crn = Request["crn"] ?? "982587";
            FromServerCrn = Request["crn"] ?? "982587";
            string termCode = Request["termCode"] ?? "173894";
            FromServerTermCode = Request["termCode"] ?? "173894";
            string classDate = Request["classDate"] ?? "10-Sep-2017 10 AM";
            FromServerClassDate = Request["classDate"] ?? "10-Sep-2017 10 AM";


            FromServerThankYou = WebConfigurationManager.AppSettings["ThankYouUrl"];
            FromHeatTicketClose = WebConfigurationManager.AppSettings["HeatTicketClose"];


            //string crnNumbers = Request.QueryString["paramName"];
            heatIdLbl.Text = heatId;
            teacherCardInput.Text = teacherId;
            crnInput.Text = crn;
            termcodeInput.Text = termCode;
            dateInput.Text = classDate;


        }

        [WebMethod]
        public static string CloseTicket(List<string> studentsData, string heatId, string teacherId, string crn, string termCode, string classDate)
        //public static void CreateTicket(string staffNumber, string crn, string termCode)
        {
            string returnValue = "none";
            try
            {

                UtilResultObject res = new UtilResultObject();

                StudentAttendanceClient response = new StudentAttendanceClient();

                res = response.UpdateHEATTicketStatus(WebConfigurationManager.AppSettings["webServiceUsername"], WebConfigurationManager.AppSettings["webServicePassword"], heatId);

                if (res.Status) {
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

        [WebMethod]
        public static List<Student> GetStudentsOnLoad()
        {
            //////////////////////////////////////////////////////
            //////////////////////////////////////////////////////
            //          DO NOT WORK FOR MORE THAN 300 - 400 RECORDS         // Failed under 500 records
            //////////////////////////////////////////////////////
            //////////////////////////////////////////////////////

            Files.dbConnection con = new Files.dbConnection();
            //List<Student> studentCollection = new List<Student>(100000);
            List<Student> studentCollection = new List<Student>();
            //var model = null;
            DataTable tempTable = null;

            string sclearsql = string.Concat(@"[dbo].[sp_getAllStudents]");
            tempTable = con.executeSelectNoParameter(sclearsql);

            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
            }
            else
            {
                foreach (DataRow dr in tempTable.Rows)
                {
                    Student st = new Student();
                    st.Login = dr["Login"].ToString();
                    st.Title = dr["Title"].ToString();
                    st.Initials = dr["Initials"].ToString();
                    st.FirstName = dr["FirstName"].ToString();
                    st.LastName = dr["LastName"].ToString();
                    st.PreferredName = dr["PreferredName"].ToString();
                    st.EmailInstitute = dr["EmailInstitute"].ToString();
                    st.EnrolmentDate = dr["EnrolmentDate"].ToString();
                    st.Gender = dr["Gender"].ToString();
                    st.DateOfBirth = dr["DateOfBirth"].ToString();
                    st.EmailPersonal = dr["EmailPersonal"].ToString();
                    st.TelephonePersonal = dr["TelephonePersonal"].ToString();
                    st.MobilePersonal = dr["MobilePersonal"].ToString();
                    st.USI = dr["USI"].ToString();
                    studentCollection.Add(st);
                }
            }

            

            var model = new List<Student>() {
              new Student{ FirstName="vaibhav", LastName="sharma"},
              new Student{ FirstName="Van", LastName="phan"},
              new Student{ FirstName="Akshay", LastName= "narang"}
            };


            //return model;
            return studentCollection;
        }

        [WebMethod]
           public static List<String> GetStudents(string query)
           {
               Files.dbConnection con = new Files.dbConnection();
               List<String> studentCollection = new List<String>();
               //var model = null;
               DataTable tempTable = null;
        
        
               string sclearsql = string.Concat("[dbo].[sp_getAllStudentsInputParams]");
               SqlParameter[] parameter = {
                                                   new SqlParameter("@query", SqlDbType.VarChar) { Value =query }
                                                    };
        
               tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);
        
               if ((tempTable == null) || (tempTable.Rows.Count == 0))
               {
                   //mail.To.Add(WebConfigurationManager.AppSettings["ToEmail"]);
               }
               else
               {
                   foreach (DataRow dr in tempTable.Rows)
                   {
                       studentCollection.Add(
                                "Name: "+dr["Name"].ToString() + dr["LastName"].ToString()
                                + " ,   " + "MobilePersonal: " + dr["MobilePersonal"].ToString()
                                + " ,   " + "Barcode: " + dr["Id"].ToString()
                            );
                   }
               }
        
               return studentCollection;
           }

     //  [WebMethod]
     //  public static List<StudentData> GetStudents(string query)
     //  {
     //      Files.dbConnection con = new Files.dbConnection();
     //      List<StudentData> studentCollection = new List<StudentData>();
     //      //var model = null;
     //      DataTable tempTable = null;
     //
     //
     //      string sclearsql = string.Concat("[dbo].[sp_getAllStudentsInputParams]");
     //      SqlParameter[] parameter = {
     //                                          new SqlParameter("@query", SqlDbType.VarChar) { Value =query }
     //                                           };
     //
     //      tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);
     //
     //      if ((tempTable == null) || (tempTable.Rows.Count == 0))
     //      {
     //          //mail.To.Add(WebConfigurationManager.AppSettings["ToEmail"]);
     //      }
     //      else
     //      {
     //          foreach (DataRow dr in tempTable.Rows)
     //          {
     //              StudentData st = new StudentData();
     //              st.Name = dr["Name"].ToString();
     //              st.Id = dr["Id"].ToString();
     //              studentCollection.Add(st);
     //          }
     //      }
     //
     //      return studentCollection;
     //  }


        protected void studentSearchTxtbx_TextChanged(object sender, EventArgs e)
        {

        }
    }

    public class Student
    {
        public string Login { get; set; }
        public string Title { get; set; }
        public string Initials { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PreferredName { get; set; }
        public string EmailInstitute { get; set; }
        public string EnrolmentDate { get; set; }
        public string Gender { get; set; }
        public string DateOfBirth { get; set; }
        public string EmailPersonal { get; set; }
        public string TelephonePersonal { get; set; }
        public string MobilePersonal { get; set; }
        public string USI { get; set; }
    }

    public class StudentData
    {
        public string Name { get; set; }
        public string Id { get; set; }
    }

}