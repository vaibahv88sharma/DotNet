<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Application.aspx.cs" Inherits="StudentApplication.Pages.Application" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        /* Sticky footer styles
        -------------------------------------------------- */
        html {
            position: relative;
            min-height: 100%;
        }

        body {
            /* Margin bottom by footer height */
            margin-bottom: 60px;
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            /* Set the fixed height of the footer here */
            height: 60px;
            line-height: 60px; /* Vertically center the text there */
            background-color: #f5f5f5;
        }

        .nextBtn {
            background-color: #ffc20e;
        }

        .backBtn {
            background-color: black;
            color: white;
        }

        .saveBtn {
            background-color: #0099cc;
            color: white;
            margin-right: 1rem;
        }

        /* Custom page CSS
        -------------------------------------------------- */
        /* Not required for template or sticky footer method. */

        /*.container {
          width: auto;
          max-width: 680px;
          padding: 0 15px;
        }*/


        /*
            Table AllDetails
        */
        table.fixedBki {
            table-layout: fixed;
            width: 100%;
            /*margin-right: 1rem;
    margin-left: 1rem;*/
        }
            /*Setting the table width is important!*/
            table.fixedBki td {
                overflow: hidden;
            }
                /*Hide text outside the cell.*/
                table.fixedBki td:nth-of-type(1) {
                    width: 20px;
                }
                /*Setting the width of column 1.*/
                table.fixedBki td:nth-of-type(2) {
                    width: 30px;
                }
                /*Setting the width of column 2.*/
                table.fixedBki td:nth-of-type(3) {
                    width: 40px;
                }
                /*Setting the width of column 3.*/
                table.fixedBki td:nth-of-type(4) {
                    width: 40px;
                }
        /*Setting the width of column 3.*/

        table.table-hover td {
            font-size: 1.25rem;
            font-weight: 500;
            line-height: 1.1;
            padding: 20px;
        }

            table.table-hover td:nth-child(even) {
                color: #007bff;
                font-size: 1rem;
            }

            table.table-hover td:nth-of-type(1) {
                border-right: 1px solid black;
            }
            /*Column 1.*/
            table.table-hover td:nth-of-type(2) {
                border-right: 1px solid black;
            }
            /*Column 2.*/
            table.table-hover td:nth-of-type(3) {
                border-right: 1px solid black;
            }
        /*Column 3.*/


        /*Bootstrap Class Fix*/
        .invalid-feedback {
            /*display: block!important;*/
            display: inline !important;
            font-size: 1rem !important;
        }
    </style>

    <script src="../Files/js/jquery.min.js"></script>
    <%-- <script src="../Files/js/jquery-3.2.1.slim.min.js"></script>--%>
    <script src="../Files/js/angular.min.js"></script>
    <script src="../Files/js/angular-cookies.min.js"></script>
    <script src="../Files/js/popper.min.js"></script>
    <script src="../Files/js/bootstrap.js"></script>

