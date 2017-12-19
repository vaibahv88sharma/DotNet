using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentHubAPI.USI;
using System.Web.Configuration;
using StudentHubAPI.Model;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

namespace StudentHubAPI.Pages
{
    public partial class ApplicationData : System.Web.UI.Page
    {
        public string FromServerApplicationPage;
        public string FromServerApplicationApiPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            FromServerApplicationPage = WebConfigurationManager.AppSettings["Application"];
            FromServerApplicationApiPage = WebConfigurationManager.AppSettings["ApplicationData"];
        }

        #region Create Application
        [WebMethod]
        public static string SaveApplication(StudentApplicationData[] ed)
        {

            //HeatData hd = new HeatData();

            Files.dbConnection con = new Files.dbConnection();

            //DateTime birthdate = DateTime.ParseExact(ed[0].birthdate.ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);


            string sclearsql = string.Concat("[dbo].[sp_createApplication]");
            SqlParameter[] parameter = {
                                                new SqlParameter("@Title", SqlDbType.VarChar) { Value =ed[0].vrt_title },
                                                new SqlParameter("@firstName", SqlDbType.VarChar) { Value =ed[0].firstName },
                                                new SqlParameter("@lastname", SqlDbType.VarChar) { Value =ed[0].lastname },
                                                new SqlParameter("@Email", SqlDbType.VarChar) { Value =ed[0].emailaddress1 },
                                                new SqlParameter("@IsEmailValid", SqlDbType.VarChar) { Value = string.IsNullOrEmpty(ed[0].isEmailValid) ? "False" : ed[0].isEmailValid }, //{ Value =ed[0].isEmailValid },
                                                new SqlParameter("@mobilephone", SqlDbType.VarChar) { Value =ed[0].mobilephone },
                                                new SqlParameter("@IsNumberValid", SqlDbType.VarChar) { Value = string.IsNullOrEmpty(ed[0].isNumberValid) ? "False" : ed[0].isNumberValid }, //ed[0].isNumberValid },
                                                new SqlParameter("@birthdate", SqlDbType.VarChar) { Value =ed[0].birthdate },
                                                new SqlParameter("@Gender", SqlDbType.VarChar) { Value =ed[0].studentGender },
                                                new SqlParameter("@Postcode", SqlDbType.VarChar) { Value =ed[0].address1_postalcode },
                                                new SqlParameter("@ReasonToChooseBKIID", SqlDbType.VarChar) { Value =ed[0].vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID },
                                                new SqlParameter("@studiedHereBefore", SqlDbType.VarChar) { Value =ed[0].vrt_studiedatkanganinstitutebendigotafebefore },
                                                new SqlParameter("@prevStudentNumber", SqlDbType.VarChar) { Value =ed[0].vrt_kibtstudentidnumber },
                                                //new SqlParameter("@ResidencyID", SqlDbType.VarChar) { Value =ed[0].vrt_CountryofResidence.countryID },
                                                new SqlParameter("@ResidencyID", SqlDbType.VarChar) { Value =ed[0].vrt_australiancitizenshipresidency.residencyId },
                                                new SqlParameter("@IndigenousStatusID", SqlDbType.VarChar) { Value =ed[0].vrt_aboriginalortorresstraitislander.statusId },
                                                new SqlParameter("@CompletedQualification", SqlDbType.VarChar) { Value =ed[0].vrt_successfullycompletedqualifications },
                                                new SqlParameter("@HasUSI", SqlDbType.VarChar) { Value =ed[0].hasUSI },
                                                new SqlParameter("@USI", SqlDbType.VarChar) { Value =ed[0].vrt_uniquestudentidentifier },
                                                new SqlParameter("@VerifyUSI", SqlDbType.VarChar) { Value =ed[0].vrt_permissiontocheckfororcreateausi },
                                                new SqlParameter("@ApplyUSI", SqlDbType.VarChar) { Value =ed[0].applyUSI },
                                                new SqlParameter("@StreetNumber", SqlDbType.VarChar) { Value =ed[0].streetName },
                                                new SqlParameter("@StreetName", SqlDbType.VarChar) { Value =ed[0].streetNumber },
                                                new SqlParameter("@CityOfResidence", SqlDbType.VarChar) { Value =ed[0].city },
                                                new SqlParameter("@StateOfResidenceId", SqlDbType.VarChar) { Value =ed[0].state.stateID },
                                                new SqlParameter("@CityOfBirth", SqlDbType.VarChar) { Value =ed[0].vrt_CityorTownofBirth },
                                                new SqlParameter("@IsAddressValid", SqlDbType.VarChar) { Value = string.IsNullOrEmpty(ed[0].isAddressValid) ? "True" : ed[0].isAddressValid },
                                                new SqlParameter("@CountryOfBirthID", SqlDbType.VarChar) { Value =ed[0].vrt_CountryofBirth.countryID },
                                                new SqlParameter("@CountryOfResidenceID", SqlDbType.VarChar) { Value =ed[0].vrt_CountryofResidence.countryID },
                                                new SqlParameter("@ProofTypeID", SqlDbType.VarChar) { Value =ed[0].idProof.proofId },
                                                new SqlParameter("@ProofNumber", SqlDbType.VarChar) { Value =ed[0].idProofText },
                                                new SqlParameter("@PartialSave", SqlDbType.VarChar) { Value =ed[0].partialSave },
                                                //new SqlParameter("@CourseCampusID", SqlDbType.VarChar) { Value = ed[0].courseNCampus.courseCampusID },
                                                new SqlParameter("@LastModifiedBy", SqlDbType.VarChar) { Value ="svc_StudentHub" },
                                                new SqlParameter("@CreatedBy", SqlDbType.VarChar) { Value ="svc_StudentHub" }
                                                 };
            DataTable tempTable = null;
            tempTable = con.executeSelectQueryWithSP(sclearsql, parameter);

            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
                string a = tempTable.Rows[0][0].ToString();
            }
            if ((ed[0].txtQualification.Count > 0) || (ed[0].txtQualification != null))
            {
                string qualificationInsertQry = string.Concat("[dbo].[sp_createApplicationQualifications]");
                foreach (Qualification qual in ed[0].txtQualification)
                {
                    //qualification: "", selected: false, internalName: "", qualificationID: 0 
                    if (qual.qualificationID != 0)
                    {
                        SqlParameter[] qualificationInsertQryParameter = {
                                                    new SqlParameter("@applicationID", SqlDbType.VarChar) { Value =tempTable.Rows[0][0] },
                                                    new SqlParameter("@qualificationCode", SqlDbType.VarChar) { Value =qual.qualificationID }
                                                     };
                        DataTable qualTable = null;
                        qualTable = con.executeSelectQueryWithSP(qualificationInsertQry, qualificationInsertQryParameter);
                    }
                }
            }
            if ((ed[0].courseNCampus.Count > 0) || (ed[0].courseNCampus != null))
            {
                string ccInsertQry = string.Concat("[dbo].[sp_createApplicationCourseCampus]");
                foreach (CourseNCampus cc in ed[0].courseNCampus)
                {
                    if (cc.courseCampusID != 0)// || cc.vrt_course != 0 || cc.txtCampus != 0 ||)
                    {
                        SqlParameter[] qualificationInsertQryParameter = {
                                                    new SqlParameter("@applicationID", SqlDbType.VarChar) { Value =tempTable.Rows[0][0] },
                                                    new SqlParameter("@courseCampusID", SqlDbType.VarChar) { Value =Convert.ToInt32(cc.courseCampusID)},
                                                    //new SqlParameter("@CourseValueID", SqlDbType.VarChar) { Value =Convert.ToInt32(cc.vrt_course)},
                                                    //new SqlParameter("@CampusValueID", SqlDbType.VarChar) { Value =cc.txtCampus}
                                                     };
                        DataTable ccTable = null;
                        ccTable = con.executeSelectQueryWithSP(ccInsertQry, qualificationInsertQryParameter);
                    }
                }
            }

