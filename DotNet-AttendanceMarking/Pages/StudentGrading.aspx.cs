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
using System.Text;
using System.IO;

namespace AttendanceMarking.Pages
{
    public partial class StudentGrading : System.Web.UI.Page
    {
        public string FromServerStudentGrading;
        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerStudentGrading = WebConfigurationManager.AppSettings["StudentGrading"];
        }

        [WebMethod]
        public static List<ResultingData> GetResulting(string crn, string termCode)
        {
            Files.dbConnection con = new Files.dbConnection();
            //List<Student> studentCollection = new List<Student>(100000);
            List<ResultingData> studentCollection = new List<ResultingData>();
            //var model = null;
            DataTable tempTable = null;

            string sclearsql = string.Concat(@"[dbo].[sp_getAttendanceResulting]");
            //tempTable = con.executeSelectNoParameter(sclearsql);

            SqlParameter[] parameter = {
                                                   new SqlParameter("@crn", SqlDbType.VarChar) { Value =crn },
                                                   new SqlParameter("@termCode", SqlDbType.VarChar) { Value =termCode },
                                                    };

            tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);


            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
            }
            else
            {
                foreach (DataRow dr in tempTable.Rows)
                {
                    ResultingData st = new ResultingData();
                    st.crn = dr["crn"].ToString();
                    st.termCode = dr["termCode"].ToString();
                    st.bannerId = dr["bannerId"].ToString();
                    st.login = dr["login"].ToString();
                    st.studentName = dr["studentName"].ToString();
                    st.minDate = dr["minDate"].ToString();
                    st.maxDate = dr["maxDate"].ToString();
                    st.attendancePercent = dr["attendancePercent"].ToString();
                    st.openCalendar = false;
                    string[] values = dr["disabledDates"].ToString().Split(',');
                    if (values.Length > 0)
                    {
                        List<string> sublist = new List<string>();
                        foreach (string s in values)
                        {
                             sublist.Add(s);
                        }
                        st.disabledDates = sublist;
                    }
                    else {
                    }

                    st.Magcode = dr["Magcode"].ToString();
                    if (dr["Magcode"].ToString() == "")
                    {
                        st.image = @"\\SMSODBPWV01\photos$\PROD\" + "NoImage" + ".jpg";
                    }
                    else
                    {
                        st.image = @"\\SMSODBPWV01\photos$\PROD\" + dr["bannerId"].ToString() + ".jpg";
                    }

                    studentCollection.Add(st);
                }
            }


            //return model;
            return studentCollection;
        }

        [WebMethod]
        public static string PostResulting(List<ResultingData> resultingPostData)
        {
            Files.dbConnection con = new Files.dbConnection();
            DataTable tempTable = null;

            string sclearsql = string.Concat(@"[dbo].[sp_postAttendanceResulting]");

            SqlParameter[] parameter = {
                                            new SqlParameter("@crn", SqlDbType.VarChar) { Value = "" }
                                        };

            //tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);
            //
            //
            //if ((tempTable == null) || (tempTable.Rows.Count == 0))
            //{
            //}
            //else
            //{
            //}

            return "OK";
        }

        [WebMethod]
        public static string PostCreateResultingCsv(List<ResultingData> resultingPostData)
        {
            try
            {
                //string filePath = @"C:\"+ resultingPostData[0].crn.ToString() +"_"+ resultingPostData[0].termCode.ToString() + ".csv";
                string filePath = @"\\kismsbat-dev\E$\app\Interface\SAS\" + resultingPostData[0].crn.ToString() + "_" + resultingPostData[0].termCode.ToString() + ".csv";

                StringBuilder sb = new StringBuilder();

                sb.AppendLine(
                    "crn" + "," +
                    "termCode" + "," +
                    "bannerId" + "," +
                    "login" + "," +
                    "studentName" + "," +
                    "attendancePercent" + "," +
                    "result"
                );

                foreach (ResultingData student in resultingPostData)
                {
                    sb.AppendLine(
                        student.crn +","+
                        student.termCode + "," +
                        student.bannerId + "," +
                        student.login + "," +
                        student.studentName + "," +
                        student.attendancePercent + "," +
                        student.result
                    );
                }

                File.WriteAllText(filePath, sb.ToString());

            }
            catch (Exception e)
            {
                throw e;
            }
            return "OK";
        }

    }

    public class ResultingData
    {
        public string crn { get; set; }
        public string termCode { get; set; }
        public string staffId { get; set; }
        public string dateField { get; set; }
        public string login { get; set; }
        public string bannerId { get; set; }
        public string image { get; set; }
        public string studentName { get; set; }
        public string minDate { get; set; }
        public string maxDate { get; set; }
        public List<string>disabledDates { get; set; }
        public string Magcode { get; set; }
        public string attendancePercent { get; set; }
        public Boolean openCalendar { get; set; }
        public string result { get; set; }
    }

}