<%--    <script src="../Files/js/contact-data-services.min.js"></script>--%>
    <%--<script src="../Files/js/contact-data-services.js"></script>--%>

    <link href="../Files/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Files/css/font-awesome.min.css" rel="stylesheet" />

    <script type="text/javascript">


        //https://portal.experianmarketingservices.com/content/License/Detail/a2Vi0000000gt8mEAA#GetTokenModal
        //Website_EnrolmentPortal
        //Website_EnrolmentPortal	Full	Active	2


        //1.

        // Address
        //Full/PROD_EnrolmentPortal  :-    auth-token   e510fc70-e28d-49e1-bd87-70b9b5033a98

        //2.

        //All
        //https://portal.experianmarketingservices.com/content/License/Detail/a2V0H000003qT8cUAE#GetTokenModal
        //  License name	    FT-Greenfield

        //AUS Address Validate for Capture API Per ClickExpires on Wed Oct 25 2017 300 credits remaining
        //Email Validate Per ClickExpires on Wed Oct 25 2017 200 credits remaining
        //Global Mobile Validate Per ClickExpires on Wed Oct 25 2017 200 credits remaining

        //  Token   a192f036-a552-4066-9e60-9a5d34eed1d0

        //  Address     Get     URL https://api.edq.com/capture/address/v2/search?country=AUS&query=11+Murphy+Street+Deer+Park&take=7
        //      HEADER      auth-token  a192f036-a552-4066-9e60-9a5d34eed1d0

        //  Email   POST    URL https://api.experianmarketingservices.com/query/EmailValidate/1.0/
        //      HEADER      auth-token  a192f036-a552-4066-9e60-9a5d34eed1d0
        //      BODY        Email       vaibhav88sharma@gmail.com

        //     $(document).ready(function () {
        //         console.log('starting 1');
        //     });
        //
        //     
        //     function validateAddress() {
        //         debugger;
        //         var options = {
        //             token: "e510fc70-e28d-49e1-bd87-70b9b5033a98", //7ad01723-88fa-4838-b232-3482716fb5d7
        //             elements: {
        //                 input: document.querySelector("input[name='address-input']"), //'11 murphy street deer park',
        //                 countryList: document.querySelector("select") //'AUS'
        //             }
        //         };
        //         debugger;
        //         var address = new ContactDataServices.address(options);
        //         debugger;
        //     }

    </script>

    <script type="text/javascript">

        angular.module('applicationApp', ['ngCookies']);

        angular.module('applicationApp')
                .controller('applicationController', ['applicationService', '$log', '$document', '$timeout', '$scope', 'filterFilter', '$filter', '$cookies',
                function (applicationService, $log, $document, $timeout, $scope, filterFilter, $filter, $cookies) {

                    //  applicationService.getApplicationAllLookups()
                    //    .then(function (data) {
                    //        debugger;
                    //        $log.info(data);
                    //        if (data.data.d) {
                    //
                    //        }
                    //    })
                    //    .catch(function (data) {
                    //        debugger;
                    //        $log.error(data);
                    //    });
                    //debugger;

                    $scope.applicationView = {  // Hide Each View
                        view1: 'true',
                        view2: '',
                        view3: '',
                        view4: '',
                        view5: '',
                        view6: '',
                        view7: ''
                    }
                    $scope.enrolmentData = {};    //  enrolment form initialized with null
                    $scope.disableSubmit = false; //  Disable submit Form initially
                    $scope.authToken = "a192f036-a552-4066-9e60-9a5d34eed1d0";
                    //$scope.isUnderstand = false;
                    applicationService.getApplicationAllLookups()//postgetGetApplicationLookups
                      .then(function (data) {
                          //debugger;
                          $log.info(data);
                          if (data.data.d) {
                              $scope.enrolmentData.vrt_courseArray = data.data.d["course"];
                              $scope.enrolmentData.campusArray = data.data.d["campus"];
                              $scope.countries = data.data.d["country"];
                              $scope.idProofChoices = data.data.d["idProof"];
                              $scope.states = data.data.d["state"];
                              $scope.enrolmentData.txtQualification = $scope.enrolmentData.txtQualification ? $scope.enrolmentData.txtQualification : data.data.d["txtQualification"];
                              $scope.vrt_aboriginalortorresstraitislander = data.data.d["vrt_aboriginalortorresstraitislander"];
                              $scope.vrt_australiancitizenshipresidency = data.data.d["vrt_australiancitizenshipresidency"];
                              $scope.whatBroughtYouHereSelect = data.data.d["whatBroughtYouHere"];
                              $scope.courseCampusArray = data.data.d["courseCampus"];
                          }
                      })
                      .catch(function (data) {
                          debugger;
                          $log.error(data);
                      });

                    if (1 == 1) {
                        //$scope.enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite = { vrt_whatbroughtyoutothekanganinstitutewebsite: '', reasonToChooseBKIID: '' };
                       // $scope.enrolmentData.idProofType = { idProofName: '', proofId: '', type: '', internalName: '' };
                    }

                    if ('<%=FromServerUrlParamApplicationId %>' != 0) {
                        applicationService.getFormPartialData('<%=FromServerUrlParamApplicationId %>')//postGetFormPartialData
                          .then(function (data) {
                              //debugger;
                              $log.info(data);
                              if (data.data.d) {
                                  //debugger;
                                  // On Load - if not partial saved
                                  $scope.loadPartialData(data.data.d);
                              }
                          })
                          .catch(function (data) {
                              debugger;
                              $log.error(data);
                          });
                    } else {

                        //enrolment2
                        //$scope.enrolmentData.courseNCampus = [
                        //    {
                        //        vrt_course: {},//"",
                        //        txtCampus: {}//""
                        //    }
                        //];
                        $scope.enrolmentData.courseNCampus = [];
                       //var vrt_course =
                       //      {
                       //          'CourseID': '',
                       //          'CourseCode': '',
                       //          'CourseName': ''
                       //      };
                       //
                       //var txtCampus =
                       //      {
                       //          'campusName': '',
                       //          'campusID': '',
                       //          'courseID': '',
                       //          'courseCampusID': ''
                       //      };

                        //$scope.enrolmentData.courseNCampus.push({ vrt_course, txtCampus });

                        $scope.enrolmentData.courseNCampus.push({
                            vrt_course :
                            {
                                'CourseID': '',
                                'CourseCode': '',
                                'CourseName': ''
                            },

                            txtCampus :
                            {
                                'campusName': '',
                                'campusID': '',
                                'courseID': '',
                                'courseCampusID': 0
                            }
                        });

                        //enrolment3
                        $scope.enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore = {
                            vrt_studiedatkanganinstitutebendigotafebefore: ""//"True"
                        }
                        //enrolment4
                        //$scope.enrolmentData.citizenshipSelected = "";
                        //$scope.enrolmentData.txtCitizenshipOther = "";
                        //enrolment5
                        //$scope.enrolmentData.vrt_successfullycompletedqualifications = "";
                        $scope.enrolmentData.vrt_successfullycompletedqualifications = {
                            vrt_successfullycompletedqualifications: ""
                        }
                        //enrolment6
                        $scope.enrolmentData.hasUSI = "";
                        $scope.enrolmentData.applyUSI = "";

                    }


                    //Enrolment All
                    $scope.loadPartialData = function (enrolmentData) {
                        //enrolment1
                        $scope.enrolmentData.vrt_title = enrolmentData.vrt_title;
                        $scope.enrolmentData.firstName = enrolmentData.firstName;
                        $scope.enrolmentData.lastname = enrolmentData.lastname;
                        $scope.enrolmentData.mobilephone = enrolmentData.mobilephone ? parseInt(enrolmentData.mobilephone) : '';
                        $scope.enrolmentData.isNumberValid = enrolmentData.isNumberValid;
                        $scope.enrolmentData.emailaddress1 = enrolmentData.emailaddress1;
                        $scope.enrolmentData.txtConfirmEmail = enrolmentData.emailaddress1;
                        $scope.enrolmentData.IsEmailValid = enrolmentData.isEmailValid;

                        //enrolment2

                        //if ((enrolmentData.courseNCampus.length = 1)
                        //    && (
                        //        (enrolmentData.courseNCampus[0].courseCampusID == 0)
                        //        || (enrolmentData.courseNCampus[0].vrt_course == null) || (enrolmentData.courseNCampus[0].txtCampus == null) || (enrolmentData.courseNCampus[0].vrt_course == null)
                        //            || (enrolmentData.courseNCampus[0].txtCampusName == null) || (enrolmentData.courseNCampus[0].vrt_courseName == null)
                        //        )
                        //    ) {
                        //}
                        //$scope.enrolmentData.courseNCampus = [];//[{ vrt_course: {}, txtCampus: {} }];

                        //debugger;
                        $scope.enrolmentData.courseNCampus = [];
                        //$scope.enrolmentData.courseNCampus = [{ vrt_course: {}, txtCampus: {} }];

                        //$scope.enrolmentData.courseNCampus = [
                        //    {
                        //        vrt_course: {
                        //            CourseID: '',
                        //            CourseCode: '',
                        //            CourseName:''
                        //        },//"",
                        //        txtCampus: {
                        //            campusName: '',
                        //            campusID: '',
                        //            courseID: '',
                        //            courseCampusID:''
                        //        }//""
                        //    }
                        //];

                        //var itemToClone = { "vrt_course": {}, "txtCampus": {} };
                        //var itemToClone = { "vrt_course": "", "txtCampus": "" };
                        //$scope.enrolmentData.courseNCampus.push(itemToClone);

                        angular.forEach(enrolmentData.courseNCampus, function (value, key) {
                            //debugger;
                            var vrt_course =
                                  {
                                      'CourseID': value.vrt_course ? value.vrt_course : '',
                                      'CourseCode': value.vrt_courseCode ? value.vrt_courseCode : '',
                                      'CourseName': value.vrt_courseName ? value.vrt_courseName : ''
                                  };
                            
                            var txtCampus =
                                  {
                                      'campusName': value.txtCampusName ? value.txtCampusName : '',
                                      'campusID': value.txtCampus ? value.txtCampus : '',
                                      'courseID': value.vrt_course ? value.vrt_course : '',
                                      'courseCampusID': value.courseCampusID != 0 ? value.courseCampusID : ''
                                  };
                            
                            //$scope.enrolmentData.courseNCampus.push({ vrt_course, txtCampus });
                            $scope.enrolmentData.courseNCampus.push({
                                vrt_course: {
                                      'CourseID': value.vrt_course ? value.vrt_course : '',
                                      'CourseCode': value.vrt_courseCode ? value.vrt_courseCode : '',
                                      'CourseName': value.vrt_courseName ? value.vrt_courseName : ''
                                },
                                txtCampus :{
                                               'campusName': value.txtCampusName ? value.txtCampusName : '',
                                               'campusID': value.txtCampus ? value.txtCampus : '',
                                               'courseID': value.vrt_course ? value.vrt_course : '',
                                               'courseCampusID': value.courseCampusID != 0 ? value.courseCampusID : ''
                                           }
                            });

                            //$scope.enrolmentData.courseNCampus.vrt_course.push(
                            //      {
                            //          'CourseID': value.CourseID ? value.CourseID : '',
                            //          'CourseCode': value.CourseCode ? value.CourseCode : '',
                            //          'CourseName': value.CourseName ? value.CourseName : ''
                            //      }
                            //);
                            //$scope.enrolmentData.courseNCampus.txtCampus.push(
                            //      {
                            //          'campusName': value.campusName ? value.campusName : '',
                            //          'campusID': value.campusID ? value.campusID : '',
                            //          'courseID': value.courseID ? value.courseID : '',
                            //          'courseCampusID': value.courseCampusID ? value.courseCampusID : ''
                            //      }
                            //);
                        });

                        //$scope.enrolmentData.courseNCampus = [
                        //    {
                        //        vrt_course: {
                        //            CourseID: enrolmentData, //? '',
                        //            CourseCode: '',
                        //            CourseName:''
                        //        },//"",
                        //        txtCampus: {
                        //            campusName: '',
                        //            campusID: '',
                        //            courseID: '',
                        //            courseCampusID:''
                        //        }//""
                        //    }
                        //];

                        //enrolment3
                        $scope.enrolmentData.birthdate = enrolmentData.birthdate == "01/01/1900" ? '' : enrolmentData.birthdate;
                        $scope.enrolmentData.studentGender = enrolmentData.studentGender;
                        $scope.enrolmentData.address1_postalcode = enrolmentData.address1_postalcode ? parseInt(enrolmentData.address1_postalcode) : '';
                        $scope.enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite = 
                            enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID != 0 ? enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite : {};
                        //debugger;
                        $scope.enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore = {
                            vrt_studiedatkanganinstitutebendigotafebefore: ""
                        }
                        $scope.enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore = {
                            vrt_studiedatkanganinstitutebendigotafebefore: enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore //== 'True' ? 'True' : 'False'
                        };
                        $scope.enrolmentData.vrt_kibtstudentidnumber = enrolmentData.vrt_kibtstudentidnumber ? enrolmentData.vrt_kibtstudentidnumber : "";

                        //$scope.enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore = {
                        //    vrt_studiedatkanganinstitutebendigotafebefore: "True"
                        //}

                        //enrolment4
                        //debugger;
                        //$scope.enrolmentData.citizenshipSelected = "";
                        //$scope.enrolmentData.txtCitizenshipOther = "";
                        $scope.enrolmentData.vrt_australiancitizenshipresidency = enrolmentData.vrt_australiancitizenshipresidency;
                        $scope.enrolmentData.vrt_aboriginalortorresstraitislander = enrolmentData.vrt_aboriginalortorresstraitislander;

                        //enrolment5
                        $scope.enrolmentData.vrt_successfullycompletedqualifications = {
                            vrt_successfullycompletedqualifications: ""
                        }
                        $scope.enrolmentData.vrt_successfullycompletedqualifications = {
                            vrt_successfullycompletedqualifications : enrolmentData.vrt_successfullycompletedqualifications //== 'True' //? 1 : 0;
                        }
                        $scope.enrolmentData.txtQualification = enrolmentData.txtQualification;
                        //enrolment6
                        debugger;
                        $scope.enrolmentData.hasUSI = enrolmentData.hasUSI;//"";
                        $scope.enrolmentData.applyUSI = enrolmentData.applyUSI;//"";
                        $scope.enrolmentData.vrt_uniquestudentidentifier = enrolmentData.vrt_uniquestudentidentifiers;
                        $scope.enrolmentData.vrt_permissiontocheckfororcreateausi = enrolmentData.vrt_permissiontocheckfororcreateausi;
                        $scope.enrolmentData.state = { state: enrolmentData.state.state, stateID: enrolmentData.state.stateID };
                        $scope.enrolmentData.vrt_CountryofResidence = {
                            country: enrolmentData.vrt_CountryofResidence.country,
                            countryID: enrolmentData.vrt_CountryofResidence.countryID
                        };
                        $scope.enrolmentData.vrt_CountryofBirth = {
                            country: enrolmentData.vrt_CountryofBirth.country,
                            countryID: enrolmentData.vrt_CountryofBirth.countryID
                        };
                        $scope.enrolmentData.idProofType = enrolmentData.idProof;
                        $scope.enrolmentData.idProofText = enrolmentData.idProofText;
                    }
                    $scope.nextClick = function (view) {
                        switch (view) {
                            case 'view1':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: 'true',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view2':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: 'true',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view3':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: 'true',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };

                                //debugger;
                                var usiCookie = $cookies.get('usiCookie');
                                if (usiCookie) {
                                    //debugger;
                                }
                                else {
                                    applicationService.postVerifyUSI($scope.enrolmentData)
                                      .then(function (data) {
                                          //debugger;
                                          $log.info(data);
                                          if ((data.data.d.USI == "Valid") && (data.data.d.FamilyName == "Match") && (data.data.d.FirstName == "Match") && (data.data.d.DateOfBirth == "Match")) {
                                              $cookies.put('usiCookie', 'Valid');
                                              debugger;
                                          }
                                      })
                                      .catch(function (data) {
                                          debugger;
                                          $log.error(data);
                                      });
                                }

                                break;
                            case 'view4':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: 'true',
                                    view6: '',
                                    view7: ''
                                };
                                //debugger;
                                //if ($scope.enrolmentData.citizenshipSelected == 1) {
                                //    debugger;
                                //    $scope.enrolmentData.txtCitizenship = "Australian Citizen"//$scope.enrolmentData.citizenshipSelected;
                                //} else if ($scope.enrolmentData.citizenshipSelected == 2) {
                                //    $scope.enrolmentData.txtCitizenship = $scope.enrolmentData.txtCitizenshipOther;
                                //}
                                break;
                            case 'view5':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: 'true',
                                    view7: ''
                                };
                                break;
                            case 'view6':
                                day = "Friday";
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: 'true'
                                };
                            case 'view7':
                                //$scope.applicationView = {
                                //    view1: '',
                                //    view2: '',
                                //    view3: '',
                                //    view4: '',
                                //    view5: '',
                                //    view6: ''
                                //};
                                break;
                        }
                    };
                    $scope.backClick = function (view) {
                        switch (view) {
                            case 'view2':
                                $scope.applicationView = {
                                    view1: 'true',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view3':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: 'true',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view4':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: 'true',
                                    view4: '',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view5':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: 'true',
                                    view5: '',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view6':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: 'true',
                                    view6: '',
                                    view7: ''
                                };
                                break;
                            case 'view7':
                                $scope.applicationView = {
                                    view1: '',
                                    view2: '',
                                    view3: '',
                                    view4: '',
                                    view5: '',
                                    view6: 'true',
                                    view7: ''
                                };
                                break;
                        }
                    };
                    //enrolment1
                    $scope.enrolment1SubmitBtn = false;

                    $scope.validateNumber = function () {

                        if (enrolment1.mobilephone.value.length > 8 && $scope.enrolmentData.mobilephone) {
                            applicationService.postNumberValidate($scope.authToken, '+61' + $scope.enrolmentData.mobilephone)
                            .then(function (data) {
                                //debugger;
                                $log.info(data);

                                //{
                                //    "ResultCode": "3",
                                //    "AdditionalPhoneInfo": {
                                //        "ValidatedPhoneNumber": "61412625737",
                                //        "CountryName": "Australia",
                                //        "CountryCode": "61",
                                //        "OperatorName": "YES OPTUS (Singtel Optus Ltd)",
                                //        "PortedOperatorName": "Singtel Optus",
                                //        "PortedCountryName": "Australia",
                                //        "PortedCountryCode": "61",
                                //        "IsRoaming": "false",
                                //        "RoamingCountryCode": "61",
                                //        "MCCMNC": "50502"
                                //    },
                                //    "Number": "+61412625737",
                                //    "PhoneType": "Mobile",
                                //    "Certainty": "Verified"
                                //}
                                //{
                                //    "ResultCode": "0",
                                //    "AdditionalPhoneInfo": {
                                //        "ValidatedPhoneNumber": "614126257374545"
                                //    },
                                //    "Number": "+614126257374545",
                                //    "PhoneType": "Provided number is Invalid",
                                //    "Certainty": "Unverified"
                                //}

                                if (data.status == 204 && data.statusText == 'No Content') {
                                    $timeout(function () {
                                        applicationService.getNumberValidate($scope.authToken, data.headers('Content-Location'))
                                          .then(function (data) {
                                              //debugger;
                                              $log.info(data);
                                              //debugger;
                                              if (data.data.ResultCode != 0 && data.data.Certainty == 'Verified') {
                                                  $scope.enrolmentData.isNumberValid = false;
                                                  console.log('phone number correct: ' + data);
                                              }
                                              else if (data.data.ResultCode == 0 && data.data.Certainty == 'Unverified') {
                                                  //debugger;
                                                  $scope.enrolmentData.isNumberValid = true;
                                                  console.log('phone number incorrect: ' + data);
                                              }

                                          })
                                          .catch(function (data) {
                                              debugger;
                                              $log.error(data);
                                          })
                                    }, 1600);
                                }
                            })
                          .catch(function (data) {
                              debugger;
                              $log.error(data);
                          });
                        }

                    }

                    $scope.validateEmail = function () {
                        debugger;
                        //enrolment1.txtConfirmEmail.$invalid

                        if (enrolment1.txtConfirmEmail.validity.valid && enrolment1.emailaddress1.validity.valid && ($scope.enrolmentData.txtConfirmEmail == $scope.enrolmentData.emailaddress1)) {
                            //debugger;
                            applicationService.postEmailValidate($scope.authToken, $scope.enrolmentData.emailaddress1) // postEmailValidateAjax // postNumberValidate // postEmailValidate  // getAddressValidate
                              .then(function (data) {
                                  //debugger;
                                  $log.info(data);

                                  if (data.status == 204 && data.statusText == 'No Content') {
                                      applicationService.getEmailValidate($scope.authToken, data.headers('Content-Location'))
                                        .then(function (data) {
                                            //debugger;
                                            $log.info(data);

                                            if (data.data.Certainty == "verified" && data.data.VerboseOutput == "verified") {
                                                $scope.enrolmentData.IsEmailValid = false;
                                                console.log('emailValidationSuccess:- ' + data.data);
                                            }
                                            else {
                                                //else if (   ((data.data.Certainty == "illegitimate") || (data.data.Certainty == "undeliverable"))
                                                //    && ((data.data.VerboseOutput == "illegitimate") || (data.data.VerboseOutput == "mailboxDoesNotExist"))) {
                                                //debugger;
                                                $scope.enrolmentData.IsEmailValid = true;
                                                console.log('emailValidationFail:- ' + data.data);
                                                // "Email": "dasdsdsadasdasdasdasdasdasdsadasd@gmail.com",
                                                // "Certainty": "undeliverable",
                                                // "Message": "OK",
                                                // "VerboseOutput": "mailboxDoesNotExist"
                                            }
                                        })
                                        .catch(function (data) {
                                            debugger;
                                            $log.error(data);
                                        });
                                  }
                              })
                              .catch(function (data) {
                                  debugger;
                                  $log.error(data);
                              });
                        }

                    }

                    //$scope.enrolment1SubmitDisabled = function (enrolment1Invalid, enrolment1SubmitBtn) {
                    //    //debugger;
                    //    //console.log(enrolment1);
                    //    if (enrolment1Invalid) {
                    //        return true;
                    //    } else {
                    //        if (!enrolment1SubmitBtn) {
                    //            return false;
                    //        } else {
                    //            return true;
                    //        }
                    //    }
                    //}

                    //enrolment2
             //       $scope.enrolmentData.courseNCampus = [  // On Load - if not partial saved
             //           {
             //               vrt_course: "",
             //               txtCampus: ""
             //           }
             //       ];
                    $scope.cloneCourseNCampus = function () {
                        //debugger;
                        var itemToClone = { "vrt_course": {}, "txtCampus": {} };
                        //var itemToClone = { "vrt_course": "", "txtCampus": "" };
                        //$scope.enrolmentData.courseNCampus.push(itemToClone);
                        $scope.enrolmentData.courseNCampus.push({
                            vrt_course:
                            {
                                'CourseID': '',
                                'CourseCode': '',
                                'CourseName': ''
                            },

                            txtCampus:
                            {
                                'campusName': '',
                                'campusID': '',
                                'courseID': '',
                                'courseCampusID': 0
                            }
                        });
                    };

                    //applicationService.postGetCourses()
                    //  .then(function (data) {
                    //      //debugger;
                    //      $log.info(data);
                    //      $scope.enrolmentData.vrt_courseArray = [];
                    //      if ((data.data.d) && (data.data.d.length > 0)) {
                    //          //debugger;
                    //          angular.forEach(data.data.d, function (value, key) {
                    //              $scope.enrolmentData.vrt_courseArray.push(
                    //                    {
                    //                        'CourseCode': value.CourseCode,
                    //                        'CourseID': value.CourseID,
                    //                        'CourseName': value.CourseName
                    //                    }
                    //              );
                    //          });
                    //      }
                    //  })
                    //  .catch(function (data) {
                    //      debugger;
                    //      $log.error(data);
                    //  });

                    //applicationService.postGetCampuses()
                    //  .then(function (data) {
                    //      //debugger;
                    //      $log.info(data);
                    //      $scope.enrolmentData.campusArray = [];
                    //      if ((data.data.d) && (data.data.d.length > 0)) {
                    //          //debugger;
                    //          angular.forEach(data.data.d, function (value, key) {
                    //              $scope.enrolmentData.campusArray.push(
                    //                    {
                    //                        'campusName': value.campusName,
                    //                        'campusID': value.campusID,
                    //                    }
                    //              );
                    //          });
                    //      }
                    //  })
                    //  .catch(function (data) {
                    //      debugger;
                    //      $log.error(data);
                    //  });

                    //enrolment3
                    //$scope.dateRegex = '[0-3][0-9]/[0-1][0-9]/[0-9]{2}(?:[0-9]{2})?';
                    $scope.dateRegex = /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/g;
                    //$scope.whatBroughtYouHereSelect = [
                    //    { vrt_whatbroughtyoutothekanganinstitutewebsite: 'Change of Career', reasonToChooseBKIID: '100' },
                    //    { vrt_whatbroughtyoutothekanganinstitutewebsite: 'Area of Interest', reasonToChooseBKIID: '101' },
                    //    { vrt_whatbroughtyoutothekanganinstitutewebsite: 'Re-Apply', reasonToChooseBKIID: '102' }
                    //];
                    $scope.studiedBkiBeforeClicked = function () {
                        //debugger;
                        if ($scope.enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore == 'False') {
                            $scope.enrolmentData.vrt_kibtstudentidnumber = "";
                        }
                    };

                    //enrolment4
                //    $scope.enrolmentData.citizenshipSelected = "";  // On Load - if not partial saved
                //    $scope.enrolmentData.txtCitizenshipOther = "";  // On Load - if not partial saved
                    //$scope.viewFourNext = function () {
                    //    if ($scope.citizenshipSelected == 1) {
                    //        $scope.enrolmentData.txtCitizenship = $scope.citizenshipSelected;
                    //    } else if ($scope.citizenshipSelected == 2) {
                    //        $scope.enrolmentData.txtCitizenship = $scope.txtCitizenshipOther;
                    //    }
                    //}

                    //enrolment5
                 //   $scope.enrolmentData.vrt_successfullycompletedqualifications = "";  // On Load - if not partial saved
                    //$scope.enrolmentData.txtQualification = {
                    //    qualification1: false,
                    //    qualification2: false,
                    //    qualification3: false,
                    //};

                    // $scope.enrolmentData.txtQualification = [
                    //   { qualification: 'Bachelor Degree or Higher Degree', selected: false, internalName: "vrt_bachelordegreeorhigherdegree", qualificationID: "101" },
                    //   { qualification: 'Advanced Diploma or Associate Degree', selected: false, internalName: "vrt_advanceddiplomaorassociatedegree", qualificationID: "102" },
                    //   { qualification: 'Diploma or Associate Diploma', selected: false, internalName: "vrt_diplomaorassociatediploma", qualificationID: "103" },
                    //   { qualification: 'Certificate IV or Advanced Certificate', selected: false, internalName: "vrt_certificateivoradvancedcertificate", qualificationID: "104" },
                    //   { qualification: 'Certificate III', selected: false, internalName: "vrt_certificateiii", qualificationID: "105" },
                    //   { qualification: 'Certificate II', selected: false, internalName: "vrt_certificateii", qualificationID: "106" },
                    //   { qualification: 'Certificate I', selected: false, internalName: "vrt_certificatei", qualificationID: "107" }
                    // ];
                    $scope.prevQualClick = function () {
                        //if ($scope.enrolmentData.vrt_successfullycompletedqualifications == 1) { }
                        //else
                        //debugger;
                        if ($scope.enrolmentData.vrt_successfullycompletedqualifications.vrt_successfullycompletedqualifications == 'False') {
                            //debugger;

                            angular.forEach($scope.enrolmentData.txtQualification, function (value, key) {
                                //debugger;
                                value.selected = false;
                                //$scope.enrolmentData.vrt_courseArray.push(
                                //      {
                                //          'CourseCode': value.CourseCode,
                                //          'CourseID': value.CourseID,
                                //          'CourseName': value.CourseName
                                //      }
                                //);
                            });
                            //$scope.enrolmentData.txtQualification = [
                            //  { qualification: 'Bachelor Degree or Higher Degree', selected: false, internalName: "vrt_bachelordegreeorhigherdegree", qualificationID: "101" },
                            //  { qualification: 'Advanced Diploma or Associate Degree', selected: false, internalName: "vrt_advanceddiplomaorassociatedegree", qualificationID: "102" },
                            //  { qualification: 'Diploma or Associate Diploma', selected: false, internalName: "vrt_diplomaorassociatediploma", qualificationID: "103" },
                            //  { qualification: 'Certificate IV or Advanced Certificate', selected: false, internalName: "vrt_certificateivoradvancedcertificate", qualificationID: "104" },
                            //  { qualification: 'Certificate III', selected: false, internalName: "vrt_certificateiii", qualificationID: "105" },
                            //  { qualification: 'Certificate II', selected: false, internalName: "vrt_certificateii", qualificationID: "106" },
                            //  { qualification: 'Certificate I', selected: false, internalName: "vrt_certificatei", qualificationID: "107" }
                            //];
                        }
                    }

                    //enrolment6
                    //$scope.enrolmentData.hasUSI = "";   // On Load - if not partial saved
                    $scope.hasUsiClick = function () {
                        //if ($scope.enrolmentData.hasUSI == 1) { }
                        //else if ($scope.enrolmentData.hasUSI == 2) {
                        //    $scope.enrolmentData.vrt_uniquestudentidentifier = "";
                        //}
                        $scope.enrolmentData.vrt_uniquestudentidentifier = $scope.enrolmentData.hasUSI == 'False' ? '' : $scope.enrolmentData.vrt_uniquestudentidentifier;
                    }
                    //$scope.enrolmentData.applyUSI = ""; // On Load - if not partial saved
                    //$scope.idProofChoices = [
                    //    { idProofName: 'Driver Licence', proofId: '201', type: 'Aus', internalName: 'vrt_DriversLicenceNumber' },
                    //    { idProofName: 'Certificate of Registration by Desent', proofId: '202', type: 'Aus', internalName: 'vrt_CertificateofRegistration' },
                    //    { idProofName: 'Passport with Australian VISA', proofId: '203', type: 'Aus', internalName: 'vrt_PassportNumber' },
                    //    { idProofName: 'Medicare Card', proofId: '204', type: 'Non', internalName: 'vrt_MedicareCardNumber' },
                    //    { idProofName: 'Australian Passport', proofId: '205', type: 'Non', internalName: 'vrt_AustralianPassportNumber' },
                    //    { idProofName: 'Country of Residence', proofId: '206', type: 'Non', internalName: 'vrt_CountryofResidence' },
                    //    { idProofName: 'ImmiCard', proofId: '207', type: 'Non', internalName: 'vrt_ImmiCard' }
                    //];
                    $scope.registerForUsi = function () {
                        if ($scope.enrolmentData.applyUSI == 2) {
                            $scope.enrolmentData.vrt_CityorTownofBirth = "";
                            $scope.enrolmentData.vrt_CountryofBirth = "";
                            $scope.enrolmentData.vrt_CountryofResidence = "";
                            $scope.enrolmentData.idProofType = "";
                            $scope.enrolmentData.idProofText = "";
                        }
                    }
                    $scope.validateAddress = function () {
                        debugger;
                        if ($scope.enrolmentData.streetNumber && $scope.enrolmentData.streetName && $scope.enrolmentData.city) {

                            applicationService.getAddressValidate($scope.authToken, $scope.enrolmentData.streetNumber + "+" + $scope.enrolmentData.streetName + "+" + $scope.enrolmentData.city)
                              .then(function (data) {
                                  //debugger;
                                  $log.info(data);
                                  if ((data.data.count > 0) && (data.data.results.length > 0)) {
                                      $scope.enrolmentData.isAddressValid = true;
                                  } else {
                                      $scope.enrolmentData.isAddressValid = false;
                                  }

                              })
                              .catch(function (data) {
                                  debugger;
                                  $log.error(data);
                              });
                        }
                    }

                    //enrolment 7
                    //Scope.qualDisp = function () {
                    //
                    //}
                    $scope.enrolmentSubmit = function (enrolmentData, partialSave) {
                        //debugger;
                        console.log(enrolmentData);
                        //$scope.formatEnrolmentData(enrolmentData);


                        //$scope.enrolment1SubmitBtn = true;
                        //$scope.enrolment1SubmitDisabled(false, true);                        

                        applicationService.postSaveApplication($scope.formatEnrolmentData(enrolmentData, partialSave))
                          .then(function (data) {
                              debugger;
                              $log.info(data);

                              if (data.data.d.message == "Ticket Created") {

                              }

                          })
                          .catch(function (data) {
                              debugger;
                              $log.error(data);
                          });

                        //    enrolmentService.postCreateTicket(enrolmentData)
                        //      .then(function (data) {
                        //          debugger;
                        //          $log.info(data);
                        //
                        //          if (data.data.d.message == "Ticket Created") {
                        //
                        //          }
                        //
                        //      })
                        //      .catch(function (data) {
                        //          debugger;
                        //          $log.error(data);
                        //      });

                    };
                    $scope.formatEnrolmentData = function (enrolmentData, partialSave) {
                        //debugger;
                        $scope.enrolmentFormattedData = {};
                        $scope.enrolmentFormattedData.partialSave = partialSave;
                        $scope.enrolmentFormattedData.vrt_title = enrolmentData.vrt_title ? enrolmentData.vrt_title : "";
                        $scope.enrolmentFormattedData.firstName = enrolmentData.firstName ? enrolmentData.firstName : "";
                        //$scope.enrolmentFormattedData.txtMiddleName = enrolmentData.txtMiddleName;
                        $scope.enrolmentFormattedData.lastname = enrolmentData.lastname ? enrolmentData.lastname : "";
                        $scope.enrolmentFormattedData.mobilephone = enrolmentData.mobilephone ? enrolmentData.mobilephone : "0000000000";
                        $scope.enrolmentFormattedData.isNumberValid = enrolmentData.isNumberValid ? enrolmentData.isNumberValid : false;
                        $scope.enrolmentFormattedData.emailaddress1 = enrolmentData.emailaddress1 ? enrolmentData.emailaddress1 : "";
                        $scope.enrolmentFormattedData.IsEmailValid = enrolmentData.IsEmailValid ? enrolmentData.IsEmailValid : false;

                        $scope.enrolmentFormattedData.birthdate = enrolmentData.birthdate ? enrolmentData.birthdate : "01/01/1900";

                        //$scope.enrolmentFormattedData.courseNCampus = enrolmentData.courseNCampus;
                        $scope.enrolmentFormattedData.courseNCampus = [];
                        //debugger;
                        if (enrolmentData.courseNCampus) {
                            angular.forEach(enrolmentData.courseNCampus, function (value, key) {
                                //angular.forEach(enrolmentData.txtQualification, function (value, key) {
                                //debugger;
                                $scope.enrolmentFormattedData.courseNCampus.push(
                                      {
                                          'vrt_course': value.vrt_course.CourseID ? value.vrt_course.CourseID : 0,
                                          'vrt_courseCode': value.vrt_course.CourseCode ? value.vrt_course.CourseCode : "",
                                          'vrt_courseName': value.vrt_course.CourseName ? value.vrt_course.CourseName : "",
                                          'txtCampus': value.txtCampus.campusID ? value.txtCampus.campusID : 0,
                                          'txtCampusName': value.txtCampus.campusName ? value.txtCampus.campusName : "",
                                          'courseCampusID': value.txtCampus.courseCampusID ? value.txtCampus.courseCampusID : 0,
                                      }
                                );
                            });
                        } else {
                            $scope.enrolmentFormattedData.courseNCampus.push(
                                  {
                                      'vrt_course': 0,
                                      'vrt_courseCode': "",
                                      'vrt_courseName': "",
                                      'txtCampus': 0,
                                      'txtCampusName': "",
                                      'courseCampusID': 0,
                            }
                            );
                        }

                        $scope.enrolmentFormattedData.studentGender = enrolmentData.studentGender ? enrolmentData.studentGender : "";
                        $scope.enrolmentFormattedData.address1_postalcode = enrolmentData.address1_postalcode ? enrolmentData.address1_postalcode : 0000;

                        $scope.enrolmentFormattedData.vrt_whatbroughtyoutothekanganinstitutewebsite = { vrt_whatbroughtyoutothekanganinstitutewebsite: '', reasonToChooseBKIID: 0 };
                        //if (enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite) {
                        //debugger;
                        $scope.enrolmentFormattedData.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite = enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite ?
                                                                        enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite : "";
                        $scope.enrolmentFormattedData.vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID = enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID ?
                                        enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.reasonToChooseBKIID : 0;
                        //}

                        //if (enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore == "Yes") {
                        //    $scope.enrolmentFormattedData.vrt_studiedatkanganinstitutebendigotafebefore = 1;
                        //} else if (enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore == "No") {
                        //    $scope.enrolmentFormattedData.vrt_studiedatkanganinstitutebendigotafebefore = 0;
                        //} else {
                        //    $scope.enrolmentFormattedData.vrt_studiedatkanganinstitutebendigotafebefore = 0;
                        //}
                        //debugger;
                        $scope.enrolmentFormattedData.vrt_studiedatkanganinstitutebendigotafebefore = enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore == 'True' ? 1 : 0;

                        $scope.enrolmentFormattedData.vrt_kibtstudentidnumber = enrolmentData.vrt_kibtstudentidnumber ? enrolmentData.vrt_kibtstudentidnumber : "";
                        $scope.enrolmentFormattedData.vrt_australiancitizenshipresidency = enrolmentData.vrt_australiancitizenshipresidency ? enrolmentData.vrt_australiancitizenshipresidency : { vrt_australiancitizenshipresidency: '', residencyId: 0, type: '' };

                        $scope.enrolmentFormattedData.vrt_aboriginalortorresstraitislander = enrolmentData.vrt_aboriginalortorresstraitislander ? enrolmentData.vrt_aboriginalortorresstraitislander : { vrt_aboriginalortorresstraitislander: '', statusId: 0 };
                        //debugger;
                        $scope.enrolmentFormattedData.vrt_successfullycompletedqualifications =
                            enrolmentData.vrt_successfullycompletedqualifications.vrt_successfullycompletedqualifications == 'True' ? "1" : "0"
                        //$scope.enrolmentFormattedData.vrt_successfullycompletedqualifications = enrolmentData.vrt_successfullycompletedqualifications ? enrolmentData.vrt_successfullycompletedqualifications :
                        //    { qualification: '', selected: false, internalName: "", qualificationID: "" };

                        $scope.enrolmentFormattedData.txtQualification = [];
                        var filteredArray = filterFilter(enrolmentData.txtQualification, { selected: 'true' });
                        //debugger;
                        if (filteredArray.length > 0) {

                            angular.forEach(filteredArray, function (value, key) {
                                //angular.forEach(enrolmentData.txtQualification, function (value, key) {
                                //debugger;
                                $scope.enrolmentFormattedData.txtQualification.push(
                                      {
                                          'qualification': value.qualification,
                                          'selected': value.selected,
                                          'internalName': value.internalName,
                                          'qualificationID': value.qualificationID
                                      }
                                );
                            });
                        } else {
                            $scope.enrolmentFormattedData.txtQualification = [{ qualification: "", selected: false, internalName: "", qualificationID: 0 }];
                        }
                        $scope.enrolmentFormattedData.hasUSI = enrolmentData.hasUSI == 'True'? '1' : '0';
                        //$scope.enrolmentFormattedData.hasUSI = enrolmentData.hasUSI;
                        //if (enrolmentData.hasUSI == 1) {
                        //    $scope.enrolmentFormattedData.hasUSI = 1;
                        //} else if (enrolmentData.hasUSI == 2) {
                        //    $scope.enrolmentFormattedData.hasUSI = 0;
                        //} else {
                        //    $scope.enrolmentFormattedData.hasUSI = 0;
                        //}
                        $scope.enrolmentFormattedData.applyUSI = enrolmentData.applyUSI == 'True' ? '1' : "0";

                        //debugger;
                        $scope.enrolmentFormattedData.streetName = enrolmentData.streetName ? enrolmentData.streetName : "";
                        $scope.enrolmentFormattedData.streetNumber = enrolmentData.streetNumber ? enrolmentData.streetNumber : "";
                        $scope.enrolmentFormattedData.city = enrolmentData.city ? enrolmentData.city : "";
                        $scope.enrolmentFormattedData.state = enrolmentData.state ? enrolmentData.state : { state: '', stateID: '0' };
                        $scope.enrolmentFormattedData.vrt_CityorTownofBirth = enrolmentData.vrt_CityorTownofBirth ? enrolmentData.vrt_CityorTownofBirth : "";
                        $scope.enrolmentFormattedData.isAddressValid = enrolmentData.isAddressValid ? enrolmentData.isAddressValid : true;

                        $scope.enrolmentFormattedData.vrt_CountryofBirth = enrolmentData.vrt_CountryofBirth ? enrolmentData.vrt_CountryofBirth : { country: '', countryID: 0 };
                        //$scope.enrolmentFormattedData.txtCountryOfBirth = "";
                        //$scope.enrolmentFormattedData.txtCountryOfBirth.country = enrolmentData.txtCountryOfBirth.country;
                        //$scope.enrolmentFormattedData.txtCountryOfBirth.value = enrolmentData.txtCountryOfBirth.value;
                        $scope.enrolmentFormattedData.vrt_CountryofResidence = enrolmentData.vrt_CountryofResidence ? enrolmentData.vrt_CountryofResidence : { country: '', countryID: 0 };
                        //$scope.enrolmentFormattedData.txtCountryOfResidence = "";
                        //$scope.enrolmentFormattedData.txtCountryOfResidence.country = enrolmentData.txtCountryOfResidence.country;
                        //$scope.enrolmentFormattedData.txtCountryOfResidence.value = enrolmentData.txtCountryOfResidence.value;
                        //$scope.enrolmentFormattedData.idProofType = enrolmentData.idProofType;
                        //$scope.enrolmentFormattedData.idProof = enrolmentData.idProof;
                        //debugger;
                        //$scope.enrolmentFormattedData.idProof = { idProofText: "", idProofName: "", proofId: 0, type: "", internalName: "" };
                        //debugger;
                        $scope.enrolmentFormattedData.idProofText = enrolmentData.idProofText ? enrolmentData.idProofText : "";
                        $scope.enrolmentFormattedData.idProof = { idProofName: "", proofId: 0, type: "", internalName: "" };                        
                        $scope.enrolmentFormattedData.idProof.idProofName = enrolmentData.idProofType.idProofName ? enrolmentData.idProofType.idProofName : "";
                        $scope.enrolmentFormattedData.idProof.proofId = enrolmentData.idProofType.proofId ? enrolmentData.idProofType.proofId : 0;
                        $scope.enrolmentFormattedData.idProof.type = enrolmentData.idProofType.type ? enrolmentData.idProofType.type : "";
                        $scope.enrolmentFormattedData.idProof.internalName = enrolmentData.idProofType.internalName ? enrolmentData.idProofType.internalName : "";

                        $scope.enrolmentFormattedData.vrt_uniquestudentidentifier = enrolmentData.vrt_uniquestudentidentifier ? enrolmentData.vrt_uniquestudentidentifier : "";
                        //$scope.enrolmentFormattedData.vrt_permissiontocheckfororcreateausi = enrolmentData.vrt_permissiontocheckfororcreateausi;
                        $scope.enrolmentFormattedData.vrt_permissiontocheckfororcreateausi = enrolmentData.vrt_permissiontocheckfororcreateausi == 'True'? '1' : '0';
                        //debugger;
                        return $scope.enrolmentFormattedData;
                    };

                    //Shared Common
                //   $scope.courses = [
                //       { courseID: '101', courseCode: 'CPC30211', vrt_course: 'Certificate I' },
                //       { courseID: '102', courseCode: 'CPC33441', vrt_course: 'Certificate II' },
                //       { courseID: '103', courseCode: 'CPC30411', vrt_course: 'Certificate III' },
                //   ];


                    // $scope.vrt_australiancitizenshipresidency = [
                    //     { vrt_australiancitizenshipresidency: 'Australian citizen', residencyId: '110', type: 'Aus' },
                    //     { vrt_australiancitizenshipresidency: 'New Zealand citizen', residencyId: '102', type: 'Non' },
                    //     { vrt_australiancitizenshipresidency: 'Permanent resident other than PHV', residencyId: '103', type: 'Non' },
                    //     { vrt_australiancitizenshipresidency: 'Temporary entry permit', residencyId: '104', type: 'Non' },
                    //     { vrt_australiancitizenshipresidency: 'Not one of the other categories and not residing in Australia', residencyId: '105', type: 'Non' },
                    //     { vrt_australiancitizenshipresidency: 'Permanent Humanitarian Visa (PHV)', residencyId: '106', type: 'Non' }
                    // ];

                    //  $scope.vrt_aboriginalortorresstraitislander = [
                    //      { vrt_aboriginalortorresstraitislander: 'Aboriginal', statusId: '101' },
                    //      { vrt_aboriginalortorresstraitislander: 'Torres Strait Islander', statusId: '102' },
                    //      { vrt_aboriginalortorresstraitislander: 'Aboriginal AND Torres Strait Islander', statusId: '103' },
                    //      { vrt_aboriginalortorresstraitislander: 'Neither Aboriginal Nor Torres Strait Islander', statusId: '104' }
                    //  ];

                    // $scope.states = [
                    //     { state: 'New South Wales', stateID: '100' },
                    //     { state: 'Queensland', stateID: '101' },
                    //     { state: 'South Australia', stateID: '102' },
                    //     { state: 'Tasmania', stateID: '103' },
                    //     { state: 'Victoria', stateID: '104' },
                    //     { state: 'Australian Capital Territory (ACT)', stateID: '105' },
                    //     { state: 'Northern Territory', stateID: '106' },
                    // ];

                    //$scope.countries = [
                    //    { country: 'Australia', countryID: '110' },
                    //    { country: 'Albania', countryID: '101' },
                    //    { country: 'Algeria', countryID: '102' },
                    //    { country: 'American Samoa', countryID: '103' },
                    //    { country: 'Andorra', countryID: '104' },
                    //    { country: 'Angola', countryID: '105' },
                    //    { country: 'Antigua and Barbuda', countryID: '106' },
                    //    { country: 'Argentina', countryID: '107' },
                    //    { country: 'Armenia', countryID: '108' },
                    //    { country: 'Aruba', countryID: '109' },
                    //    { country: 'Afghanistan', countryID: '100' },
                    //    { country: 'Austria', countryID: '111' },
                    //    { country: 'Azerbaijan', countryID: '112' },
                    //    { country: 'Bahamas', countryID: '113' },
                    //    { country: 'Bahrain', countryID: '114' },
                    //    { country: 'Bangladesh', countryID: '115' },
                    //    { country: 'Barbados', countryID: '116' },
                    //    { country: 'Belarus', countryID: '117' },
                    //    { country: 'Belgium', countryID: '118' },
                    //    { country: 'Belize', countryID: '119' },
                    //    { country: 'Benin', countryID: '120' },
                    //    { country: 'Bermuda', countryID: '121' },
                    //    { country: 'Bhutan', countryID: '122' },
                    //    { country: 'Bolivia', countryID: '123' },
                    //    { country: 'Bosnia and Herzegovina', countryID: '124' },
                    //    { country: 'Botswana', countryID: '125' },
                    //    { country: 'Brazil', countryID: '126' },
                    //    { country: 'British Virgin Islands', countryID: '127' },
                    //    { country: 'Brunei', countryID: '128' },
                    //    { country: 'Bulgaria', countryID: '129' },
                    //    { country: 'Burkina Faso', countryID: '130' },
                    //    { country: 'Burundi', countryID: '131' },
                    //    { country: 'Cambodia', countryID: '132' },
                    //    { country: 'Cameroon', countryID: '133' },
                    //    { country: 'Canada', countryID: '134' },
                    //    { country: 'Cape Verde', countryID: '135' },
                    //    { country: 'Cayman Islands', countryID: '136' },
                    //    { country: 'Central African Republic', countryID: '137' },
                    //    { country: 'Chad', countryID: '138' },
                    //    { country: 'Chile', countryID: '139' },
                    //    { country: 'China', countryID: '140' },
                    //    { country: 'Chinese Taipei[5]', countryID: '141' },
                    //    { country: 'Colombia', countryID: '142' },
                    //    { country: 'Comoros', countryID: '143' },
                    //    { country: 'Congo', countryID: '144' },
                    //    { country: 'Cook Islands', countryID: '145' },
                    //    { country: 'Costa Rica', countryID: '146' },
                    //    { country: 'Croatia', countryID: '147' },
                    //    { country: 'Cuba', countryID: '148' },
                    //    { country: 'Cyprus', countryID: '149' },
                    //    { country: 'Czech Republic', countryID: '150' },
                    //    { country: 'Denmark', countryID: '151' },
                    //    { country: 'Djibouti', countryID: '152' },
                    //    { country: 'Dominica', countryID: '153' },
                    //    { country: 'Dominican Republic', countryID: '154' },
                    //    { country: 'DR Congo', countryID: '155' },
                    //    { country: 'Ecuador', countryID: '156' },
                    //    { country: 'Egypt', countryID: '157' },
                    //    { country: 'El Salvador', countryID: '158' },
                    //    { country: 'Equatorial Guinea', countryID: '159' },
                    //    { country: 'Eritrea', countryID: '160' },
                    //    { country: 'Estonia', countryID: '161' },
                    //    { country: 'Ethiopia', countryID: '162' },
                    //    { country: 'Federated States of Micronesia', countryID: '163' },
                    //    { country: 'Fiji', countryID: '164' },
                    //    { country: 'Finland', countryID: '165' },
                    //    { country: 'France', countryID: '166' },
                    //    { country: 'Gabon', countryID: '167' },
                    //    { country: 'Georgia', countryID: '168' },
                    //    { country: 'Germany', countryID: '169' },
                    //    { country: 'Ghana', countryID: '170' },
                    //    { country: 'Great Britain', countryID: '171' },
                    //    { country: 'Greece', countryID: '172' },
                    //    { country: 'Grenada', countryID: '173' },
                    //    { country: 'Guam', countryID: '174' },
                    //    { country: 'Guatemala', countryID: '175' },
                    //    { country: 'Guinea', countryID: '176' },
                    //    { country: 'Guinea-Bissau', countryID: '177' },
                    //    { country: 'Guyana', countryID: '178' },
                    //    { country: 'Haiti', countryID: '179' },
                    //    { country: 'Honduras', countryID: '180' },
                    //    { country: 'Hong Kong', countryID: '181' },
                    //    { country: 'Hungary', countryID: '182' },
                    //    { country: 'Iceland', countryID: '183' },
                    //    { country: 'India', countryID: '184' },
                    //    { country: 'Indonesia', countryID: '185' },
                    //    { country: 'Iran', countryID: '186' },
                    //    { country: 'Iraq', countryID: '187' },
                    //    { country: 'Ireland', countryID: '188' },
                    //    { country: 'Israel', countryID: '189' },
                    //    { country: 'Italy', countryID: '190' },
                    //    { country: 'Ivory Coast', countryID: '191' },
                    //    { country: 'Jamaica', countryID: '192' },
                    //    { country: 'Japan', countryID: '193' },
                    //    { country: 'Jordan', countryID: '194' },
                    //    { country: 'Kazakhstan', countryID: '195' },
                    //    { country: 'Kenya', countryID: '196' },
                    //    { country: 'Kiribati', countryID: '197' },
                    //    { country: 'Kosovo', countryID: '198' },
                    //    { country: 'Kuwait', countryID: '199' },
                    //    { country: 'Kyrgyzstan', countryID: '200' },
                    //    { country: 'Laos', countryID: '201' },
                    //    { country: 'Latvia', countryID: '202' },
                    //    { country: 'Lebanon', countryID: '203' },
                    //    { country: 'Lesotho', countryID: '204' },
                    //    { country: 'Liberia', countryID: '205' },
                    //    { country: 'Libya', countryID: '206' },
                    //    { country: 'Liechtenstein', countryID: '207' },
                    //    { country: 'Lithuania', countryID: '208' },
                    //    { country: 'Luxembourg', countryID: '209' },
                    //    { country: 'Macedonia', countryID: '210' },
                    //    { country: 'Madagascar', countryID: '211' },
                    //    { country: 'Malawi', countryID: '212' },
                    //    { country: 'Malaysia', countryID: '213' },
                    //    { country: 'Maldives', countryID: '214' },
                    //    { country: 'Mali', countryID: '215' },
                    //    { country: 'Malta', countryID: '216' },
                    //    { country: 'Marshall Islands', countryID: '217' },
                    //    { country: 'Mauritania', countryID: '218' },
                    //    { country: 'Mauritius', countryID: '219' },
                    //    { country: 'Mexico', countryID: '220' },
                    //    { country: 'Moldova', countryID: '221' },
                    //    { country: 'Monaco', countryID: '222' },
                    //    { country: 'Mongolia', countryID: '223' },
                    //    { country: 'Montenegro', countryID: '224' },
                    //    { country: 'Morocco', countryID: '225' },
                    //    { country: 'Mozambique', countryID: '226' },
                    //    { country: 'Myanmar', countryID: '227' },
                    //    { country: 'Namibia', countryID: '228' },
                    //    { country: 'Nauru', countryID: '229' },
                    //    { country: 'Nepal', countryID: '230' },
                    //    { country: 'Netherlands', countryID: '231' },
                    //    { country: 'New Zealand', countryID: '232' },
                    //    { country: 'Nicaragua', countryID: '233' },
                    //    { country: 'Niger', countryID: '234' },
                    //    { country: 'Nigeria', countryID: '235' },
                    //    { country: 'North Korea', countryID: '236' },
                    //    { country: 'Norway', countryID: '237' },
                    //    { country: 'Oman', countryID: '238' },
                    //    { country: 'Pakistan', countryID: '239' },
                    //    { country: 'Palau', countryID: '240' },
                    //    { country: 'Palestine', countryID: '241' },
                    //    { country: 'Panama', countryID: '242' },
                    //    { country: 'Papua New Guinea', countryID: '243' },
                    //    { country: 'Paraguay', countryID: '244' },
                    //    { country: 'Peru', countryID: '245' },
                    //    { country: 'Philippines', countryID: '246' },
                    //    { country: 'Poland', countryID: '247' },
                    //    { country: 'Portugal', countryID: '248' },
                    //    { country: 'Puerto Rico', countryID: '249' },
                    //    { country: 'Qatar', countryID: '250' },
                    //    { country: 'Romania', countryID: '251' },
                    //    { country: 'Russia', countryID: '252' },
                    //    { country: 'Rwanda', countryID: '253' },
                    //    { country: 'Saint Kitts and Nevis', countryID: '254' },
                    //    { country: 'Saint Lucia', countryID: '255' },
                    //    { country: 'Saint Vincent and the Grenadines', countryID: '256' },
                    //    { country: 'Samoa', countryID: '257' },
                    //    { country: 'San Marino', countryID: '258' },
                    //    { country: 'São Tomé and Príncipe', countryID: '259' },
                    //    { country: 'Saudi Arabia', countryID: '260' },
                    //    { country: 'Senegal', countryID: '261' },
                    //    { country: 'Serbia', countryID: '262' },
                    //    { country: 'Seychelles', countryID: '263' },
                    //    { country: 'Sierra Leone', countryID: '264' },
                    //    { country: 'Singapore', countryID: '265' },
                    //    { country: 'Slovakia', countryID: '266' },
                    //    { country: 'Slovenia', countryID: '267' },
                    //    { country: 'Solomon Islands', countryID: '268' },
                    //    { country: 'Somalia', countryID: '269' },
                    //    { country: 'South Africa', countryID: '270' },
                    //    { country: 'South Korea', countryID: '271' },
                    //    { country: 'South Sudan', countryID: '272' },
                    //    { country: 'Spain', countryID: '273' },
                    //    { country: 'Sri Lanka', countryID: '274' },
                    //    { country: 'Sudan', countryID: '275' },
                    //    { country: 'Suriname', countryID: '276' },
                    //    { country: 'Swaziland', countryID: '277' },
                    //    { country: 'Sweden', countryID: '278' },
                    //    { country: 'Switzerland', countryID: '279' },
                    //    { country: 'Syria', countryID: '280' },
                    //    { country: 'Tajikistan', countryID: '281' },
                    //    { country: 'Tanzania', countryID: '282' },
                    //    { country: 'Thailand', countryID: '283' },
                    //    { country: 'The Gambia', countryID: '284' },
                    //    { country: 'Timor-Leste', countryID: '285' },
                    //    { country: 'Togo', countryID: '286' },
                    //    { country: 'Tonga', countryID: '287' },
                    //    { country: 'Trinidad and Tobago', countryID: '288' },
                    //    { country: 'Tunisia', countryID: '289' },
                    //    { country: 'Turkey', countryID: '290' },
                    //    { country: 'Turkmenistan', countryID: '291' },
                    //    { country: 'Tuvalu', countryID: '292' },
                    //    { country: 'Uganda', countryID: '293' },
                    //    { country: 'Ukraine', countryID: '294' },
                    //    { country: 'United Arab Emirates', countryID: '295' },
                    //    { country: 'United States', countryID: '296' },
                    //    { country: 'Uruguay', countryID: '297' },
                    //    { country: 'Uzbekistan', countryID: '298' },
                    //    { country: 'Vanuatu', countryID: '299' },
                    //    { country: 'Venezuela', countryID: '300' },
                    //    { country: 'Vietnam', countryID: '301' },
                    //    { country: 'Virgin Islands', countryID: '302' },
                    //    { country: 'Yemen', countryID: '303' },
                    //    { country: 'Zambia', countryID: '304' },
                    //    { country: 'Zimbabwe', countryID: '305' },
                    //];

                    $scope.yesNo = [{ 
                        checked: false,
                        name: "Yes",
                        value: 1
                    }, {
                        checked: false,
                        name: "No",
                        value: 2
                    }];

                }]);

                angular.module('applicationApp').factory("applicationService", ["$http", "$q", '$log', function ($http, $q, $log) {

                    var postVerifyUSI = function (enrolmentData) {
                        //debugger;

                        var deferred = $q.defer();

                        //H3ZB7Y7427 

                        var USIData = {  //enrolmentData
                            USI: 'H3ZB7Y7427',
                            firstName: 'Vaibhav',
                            lastName: 'Sharma',
                            dateOfBirth: '11/20/1988'
                        };

                        var parameters = {
                            verifyUsi: [
                                USIData
                            ]
                        };


                        var urlSite = '<%=FromServerApplication %>' + "/VerifyUsi";
                $http({
                    url: urlSite,
                    method: "POST",

                    data: JSON.stringify(parameters),
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var postCreateTicket = function (enrolmentData) {
                debugger;

                var deferred = $q.defer();

                var parameters = {
                    ed: [
                        enrolmentData
                    ]
                };


                var urlSite = '<%=FromServerApplication %>' + "/CreateTicket";
                $http({
                    url: urlSite,
                    method: "POST",

                    data: JSON.stringify(parameters),
                    // data: "{'heatId':" + "11"  
                    //             + ",'teacherId':" + "11"  
                    //             + ",'crn':" + "11"
                    //             + ",'termCode':" + "11"
                    //             + ",'classDate':" + "11" 
                    //        + "}",
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var postSaveApplication = function (enrolmentData) {
                //debugger;

                var deferred = $q.defer();

                var parameters = {
                    ed: [
                        enrolmentData
                    ]
                };


                var urlSite = '<%=FromServerApplication %>' + "/SaveApplication";
                $http({
                    url: urlSite,
                    method: "POST",

                    data: JSON.stringify(parameters),
                    // data: "{'heatId':" + "11"  
                    //             + ",'teacherId':" + "11"  
                    //             + ",'crn':" + "11"
                    //             + ",'termCode':" + "11"
                    //             + ",'classDate':" + "11" 
                    //        + "}",
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var postEmailValidate = function (authToken, email) {
                //debugger;

                var deferred = $q.defer();

                var urlSite = 'https://api.experianmarketingservices.com/query/EmailValidate/1.0';
                $http({
                    url: urlSite,
                    method: "POST",
                    data: {
                        "Email": email,//"vaibhav88sharma@gmail.com",
                        "Timeout": "5",
                        "Verbose": "True"
                    },//JSON.stringify(parameters),
                    headers: {
                        "Auth-Token": authToken,//"a192f036-a552-4066-9e60-9a5d34eed1d0",
                        "content-Type": "application/application/json"
                    }
                })
                    //.then(function (data, status, headers, config) { //response
                    .then(function (response) {
                        //debugger;
                        console.log('Content-Location Header: ' + response.headers('Content-Location'));
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };
            var getEmailValidate = function (authToken, emailUrl) {
                //debugger;

                var deferred = $q.defer();

                //var urlSite = 'https://api.experianmarketingservices.com/query/EmailValidate/1.0';
                $http({
                    url: emailUrl,
                    method: "GET",
                    data: {},//JSON.stringify(parameters),
                    headers: {
                        "Auth-Token": authToken,
                        "content-Type": "application/application/json"
                    }
                })
                    //.then(function (data, status, headers, config) { //response
                    .then(function (response) {
                        //console.log('Content-Range: ' + response.headers('Content-Location'));
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var postNumberValidate = function (authToken, phoneNumber) {
                //debugger;

                var deferred = $q.defer();

                $http({
                    url: 'https://api.experianmarketingservices.com/query/PhoneValidate/3.0/',
                    method: "POST",
                    data: {
                        "Number": phoneNumber//"+61412625737"
                    },
                    headers: {
                        "Auth-Token": authToken, //"ad49bc49-2752-422b-a436-87dab6b10bc2", // a192f036-a552-4066-9e60-9a5d34eed1d0
                        "content-Type": "application/json"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var getNumberValidate = function (authToken, phoneNumberUrl) {
                //debugger;

                var deferred = $q.defer();

                //var urlSite = 'https://api.experianmarketingservices.com/query/EmailValidate/1.0';
                $http({
                    url: phoneNumberUrl,
                    method: "GET",
                    data: {},//JSON.stringify(parameters),
                    headers: {
                        "Auth-Token": authToken,
                        "content-Type": "application/application/json"
                    }
                })
                    //.then(function (data, status, headers, config) { //response
                    .then(function (response) {
                        //console.log('Content-Range: ' + response.headers('Content-Location'));
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var getAddressValidate = function (authToken, address) {
                //debugger;

                var deferred = $q.defer();

                //var urlSite = ' https://api.edq.com/capture/address/v2/search?country=gbr&query=experian+data+quality&take=7&auth-token=a1b234c5-a1bc-1234-a1bc-123a4567891bc';
                var urlSite = 'https://api.edq.com/capture/address/v2/search?country=AUS&query=' + address + '&take=7';
                $http({
                    url: urlSite,
                    method: "GET",
                    data: {},//JSON.stringify(parameters),
                    headers: {
                        "auth-token": authToken,//"a192f036-a552-4066-9e60-9a5d34eed1d0"
                        //"accept": "application/json; charset=utf-8",
                        //"content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var getStudentsBksb = function () {
                debugger;
                var deferred = $.Deferred();

                $.ajax({
                    //type: "POST",
                    //url: "https://live2api.bksblive2.com.au/api/userGroups/search?page=1&recordsPerPage=20&query=Afternoon%20Group",
                    url: "https://live2api.bksblive2.com.au/api/userGroups/search?page=1&recordsPerPage=20&query=Everyone",
                    //url: "https://kanganinstitute.bksblive2.com.au/api/userGroups/search?page=1&recordsPerPage=20&query=Everyone",
                    //https://api.bksblive2.com.au/bksbapi/
                    //https://live2api.bksblive2.com.au/api/userGroups/search?page=dasd&recordsPerPage=dasd&query=dasd
                    method: "GET",
                    //cache: false,
                    data: {},
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization", "Basic " + btoa(apiAccessKey + ":" + apiSecretKey));
                    },
                    success: function (data, textStatus, jqXHR) {
                        debugger;
                        deferred.resolve(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        debugger;
                        deferred.resolve(jqXHR);
                    },
                    complete: function (jqXHR, textStatus) {
                        debugger;
                    }
                });


                return deferred.promise();
            };

            var postGetCourses = function () {
                //debugger;

                var deferred = $q.defer();

                //var parameters = {
                //    verifyUsi: [
                //        USIData
                //    ]
                //};

                var urlSite = '<%=FromServerApplication %>' + "/GetCourses";
                        $http({
                            url: urlSite,
                            method: "POST",
                            data: {},//JSON.stringify(parameters),
                            headers: {
                                "accept": "application/json; charset=utf-8",
                                "content-Type": "application/json; charset=utf-8"
                            }
                        })
                            .then(function (response) {
                                //debugger;
                                deferred.resolve(response);
                            })
                            .catch(function (error) {
                                debugger;
                                deferred.reject(error);
                            });
                        return deferred.promise;
                };
            var postGetCampuses = function () {
                //debugger;

                var deferred = $q.defer();

                //var parameters = {
                //    verifyUsi: [
                //        USIData
                //    ]
                //};

                var urlSite = '<%=FromServerApplication %>' + "/GetCampuses";
                        $http({
                            url: urlSite,
                            method: "POST",
                            data: {},//JSON.stringify(parameters),
                            headers: {
                                "accept": "application/json; charset=utf-8",
                                "content-Type": "application/json; charset=utf-8"
                            }
                        })
                            .then(function (response) {
                                //debugger;
                                deferred.resolve(response);
                            })
                            .catch(function (error) {
                                debugger;
                                deferred.reject(error);
                            });
                        return deferred.promise;
                };

            var postgetGetApplicationLookups = function () {
                //debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerApplication %>' + "/GetApplicationLookups";
                $http({
                    url: urlSite,
                    method: "POST",

                    data: {},
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var postGetFormPartialData = function (applicationId) {
                //debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerApplication %>' + "/GetFormData";
                $http({
                    url: urlSite,
                    method: "POST",

                    data: "{'applicationId':" + JSON.stringify(applicationId)
                             //   + ",'teacherId':" + JSON.stringify(a)
                             //   + ",'crn':" + JSON.stringify(a)
                             //   + ",'termCode':" + JSON.stringify(a)
                             //   + ",'classDate':" + JSON.stringify(a)
                           + "}",
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var getApplicationAllLookups = function () {
                //debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerApplication %>' + "/GetApplicationAllLookups";
                $http({
                    url: urlSite,
                    method: "GET",

                    data: {},
                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            var getFormPartialData = function (applicationId) {
                //debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerApplication %>' + "/GetFormData" //;
                    + "?applicationId=" + applicationId;

                $http({
                    url: urlSite,
                    method: "GET",
                    //data: "{'applicationId':" + JSON.stringify(applicationId) + "}",
                    //data: JSON.stringify({ 'applicationId': applicationId }),
                    //data: "{ 'applicationId' : '" + applicationId + "'}",
                    //data: "{ 'applicationId' : " + applicationId + "}",
                    //data: "applicationId=" + encodeURIComponent(applicationId),

                    data: {
                        //applicationId: 1
                    },

                    headers: {
                        "accept": "application/json; charset=utf-8",
                        "content-Type": "application/json; charset=utf-8"
                    }
                })
                    .then(function (response) {
                        //debugger;
                        deferred.resolve(response);
                    })
                    .catch(function (error) {
                        debugger;
                        deferred.reject(error);
                    });
                return deferred.promise;
            };

            return {
                postVerifyUSI: postVerifyUSI,
                postCreateTicket: postCreateTicket,
                postSaveApplication: postSaveApplication,
                postEmailValidate: postEmailValidate,
                getEmailValidate: getEmailValidate,
                //postEmailValidateAjax: postEmailValidateAjax,
                postNumberValidate: postNumberValidate,
                getNumberValidate: getNumberValidate,
                getAddressValidate: getAddressValidate,
                postGetCourses: postGetCourses,
                postGetCampuses: postGetCampuses,
                postgetGetApplicationLookups: postgetGetApplicationLookups,
                postGetFormPartialData: postGetFormPartialData,
                getApplicationAllLookups: getApplicationAllLookups,
                getFormPartialData: getFormPartialData
            };
        }]);


    </script>


</head>
<body data-ng-app="applicationApp">

    <div data-ng-controller="applicationController">
        <div class="container">
            <div class="row">
<%--                <div class="col jumbotron jumbotron-fluid" style="background-color: black"> <!--#289ad7;-->
                    <p style="margin-left: 0.1em; text-align: center; color: white;" class="h1">Apply for a Course</p>
                </div>--%>
                <div class="col my-5">
                    <img  src="../Files/images/A0.png" /> <%--style="margin-left: 25.5rem;"/>--%>
                    <%--data-ng-if="applicationView.view3 ? true : false"--%>
                </div>
            </div>
        </div>
        <div class="container mb-5">

<%--		<form name="address1">
			<label for="country">Country</label>
			<select name="country">
				<option value="">Please select</option>
				<option value="aus">Australia</option>
				<option value="fra">France</option>
				<option value="nzl">New Zealand</option>
				<option value="gbr" selected>United Kingdom</option>
				<option value="usa">United States</option>
			</select>

			<label for="input">Address</label>
			<input type="text" name="address-input"/>
            <button onclick="validateAddress()">Try it</button>

		</form>--%>
            
            <form name="enrolment1" novalidate ng-submit="enrolmentSubmit(enrolmentData, 0)"> <%--enrolmentData--%>
                <fieldset>

                    <%--View 1--%>
                    <%--View 1--%>
                    <%--View 1--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view1 ? true : false">
                        <h4 class="card-header">Before You Start</h4>
                        <div class="card-body">

                            <div class="form-group row">
                                <label for="vrt_title" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.vrt_title.$touched || enrolment1.vrt_title.$dirty) && enrolment1.vrt_title.$invalid}">Title</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="vrt_title" id="vrt_title" data-ng-model="enrolmentData.vrt_title" required
                                        data-ng-class="{'is-invalid': (enrolment1.vrt_title.$touched || enrolment1.vrt_title.$dirty) && enrolment1.vrt_title.$invalid}">
                                        <option style="display:none" value=""></option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Miss">Miss</option>
                                        <option value="Dr">Dr</option>
                                    </select>
                                        <span class="form-text" data-ng-if="(enrolment1.vrt_title.$touched || enrolment1.vrt_title.$dirty) && enrolment1.vrt_title.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.vrt_title.$touched || enrolment1.vrt_title.$dirty) && enrolment1.vrt_title.$invalid }">
                                            <span data-ng-if="enrolment1.vrt_title.$error.required">
                                                Please select a title.
                                            </span>
                                        </span>
                                </div>
                            </div>
<%--                            <div class="form-group row">
                                <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name *" required data-ng-model="enrolmentData.firstName"/>
                                </div>
                            </div>--%>
                            <div class="form-group row">
                                <label for="firstName" class="col-sm-2 col-form-label"  
                                    data-ng-class="{'invalid-feedback': (enrolment1.firstName.$touched || enrolment1.firstName.$dirty) && enrolment1.firstName.$invalid}"
                                    >First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name *" required data-ng-model="enrolmentData.firstName"
                                        data-ng-class="{'is-invalid': (enrolment1.firstName.$touched || enrolment1.firstName.$dirty) && enrolment1.firstName.$invalid}"/>
                                        <span class="form-text" data-ng-if="(enrolment1.firstName.$touched || enrolment1.firstName.$dirty) && enrolment1.firstName.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.firstName.$touched || enrolment1.firstName.$dirty) && enrolment1.firstName.$invalid }">
                                            <span data-ng-if="enrolment1.firstName.$error.required">
                                                Please enter the First name.
                                            </span>
                                        </span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="lastname" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.lastname.$touched || enrolment1.lastname.$dirty) && enrolment1.lastname.$invalid}">Last Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name *" required data-ng-model="enrolmentData.lastname"
                                        data-ng-class="{'is-invalid': (enrolment1.lastname.$touched || enrolment1.lastname.$dirty) && enrolment1.lastname.$invalid}" />
                                        <span class="form-text" data-ng-if="(enrolment1.lastname.$touched || enrolment1.lastname.$dirty) && enrolment1.lastname.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.lastname.$touched || enrolment1.lastname.$dirty) && enrolment1.lastname.$invalid }">
                                            <span data-ng-if="enrolment1.lastname.$error.required">
                                                Please enter the Last name.
                                            </span>
                                        </span>
                                </div>
                            </div>
                           <div class="form-group row">
                                <label for="mobilephone" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.mobilephone.$touched || enrolment1.mobilephone.$dirty) && enrolment1.mobilephone.$invalid}">Mobile</label>
                                <div class="col-sm-10">

                                    <div class="input-group">

                                        <input type="number" class="form-control" id="mobilephone" name="mobilephone" placeholder="Mobile *" required data-ng-model="enrolmentData.mobilephone"
                                            data-ng-class="{'is-invalid': (enrolment1.mobilephone.$touched || enrolment1.mobilephone.$dirty) && enrolment1.mobilephone.$invalid}" 
                                            ng-style="enrolmentData.isNumberValid == true ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}"
                                            /> <%--ng-blur="validateNumber()"--%>
                                        <i class="fa fa-exclamation-triangle text-warning" 
                                            style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                    border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                            data-ng-if="enrolmentData.isNumberValid == true"></i>

                                    </div>
                                        <span class="form-text" data-ng-if="(enrolment1.mobilephone.$touched || enrolment1.mobilephone.$dirty) && enrolment1.mobilephone.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.mobilephone.$touched || enrolment1.mobilephone.$dirty) && enrolment1.mobilephone.$invalid }">
                                            <span data-ng-if="enrolment1.mobilephone.$error.required" style="border-left: none">
                                                Please enter the Mobile Phone.
                                            </span>
                                        </span>
<%--                                        <span data-ng-if="enrolmentData.isNumberInvalid == true" class="text-warning">
                                            Mobile number entered is not valid
                                        </span>--%>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="emailaddress1" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.emailaddress1.$touched || enrolment1.emailaddress1.$dirty) && enrolment1.emailaddress1.$invalid}">Email</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="email" class="form-control" id="emailaddress1" name="emailaddress1" placeholder="Email *" required data-ng-model="enrolmentData.emailaddress1"
                                            data-ng-class="{'is-invalid': (enrolment1.emailaddress1.$touched || enrolment1.emailaddress1.$dirty) && enrolment1.emailaddress1.$invalid}"
                                            ng-style="enrolmentData.IsEmailValid == true ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}"
                                            /> <%--ng-blur="validateEmail()"--%>
                                        <i class="fa fa-exclamation-triangle text-warning" 
                                            style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                    border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                            data-ng-if="enrolmentData.IsEmailValid == true"></i>
                                    </div>
                                        <span class="form-text" data-ng-if="(enrolment1.emailaddress1.$touched || enrolment1.emailaddress1.$dirty) && enrolment1.emailaddress1.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.emailaddress1.$touched || enrolment1.emailaddress1.$dirty) && enrolment1.emailaddress1.$invalid }">
                                            <span data-ng-if="enrolment1.emailaddress1.$error.required">
                                                Please enter the email address.
                                            </span>
                                            <span data-ng-if="enrolment1.emailaddress1.$error.email">
                                                Please enter valid email address.
                                            </span>
                                        </span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtConfirmEmail" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.txtConfirmEmail.$touched || enrolment1.txtConfirmEmail.$dirty) && enrolment1.txtConfirmEmail.$invalid}">Confirm Email</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="email" class="form-control" id="txtConfirmEmail" name="txtConfirmEmail" placeholder="Confirm Email" required data-ng-model="enrolmentData.txtConfirmEmail" data-ng-pattern="enrolmentData.emailaddress1"
                                            data-ng-class="{'is-invalid': (enrolment1.txtConfirmEmail.$touched || enrolment1.txtConfirmEmail.$dirty) && enrolment1.txtConfirmEmail.$invalid}"
                                            ng-style="enrolmentData.IsEmailValid == true ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}"
                                            />  <%--ng-blur="validateEmail()"--%>
                                        <i class="fa fa-exclamation-triangle text-warning" 
                                                style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                        border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                                data-ng-if="enrolmentData.IsEmailValid == true"></i>
                                    </div>
                                        <span class="form-text" data-ng-if="(enrolment1.txtConfirmEmail.$touched || enrolment1.txtConfirmEmail.$dirty) && enrolment1.txtConfirmEmail.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.txtConfirmEmail.$touched || enrolment1.txtConfirmEmail.$dirty) && enrolment1.txtConfirmEmail.$invalid }">
                                            <span data-ng-if="enrolment1.txtConfirmEmail.$error.required">
                                                Please enter the Confirmation Email address.
                                            </span>
                                            <span data-ng-if="enrolment1.txtConfirmEmail.$error.pattern">
                                                Confirmation Email is not equal to Email address.
                                            </span>
                                        </span>
<%--                                         pattern:   <span data-ng-if="enrolment1.txtConfirmEmail.$error.pattern">
                                                Confirmation Email is not equal to Email address.
                                            </span><br />
                                         $error:   <span data-ng-if="enrolment1.txtConfirmEmail.$error">
                                                Confirmation Email is not equal to Email address.
                                            </span><br />
valid:   <span data-ng-if="enrolment1.txtConfirmEmail.$valid">
                                                Confirmation Email is not equal to Email address.
                                            </span>
<br />invalid:   <span data-ng-if="enrolment1.txtConfirmEmail.$invalid">
                                                Confirmation Email is not equal to Email address.
                                            </span> --%>                                   
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-2">&nbsp;</div>
                                <div data-ng-if="(enrolmentData.isNumberValid == true) || (enrolmentData.IsEmailValid == true)" class="text-warning col my-2 h6 mt-1">
                                    <i class="fa fa-exclamation-triangle mr-2"></i> Value returned as invalid, please review
<%--                                    <div class="d-flex justify-content-center">
                                        <div class="d-flex flex-column">
                                            <div class="h5 text-uppercase">
                                                <i class="fa fa-exclamation-triangle mx-2 mt-1"></i>
                                                Value returned an invalid response, please review
                                            </div>--%>

<%--                                            <div class="h5" data-ng-if="enrolmentData.isNumberInvalid == true">
                                                <i class="fa fa-exclamation-triangle mx-2 mt-1"></i>
                                                Mobile number entered returned a invalid response, please review.
                                            </div>
                                            <div class="h5" data-ng-if="enrolmentData.isEmailInvalid == true">
                                                <i class="fa fa-exclamation-triangle mx-2 mt-1"></i>
                                                Email entered returned a invalid response, please review.
                                            </div>--%>
<%--                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <div class="d-flex flex-row">
                                        <div class="p-2">
                                            <input type="checkbox" name="isUnderstand" id="isUnderstand" style="transform: scale(2);" data-ng-model="isUnderstand"
                                                data-ng-disabled=" ((enrolment1.vrt_title.$invalid)
                                                    ||(enrolment1.firstName.$invalid)
                                                    ||(enrolment1.lastname.$invalid)
                                                    ||(enrolment1.mobilephone.$invalid)
                                                    ||(enrolment1.emailaddress1.$invalid)
                                                    ||(enrolment1.txtConfirmEmail.$invalid))"
                                                />
                                        </div>
                                        <div class="p-2">Yes I understand</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <%--data-ng-disabled="enrolment1.$invalid" --%>
                                    <button type="button" class="btn nextBtn float-right" data-ng-click="nextClick('view1')" title="Please Click 'Yes I understand' to proceed"
                                                data-ng-disabled="!(!(!isUnderstand) && !((enrolment1.vrt_title.$invalid)
                                                    ||(enrolment1.firstName.$invalid)
                                                    ||(enrolment1.lastname.$invalid)
                                                    ||(enrolment1.mobilephone.$invalid)
                                                    ||(enrolment1.emailaddress1.$invalid)
                                                    ||(enrolment1.txtConfirmEmail.$invalid)))"
                                        >
                                        <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                        Next
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <%--View 2--%>
                    <%--View 2--%>
                    <%--View 2--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view2 ? true : false"><%-- data-ng-if="applicationView.view2 ? true : false"--%>
                        <h4 class="card-header">Course Details</h4>
                        <div class="card-body">
                            <div data-ng-repeat='cc in enrolmentData.courseNCampus track by $index'>
                                <div class="row" data-ng-if="enrolmentData.courseNCampus.length>1">
                                    <p class="h5 ml-3">Course - {{$index+1}}</p>
                                </div>
                                <div class="form-group row">
                                    <label for="vrt_course" class="col-sm-2 col-form-label">Course</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="vrt_course" id="vrt_course"
                                            data-ng-model="cc.vrt_course"
                                            data-ng-options="select.CourseName for select in enrolmentData.vrt_courseArray track by select.CourseID">
                                            <option style="display:none" value=""></option>
                                        </select>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtCampus" class="col-sm-2 col-form-label">Campus</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="campusArray" id="campusArray"
                                            data-ng-model="cc.txtCampus"
                                            ng-disabled="cc.vrt_course.CourseCode ? false : true"
                                            data-ng-options="select.campusName for select in courseCampusArray | filter:{courseID:cc.vrt_course.CourseID} track by select.courseCampusID">
<%--                                        <select class="form-control" name="campusArray" id="campusArray"
                                            ng-disabled="cc.vrt_course ? false : true"
                                            data-ng-model="cc.txtCampus"
                                            data-ng-options="select.campusName for select in enrolmentData.campusArray track by select.campusID">--%>
                                            <option style="display:none" value=""></option>
                                        </select>
                                    </div>

                                </div>
                                <hr class="border" />
                            </div>
                            <div class="row">
                                <div class="col">
                                    <button type="button" data-ng-click="cloneCourseNCampus()" class="btn float-right text-white" style="background-color:#0099cc;">
                                        <i class="fa fa-plus fa-2" aria-hidden="true"></i>
                                        Add Another Course
                                    </button>
                                </div>

                            </div>
                            <hr class="border border-dark" />
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view2')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <div class="float-right">
                                        <button type="button" class="btn saveBtn" ng-click="enrolmentSubmit(enrolmentData, 1)">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                            Save
                                        </button>
                                        <button type="button" class="btn nextBtn" data-ng-click="nextClick('view2')"
                                            ng-disabled="( (enrolmentData.courseNCampus) | filter: {txtCampus: {courseCampusID: 0} } ).length>0"                                            
                                            > <%--ng-disabled="(enrolmentData.courseNCampus | filter:{txtCampus:''}).length > 0"--%>
                                            <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <%--View 3--%>
                    <%--View 3--%>
                    <%--View 3--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view3 ? true : false"> <%--applicationView.view3 ? true : false--%>
                        <h4 class="card-header">Personal Information</h4>
                        <div class="card-body">
                                
                           <div class="form-group row">
                                <label for="birthdate" class="col-3 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.birthdate.$touched || enrolment1.birthdate.$dirty) && enrolment1.birthdate.$invalid}"
                                    >Date of Birth
                                    <span 
                                        data-ng-class="{'invalid-feedback': (enrolment1.birthdate.$touched || enrolment1.birthdate.$dirty) && enrolment1.birthdate.$invalid}">
                                        (dd/mm/yyyy)
                                    </span><%--class="text-muted"--%>
                                </label>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="Date Of Birth *" required data-ng-model="enrolmentData.birthdate"
                                        ng-pattern="dateRegex"
                                        data-ng-class="{'is-invalid': (enrolment1.birthdate.$touched || enrolment1.birthdate.$dirty) && enrolment1.birthdate.$invalid}"/>
                                        <span class="form-text" data-ng-if="(enrolment1.birthdate.$touched || enrolment1.birthdate.$dirty) && enrolment1.birthdate.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.birthdate.$touched || enrolment1.birthdate.$dirty) && enrolment1.birthdate.$invalid }">
                                            <span data-ng-if="enrolment1.birthdate.$error.required">
                                                Please enter your Date of Birth.
                                            </span>
                                            <span data-ng-if="enrolment1.birthdate.$error.pattern">
                                                Please enter your Date of Birth in (dd/mm/yyyy) format.
                                            </span>
                                        </span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="studentGender" class="col-3 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.studentGender.$touched || enrolment1.studentGender.$dirty) && enrolment1.studentGender.$invalid}"
                                    >Gender</label>
                                <div class="col-9">
                                    <select class="form-control" name="studentGender" id="studentGender" required data-ng-model="enrolmentData.studentGender"
                                        data-ng-class="{'is-invalid': (enrolment1.studentGender.$touched || enrolment1.studentGender.$dirty) && enrolment1.studentGender.$invalid}">
                                        <option style="display:none" value=""></option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="X (indeterminate/intersex/unspecified)">X (indeterminate/intersex/unspecified)</option>
                                    </select>
                                    <span class="form-text" data-ng-if="(enrolment1.studentGender.$touched || enrolment1.studentGender.$dirty) && enrolment1.studentGender.$error"
                                        data-ng-class="{'invalid-feedback': (enrolment1.studentGender.$touched || enrolment1.studentGender.$dirty) && enrolment1.studentGender.$invalid }">
                                        <span data-ng-if="enrolment1.studentGender.$error.required">
                                            Please select a Gender.
                                        </span>
                                    </span>
                                </div>
                            </div>
                           <div class="form-group row">
                                <label for="address1_postalcode" class="col-3 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.address1_postalcode.$touched || enrolment1.address1_postalcode.$dirty) && enrolment1.address1_postalcode.$invalid}">
                                    Post Code</label>
                                <div class="col-9">
                                    <input type="number" class="form-control" id="address1_postalcode" name="address1_postalcode" placeholder="Post Code" 
                                        required data-ng-model="enrolmentData.address1_postalcode"
                                        data-ng-class="{'is-invalid': (enrolment1.address1_postalcode.$touched || enrolment1.address1_postalcode.$dirty) && enrolment1.address1_postalcode.$invalid}" />
                                        <span class="form-text" data-ng-if="(enrolment1.address1_postalcode.$touched || enrolment1.address1_postalcode.$dirty) && enrolment1.address1_postalcode.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.address1_postalcode.$touched || enrolment1.address1_postalcode.$dirty) && enrolment1.address1_postalcode.$invalid }">
                                            <span data-ng-if="enrolment1.address1_postalcode.$error.required">
                                                Please enter a Post Code.
                                            </span>
                                        </span>
                                </div>
                            </div>
                           <div class="form-group row">
                                <label for="vrt_whatbroughtyoutothekanganinstitutewebsite" class="col-3 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$touched || enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$dirty) && enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$invalid}"
                                    >What brought you to this website?</label>
                                <div class="col-9">
                                        <select class="form-control" name="vrt_whatbroughtyoutothekanganinstitutewebsite" id="vrt_whatbroughtyoutothekanganinstitutewebsite" required
                                            data-ng-model="enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite"
                                            data-ng-options="select.vrt_whatbroughtyoutothekanganinstitutewebsite for select in whatBroughtYouHereSelect track by select.reasonToChooseBKIID"
                                            data-ng-class="{'is-invalid': (enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$touched || enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$dirty) && enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$invalid}">
                                            <option style="display:none" value=""></option>
                                        </select>
                                        <span class="form-text" data-ng-if="(enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$touched || enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$dirty) && enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$error"
                                            data-ng-class="{'invalid-feedback': (enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$touched || enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$dirty) && enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$invalid }">
                                            <span data-ng-if="enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$error.required">
                                            Please select any option.
                                            </span>
                                        </span>
                                </div>
                            </div>
<%--                            <div class="form-group row">
                                <label for="vrt_studiedatkanganinstitutebendigotafebefore" class="col-3 col-form-label">Have you ever studied at Kangan Institute/Bendigo TAFE before?</label>
                                <div class="col-9">
                                    <div class="form-check form-check-inline" data-ng-repeat="yn in yesNo" id="vrt_studiedatkanganinstitutebendigotafebefore-{{yn.value}}">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="vrt_studiedatkanganinstitutebendigotafebefore" 
                                            required data-ng-checked="yn.checked"
                                            value="{{yn.name}}"
                                            data-ng-model="enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore" data-ng-click="studiedBkiBeforeClicked()"/> {{yn.name}}
                                      </label>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group row">
                                <label for="vrt_studiedatkanganinstitutebendigotafebefore" class="col-3 col-form-label">Have you ever studied at Kangan Institute/Bendigo TAFE before?</label>
                                <div class="col-9">
                                    <div class="form-check form-check-inline mt-2" id="vrt_studiedatkanganinstitutebendigotafebefore">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="vrt_studiedatkanganinstitutebendigotafebefore" 
                                            required data-ng-model="enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore" 
                                            value="True" data-ng-click="studiedBkiBeforeClicked()"/> Yes
                                      </label>
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="vrt_studiedatkanganinstitutebendigotafebefore" 
                                            required data-ng-model="enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore" 
                                            value="False" data-ng-click="studiedBkiBeforeClicked()"/> No
                                      </label>
                                    </div>
                                </div>
                            </div>
                           <%--<div class="form-group row" data-ng-show="enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore == 'Yes' ? true : false">--%>
                           <div class="form-group row" data-ng-show="enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore == 'True'">
                                <label for="vrt_kibtstudentidnumber" class="col-3 col-form-label">Kangan Institute/Bendigo TAFE Student ID Number (if known):</label>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="vrt_kibtstudentidnumber" name="vrt_kibtstudentidnumber" placeholder="Kangan Institute/Bendigo TAFE Student ID Number" 
                                        data-ng-model="enrolmentData.vrt_kibtstudentidnumber"/>
                                </div>
                            </div>
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view3')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <div class="float-right">
                                        <button type="button" class="btn saveBtn" ng-click="enrolmentSubmit(enrolmentData, 1)">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                            Save
                                        </button>
                                        <button type="button" class="btn nextBtn" data-ng-click="nextClick('view3')"
                                            ng-disabled="((enrolment1.birthdate.$invalid)
                                                        ||(enrolment1.studentGender.$invalid)
                                                        ||(enrolment1.address1_postalcode.$invalid)
                                                        ||(enrolment1.vrt_studiedatkanganinstitutebendigotafebefore.$invalid)
                                                        ||(enrolment1.vrt_whatbroughtyoutothekanganinstitutewebsite.$invalid))"
                                            >
                                            <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <%--View 4--%>
                    <%--View 4--%>
                    <%--View 4--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view4 ? true : false"> <%--applicationView.view4 ? true : false--%>
                        <h4 class="card-header text-capitalize">Residency and cultural diversity</h4>
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="vrt_australiancitizenshipresidency" class="col-sm-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.vrt_australiancitizenshipresidency.$touched || enrolment1.vrt_australiancitizenshipresidency.$dirty) && enrolment1.vrt_australiancitizenshipresidency.$invalid}"
                                    >Residency</label>
                                <div class="col-sm-10">
                                    <select class="form-control"
                                        name="vrt_australiancitizenshipresidency"
                                        id="vrt_australiancitizenshipresidency"
                                        required data-ng-model="enrolmentData.vrt_australiancitizenshipresidency"
                                        data-ng-options="country.vrt_australiancitizenshipresidency for country in vrt_australiancitizenshipresidency track by country.residencyId"
                                        data-ng-class="{'is-invalid': (enrolment1.vrt_australiancitizenshipresidency.$touched || enrolment1.vrt_australiancitizenshipresidency.$dirty) && enrolment1.vrt_australiancitizenshipresidency.$invalid}">
                                        <option style="display:none" value=""></option>
                                    </select>
                                    <span class="form-text" data-ng-if="(enrolment1.vrt_australiancitizenshipresidency.$touched || enrolment1.vrt_australiancitizenshipresidency.$dirty) && enrolment1.vrt_australiancitizenshipresidency.$error"
                                        data-ng-class="{'invalid-feedback': (enrolment1.vrt_australiancitizenshipresidency.$touched || enrolment1.vrt_australiancitizenshipresidency.$dirty) && enrolment1.vrt_australiancitizenshipresidency.$invalid }">
                                        <span data-ng-if="enrolment1.vrt_australiancitizenshipresidency.$error.required">
                                            Please select Residency Status.
                                        </span>
                                    </span>
                                </div>
                            </div>                                
                            <div class="form-group row">
                                <label for="vrt_aboriginalortorresstraitislander" class="col-2 col-form-label"
                                    data-ng-class="{'invalid-feedback': (enrolment1.vrt_aboriginalortorresstraitislander.$touched || enrolment1.vrt_aboriginalortorresstraitislander.$dirty) && enrolment1.vrt_aboriginalortorresstraitislander.$invalid}"
                                    >Cultural Diversity</label>
                                <div class="col-10">
                                    <select class="form-control"
                                        name="vrt_aboriginalortorresstraitislander"
                                        id="vrt_aboriginalortorresstraitislander"
                                        required data-ng-model="enrolmentData.vrt_aboriginalortorresstraitislander"
                                        data-ng-options="aboriginal.vrt_aboriginalortorresstraitislander for aboriginal in vrt_aboriginalortorresstraitislander track by aboriginal.statusId"
                                        data-ng-class="{'is-invalid': (enrolment1.vrt_aboriginalortorresstraitislander.$touched || enrolment1.vrt_aboriginalortorresstraitislander.$dirty) && enrolment1.vrt_aboriginalortorresstraitislander.$invalid}">
                                        <option style="display:none" value=""></option>
                                    </select>
                                    <span class="form-text" data-ng-if="(enrolment1.vrt_aboriginalortorresstraitislander.$touched || enrolment1.vrt_aboriginalortorresstraitislander.$dirty) && enrolment1.vrt_aboriginalortorresstraitislander.$error"
                                        data-ng-class="{'invalid-feedback': (enrolment1.vrt_aboriginalortorresstraitislander.$touched || enrolment1.vrt_aboriginalortorresstraitislander.$dirty) && enrolment1.vrt_aboriginalortorresstraitislander.$invalid }">
                                        <span data-ng-if="enrolment1.vrt_aboriginalortorresstraitislander.$error.required">
                                            Please select Cultural Diversity Status.
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view4')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <div class="float-right">
                                        <button type="button" class="btn saveBtn" ng-click="enrolmentSubmit(enrolmentData, 1)">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                            Save
                                        </button>
                                        <button type="button" class="btn nextBtn" data-ng-click="nextClick('view4')"
                                            ng-disabled="((enrolment1.vrt_australiancitizenshipresidency.$invalid)
                                                        ||(enrolment1.vrt_aboriginalortorresstraitislander.$invalid))"
                                            > <%--ng-click="viewFourNext()" --%>
                                            <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--View 5--%>
                    <%--View 5--%>
                    <%--View 5--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view5 ? true : false"> <%--applicationView.view5 ? true : false--%>
                        <h4 class="card-header text-capitalize">Previous Qualifications</h4>
                        <div class="card-body"> 
<%--                            <div class="form-group row">
                                <label for="vrt_successfullycompletedqualifications" class="col-5 col-form-label"
                                    >Have you SUCCESSFULLY COMPLETED any qualifications</label>
                                <div class="col-7">
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="vrt_successfullycompletedqualifications" id="vrt_successfullycompletedqualifications1" 
                                            required value="1" data-ng-model="enrolmentData.vrt_successfullycompletedqualifications" data-ng-click="prevQualClick()"/> Yes                           
                                      </label>                                                                                                                                    
                                    </div>                                                                                                                                        
                                    <div class="form-check form-check-inline">                                                                                                    
                                      <label class="form-check-label">                                                                                                            
                                        <input class="form-check-input" type="radio" name="vrt_successfullycompletedqualifications" id="vrt_successfullycompletedqualifications2" 
                                            required value="0" data-ng-model="enrolmentData.vrt_successfullycompletedqualifications" data-ng-click="prevQualClick()"/> No
                                      </label>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group row">
                                <label for="vrt_successfullycompletedqualifications" class="col-5 col-form-label"
                                    >Have you SUCCESSFULLY COMPLETED any qualifications</label>
                                <div class="col-7">
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="vrt_successfullycompletedqualifications" id="vrt_successfullycompletedqualifications1" 
                                            required value="True" data-ng-model="enrolmentData.vrt_successfullycompletedqualifications.vrt_successfullycompletedqualifications" data-ng-click="prevQualClick()"/> Yes                           
                                      </label>                                                                                                                                    
                                    </div>                                                                                                                                        
                                    <div class="form-check form-check-inline">                                                                                                    
                                      <label class="form-check-label">                                                                                                            
                                        <input class="form-check-input" type="radio" name="vrt_successfullycompletedqualifications" id="vrt_successfullycompletedqualifications2" 
                                            required value="False" data-ng-model="enrolmentData.vrt_successfullycompletedqualifications.vrt_successfullycompletedqualifications" data-ng-click="prevQualClick()"/> No
                                      </label>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="form-group row" ng-if="enrolmentData.vrt_successfullycompletedqualifications == 1">--%>
                            <div class="form-group row" ng-if="enrolmentData.vrt_successfullycompletedqualifications.vrt_successfullycompletedqualifications == 'True'"">
                                <label class="col-form-legend col-5" for="txtQualification"
                                    >Select All Completed Qualifications: </label>
<%--                                    data-ng-class="{'invalid-feedback': (enrolment1.txtQualification.$touched || enrolment1.txtQualification.$dirty) && enrolment1.txtQualification.$invalid}"--%>
                                <div class="col-7">
                                    <div class="form-check" data-ng-repeat="(qualification,selected) in enrolmentData.txtQualification">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" name="txtQualification" data-ng-model="enrolmentData.txtQualification[qualification].selected"
                                                /> 
                                                {{enrolmentData.txtQualification[qualification].qualification}}
                                                <%--data-ng-class="{'is-invalid': (enrolment1.txtQualification.$touched || enrolment1.txtQualification.$dirty) && enrolment1.txtQualification.$invalid}"--%>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view5')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <div class="float-right">
                                        <button type="button" class="btn saveBtn" ng-click="enrolmentSubmit(enrolmentData, 1)">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                            Save
                                        </button>
                                        <button type="button" class="btn nextBtn" data-ng-click="nextClick('view5')"
                                            ng-disabled="( (enrolment1.vrt_successfullycompletedqualifications.$invalid)
                                                        ||( (enrolmentData.txtQualification | filter:{selected:true}).length < 1 ) )"
                                            >                                       
                                            <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>                         
                        </div>

                    </div>

                    <%--View 6--%>
                    <%--View 6--%>
                    <%--View 6--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view6 ? true : false"> <%--data-ng-if="applicationView.view6 ? true : false"--%>
                        <h4 class="card-header text-capitalize">unique student identifier (USI)</h4>
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="hasUSI" class="col-4 col-form-label">Do you have a USI</label>
                                <div class="col-8">
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <%--<input class="form-check-input" type="radio" name="hasUSI" value="1" data-ng-model="enrolmentData.hasUSI" data-ng-click="hasUsiClick()" required/> Yes--%>
                                        <input class="form-check-input" type="radio" name="hasUSI" value="True" data-ng-model="enrolmentData.hasUSI" data-ng-click="hasUsiClick()" required/> Yes
                                      </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <%--<input class="form-check-input" type="radio" name="hasUSI" value="2" data-ng-model="enrolmentData.hasUSI" data-ng-click="hasUsiClick()" required/> No--%>
                                        <input class="form-check-input" type="radio" name="hasUSI" value="False" data-ng-model="enrolmentData.hasUSI" data-ng-click="hasUsiClick()" required/> No
                                      </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" data-ng-show="enrolmentData.hasUSI == 'False'">
                                <label for="applyUSI" class="col-4 col-form-label">Do you want to register for a USI</label>
                                <div class="col-8">
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="applyUSI" value="True" data-ng-model="enrolmentData.applyUSI" data-ng-click="registerForUsi()" required/> Yes
                                      </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                      <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="applyUSI" value="False" data-ng-model="enrolmentData.applyUSI" data-ng-click="registerForUsi()" required/> No
                                      </label>
                                    </div>
                                </div>
                            </div>
                            <div data-ng-if="enrolmentData.hasUSI == 'True'">  <%--YES--%>
                               <div class="form-group row">
                                    <label for="vrt_uniquestudentidentifier" class="col-4 col-form-label">Unique Student Identifier (if known)</label>
                                    <div class="col-8">
                                        <input type="text" class="form-control" id="vrt_uniquestudentidentifier" name="vrt_uniquestudentidentifier" placeholder="USI" data-ng-model="enrolmentData.vrt_uniquestudentidentifier"/>
                                    </div>
                                </div>
                            </div>
                            <div data-ng-if="(  (enrolmentData.hasUSI=='False' && enrolmentData.applyUSI=='True') )">  <%--NO--%>
                                    <hr class="border border-dark" />
                                <div class="row">
                                    <div class="h4 my-3 ml-3 text-capitalize">Please provide Below mentioned details for USI Registration</div>
                                </div>
                               <hr class="border border-dark" />

                                <div class="form-group row">
                                    <label for="streetNumber" class="col-4 col-form-label">Street Number</label>
                                    <div class="col-8">
                                        <%--<input type="text" class="form-control" id="streetNumber" name="streetNumber" placeholder="Enter Street Number" data-ng-model="enrolmentData.streetNumber"/>--%>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="streetNumber" name="streetNumber" placeholder="Enter Street Number" data-ng-model="enrolmentData.streetNumber"
                                                ng-style="enrolmentData.isAddressValid == false ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}"/>
                                            <i class="fa fa-exclamation-triangle text-warning" 
                                                style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                        border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                                data-ng-if="enrolmentData.isAddressValid == false"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="streetName" class="col-4 col-form-label">Street Name</label>
                                    <div class="col-8">
                                        <%--<input type="text" class="form-control" id="streetName" name="streetName" placeholder="Enter Street Name" data-ng-model="enrolmentData.streetName"/>--%>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="streetName" name="streetName" placeholder="Enter Street Name" data-ng-model="enrolmentData.streetName"
                                                ng-style="enrolmentData.isAddressValid == false ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}"/>
                                            <i class="fa fa-exclamation-triangle text-warning" 
                                                style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                        border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                                data-ng-if="enrolmentData.isAddressValid == false"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="city" class="col-4 col-form-label">City</label>
                                    <div class="col-8">
                                        <%--<input type="text" class="form-control" id="city" name="city" placeholder="Enter City Of Residence" data-ng-model="enrolmentData.city" ng-blur="validateAddress()"/>--%>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" data-ng-model="enrolmentData.city"
                                                ng-style="enrolmentData.isAddressValid == false ? {'outline': 'none', 'border-right': 'none'} : {'outline': 'none'}" />   <%--ng-blur="validateAddress()"--%>
                                            <i class="fa fa-exclamation-triangle text-warning" 
                                                style="font-size: 30px; background: white; border-right: 1px solid rgba(0,0,0,.15); border-top: 1px solid rgba(0,0,0,.15); 
                                                        border-bottom: 1px solid rgba(0,0,0,.15); border-left: none; padding-top: 3px; padding-right: 3px;"
                                                data-ng-if="enrolmentData.isAddressValid == false"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="state" class="col-4 col-form-label">State</label>
                                    <div class="col-8">
                                        <select class="form-control"
                                            name="state"
                                            id="state"
                                            data-ng-model="enrolmentData.state"
                                            data-ng-options="state.state for state in states track by state.stateID">
                                            <option style="display:none" value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="vrt_CityorTownofBirth" class="col-4 col-form-label">City or Town of Birth</label>
                                    <div class="col-8">
                                        <input type="text" class="form-control" id="vrt_CityorTownofBirth" name="vrt_CityorTownofBirth" placeholder="Enter City or Town" data-ng-model="enrolmentData.vrt_CityorTownofBirth"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="vrt_CountryofBirth" class="col-4 col-form-label">Country of Birth</label>
                                    <div class="col-8">
<%--                                        <select class="form-control" name="txtCountryOfBirth" id="txtCountryOfBirth" data-ng-model="enrolmentData.txtCountryOfBirth">
                                            <option style="display:none" value="">Select Country of Birth</option>
                                            <option value="Mr">Australia</option>
                                            <option value="Ms">Ms</option>
                                            <option value="Other">Other</option>
                                        </select>--%>
                                        <select class="form-control"
                                            name="vrt_CountryofBirth"
                                            id="vrt_CountryofBirth"
                                            data-ng-model="enrolmentData.vrt_CountryofBirth"
                                            data-ng-options="country.country for country in countries track by country.countryID">
                                            <option style="display:none" value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="vrt_CountryofResidence" class="col-4 col-form-label">Country of Residence</label>
                                    <div class="col-8">
                                        <select class="form-control"
                                            name="vrt_CountryofResidence"
                                            id="vrt_CountryofResidence"
                                            data-ng-model="enrolmentData.vrt_CountryofResidence"
                                            data-ng-options="country.country for country in countries track by country.countryID">
                                            <option style="display:none" value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="idProofType" class="col-4 col-form-label">Register for USI requires one of the following</label>
                                    <div class="col-8">
                                        <select class="form-control"
                                            name="idProofType"
                                            id="idProofType"
                                            data-ng-model="enrolmentData.idProofType"
                                            data-ng-options="choice.idProofName for choice in idProofChoices | filter:{type:enrolmentData.vrt_australiancitizenshipresidency.type} track by choice.proofId">
                                            <option style="display:none" value=""></option>
                                        </select>
                                    </div>
                                </div>
                               <div class="form-group row" data-ng-if="enrolmentData.idProofType">   <%--enrolmentData.idProofType--%>
                                    <label for="idProof" class="col-4 col-form-label">Please Enter {{enrolmentData.idProofType.idProofName}} Number</label>  <%--{{idProofChoices[enrolmentData.idProofType].proof}}--%>
                                    <div class="col-8">
                                        <input type="text" class="form-control" id="idProof" name="idProof" 
                                            placeholder="Enter {{enrolmentData.idProofType.idProofName}} Number" 
                                            data-ng-model="enrolmentData.idProofText"/>
                                    </div>
                                </div>
                            </div>
                            <div data-ng-show="enrolmentData.hasUSI=='True'">   <%--( (hasUSI==1) || (hasUSI==2 && applyUSI==1) )--%>  <%--(hasUSI == 2) || (hasUSI == 1)--%>
                                <div class="form-group row">
                                    <label for="vrt_permissiontocheckfororcreateausi" class="col-4 col-form-label">Can we have your permission to verify the USI you have supplied with www.usi.gov.au</label>
                                    <div class="col-8">
                                        <div class="form-check form-check-inline">
                                          <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="vrt_permissiontocheckfororcreateausi" value="True" 
                                                required data-ng-model="enrolmentData.vrt_permissiontocheckfororcreateausi"/> Yes
                                          </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                          <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="vrt_permissiontocheckfororcreateausi" value="False" 
                                                required data-ng-model="enrolmentData.vrt_permissiontocheckfororcreateausi"/> No
                                          </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">&nbsp;</div>
                                <div data-ng-if="enrolmentData.isAddressValid == false" class="text-warning col my-2 h6 mt-1">
                                    <i class="fa fa-exclamation-triangle mr-2"></i> Value returned as invalid, please review
                                </div>
                            </div>		
                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view6')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <div class="float-right">
                                        <button type="button" class="btn saveBtn" ng-click="enrolmentSubmit(enrolmentData, 1)">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                            Save
                                        </button>
                                        <button type="button" class="btn nextBtn" data-ng-click="nextClick('view6')"
                                            >                                        
    <%--                                        ng-disabled="(
                                                ((enrolment1.hasUSI.$invalid) ||(enrolment1.vrt_permissiontocheckfororcreateausi.$invalid))
                                                ||
                                                ((enrolment1.hasUSI.$invalid) ||(enrolment1.applyUSI.$invalid))
                                            )"--%>
                                            <i class="fa fa-arrow-right fa-2" aria-hidden="true"></i>
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>
<%--                            
                            has usi -{{((enrolment1.hasUSI.$invalid) ||(enrolment1.vrt_permissiontocheckfororcreateausi.$invalid))}}
                            <br />
                            Not have and not apply -{{((enrolment1.hasUSI.$invalid) ||(enrolment1.applyUSI.$invalid))}}--%>
                        </div>
                    </div>

                </fieldset>


                    <%--View 7--%>
                    <%--View 7--%>
                    <%--View 7--%>
                    <div class="card text-black bg-light mb-5" data-ng-show="applicationView.view7 ? true : false"> <%--data-ng-if="applicationView.view7 ? true : false"--%>
                        <div class="card-header text-capitalize h4">Submit Your application</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <div class="h3 mt-5 text-center">Please verify your details before Submission</div>
                                </div>
                            </div>

<%--                            <div class="row">
<table class="table table-bordered fixedBki" id="allDetails">
  <tbody>
    <tr>
      <td>Title:</td>
      <td>{{enrolmentData.vrt_title}}</td>
      <td>Full Name:</td>
	  <td>{{enrolmentData.firstName +' '+ enrolmentData.lastname}}</td>
    </tr>
  </tbody>
</table>
                            </div>--%>

                            <div class="row p-5">
                                <table class="table-hover">
                                  <tbody>
                                    <tr class="row">
                                      <td class="col-2">Title:</td>
                                      <td class="col-3">{{enrolmentData.vrt_title}}</td>
                                      <td class="col-3">Full Name:</td>
	                                  <td class="col-4">{{enrolmentData.firstName +' '+ enrolmentData.lastname}}</td>
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Mobile:</td>
                                      <td class="col-3">{{enrolmentData.mobilephone}}</td>
                                      <td class="col-3">Email:</td>
	                                  <td class="col-4">{{enrolmentData.emailaddress1}}</td>
                                    </tr>
                                    <tr class="row" data-ng-repeat='cc in enrolmentData.courseNCampus track by $index'>
                                      <td class="col-2">Course <span data-ng-if="enrolmentData.courseNCampus.length>1">- {{$index+1}}</span> :</td>
                                      <td class="col-3">{{cc.vrt_course.CourseName}}</td>
                                      <td class="col-3">Campus:</td>
	                                  <td class="col-4">{{cc.txtCampus.campusName}}</td>
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Date Of Birth:</td>
                                      <td class="col-3">{{enrolmentData.birthdate}}</td>
                                      <td class="col-3">Gender:</td>
	                                  <td class="col-4">{{enrolmentData.studentGender}}</td>
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Post Code:</td>
                                      <td class="col-3">{{enrolmentData.address1_postalcode}}</td>
                                      <td class="col-3">What brought you to this website:</td>
	                                  <td class="col-4">{{enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite}}</td>
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Studied at Kangan Institute/Bendigo TAFE before:</td>
                                      <td class="col-3">{{enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore.vrt_studiedatkanganinstitutebendigotafebefore == 'True' ? 'Yes' : 'No'}}</td>
                                      <td class="col-3">Kangan Institute/Bendigo TAFE Student Number:</td>
	                                  <td class="col-4">{{enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore !== 'No' ? enrolmentData.vrt_kibtstudentidnumber : 'NA'}}</td>                                      
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Australian Residency:</td>
                                      <td class="col-3">{{enrolmentData.vrt_australiancitizenshipresidency.vrt_australiancitizenshipresidency}}</td>
                                      <td class="col-3">Cultural Divesity:</td>
	                                  <td class="col-4">{{enrolmentData.vrt_aboriginalortorresstraitislander.vrt_aboriginalortorresstraitislander}}</td>
                                    </tr>
                                    <tr class="row">
                                      <td class="col-2">Successfully Completed Qualifications:</td>
                                      <td class="col-3">{{enrolmentData.vrt_successfullycompletedqualifications == 1 ? 'Yes' : 'No'}}</td>
                                      <td class="col-3">Qualifications:</td>
	                                  <td class="col-4">
                                          <p data-ng-repeat="(qualification,selected) in enrolmentData.txtQualification | filter:{selected:true} as results">
                                             {{$index + 1}} -  {{enrolmentData.txtQualification[qualification].qualification}}
                                          </p>
	                                  </td>
                                    </tr>
                                    <tr class="row" data-ng-show="enrolmentData.hasUSI == 1">
                                      <td class="col-2">USI:</td>
                                      <td class="col-3">{{enrolmentData.vrt_uniquestudentidentifier}}</td>
                                      <td class="col-3">Permission to Verify USI:</td>
	                                  <td class="col-4">{{enrolmentData.vrt_permissiontocheckfororcreateausi == 1 ? 'Yes' : 'No'}}</td>
                                    </tr>
                                    <tr class="row" data-ng-show="enrolmentData.hasUSI == 2">
                                      <td class="col-2">Do you have USI:</td>
                                      <td class="col-3">{{enrolmentData.hasUSI == 1 ? 'Yes' : 'No'}}</td>
                                      <td class="col-3">Register for USI:</td>
	                                  <td class="col-4">{{enrolmentData.applyUSI == 1 ? 'Yes' : 'No'}}</td>
                                    </tr>
                                    <tr class="row" data-ng-show="enrolmentData.hasUSI == 2">
                                      <td class="col-2">City of Birth:</td>
                                      <td class="col-3">{{enrolmentData.vrt_CityorTownofBirth}}</td>
                                      <td class="col-3">Country of Birth:</td>
	                                  <td class="col-4">{{enrolmentData.vrt_CountryofBirth.country}}</td>
                                    </tr>
                                    <tr class="row" data-ng-show="enrolmentData.hasUSI == 2">
                                      <td class="col-2">Country of Residence:</td>
                                      <td class="col-3">{{enrolmentData.vrt_CountryofResidence.country}}</td>
                                      <td class="col-3">{{enrolmentData.idProofType.idProofName}} Number:</td>
	                                  <td class="col-4">{{enrolmentData.idProofText}}</td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>

<%--                            <div class="row h5">
                                <div class="col-3"><p class="pl-5">Title:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_title}}</p></div>
                                <div class="col-2"><p class="">Full Name: </p></div>
                                <div class="col-4">
                                    <p class="text-primary">{{enrolmentData.firstName +' '+ enrolmentData.lastname}}</p>
                                </div>  
                                <div class="w-100 m-2"></div>                              
                                <div class="col-3"><p class="pl-5">Mobile:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.mobilephone}}</p></div>
                                <div class="col-2"><p class="">Email: </p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.emailaddress1}}</p></div>
                            </div>
                            <div class="row my-3 h5" data-ng-repeat='cc in enrolmentData.courseNCampus track by $index'>
                                <div class="col-3"><p class="pl-5">Course <span data-ng-if="enrolmentData.courseNCampus.length>1">- {{$index+1}}</span> :</p></div>
                                <div class="col-3"><p class="text-primary">{{cc.vrt_course}}</p></div>
                                <div class="col-2"><p class="">Campus: </p></div>
                                <div class="col-4"><p class="text-primary">{{cc.txtCampus}}</p></div>
                            </div>
                            <div class="row h5">
                                <div class="col-3"><p class="pl-5">Date Of Birth:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.birthdate}}</p></div>
                                <div class="col-2"><p class="">Gender:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.studentGender}}</p></div>

                                <div class="col-3"><p class="pl-5">Post Code:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.address1_postalcode}}</p></div>
                                <div class="col-2"><p class="">What brought you to this website</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.vrt_whatbroughtyoutothekanganinstitutewebsite.vrt_whatbroughtyoutothekanganinstitutewebsite}}</p></div>

                                <div class="col-3"><p class="pl-5">Studied at Kangan Institute/Bendigo TAFE before</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore}}</p></div>
                                <div class="col-2"><p class="">Kangan Institute/Bendigo TAFE Student Number</p></div>  
                                <div class="col-4"><p class="text-primary">{{enrolmentData.vrt_studiedatkanganinstitutebendigotafebefore !== 'No' ? enrolmentData.vrt_kibtstudentidnumber : 'NA'}}</p></div>  

                                <div class="col-3"><p class="pl-5">Australian Residency:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_australiancitizenshipresidency.vrt_australiancitizenshipresidency}}</p></div>
                                <div class="col-2"><p class="">Cultural Divesity:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.vrt_aboriginalortorresstraitislander.vrt_aboriginalortorresstraitislander}}</p></div>
                                
                                <div class="col-3"><p class="pl-5">Successfully Completed Qualifications:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_successfullycompletedqualifications == 1 ? 'Yes' : 'No'}}</p></div>
                                <div class="col-2"><p class="">Qualifications:</p></div>
                                <div class="col-4">
                                    <span class="">
                                        <p data-ng-repeat="(qualification,selected) in enrolmentData.txtQualification | filter:{selected:true} as results" class="text-primary">
                                             {{$index + 1}} -  {{enrolmentData.txtQualification[qualification].qualification}}</p>
                                    </span>
                                </div>
                            </div>
                            <div class="row h5" data-ng-show="enrolmentData.hasUSI == 1">
                                <div class="col-3"><p class="pl-5">USI:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_uniquestudentidentifier}}</p></div>
                                <div class="col-2"><p class="">Permission to Verify USI:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.vrt_permissiontocheckfororcreateausi == 1 ? 'Yes' : 'No'}}</p></div>
                            </div>
                            <div class="row h5" data-ng-show="enrolmentData.hasUSI == 2">
                                <div class="col-3"><p class="pl-5">Do you have USI:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.hasUSI == 1 ? 'Yes' : 'No'}}</p></div>
                                <div class="col-2"><p class="">Register for USI:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.applyUSI == 1 ? 'Yes' : 'No'}}</p></div>
                                <div class="w-100 my-2"></div>
                                <div class="col-3"><p class="pl-5">City of Birth:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_CityorTownofBirth}}</p></div>
                                <div class="col-2"><p class="">Country of Birth:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.vrt_CountryofBirth.country}}</p></div>
                                <div class="w-100 my-2"></div>
                                <div class="col-3"><p class="pl-5">Country of Residence:</p></div>
                                <div class="col-3"><p class="text-primary">{{enrolmentData.vrt_CountryofResidence.country}}</p></div>
                                <div class="col-2"><p class="">{{enrolmentData.idProofType.proof}} Number:</p></div>
                                <div class="col-4"><p class="text-primary">{{enrolmentData.idProof}}</p></div>
                            </div>--%>

                            <div class="row">
                                <div class="col">
                                    <div class="h3 my-5 text-center">Once you've hit submit, keep an eye out for a confirmation e-mail containing your Application ID</div>
                                </div>
                            </div>

                            <%-- Back and Next Buttons--%>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn backBtn float-left" data-ng-click="backClick('view7')">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Back
                                    </button>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn nextBtn float-right">
                                        <i class="fa fa-print" aria-hidden="true"></i>
                                        Print
                                    </button>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-12 my-4">
                                    <button type="submit" class="btn btn-lg btn-block" style="background-color: #0099cc; color: white;">Submit</button>
                                    <%--<button type="submit" class="btn btn-success btn-lg btn-block" data-ng-if="enrolment1SubmitDisabled(enrolment1.$invalid, enrolment1SubmitBtn)">Submit</button>--%>
            <%--                        
                                    {{enrolment1SubmitBtn}}
                                    {{enrolment1.$invalid && enrolment1SubmitBtn === true ? 'disabled' : 'notDisabled'}}--%>
            <%--                        <button type="submit" class="btn btn-success btn-lg float-right" data-ng-disabled="enrolment1.$invalid" data-ng-hide="enrolment1SubmitBtn">Submit</button>
                                    <input type="button" class="btn btn-success btn-lg float-right" data-ng-hide="!enrolment1SubmitBtn" value="Submitting" disabled/>--%>
                                </div>
                            </div>
                        </div>
                    </div>

            </form>
        </div>
<%--        <footer class="footer" style="background-color:#241f20;">
          <div class="container mt-2">
              <img src="../Files/HeaderMono.png" class="rounded mx-auto d-block"/>
          </div>
        </footer>--%>
    </div>

</body>
</html>
