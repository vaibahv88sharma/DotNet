<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSubmission.aspx.cs" Inherits="AttendanceMarking.Pages.AttendanceSubmission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

 <meta name="viewport" content="width=device-width, initial-scale=1" />


    <%--<script src="../BKI/jquery.min.js"></script>--%>
    <script src="../BKI/jquery-1.12.4.min.js"></script>
    <script src="../BKI/jquery-ui.min.js"></script>
    
    <script src="../BKI/angular.min.js"></script>
    <script src="../BKI/bootstrap.min.js"></script>

    <%--<script src="../BKI/angular-resource.min.js"></script>--%>

    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />--%>
    <link rel="stylesheet" href="../BKI/jquery-ui.css" />
    <link rel="stylesheet" href="../BKI/bootstrap.min.css" />

<script>
    angular.module('attendanceApp', []);

    angular.module('attendanceApp')
            .controller('attendanceController', ['details', '$log', '$document', '$timeout', '$scope', 'filterFilter', '$filter',
            function (details, $log, $document, $timeout, $scope, filterFilter, $filter) {

                $scope.studentsCollection = "";
                $scope.disableSave = false;
                // Get All Students on Page Load
                details.postGetAllStudents('<%=FromServerHeatId %>')
                      .then(function (data) {
                          $log.info(data);
                
                          if (data.data.d.length) {
                              $scope.studentsCollection = data.data.d;
                          }
                
                      })
                      .catch(function (data) {
                          debugger;
                          $log.error(data);
                      });

                $scope.OpenAnExternalFile = function (filename) {
                    //
                    //  Open an external file (i.e. a file which ISN'T in our IIS folder)
                    //  To do this, we get an ASP.Net Handler to manually load the file, 
                    //  then return it's contents in a Response.
                    //
                    //debugger;
                    var URL = '../Handler/LoadImages.ashx?filename=' + encodeURIComponent(filename);
                    return URL;
                    //window.open(URL);
                }

                $scope.closeTicket = function () {
                    //debugger;
                    $scope.disableSave = true;

                    details.postCloseHeatTicket()
                                  .then(function (data) {
                                      if (data.data.d === 'Ticket Closed') {

                                        // details.createCsv(
                                        //     '<%=FromServerTeacherId %>', '<%=FromServerCrn %>', '<%=FromServerTermCode %>',
                                        //      $scope.dataToSend('<%=FromServerTeacherId %>', '<%=FromServerCrn %>', '<%=FromServerTermCode %>', $scope.studentsCollection, "NoneId"),
                                        //      "NoneId")
                                        //    .then(function (data) {
                                        //        debugger;
                                        //        window.location.href =  '<%=FromServerThankYou %>';
                                        //    })
                                        //    .catch(function (data) {
                                        //        debugger;
                                        //        $log.error(data);
                                        //        window.location.href = '<%=FromServerThankYou %>';
                                        //    });


                                          saveToCsv(
                                             '<%=FromServerTeacherId %>', '<%=FromServerCrn %>', '<%=FromServerTermCode %>',
                                              $scope.dataToSend('<%=FromServerTeacherId %>', '<%=FromServerCrn %>', '<%=FromServerTermCode %>', $scope.studentsCollection, "NoneId", "NoneEmail"),
                                              "NoneId")
                                              .then(
                                                  function (data) {
                                                      //debugger;
                                                      console.log('Saved CSV:- ' + data);
                                                      window.location.href =  '<%=FromServerThankYou %>';
                                                  },
                                                  function (sender, args) {
                                                      debugger;
                                                      console.log('An error occured while retrieving list items:' + args.get_message());
                                                      window.location.href =  '<%=FromServerThankYou %>';
                                                  }
                                              );




                                      }
                                  })
                                  .catch(function (data) {
                                      debugger;
                                      $log.error(data);
                                  });

                }


                $scope.dataToSend = function (card, crn, termCode, studentCardsArray, heatId, emailId) {

                    //debugger;
                    console.log(studentCardsArray);
                    //var heatId = heatIdGenerated == "NoneId" ? "NoneId" : heatIdGenerated;
                    //var heatId = heatIdGenerated == "NoneId" ? "NoneId" : heatIdGenerated;

                    var filteredArray = filterFilter(studentCardsArray, { checkBox: 'true' });


                    //filterFilter


                    var exportDataJsp = [];
                    exportDataJsp.push(["StudentCard",
                                            "StaffCard",
                                            "CRN",
                                            "TermCode",
                                            "Date",
                                            "Day",
                                            "heatId",//"heatIdGenerated"
                                            , "emailId"
                    ]);

                    angular.forEach(filteredArray, function (value, key) {
                        //debugger;
                        var d1 = new Date();
                        var n1 = d1.getMonth() + 1;
                        //debugger;//   
                        exportDataJsp.push([
                              value.login,
                              card,
                              crn,
                              termCode,
                              '<%=FromServerClassDate %>', //new Date().getDate() + "/" + n1 + "/" + new Date().getFullYear(),
                              new Date().getDay(),
                              heatId,
                              emailId
                        ]);
                    });

                    return exportDataJsp;
                }



            }]);

    angular.module('attendanceApp').factory("details", ["$http", "$q", '$log', function ($http, $q, $log) {

            var postCloseHeatTicket = function () {
                //debugger;

                var deferred = $q.defer();
                var urlSite = '<%=FromServerAttendanceSubmission %>'+"/CloseTicket";
                $http({
                        url: urlSite,
                        method: "POST",

                        //data: "{studentsData:" + JSON.stringify(studentsData)
                        data: "{'heatId':" + JSON.stringify('<%=FromServerHeatId %>')
                                    + ",'teacherId':" + JSON.stringify('<%=FromServerTeacherId %>')
                                    + ",'crn':" + JSON.stringify('<%=FromServerCrn %>')
                                    + ",'termCode':" + JSON.stringify('<%=FromServerTermCode %>')
                                    + ",'classDate':" + JSON.stringify('<%=FromServerClassDate %>')
                               + "}",
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
                        deferred.reject(response);
                    });
                return deferred.promise;
            };


        var postGetAllStudents = function (ticketRefNumber) {
            //debugger;

                var deferred = $q.defer();
                var urlSite = '<%=FromServerAttendanceSubmission %>' + "/GetAllStudents";
                $http({
                        url: urlSite,
                        method: "POST",
                        data: "{query:" + JSON.stringify(ticketRefNumber) + "}",
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
                        deferred.reject(response);
                    });
                return deferred.promise;
            };


                   var createCsv = function (card, crn, termCode, exportDataJsp, heatId) {
                       debugger;
                       var deferred = $.Deferred();

                        $.ajax({
                                url: '<%=FromServerThankYou %>',
                                type: "POST",
                                cache: false,
                                data: {
                                    "teacherCard": card,
                                    "crnNumber": crn,
                                    "termCode": termCode,
                                    "test[]": exportDataJsp,
                                    "heatId": heatId
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

        return {
            //postStudentAttendence: postStudentAttendence,
            postCloseHeatTicket: postCloseHeatTicket,
            postGetAllStudents: postGetAllStudents,
            createCsv: createCsv
        };
    }]);


        function saveToCsv(card, crn, termCode, exportDataJsp, heatId) {
            //debugger;
            var deferred = $.Deferred();

                            $.ajax({
                                url: '<%=FromServerThankYou %>',
                                type: "POST",
                                cache: false,
                                data: {
                                    "teacherCard": card,
                                    "crnNumber": crn,
                                    "termCode": termCode,
                                    "test[]": exportDataJsp,
                                    "heatId": heatId
                                },
                                success: function (data, textStatus, jqXHR) {
                                    //debugger;
                                    deferred.resolve(data);
                                    //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"

                                },
                                error: function (sender, args) {
                                    debugger;
                                    deferred.reject(sender, args);
                                    //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                                },

                                complete: function (jqXHR, textStatus) {
                                    //debugger;
                                }
                            });

            return deferred.promise();
        }


</script>


</head>
<body data-ng-app="attendanceApp">

        <div class="container-fluid" data-ng-controller="attendanceController" id="attendanceController">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron" style="background-color: #289ad7;">
                        <h1 style="margin-left: 0.1em;  text-align: center;  color: white; ">Student Attendance System (Update)</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="jumbotron" style="height: 6em; font-size: 2em;"> 
                         <div class="col-md-12 col-lg-12">                       
                            <div class="col-md-6 col-lg-6">
                                <div class="col-md-6 col-lg-6">
                                   Staff ID :
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <asp:Label ID="teacherCardLbl" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div class="col-md-6 col-lg-6">
                                   CRN :
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <asp:Label ID="crnLbl" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12" style="margin-top:0.5em;">
                            <div class="col-md-6 col-lg-6">
                                <div class="col-md-6 col-lg-6">
                                   Term Code :
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <asp:Label ID="termcodeLbl" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div class="col-md-6 col-lg-6">
                                   Date of Class :
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <asp:Label ID="dateLbl" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12" style="font-size: 1.5em; text-align: center; background-color: #289ad7; color: white; padding: 0.4em 0;">
                                Student(s) Who Did Not Swipe ID
                    </div>
                </div>
                <div ng-if="studentsCollection.length == 0" style="color: green; margin-top:2em;">
                    <p class="h3 text-capitalize"><em>There was not student found with missing attendance. Please Click the Submit Button the close the Heat Ticket.</em></p>
                </div>
                <div class="row" ng-if="studentsCollection.length > 0">
                    <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top: 1.5em; font-size: 2em;">
                        <%--<div class="col-md-1 col-lg-1">
                            &nbsp;
                        </div>--%>
                        <div class="col-md-1 col-lg-1">
                            &nbsp;
                        </div>
                        <div class="col-md-4 col-lg-4">
                            Student Name
                        </div>
                        <div class="col-md-2 col-lg-2">
                            Student ID
                        </div>
<%--                        <div class="col-md-2 col-lg-2">
                            Mobile No
                        </div>--%>
                        <div class="col-md-1 col-lg-1">
                            &nbsp;
                        </div>
                        <div class="col-md-4 col-lg-4">
                            &nbsp;
                        </div>
                    </div>
                </div>

                <hr style="border-width: 3px;">

                <div class="row" ng-if="studentsCollection.length > 0">
                    <div class="col-sm-12 col-md-12 col-lg-12" data-ng-repeat="eachStudentCard in studentsCollection track by $index" 
                                style="margin-top: 1.5em; font-size: 2em;">
                        <div class="col-md-1 col-lg-1">
                            <input type="checkbox" style="transform: scale(3); " data-ng-model="eachStudentCard.checkBox" />
                        </div>
                        <%--<div class="col-md-1 col-lg-1">
                            {{$index + 1}}
                        </div>--%>
                        <div class="col-md-4 col-lg-4">
                            {{eachStudentCard.studentName}}
                        </div>
                        <div class="col-md-2 col-lg-2">
                            {{eachStudentCard.login}}
                        </div>
<%--                        <div class="col-md-2 col-lg-2">
                            {{eachStudentCard.mobilePersonal}}
                        </div>--%>
                        <div class="col-md-1 col-lg-1">
                            &nbsp;
                        </div>
                        <div class="col-md-4 col-lg-4">
                            <img ng-src="{{OpenAnExternalFile(eachStudentCard.image)}}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12" style="margin:2em">
                        <input type="button" 
                            value="Submit"  
                            style="font-size: 1.5em; border-radius: 0.3em; width: 5em;"
                            class="btn btn-primary pull-right"
                            ng-disable="disableSave"
                            ng-click="closeTicket()" />
                    </div>
                </div>

            </div>
        </div>

</body>
</html>
