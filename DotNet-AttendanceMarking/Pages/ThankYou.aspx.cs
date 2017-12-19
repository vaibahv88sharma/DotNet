using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceMarking.Pages
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string teacherCard = Request["teacherCard"] ?? "(no name)";
            string crnNumber = Request["crnNumber"] ?? "(no time)";
            string termCode = Request["termCode"] ?? "(no time)";
            string urlkeys = Request["test"] ?? "(no time)";

            //replace dashes with spaces
            urlkeys = urlkeys.Replace("_", " ");
            Regex rgx = new Regex("[^a-zA-Z0-9 -]");
            //urlkeys = rgx.Replace(urlkeys, "");
            //split back into an array
            string[] arr = urlkeys.Split(',');
            string a = rgx.Replace(arr[0], "");

            string csvTargetLocation = @"D:\data\" + teacherCard + "_" + crnNumber + "_" + termCode + ".csv";
            string delimiterData = ",";
            StringBuilder csvSb = new StringBuilder();

            csvSb.AppendLine(string.Join(delimiterData,
                                              "StudentCard",
                                              "StaffCard",
                                              "CRN",
                                              "TermCode",
                                              "Date",
                                              "Day"
                                          ));

            for (int index = 0; index < arr.Length; index++)
            {
                csvSb.AppendLine(string.Join(delimiterData,
                                            rgx.Replace(arr[index], ""),
                                            teacherCard,
                                            crnNumber,
                                            termCode,
                                            DateTime.Now.ToString("dd/MM/yyyy"),
                                            (int)System.DateTime.Now.DayOfWeek
                                            )
                                 );
            }

            File.WriteAllText(csvTargetLocation, csvSb.ToString());


            //System.Configuration.ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString;  //MSOL



        }
    }
}