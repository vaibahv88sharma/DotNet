using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

namespace AttendanceMarking.Pages
{
    public partial class StudentAttendance : System.Web.UI.Page
    {
        public string FromServerCurrentPage;
        public string FromServerImageHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerCurrentPage = WebConfigurationManager.AppSettings["StudentAttendance"];
            FromServerImageHandler = WebConfigurationManager.AppSettings["ImageHandler"];            
        }
        [WebMethod]
        public static List<AttendanceCrnTerm> GetAllCrn(string staffId)
        {
         string oradb = @"Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = KISMSDB-DEV.kbtm.kangan.edu.au)(PORT = 1521))"
            + "(CONNECT_DATA =" + "(SERVER = DEDICATED)"
            + "(SERVICE_NAME = test.kbtm.KANGAN.EDU.AU)));"
            + "User Id=baninst1;Password=u_pick_it;";

        List<AttendanceCrnTerm> crnTermColl = new List<AttendanceCrnTerm>();
            Files.dbConnection con = new Files.dbConnection();
            System.Data.DataTable tempTable = null;
            string sclearsql = string.Concat(@"[dbo].[sp_getStaffBannerId]");
            SqlParameter[] parameter = {
                                            new SqlParameter("@query", SqlDbType.VarChar) { Value =staffId } //Akshay 220860
                                        };
            tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);
            string pidm = "";
            string staffName = "";
            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
                //worksheet.Cells[3, 1] = "Student 3";
            }
            else
            {
                //worksheet.Cells[4, 1] = "Student 4";
                foreach (DataRow drr in tempTable.Rows)
                {
                    pidm = drr["pidm"].ToString();
                    staffName = drr["name"].ToString();
                }
            }
           OracleConnection OrCon = new OracleConnection(oradb);
           OracleCommand cmd = new OracleCommand();
           //worksheet.Cells[6, 1] = "Student 6";
           cmd.CommandText = "select sirasgn_crn,sirasgn_term_code from sirasgn where sirasgn_pidm=" + pidm;
           cmd.Connection = OrCon;
           OrCon.Open();
           ///worksheet.Cells[7, 1] = "Student 7";
           //DataSet dataSet = new DataSet();
           //using (OracleDataAdapter dataAdapter = new OracleDataAdapter())
           //{
           //    dataAdapter.SelectCommand = cmd;
           //    dataAdapter.Fill(dataSet);
           //}
           
           OracleDataReader dr = cmd.ExecuteReader();
           if (dr.HasRows)
           {
               //worksheet.Cells[8, 1] = "Student 8";
               while (dr.Read())
               {
                    AttendanceCrnTerm list = new AttendanceCrnTerm();
                    list.crn = dr["sirasgn_crn"].ToString();
                    list.termCode = dr["sirasgn_term_code"].ToString();
                    list.staffName = staffName;
                    crnTermColl.Add(list);
                   //worksheet.Cells[9, 1] = "Student 9";
               }
           }
           
           OrCon.Close();
           OrCon.Dispose();
            //AttendanceCrnTerm list = new AttendanceCrnTerm();
            //list.crn = "10050";
            //list.termCode = "201710";
            //crnTermColl.Add(list);
            return crnTermColl;
        }
        [WebMethod]
        public static List<MissingStudent> GetAllStudents(string query)
        {
            Files.dbConnection con = new Files.dbConnection();

            List<MissingStudent> studentCollection = new List<MissingStudent>();

            #region SQL
            DataTable tempTable = null;
            string sclearsql = string.Concat(@"[dbo].[sp_getMissingStudentsDemo]");
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
                        //st.image = @"\\webapp01d-doc\sam\11Data\NoImage1.jpg";
                    }
                    else
                    {
                        st.image = @"\\SMSODBPWV01\photos$\PROD\" + dr["bannerId"].ToString() + ".jpg";
                    }
                    //st.image = @"\\SMSODBPWV01\photos$\PROD\"+ dr["bannerId"].ToString() +".jpg";
                    st.checkBox = false;
                    //st.Tick1= @"\\webapp01d-doc\C$\inetpub\wwwroot\SAM\11Data\Tick1Copy.jpg";
                    st.Tick1 = "//webapp01d-doc/sam/11Data/Tick1Copy.jpg";
                    studentCollection.Add(st);
                }
            }
            #endregion

            #region Oracle
            //OracleConnection OrCon = new OracleConnection(oradb);
            //OracleCommand cmd = new OracleCommand();
            //cmd.CommandText = "select sirasgn_crn,sirasgn_term_code from sirasgn where sirasgn_pidm=" + pidm;
            //cmd.Connection = OrCon;
            //OrCon.Open();
            //
            //OracleDataReader dr = cmd.ExecuteReader();
            //if (dr.HasRows)
            //{
            //    while (dr.Read())
            //    {
            //        //AttendanceCrnTerm list = new AttendanceCrnTerm();
            //        //list.crn = dr["sirasgn_crn"].ToString();
            //        //list.termCode = dr["sirasgn_term_code"].ToString();
            //        //crnTermColl.Add(list);
            //    }
            //}
            //
            //OrCon.Close();
            // OrCon.Dispose();
            #endregion

            //return model;
            return studentCollection;
        }
    }

}