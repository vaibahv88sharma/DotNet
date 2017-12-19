using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentHubAPI.Model
{
    public class DataModel
    {
    }


    public class StudentApplicationData
    {
        public string vrt_title { get; set; }
        public string firstName { get; set; }
        //public string txtMiddleName { get; set; }  //Removed
        public string lastname { get; set; }
        public string mobilephone { get; set; }
        public string isNumberValid { get; set; }
        public string emailaddress1 { get; set; }
        public string isEmailValid { get; set; }
        public string birthdate { get; set; }
        public List<CourseNCampus> courseNCampus { get; set; }  //Campus not changed
        public string studentGender { get; set; }  //Gender Not Changed
        public string address1_postalcode { get; set; }
        public Residency vrt_australiancitizenshipresidency { get; set; }
        public Aboriginal vrt_aboriginalortorresstraitislander { get; set; }
        public string vrt_successfullycompletedqualifications { get; set; }
        public List<Qualification> txtQualification { get; set; }
        public string hasUSI { get; set; }
        public string applyUSI { get; set; }
        public string streetName { get; set; }
        public string streetNumber { get; set; }
        public string city { get; set; }
        public State state { get; set; }
        public string vrt_CityorTownofBirth { get; set; }
        public string isAddressValid { get; set; }
        public Country vrt_CountryofBirth { get; set; }
        public Country vrt_CountryofResidence { get; set; }
        public IdProof idProof { get; set; }
        public string idProofText { get; set; } //New
        public string vrt_uniquestudentidentifier { get; set; }
        public string vrt_permissiontocheckfororcreateausi { get; set; }
        public WhatBroughtYouHere vrt_whatbroughtyoutothekanganinstitutewebsite { get; set; }
        public string vrt_studiedatkanganinstitutebendigotafebefore { get; set; }
        public string vrt_kibtstudentidnumber { get; set; }
        public string partialSave { get; set; }

    }

    public class StudentApplicationDataLookup
    {
        public List<Course> course { get; set; }
        public List<Campus> campus { get; set; }
        public List<CourseCampus> courseCampus { get; set; }
        public List<Residency> vrt_australiancitizenshipresidency { get; set; }
        public List<Aboriginal> vrt_aboriginalortorresstraitislander { get; set; }
        public List<Qualification> txtQualification { get; set; }
        public List<State> state { get; set; }
        public List<Country> country { get; set; }
        public List<IdProof> idProof { get; set; }
        public List<WhatBroughtYouHere> whatBroughtYouHere { get; set; }
    }

    public class Qualification
    {
        public string qualification { get; set; }
        public bool selected { get; set; }
        public string internalName { get; set; }
        public int qualificationID { get; set; }
        public string qualificationCode { get; set; }
    }

    public class IdProof
    {
        //public string idProofText { get; set; }
        public string idProofName { get; set; }
        public int proofId { get; set; }
        public string type { get; set; }
        public string internalName { get; set; }
        //public string courseCampusID { get; set; }
    }
    public class CourseNCampus
    {
        public string vrt_course { get; set; }
        public string vrt_courseCode { get; set; }
        public string vrt_courseName { get; set; }
        public string txtCampus { get; set; }
        public string txtCampusName { get; set; }
        public int courseCampusID { get; set; }
    }
    public class Residency
    {
        public string vrt_australiancitizenshipresidency { get; set; }
        public int residencyId { get; set; }
        public string type { get; set; }
    }
    public class Aboriginal
    {
        public string vrt_aboriginalortorresstraitislander { get; set; }
        public int statusId { get; set; }
    }
    public class Country
    {
        public string country { get; set; }
        public int countryID { get; set; }
    }
    public class State
    {
        public string state { get; set; }
        public int stateID { get; set; }
    }
    public class WhatBroughtYouHere
    {
        public string vrt_whatbroughtyoutothekanganinstitutewebsite { get; set; }
        public int reasonToChooseBKIID { get; set; }
    }

    public class HeatData
    {
        public string message { get; set; }
        public string heatId { get; set; }

    }

    public class USIVerifyModel
    {
        public string USI { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string dateOfBirth { get; set; }
    }

    public class Course
    {
        public int CourseID { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
    }
    public class Campus
    {
        public string campusName { get; set; }
        public int campusID { get; set; }
    }

    public class CourseCampus
    {
        public string campusName { get; set; }
        public int campusID { get; set; }
        public int courseID { get; set; }
        public int courseCampusID { get; set; }

    }

    public class USICreateModel
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string dateOfBirth { get; set; }
        public string gender { get; set; }
        public string emailAddress { get; set; }
        public string phoneNumber { get; set; }
        public string address { get; set; }
        public string postCode { get; set; }
        public string state { get; set; }
        public string suburbTownCity { get; set; }
        public string documentType { get; set; }
        public Dictionary<string, string> documentKeys { get; set; }
    }


}