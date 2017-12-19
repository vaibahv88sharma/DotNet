using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using AttendanceMarking.ServiceReference1;
using System.Net.Mail;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace AttendanceMarking.Pages
{
    public partial class AttendanceMarking : System.Web.UI.Page
    {
        public string FromServerThankYou;
        public string FromServerAttendanceMarking;

        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerThankYou = WebConfigurationManager.AppSettings["ThankYouUrl"];
            FromServerAttendanceMarking = WebConfigurationManager.AppSettings["AttendanceMarking"];
        }

        [WebMethod]
        public static List<HeatData> CreateTicket(string staffNumber, string crn, string termCode)
        {
            List<HeatData> heatData = new List<HeatData>();
            string sentToEmail = WebConfigurationManager.AppSettings["ToEmail"];
            try
            {
                UtilResultObject res = new UtilResultObject();
                 
                StudentAttendanceClient response = new StudentAttendanceClient();

                Files.dbConnection con = new Files.dbConnection(); // 218720 VP  // 22178 VS

                string sclearsql = string.Concat("SELECT * FROM [IntHub].[dbo].[StaffBKI] " +
                                                         "WHERE BarCode = @staffNumber" +
                                                         " and isActive = 1 and StaffType in ('Payroll BT','Payroll KI')"
                                                );
                SqlParameter[] parameter = {
                                                new SqlParameter("@staffNumber", SqlDbType.VarChar) { Value =staffNumber }
                                                 };
                DataTable tempTable = null;
                tempTable = con.executeSelectQuery(sclearsql, parameter);
                string emailTofromDB = WebConfigurationManager.AppSettings["ToEmail"];

                if ((tempTable == null) || (tempTable.Rows.Count == 0))
                {
                    emailTofromDB = WebConfigurationManager.AppSettings["ToEmailLogin"];
                }
                else
                {
                    foreach (DataRow dr in tempTable.Rows)
                    {
                        emailTofromDB = dr["Login"].ToString();
                        sentToEmail = dr["EmailInstitute"].ToString();
                    }
                }

                res = response.CreateHEATTicket(WebConfigurationManager.AppSettings["webServiceUsername"], 
                                                WebConfigurationManager.AppSettings["webServicePassword"],
                                                emailTofromDB,
                                                staffNumber, 
                                                crn, 
                                                termCode);

                if (res.Status)
                 {
                   try
                   {


                        MailMessage mail = new MailMessage();
                        SmtpClient SmtpServer = new SmtpClient("mail-relay.kbtm.kangan.edu.au");

                        mail.From = new MailAddress(WebConfigurationManager.AppSettings["FromEmail"]);

                        //Files.dbConnection con = new Files.dbConnection(); // 218720 VP  // 22178 VS


                        //string sclearsql = string.Concat("SELECT * FROM [IntHub].[dbo].[StaffBKI] " +
                        //                                         "WHERE BarCode = @staffNumber" +
                        //                                         " and isActive = 1 and StaffType in ('Payroll BT','Payroll KI')"
                        //                                );
                        //SqlParameter[] parameter = {
                        //                        new SqlParameter("@staffNumber", SqlDbType.VarChar) { Value =staffNumber }
                        //                         };
                        //DataTable tempTable = null;

                        //tempTable = con.executeSelectQuery(sclearsql, parameter);

                        //if ((tempTable == null) || (tempTable.Rows.Count == 0))
                        //{
                        //    mail.To.Add(WebConfigurationManager.AppSettings["ToEmail"]);
                        //}
                        //else
                        //{
                        //    foreach (DataRow dr in tempTable.Rows)
                        //    {
                        //        //dr["EmailInstitute"].ToString();
                        //        mail.To.Add(dr["EmailInstitute"].ToString());
                        //        sentToEmail = dr["EmailInstitute"].ToString();
                        //    }
                        //}
                        //where BarCode = CONVERT(varchar(50), 218720 )

                        mail.To.Add(sentToEmail);

                        mail.Subject = "Student Attendance Missing";

                        string heatCloseUrl = WebConfigurationManager.AppSettings["AttendanceSubmission"];
                        //string heatCloseUrl = WebConfigurationManager.AppSettings["HeatTicketClose"];

                        string url = heatCloseUrl+"?heatId=" + res.Message +
                                                    "&teacherId=" + staffNumber
                                                     + "&crn=" + crn
                                                     + "&termCode=" + termCode
                                                     + "&classDate=" + DateTime.Now.ToString("dd'/'MM'/'yyyy");

                        mail.Body = @"Heat Ticket is created." + " The id is:- " + res.Message + "\n" + url;

                        SmtpServer.Port = 25;
            
                       //SmtpServer.Send(mail);


                        HeatData hd = new HeatData();
                        hd.heatId = res.Message;
                        hd.message = res.Status.ToString();
                        hd.sentToEmail = sentToEmail;
                        hd.emailTofromDB = emailTofromDB;
                        heatData.Add(hd);

                        return heatData;

                    }
                   catch (Exception ex)
                   {
                        return heatData;
                        throw ex;
                        //MessageBox.Show(ex.ToString());
                    }
               }

                

            }
            catch (Exception)
            {
                throw;
            }

            //return message;
            return heatData;
        }

    }


    public class HeatData
    {
        public string message { get; set; }
        public string heatId { get; set; }
        public string sentToEmail { get; set; }
        public string emailTofromDB { get; set; }
        
    }


}