            if (Convert.ToInt32(ed[0].partialSave.ToString()) == 1)
            {
                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("mail-relay.kbtm.kangan.edu.au");
                    mail.From = new MailAddress(WebConfigurationManager.AppSettings["FromEmail"]);
                    mail.To.Add(WebConfigurationManager.AppSettings["FromEmail"]);
                    mail.Subject = "Complete Bendigo Kangan Course Application";

                    string url = WebConfigurationManager.AppSettings["Application"] + "?applicationId=" + tempTable.Rows[0][0].ToString() +
                                                "&date=" + DateTime.Now.ToString("dd'/'MM'/'yyyy");

                    mail.Body = @" The URL is:- " + "\n" + url;
                    SmtpServer.Port = 25;
                    SmtpServer.Send(mail);
                }
                catch (Exception ex)
                {
                }
            }

            string returnValue = "none";
            try
            {


                //hd.heatId = res.Message;
                //hd.message = "Ticket Created";


            }
            catch (Exception e)
            {
                returnValue = e.Message;
                throw e;
            }

            return tempTable.Rows[0][0].ToString();
        }
        #endregion

        #region Get Application All Lookups Post Method
        [WebMethod]
        public static StudentApplicationDataLookup GetApplicationLookups() //StudentApplicationDataLookup
        {
            Files.dbConnection con = new Files.dbConnection();
            StudentApplicationDataLookup lkp = new StudentApplicationDataLookup();
            try
            {

                #region Course List
                List<Course> courses = new List<Course>();

                string sqlCourses = string.Concat("[dbo].[sp_getCourses]");
                DataTable tempTableCourse = null;
                tempTableCourse = con.executeSelectNoParameter(sqlCourses); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCourse != null) || (tempTableCourse.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCourse.Rows)
                    {
                        Course course = new Course();
                        course.CourseID = Convert.ToInt32(drr["CourseID"]);
                        course.CourseName = drr["Course"].ToString();
                        course.CourseCode = drr["CourseCode"].ToString();
                        courses.Add(course);
                    }
                }
                lkp.course = courses;
                #endregion

                #region Get Campus
                List<Campus> campuses = new List<Campus>();

                string sqlCampuses = string.Concat("[dbo].[sp_getAllCampus]");
                DataTable tempTableCampus = null;
                tempTableCampus = con.executeSelectNoParameter(sqlCampuses); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCampus != null) || (tempTableCampus.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCampus.Rows)
                    {
                        Campus campus = new Campus();
                        campus.campusID = Convert.ToInt32(drr["CampusID"].ToString());
                        campus.campusName = drr["Campus"].ToString();
                        campuses.Add(campus);
                    }
                }
                lkp.campus = campuses;
                #endregion

                #region Get Country
                List<Country> countries = new List<Country>();

                string sqlCountry = string.Concat("[dbo].[sp_getCountry]");
                DataTable tempTableCountry = null;
                tempTableCountry = con.executeSelectNoParameter(sqlCountry); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCountry != null) || (tempTableCountry.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCountry.Rows)
                    {
                        Country country = new Country();
                        country.countryID = Convert.ToInt32(drr["CountryID"].ToString());
                        country.country = drr["Country"].ToString();
                        countries.Add(country);
                    }
                }
                lkp.country = countries;
                #endregion

                #region Get Residency
                List<Residency> residencyCollection = new List<Residency>();

                string sqlResidency = string.Concat("[dbo].[sp_getResidency]");
                DataTable tempResidency = null;
                tempResidency = con.executeSelectNoParameter(sqlResidency); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempResidency != null) || (tempResidency.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempResidency.Rows)
                    {
                        Residency residency = new Residency();
                        residency.residencyId = Convert.ToInt32(drr["ResidencyId"].ToString());
                        residency.vrt_australiancitizenshipresidency = drr["Residency"].ToString();
                        residency.type = drr["Type"].ToString();
                        residencyCollection.Add(residency);
                    }
                }
                lkp.vrt_australiancitizenshipresidency = residencyCollection;
                #endregion

                #region Get Aboriginal
                List<Aboriginal> aboriginalCollection = new List<Aboriginal>();

                string sqlAboriginal = string.Concat("[dbo].[sp_getIndigenousAustralians]");
                DataTable tempAboriginal = null;
                tempAboriginal = con.executeSelectNoParameter(sqlAboriginal); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempAboriginal != null) || (tempAboriginal.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempAboriginal.Rows)
                    {
                        Aboriginal aboriginal = new Aboriginal();
                        aboriginal.statusId = Convert.ToInt32(drr["StatusId"].ToString());
                        aboriginal.vrt_aboriginalortorresstraitislander = drr["Status"].ToString();
                        aboriginalCollection.Add(aboriginal);
                    }
                }
                lkp.vrt_aboriginalortorresstraitislander = aboriginalCollection;
                #endregion

                #region Get Qualification
                List<Qualification> qualificationCollection = new List<Qualification>();

                string sqlQualification = string.Concat("[dbo].[sp_getQualification]");
                DataTable tempsqlQualification = null;
                tempsqlQualification = con.executeSelectNoParameter(sqlQualification); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlQualification != null) || (tempsqlQualification.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlQualification.Rows)
                    {
                        Qualification qualification = new Qualification();
                        qualification.qualificationID = Convert.ToInt32(drr["QualificationID"].ToString());
                        qualification.qualification = drr["Qualification"].ToString();
                        qualification.internalName = drr["internalName"].ToString();
                        qualification.selected = false;
                        qualification.qualificationCode = drr["qualificationCode"].ToString() ?? "";
                        qualificationCollection.Add(qualification);
                    }
                }
                lkp.txtQualification = qualificationCollection;
                #endregion

                #region Get State
                List<State> stateCollection = new List<State>();

                string sqlState = string.Concat("[dbo].[sp_getState]");
                DataTable tempsqlState = null;
                tempsqlState = con.executeSelectNoParameter(sqlState); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlState != null) || (tempsqlState.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlState.Rows)
                    {
                        State state = new State();
                        state.stateID = Convert.ToInt32(drr["StateID"].ToString());
                        state.state = drr["State"].ToString();
                        stateCollection.Add(state);
                    }
                }
                lkp.state = stateCollection;
                #endregion

                #region Get IdProof
                List<IdProof> idProofCollection = new List<IdProof>();

                string idProofState = string.Concat("[dbo].[sp_getIdentityProof]");
                DataTable tempsqlIdProof = null;
                tempsqlIdProof = con.executeSelectNoParameter(idProofState); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlIdProof != null) || (tempsqlIdProof.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlIdProof.Rows)
                    {
                        IdProof idProof = new IdProof();
                        idProof.proofId = Convert.ToInt32(drr["ProofId"].ToString());
                        idProof.idProofName = drr["IdentityProof"].ToString();
                        idProof.type = drr["Type"].ToString();
                        idProof.internalName = drr["InternalName"].ToString();
                        idProofCollection.Add(idProof);
                    }
                }
                lkp.idProof = idProofCollection;
                #endregion

                #region Get WhatBroughtYouHere
                List<WhatBroughtYouHere> whatBroughtYouHereCollection = new List<WhatBroughtYouHere>();

                string sqlwhatBroughtYouHereCollection = string.Concat("[dbo].[sp_getReasonToChooseBKI]");
                DataTable tempsqlWhatBroughtYouHere = null;
                tempsqlWhatBroughtYouHere = con.executeSelectNoParameter(sqlwhatBroughtYouHereCollection); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlWhatBroughtYouHere != null) || (tempsqlWhatBroughtYouHere.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlWhatBroughtYouHere.Rows)
                    {
                        WhatBroughtYouHere state = new WhatBroughtYouHere();
                        state.reasonToChooseBKIID = Convert.ToInt32(drr["ReasonToChooseBKIID"].ToString());
                        state.vrt_whatbroughtyoutothekanganinstitutewebsite = drr["ReasonToChooseBKI"].ToString();
                        whatBroughtYouHereCollection.Add(state);
                    }
                }
                lkp.whatBroughtYouHere = whatBroughtYouHereCollection;
                #endregion

            }
            catch (Exception e)
            {
            }
            return lkp;
        }
        #endregion

        #region Get Form Data from ID
        [WebMethod]
        //[ScriptMethod(UseHttpGet = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static StudentApplicationData GetFormData(string applicationId) //string applicationId
        {
            Files.dbConnection con = new Files.dbConnection();
            StudentApplicationData applicationDetails = new StudentApplicationData();
            try
            {
                string sql_getApplicationDetails = string.Concat("[dbo].[sp_getApplicationDetails]");
                DataTable tempTable_getApplicationDetails = null;
                SqlParameter[] parameter = {
                                                new SqlParameter("@applicationId", SqlDbType.VarChar) { Value =applicationId }
                                                 };

                tempTable_getApplicationDetails = con.executeSelectQuery(sql_getApplicationDetails, parameter);
                if ((tempTable_getApplicationDetails != null) || (tempTable_getApplicationDetails.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTable_getApplicationDetails.Rows)
                    {
                        applicationDetails.vrt_title = drr["Title"].ToString();
                        applicationDetails.firstName = drr["FirstName"].ToString();
                        applicationDetails.lastname = drr["Lastname"].ToString();
                        applicationDetails.emailaddress1 = drr["Email"].ToString();
                        applicationDetails.isEmailValid = drr["IsEmailValid"].ToString();
                        applicationDetails.mobilephone = drr["MobilePhone"].ToString();
                        applicationDetails.isNumberValid = drr["IsNumberValid"].ToString();
                        applicationDetails.birthdate = drr["BirthdateFormatted"].ToString();//Birthdate

                        #region Get course and campus lookup
                        string sql_getApplicationCourseCampus = string.Concat("[dbo].[sp_getApplicationCourseCampus]");
                        DataTable tempTable_getApplicationCourseCampus = null;
                        SqlParameter[] parameterApplicationCourseCampus = {
                                                new SqlParameter("@applicationId", SqlDbType.VarChar) { Value =applicationId }
                                                 };

                        tempTable_getApplicationCourseCampus = con.executeSelectQuery(sql_getApplicationCourseCampus, parameterApplicationCourseCampus);
                        applicationDetails.courseNCampus = new List<CourseNCampus>();
                        if ((tempTable_getApplicationCourseCampus != null) && (tempTable_getApplicationCourseCampus.Rows.Count > 0))
                        {
                            foreach (DataRow dr in tempTable_getApplicationCourseCampus.Rows)
                            {
                                CourseNCampus cc = new CourseNCampus();

                                cc.vrt_course = dr["CourseID"].ToString();
                                cc.vrt_courseCode = dr["CourseCode"].ToString();
                                cc.vrt_courseName = dr["Course"].ToString();
                                cc.txtCampus = dr["CampusID"].ToString();
                                cc.txtCampusName = dr["Campus"].ToString();
                                cc.courseCampusID = Int32.Parse(dr["CourseCampusID"].ToString());
                                applicationDetails.courseNCampus.Add(cc);
                            }
                        }
                        else
                        {
                            applicationDetails.courseNCampus.Add(new CourseNCampus());
                        }
                        #endregion

                        applicationDetails.studentGender = drr["Gender"].ToString();
                        applicationDetails.address1_postalcode = drr["Postcode"].ToString();

                        #region Get Qualification Lookup
                        string sql_getApplicationQualifications = string.Concat("[dbo].[sp_getApplicationQualifications]");
                        DataTable tempTable_getApplicationQualifications = null;
                        SqlParameter[] parameterApplicationQualifications = {
                                                new SqlParameter("@applicationId", SqlDbType.VarChar) { Value =applicationId }
                                                 };

                        tempTable_getApplicationQualifications = con.executeSelectQuery(sql_getApplicationQualifications, parameterApplicationQualifications);
                        applicationDetails.txtQualification = new List<Qualification>();
                        if ((tempTable_getApplicationQualifications != null) && (tempTable_getApplicationQualifications.Rows.Count > 0))
                        {
                            foreach (DataRow dr in tempTable_getApplicationQualifications.Rows)
                            {
                                Qualification qual = new Qualification();

                                qual.qualificationID = Int32.Parse(dr["QualificationID"].ToString());
                                qual.qualification = dr["Qualification"].ToString();
                                qual.internalName = dr["InternalName"].ToString();
                                qual.qualificationCode = dr["QualificationCode"].ToString();
                                qual.selected = Boolean.Parse(dr["selected"].ToString());
                                applicationDetails.txtQualification.Add(qual);
                            }
                        }
                        #endregion

                        applicationDetails.vrt_successfullycompletedqualifications = drr["CompletedQualification"].ToString();
                        applicationDetails.vrt_whatbroughtyoutothekanganinstitutewebsite = new WhatBroughtYouHere();
                        applicationDetails.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite = drr["ReasonToChooseBKI"].ToString();
                        applicationDetails.vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID = Int32.Parse(drr["ReasonToChooseBKIID"].ToString());
                        applicationDetails.vrt_studiedatkanganinstitutebendigotafebefore = drr["StudiedHereBefore"].ToString();
                        applicationDetails.vrt_kibtstudentidnumber = drr["PrevStudentNumber"].ToString();
                        applicationDetails.vrt_australiancitizenshipresidency = new Residency();
                        applicationDetails.vrt_australiancitizenshipresidency.vrt_australiancitizenshipresidency = drr["Residency"].ToString();
                        applicationDetails.vrt_australiancitizenshipresidency.residencyId = Int32.Parse(drr["ResidencyID"].ToString());
                        applicationDetails.vrt_australiancitizenshipresidency.type = drr["ResidencyType"].ToString();
                        applicationDetails.vrt_aboriginalortorresstraitislander = new Aboriginal();
                        applicationDetails.vrt_aboriginalortorresstraitislander.vrt_aboriginalortorresstraitislander = drr["Status"].ToString();
                        applicationDetails.vrt_aboriginalortorresstraitislander.statusId = Int32.Parse(drr["IndigenousStatusID"].ToString());
                        applicationDetails.hasUSI = drr["HasUSI"].ToString();
                        applicationDetails.vrt_uniquestudentidentifier = drr["USI"].ToString();
                        applicationDetails.vrt_permissiontocheckfororcreateausi = drr["VerifyUSI"].ToString();
                        applicationDetails.applyUSI = drr["ApplyUSI"].ToString();
                        applicationDetails.streetNumber = drr["StreetNumber"].ToString();
                        applicationDetails.streetName = drr["StreetName"].ToString();
                        applicationDetails.city = drr["CityOfResidence"].ToString();
                        applicationDetails.state = new State();
                        applicationDetails.state.state = drr["State"].ToString();
                        applicationDetails.state.stateID = Int32.Parse(drr["StateOfResidenceId"].ToString());
                        applicationDetails.vrt_CityorTownofBirth = drr["CityOfBirth"].ToString();
                        applicationDetails.isAddressValid = drr["IsAddressValid"].ToString();  // Accepts True or False
                        applicationDetails.vrt_CountryofBirth = new Country();
                        applicationDetails.vrt_CountryofBirth.country = drr["CountryOfBirth"].ToString();
                        applicationDetails.vrt_CountryofBirth.countryID = Int32.Parse(drr["CountryOfBirthID"].ToString());
                        applicationDetails.vrt_CountryofResidence = new Country();
                        applicationDetails.vrt_CountryofResidence.country = drr["CountryOfResidence"].ToString();
                        applicationDetails.vrt_CountryofResidence.countryID = Int32.Parse(drr["CountryOfResidenceID"].ToString());
                        applicationDetails.idProof = new IdProof();
                        applicationDetails.idProof.internalName = drr["InternalName"].ToString();
                        applicationDetails.idProof.type = drr["Type"].ToString();
                        applicationDetails.idProof.proofId = Int32.Parse(drr["ProofTypeID"].ToString());                        
                        applicationDetails.idProof.idProofName = drr["IdentityProof"].ToString();
                        applicationDetails.idProofText = drr["ProofNumber"].ToString();
                        applicationDetails.partialSave = drr["PartialSave"].ToString();
                    }
                }
            }
            catch (Exception e)
            {
            }
            return applicationDetails;
        }
        #endregion

        #region Not Used
        //Get Courses
        [WebMethod]
        public static List<Course> GetCourses()
        {
            List<Course> courses = new List<Course>();

            Files.dbConnection con = new Files.dbConnection();
            //[dbo].[sp_getCourses]

            string sqlCourses = string.Concat("[dbo].[sp_getCourses]");
            DataTable tempTable = null;
            tempTable = con.executeSelectNoParameter(sqlCourses); //con.executeSelectQueryWithSP(sclearsql, parameter);
            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
                //string a = tempTable.Rows[0][0].ToString();
            }
            else
            {
                foreach (DataRow drr in tempTable.Rows)
                {
                    Course course = new Course();
                    course.CourseID = Convert.ToInt32(drr["CourseID"]);
                    course.CourseName = drr["Course"].ToString();
                    course.CourseCode = drr["CourseCode"].ToString();
                    courses.Add(course);
                }
            }

            return courses;
        }
        //Get Campus
        [WebMethod]
        public static List<Campus> GetCampuses()
        {
            List<Campus> campuses = new List<Campus>();

            Files.dbConnection con = new Files.dbConnection();
            //[dbo].[sp_getCourses]

            string sqlCampuses = string.Concat("[dbo].[sp_getAllCampus]");
            DataTable tempTable = null;
            tempTable = con.executeSelectNoParameter(sqlCampuses); //con.executeSelectQueryWithSP(sclearsql, parameter);
            if ((tempTable == null) || (tempTable.Rows.Count == 0))
            {
                //string a = tempTable.Rows[0][0].ToString();
            }
            else
            {
                foreach (DataRow drr in tempTable.Rows)
                {
                    Campus campus = new Campus();
                    campus.campusID = Convert.ToInt32(drr["CampusID"].ToString());
                    campus.campusName = drr["Campus"].ToString();
                    campuses.Add(campus);
                }
            }

            return campuses;
        }

        #endregion

        #region Get Application All Lookups
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static StudentApplicationDataLookup GetApplicationAllLookups()
        {
            HttpResponse response = HttpContext.Current.Response;
            //response.AppendHeader("Access-Control-Allow-Origin", "*");
            //response.AppendHeader("Access-Control-Allow-Methods", "*");
            //headers.set('Access-Control-Allow-Headers', 'true');
            //headers.set('Access-Control-Allow-Methods','GET, POST, PATCH, PUT, DELETE, OPTIONS');
            //headers.set('Access-Control-Allow-Credentials', 'Origin, Content-Type, X-Auth-Token');

            Files.dbConnection con = new Files.dbConnection();
            StudentApplicationDataLookup lkp = new StudentApplicationDataLookup();
            try
            {

                #region Course List
                List<Course> courses = new List<Course>();

                string sqlCourses = string.Concat("[dbo].[sp_getCourses]");
                DataTable tempTableCourse = null;
                tempTableCourse = con.executeSelectNoParameter(sqlCourses); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCourse != null) || (tempTableCourse.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCourse.Rows)
                    {
                        Course course = new Course();
                        course.CourseID = Convert.ToInt32(drr["CourseID"]);
                        course.CourseName = drr["Course"].ToString();
                        course.CourseCode = drr["CourseCode"].ToString();
                        courses.Add(course);
                    }
                }
                lkp.course = courses;
                #endregion

                #region Get Campus
                List<Campus> campuses = new List<Campus>();

                string sqlCampuses = string.Concat("[dbo].[sp_getAllCampus]");
                DataTable tempTableCampus = null;
                tempTableCampus = con.executeSelectNoParameter(sqlCampuses); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCampus != null) || (tempTableCampus.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCampus.Rows)
                    {
                        Campus campus = new Campus();
                        campus.campusID = Convert.ToInt32(drr["CampusID"].ToString());
                        campus.campusName = drr["Campus"].ToString();
                        campuses.Add(campus);
                    }
                }
                lkp.campus = campuses;
                #endregion

                #region Get CourseCampus
                List<CourseCampus> ccCollection = new List<CourseCampus>();

                string sqlCC = string.Concat("[dbo].[sp_getCourseCampus]");
                DataTable tempTableCC = null;
                tempTableCC = con.executeSelectNoParameter(sqlCC); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCC != null) || (tempTableCC.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCC.Rows)
                    {
                        CourseCampus cc = new CourseCampus();
                        cc.campusID = Convert.ToInt32(drr["CampusID"].ToString());
                        cc.courseID = Convert.ToInt32(drr["CourseId"].ToString());
                        cc.courseCampusID = Convert.ToInt32(drr["CourseCampusID"].ToString());
                        cc.campusName = drr["Campus"].ToString();
                        ccCollection.Add(cc);
                    }
                }
                lkp.courseCampus = ccCollection;
                #endregion

                #region Get Country
                List<Country> countries = new List<Country>();

                string sqlCountry = string.Concat("[dbo].[sp_getCountry]");
                DataTable tempTableCountry = null;
                tempTableCountry = con.executeSelectNoParameter(sqlCountry); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempTableCountry != null) || (tempTableCountry.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempTableCountry.Rows)
                    {
                        Country country = new Country();
                        country.countryID = Convert.ToInt32(drr["CountryID"].ToString());
                        country.country = drr["Country"].ToString();
                        countries.Add(country);
                    }
                }
                lkp.country = countries;
                #endregion

                #region Get Residency
                List<Residency> residencyCollection = new List<Residency>();

                string sqlResidency = string.Concat("[dbo].[sp_getResidency]");
                DataTable tempResidency = null;
                tempResidency = con.executeSelectNoParameter(sqlResidency); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempResidency != null) || (tempResidency.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempResidency.Rows)
                    {
                        Residency residency = new Residency();
                        residency.residencyId = Convert.ToInt32(drr["ResidencyId"].ToString());
                        residency.vrt_australiancitizenshipresidency = drr["Residency"].ToString();
                        residency.type = drr["Type"].ToString();
                        residencyCollection.Add(residency);
                    }
                }
                lkp.vrt_australiancitizenshipresidency = residencyCollection;
                #endregion

                #region Get Aboriginal
                List<Aboriginal> aboriginalCollection = new List<Aboriginal>();

                string sqlAboriginal = string.Concat("[dbo].[sp_getIndigenousAustralians]");
                DataTable tempAboriginal = null;
                tempAboriginal = con.executeSelectNoParameter(sqlAboriginal); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempAboriginal != null) || (tempAboriginal.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempAboriginal.Rows)
                    {
                        Aboriginal aboriginal = new Aboriginal();
                        aboriginal.statusId = Convert.ToInt32(drr["StatusId"].ToString());
                        aboriginal.vrt_aboriginalortorresstraitislander = drr["Status"].ToString();
                        aboriginalCollection.Add(aboriginal);
                    }
                }
                lkp.vrt_aboriginalortorresstraitislander = aboriginalCollection;
                #endregion

                #region Get Qualification
                List<Qualification> qualificationCollection = new List<Qualification>();

                string sqlQualification = string.Concat("[dbo].[sp_getQualification]");
                DataTable tempsqlQualification = null;
                tempsqlQualification = con.executeSelectNoParameter(sqlQualification); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlQualification != null) || (tempsqlQualification.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlQualification.Rows)
                    {
                        Qualification qualification = new Qualification();
                        qualification.qualificationID = Convert.ToInt32(drr["QualificationID"].ToString());
                        qualification.qualification = drr["Qualification"].ToString();
                        qualification.internalName = drr["internalName"].ToString();
                        qualification.selected = false;
                        qualification.qualificationCode = drr["qualificationCode"].ToString() ?? "";
                        qualificationCollection.Add(qualification);
                    }
                }
                lkp.txtQualification = qualificationCollection;
                #endregion

                #region Get State
                List<State> stateCollection = new List<State>();

                string sqlState = string.Concat("[dbo].[sp_getState]");
                DataTable tempsqlState = null;
                tempsqlState = con.executeSelectNoParameter(sqlState); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlState != null) || (tempsqlState.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlState.Rows)
                    {
                        State state = new State();
                        state.stateID = Convert.ToInt32(drr["StateID"].ToString());
                        state.state = drr["State"].ToString();
                        stateCollection.Add(state);
                    }
                }
                lkp.state = stateCollection;
                #endregion

                #region Get IdProof
                List<IdProof> idProofCollection = new List<IdProof>();

                string idProofState = string.Concat("[dbo].[sp_getIdentityProof]");
                DataTable tempsqlIdProof = null;
                tempsqlIdProof = con.executeSelectNoParameter(idProofState); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlIdProof != null) || (tempsqlIdProof.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlIdProof.Rows)
                    {
                        IdProof idProof = new IdProof();
                        idProof.proofId = Convert.ToInt32(drr["ProofId"].ToString());
                        idProof.idProofName = drr["IdentityProof"].ToString();
                        idProof.type = drr["Type"].ToString();
                        idProof.internalName = drr["InternalName"].ToString();
                        idProofCollection.Add(idProof);
                    }
                }
                lkp.idProof = idProofCollection;
                #endregion

                #region Get WhatBroughtYouHere
                List<WhatBroughtYouHere> whatBroughtYouHereCollection = new List<WhatBroughtYouHere>();

                string sqlwhatBroughtYouHereCollection = string.Concat("[dbo].[sp_getReasonToChooseBKI]");
                DataTable tempsqlWhatBroughtYouHere = null;
                tempsqlWhatBroughtYouHere = con.executeSelectNoParameter(sqlwhatBroughtYouHereCollection); //con.executeSelectQueryWithSP(sclearsql, parameter);
                if ((tempsqlWhatBroughtYouHere != null) || (tempsqlWhatBroughtYouHere.Rows.Count >= 0))
                {
                    foreach (DataRow drr in tempsqlWhatBroughtYouHere.Rows)
                    {
                        WhatBroughtYouHere state = new WhatBroughtYouHere();
                        state.reasonToChooseBKIID = Convert.ToInt32(drr["ReasonToChooseBKIID"].ToString());
                        state.vrt_whatbroughtyoutothekanganinstitutewebsite = drr["ReasonToChooseBKI"].ToString();
                        whatBroughtYouHereCollection.Add(state);
                    }
                }
                lkp.whatBroughtYouHere = whatBroughtYouHereCollection;
                #endregion

            }
            catch (Exception e)
            {
            }
            return lkp;
        }
        #endregion

        #region Verify and Create USI

        //Verify USI
        [WebMethod]
        public static Dictionary<string, string> VerifyUsi(USIVerifyModel[] verifyUsi)
        {
            Dictionary<string, string> usi = new Dictionary<string, string>();

            try
            {
                ServiceClient sc = new ServiceClient();

                Dictionary<string, string> res = new Dictionary<string, string>();

                //res = sc.VerifyUSI(verifyUsi[0].USI, verifyUsi[0].firstName, verifyUsi[0].lastName, Convert.ToDateTime(verifyUsi[0].dateOfBirth));
                usi = res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usi;
        }

        //Create USI
        [WebMethod]
        public static Dictionary<string, string> CreateUsi(USIVerifyModel[] verifyUsi)
        {
            Dictionary<string, string> usi = new Dictionary<string, string>();
            try
            {
                ServiceClient sc = new ServiceClient();

                Dictionary<string, string> res = new Dictionary<string, string>();

                //res = sc.VerifyUSI(verifyUsi[0].USI, verifyUsi[0].firstName, verifyUsi[0].lastName, Convert.ToDateTime(verifyUsi[0].dateOfBirth));
                usi = res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usi;
        }

        #endregion
    }
}