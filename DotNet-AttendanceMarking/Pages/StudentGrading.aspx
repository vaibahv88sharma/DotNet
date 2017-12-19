<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentGrading.aspx.cs" Inherits="AttendanceMarking.Pages.StudentGrading" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Grading</title>

 <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--<link rel="stylesheet" href="../BKI/bootstrap.min.css" />
    <script language="javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.js"></script>
    <script language="javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.js"></script>
    <script language="javascript" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.14.3.js"></script>--%>


    <script src="../BKI/jquery-1.12.4.min.js"></script>
    <script src="../BKI/jquery-ui.min.js"></script>
    <%--<script src="../BKI/angular.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.32/angular.min.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.7.0.js"></script>
    <script src="../BKI/bootstrap.min.js"></script>


    <link rel="stylesheet" href="../BKI/jquery-ui.css" />
    <link rel="stylesheet" href="../BKI/bootstrap.min.css" />
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet"/>


<script>
    angular.module('gradingApp', ['ui.bootstrap']);

    angular.module('gradingApp')
            .controller('gradingController', ['details', '$log', '$document', '$timeout', '$scope', 'filterFilter', '$filter',
            function (details, $log, $document, $timeout, $scope, filterFilter, $filter) {

                
                details.postGetAllStudents(12682, 201710)
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

                $scope.submitResult = function () {
                    //debugger;
                    details.createResultingCsv($scope.studentsCollection)
                          .then(function (data) {
                              debugger;
                              $log.info(data);
                              if (data.data.d.length) {
                                  $scope.studentsCollection = data.data.d;
                              }
                          })
                          .catch(function (data) {
                              debugger;
                              $log.error(data);
                          });
                }


                $scope.OpenAnExternalFile = function (filename) {
                    var URL = '../Handler/LoadImages.ashx?filename=' + encodeURIComponent(filename);
                    return URL;
                }

                $scope.disabledDates = function (date, mode, index, eachStudentCard) {
                    var today = new Date();

                    var dateDisabled = false;
                    if (date.getDay() === 0 || date.getDay() === 6) {
                        dateDisabled = true;
                    } else
                    {

                        var today = date;//new Date();
                        var dd = today.getDate();
                        var mm = today.getMonth()+1; //January is 0!

                        var yyyy = today.getFullYear();
                        if(dd<10){
                            dd='0'+dd;
                        } 
                        if(mm<10){
                            mm='0'+mm;
                        } 
                        var today = yyyy+'-'+mm+'-'+dd;


                        var filteredDate = filterFilter(
                                                eachStudentCard.disabledDates,
                                                today
                                                //date.toLocaleString('en-us', { year: 'numeric', month: '2-digit', day: '2-digit' }).replace(/(\d+)\/(\d+)\/(\d+)/, '$3-$1-$2').slice(0, 10)
                                            );
                        if (filteredDate.length) {
                            dateDisabled = true;
                        }
                    }

                    return (mode === 'day' && (dateDisabled));
                };

                $scope.openCalendar = function (event, eachStudentCard) {
                    //debugger;
                    eachStudentCard.openCalendar = true;
                    //$timeout(function () {
                    //    $scope.opened1 = true;
                    //});
                };


                //Date Picker : Begin

                                                //$scope.opened = false;
                                                
                $scope.minDate = new Date("08/07/2008");

                                                $scope.today = function () {
                                                    //debugger;
                                                    $scope.dt = new Date("08/07/2008");  // Month / Date / Year    Starting Month 01
                                                    //$scope.minDate = new Date("08/07/2017");
                                                };
                                                $scope.today();

                                                $scope.showWeeks = true;
                                                $scope.toggleWeeks = function () {
                                                    $scope.showWeeks = !$scope.showWeeks;
                                                };

                                                $scope.clear = function () {
                                                    $scope.dt = null;
                                                };

                                                // Disable weekend selection
                                                $scope.disabled = function (date, mode, index, eachStudentCard) {
                                                    debugger;
                                                    //console.log(date);
                                                    //var i = $scope.isDateEnabled(date);
                                                    var dateDisabled = false;
                                                    var months = ["07", "08"];
                                                    var dates = [28, 29];
                                                    var dd = date.getDate();
                                                    var mm = date.getMonth();
                                                    if (dd < 10) {
                                                        dd = '0' + dd;
                                                    }
                                                    if (mm < 10) {
                                                        mm = '0' + mm;
                                                    }
                                                    //debugger;
                                                    var filteredDate = filterFilter(dates, dd);
                                                    var filteredMonth = filterFilter(months, mm);
                                                    if (filteredDate.length && filteredMonth.length) {
                                                        //dateDisabled = true;
                                                        dateDisabled = true;
                                                    }
                                                    return (mode === 'day' && (dateDisabled));
                                                    //return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
                                                };

                                                $scope.isDateDisabled = function (date) {
                                                    //debugger;
                                                    var dateDisabled = 1;
                                                    var months = [07, 08];
                                                    var dates = [28, 29];
                                                    var dd = date.getDate();
                                                    var mm = date.getMonth();
                                                    if (dd < 10) {
                                                        dd = '0' + dd;
                                                    }
                                                    if (mm < 10) {
                                                        mm = '0' + mm;
                                                    }

                                                    var filteredDate = filterFilter(dates, dd);
                                                    var filteredMonth = filterFilter(months, mm);
                                                    if (filteredDate.length && filteredMonth.length) {
                                                        //dateDisabled = true;
                                                        dateDisabled = 0;
                                                    }
                                                    return dateDisabled;
                                                };

                                                $scope.toggleMin = function () {
                                                    $scope.minDate = ($scope.minDate) ? $scope.minDate : new Date();
                                                    //$scope.minDate = ($scope.minDate) ? null : new Date();
                                                };
                                                $scope.toggleMin();

                                                $scope.open = function (event) {
                                                    debugger;
                                                    $timeout(function () {
                                                        $scope.opened = true;
                                                    });
                                                };

                                                $scope.dateOptions = {
                                                    'year-format': "'yyyy'",
                                                    'starting-day': 0
                                                };

                //Date Picker : End

                

            }]);

    angular.module('gradingApp').factory("details", ["$http", "$q", '$log', function ($http, $q, $log) {

        var postGetAllStudents = function (crn, termCode) {
            //debugger;

                var deferred = $q.defer();
                var urlSite = '<%=FromServerStudentGrading %>' + "/GetResulting";
                $http({
                        url: urlSite,
                        method: "POST",
                        //data: "{query:" + JSON.stringify(ticketRefNumber) + "}",
                        data: "{crn:" + JSON.stringify(crn)
                        + ",'termCode':" + JSON.stringify(termCode) + "}",
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

        var postResult = function (studentsCollection) {
            debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerStudentGrading %>' + "/PostResulting";
                $http({
                        url: urlSite,
                        method: "POST",
                        data: "{'resultingPostData':" + JSON.stringify(studentsCollection) + "}",
                        //data: "{crn:" + JSON.stringify(crn)
                        //+ ",'termCode':" + JSON.stringify(termCode) + "}",
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
                        deferred.reject(response);
                    });
                return deferred.promise;
            };

            var createResultingCsv = function (studentsCollection) {
                //debugger;
                var deferred = $q.defer();
                var urlSite = '<%=FromServerStudentGrading %>' + "/PostCreateResultingCsv";
                $http({
                        url: urlSite,
                        method: "POST",
                        data: "{'resultingPostData':" + JSON.stringify(studentsCollection) + "}",
                        //data: "{crn:" + JSON.stringify(crn)
                        //+ ",'termCode':" + JSON.stringify(termCode) + "}",
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
                        deferred.reject(response);
                    });
                return deferred.promise;

            };

        return {
            postGetAllStudents: postGetAllStudents,
            postResult: postResult,
            createResultingCsv: createResultingCsv
        };
    }]);



</script>


</head>
<body data-ng-app="gradingApp">

    <div class="container-fluid" data-ng-controller="gradingController">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron" style="background-color: #289ad7;">
                <h1 style="margin-left: 0.1em;  text-align: center;  color: white; ">Student Resulting</h1>
            </div>
        </div>
        <div class="row">
            <div class="jumbotron" style="height: 6em; font-size: 2em;">  <%--<div class="jumbotron" style="height: 6em; font-size: 2em;"> --%>
                 <div class="col-md-12 col-lg-12">                       
                    <div class="col-md-6 col-lg-6">
                        <div class="col-md-6 col-lg-6">
                           Staff ID :
                        </div>
                        <div class="col-md-6 col-lg-6">
                            22178
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="col-md-6 col-lg-6">
                           CRN :
                        </div>
                        <div class="col-md-6 col-lg-6">
                            22332
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-12" style="margin-top:1.2em;">
                    <div class="col-md-6 col-lg-6">
                        <div class="col-md-6 col-lg-6">
                           Term Code :
                        </div>
                        <div class="col-md-6 col-lg-6">
                           23444
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="col-md-6 col-lg-6">
                           Date of Class :
                        </div>
                        <div class="col-md-6 col-lg-6">
                            15/09/2017
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <hr style="border-width: 3px;"/>
                <p class="h3">STUDENT DETAILS</p>
                <hr style="border-width: 3px;"/>
                <div class="col-md-12 col-lg-12" style="margin-top: 1.5em; font-size: 2em;">
                    <div class="col-md-2 col-lg-2">
                        <%--&nbsp; Picture--%>
                    </div>
<%--                    <div class="col-md-2 col-lg-2">
                        Login
                    </div>--%>
                    <div class="col-md-3 col-lg-3">
                        Name
                    </div>
                    <div class="col-md-2 col-lg-2">
                        Course Period
                    </div>
                    <div class="col-md-2 col-lg-2">
                        Attendance %
                    </div>
                    <div class="col-md-3 col-lg-3">
                        Result
                    </div>
                </div>
                <div class="col-md-12 col-lg-12" style="margin-top: 1.5em; font-size: 2em;" data-ng-repeat="eachStudentCard in studentsCollection track by $index">
                    <div class="col-md-2 col-lg-2">
                        <img ng-src="{{OpenAnExternalFile(eachStudentCard.image)}}">
                    </div>
<%--                    <div class="col-md-2 col-lg-2">
                        {{eachStudentCard.login}}
                    </div>--%>
                    <div class="col-md-3 col-lg-3">
                        {{eachStudentCard.studentName}}
                    </div>
                    <div class="col-md-2 col-lg-2">
                        <%--<div class="form-horizontal">--%>
<%--                            <input type="text" datepicker-popup="dd-MMMM-yyyy" data-ng-model="dt" is-open="opened" 
                                min="minDate" max="'2017-09-22'" datepicker-options="dateOptions" 
                                date-disabled="disabled(date, mode)" name='theDate' 
                                style="height: 2em; background-color: skyblue; color: white; font-size: 0.7em;" />
                            <button class="btn" data-ng-click="open()"><i class="icon-calendar"></i></button>--%>
                            <input type="text" datepicker-popup="dd-MMMM-yyyy" data-ng-model="eachStudentCard.minDate" is-open="eachStudentCard.openCalendar" 
                                min="eachStudentCard.minDate" max="eachStudentCard.maxDate" datepicker-options="dateOptions" 
                                date-disabled="disabledDates(date, mode, $index, eachStudentCard)" name='theDate' 
                                style="height: 2em; background-color: skyblue; color: white; font-size: 0.7em;" />
                            <%--<button class="btn btn-default" data-ng-click="openCalendar($event, eachStudentCard)"><i class="glyphicon glyphicon-th-list"></i></button>--%>
                        <%--</div>--%> 
                    </div>
                    <div class="col-md-2 col-lg-2" style="padding-left: 2em;">
                        {{eachStudentCard.attendancePercent}}
                    </div>
                    <div class="col-md-3 col-lg-3">
                        <select name="selectCourse" id="selectCourse" data-ng-model="eachStudentCard.result"> <%--data-ng-model="enrolmentData.txtCourse"--%>
                            <%--<option value="" selected disabled hidden>Choose here</option>--%>
                            <option value="1" selected>Option one</option>
                            <option value="2">Option two</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <hr style="border-width: 3px;"/>
        <div class="row">
            <div class="col-md-11 col-lg-11">
                <input type="button" class="btn btn-success pull-right" value="Submit" style="margin: 1em 0 3em 0; padding: 0.5em 1em; font-size: large;" data-ng-click="submitResult()"/>
            </div>
        </div>
    </div>

</body>
</html>
