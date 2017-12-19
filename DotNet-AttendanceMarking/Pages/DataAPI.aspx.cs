using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using Oracle.DataAccess.Client;
using System.Web.Configuration;
using AttendanceMarking.DataModel;

namespace AttendanceMarking.Pages
{
    public partial class DataAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<MultiCrnStudent> GetAllstudents(List<string> crnCollection) //String[] crnCollection
        {
            string oradb = @"Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = KISMSDB-DEV.kbtm.kangan.edu.au)(PORT = 1521))"
               + "(CONNECT_DATA =" + "(SERVER = DEDICATED)"
               + "(SERVICE_NAME = test.kbtm.KANGAN.EDU.AU)));"
               + "User Id=baninst1;Password=u_pick_it;";

            List<MultiCrnStudent> multiCrnStudent = new List<MultiCrnStudent>();
            OracleConnection OrCon = new OracleConnection(oradb);
            OracleCommand cmd = new OracleCommand();

            //12682
            //10050

            foreach (string crn in crnCollection)
            {
                //cmd.CommandText = @"SELECT GORADID_ADDITIONAL_ID as LoginId,spriden_id as LeagacyId,spriden_first_name || ' ' || spriden_last_name as FullName FROM GORADID,spriden 
                //                        WHERE GORADID_PIDM IN (SELECT SFRSTCR_PIDM FROM SFRSTCR WHERE SFRSTCR_CRN="+crn+@" and SFRSTCR_RSTS_CODE='RE' ) 
                //                        AND GORADID_ADID_CODE='HERI' 
                //                        and goradid_pidm=spriden_pidm 
                //                        and spriden_change_ind is null";
                cmd.CommandText = @"SELECT 
(select spriden_first_name || ' ' || spriden_last_name from spriden where spriden_pidm=
(select sirasgn_pidm from (select * from sirasgn where sirasgn_crn="+ crn + @" order by sirasgn_activity_date desc) where rownum=1) and spriden_change_ind is null) as Teacher ,
GORADID_ADDITIONAL_ID as LoginId,spriden_id as LeagacyId,spriden_first_name || ' ' || spriden_last_name as FullName FROM GORADID,spriden WHERE GORADID_PIDM IN 
(SELECT SFRSTCR_PIDM FROM SFRSTCR s WHERE SFRSTCR_CRN=" + crn + @" and SFRSTCR_RSTS_CODE='RE' ) AND GORADID_ADID_CODE='HERI' and goradid_pidm=spriden_pidm and spriden_change_ind is null 
";
                cmd.Connection = OrCon;
                OrCon.Open();

                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        MultiCrnStudent list = new MultiCrnStudent();
                        list.loginId = dr["LoginId"].ToString();
                        list.leagacyId = dr["LeagacyId"].ToString();
                        list.fullName = dr["FullName"].ToString();
                        list.teacher = dr["Teacher"].ToString();
                        list.crn = crn;
                        list.image = "\\\\SMSODBPWV01\\photos$\\PROD\\" + dr["LeagacyId"].ToString() + ".jpg";
                        list.marked = false;
                        multiCrnStudent.Add(list);
                    }
                }

                OrCon.Close();
                

            }
            OrCon.Dispose();
            return multiCrnStudent;
        }

    }
}