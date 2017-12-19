using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Oracle.DataAccess.Client;
using System.Web.Configuration;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Office.Interop;
using Excel = Microsoft.Office.Interop.Excel;

namespace AttendanceMarking.Pages
{
    public partial class Attendance : System.Web.UI.Page
    {
        public string FromServerCurrentPage;


        public static string oradb = @"Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = KISMSDB-DEV.kbtm.kangan.edu.au)(PORT = 1521))" 
            + "(CONNECT_DATA =" + "(SERVER = DEDICATED)" 
            + "(SERVICE_NAME = test.kbtm.KANGAN.EDU.AU)));" 
            + "User Id=baninst1;Password=u_pick_it;";

        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerCurrentPage = WebConfigurationManager.AppSettings["Attendance"];

            //OracleConnection con = new OracleConnection(oradb);
            //OracleCommand cmd = new OracleCommand();
            //cmd.CommandText = "select reference_number.nextval from dual";
            //cmd.Connection = con;
            //con.Open();
            //OracleDataReader dr = cmd.ExecuteReader();
            //if (dr.HasRows)
            //{
            //    Response.Write("<table border='1'>");
            //    Response.Write("<tr><th>Name</th><th>Roll No</th></tr>");
            //    while (dr.Read())
            //    {
            //
            //        Response.Write("<tr>");
            //        Response.Write("<td>" + dr["name"].ToString() + "</td>");
            //        Response.Write("<td>" + dr["roll_no"].ToString() + "</td>");
            //        Response.Write("</tr>");
            //    }
            //    Response.Write("</table>");
            //}
            //else
            //{
            //    Response.Write("No Data In DataBase");
            //}
            //
            //Response.Write("Connected to Oracle" + con.ServerVersion);
            //// Close and Dispose OracleConnection object  
            //con.Close();
            //con.Dispose();
            //Response.Write("Disconnected");
        }

        [WebMethod]
        public static List<AttendanceCrnTerm> GetAllCrn(string staffId)
        {
            List<AttendanceCrnTerm> crnTermColl = new List<AttendanceCrnTerm>();
            Microsoft.Office.Interop.Excel.Application excel;
            Microsoft.Office.Interop.Excel.Workbook worKbooK;
            Microsoft.Office.Interop.Excel.Worksheet worksheet;
            Microsoft.Office.Interop.Excel.Range celLrangE;
            excel = new Microsoft.Office.Interop.Excel.Application();
            excel.Visible = false;
            excel.DisplayAlerts = false;
            worKbooK = excel.Workbooks.Add(Type.Missing);
            worksheet = (Microsoft.Office.Interop.Excel.Worksheet)worKbooK.ActiveSheet; worksheet.Name = "StudentRepoertCard";
            worksheet.Range[worksheet.Cells[1, 1], worksheet.Cells[1, 8]].Merge();
            worksheet.Cells[1, 1] = "Student 1";

            try
            {
                Files.dbConnection con = new Files.dbConnection();


                worksheet.Cells[2, 1] = "Student 2";

                //celLrangE = worksheet.Range[worksheet.Cells[1, 1], worksheet.Cells[rowcount, ExportToExcel().Columns.Count]];
                //celLrangE.EntireColumn.AutoFit();
                //Microsoft.Office.Interop.Excel.Borders border = celLrangE.Borders;
                //border.LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
                //border.Weight = 2d;

                //celLrangE = worKsheeT.Range[worKsheeT.Cells[1, 1], worKsheeT.Cells[2, ExportToExcel().Columns.Count]];




               //System.Data.DataTable tempTable = null;
               //string sclearsql = string.Concat(@"[dbo].[sp_getStaffBannerId]");
               //SqlParameter[] parameter = {
               //                            new SqlParameter("@query", SqlDbType.VarChar) { Value =staffId } //Akshay 220860
               //                        };
               //tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);
               //string pidm = "";
               //if ((tempTable == null) || (tempTable.Rows.Count == 0))
               //{
               //    worksheet.Cells[3, 1] = "Student 3";
               //}
               //else
               //{
               //    worksheet.Cells[4, 1] = "Student 4";
               //    foreach (DataRow drr in tempTable.Rows)
               //    {
               //        pidm = drr["pidm"].ToString();
               //    }
               //}
               //worksheet.Cells[5, 1] = "Student 5";


                AttendanceCrnTerm list = new AttendanceCrnTerm();
                list.crn = "10050";
                list.termCode = "201710";
                crnTermColl.Add(list);


                //     OracleConnection OrCon = new OracleConnection(oradb);
                //     OracleCommand cmd = new OracleCommand();
                //     worksheet.Cells[6, 1] = "Student 6";
                //     cmd.CommandText = "select sirasgn_crn,sirasgn_term_code from sirasgn where sirasgn_pidm=" + pidm;
                //     cmd.Connection = OrCon;
                //     OrCon.Open();
                //     worksheet.Cells[7, 1] = "Student 7";
                //     //DataSet dataSet = new DataSet();
                //     //using (OracleDataAdapter dataAdapter = new OracleDataAdapter())
                //     //{
                //     //    dataAdapter.SelectCommand = cmd;
                //     //    dataAdapter.Fill(dataSet);
                //     //}
                //
                //     OracleDataReader dr = cmd.ExecuteReader();
                //     if (dr.HasRows)
                //     {
                //         worksheet.Cells[8, 1] = "Student 8";
                //         while (dr.Read())
                //         {
                //             AttendanceCrnTerm list = new AttendanceCrnTerm();
                //             list.crn = dr["sirasgn_crn"].ToString();
                //             list.termCode = dr["sirasgn_term_code"].ToString();
                //             crnTermColl.Add(list);
                //             worksheet.Cells[9, 1] = "Student 9";
                //         }
                //     }
                //
                //     OrCon.Close();
                //     OrCon.Dispose();

                worksheet.Cells[10, 1] = "Student 10";
            }
            catch (Exception ex)
            {
                worksheet.Cells[11, 1] = ex.Message; 
                throw ex;
            }
            finally
            {
                worKbooK.SaveAs("c:\\DeleteIt\\csharp-Excel" + "1" + ".xls"); //"c:\\DeleteIt\\csharp-Excel" + new DateTime().ToString() + ".xls"
                worKbooK.Close();
                excel.Quit();
            }

           //worKbooK.SaveAs("c:\\DeleteIt\\csharp-Excel" + "1" + ".xls"); //"c:\\DeleteIt\\csharp-Excel" + new DateTime().ToString() + ".xls"
           //worKbooK.Close();
           //excel.Quit();


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

    public class AttendanceCrnTerm
    {
        public string crn { get; set; }
        public string termCode { get; set; }
        public string staffName { get; set; }

    }

}