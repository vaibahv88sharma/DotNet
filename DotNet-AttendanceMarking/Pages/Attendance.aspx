<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="AttendanceMarking.Pages.Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance</title>


 <meta name="viewport" content="width=device-width, initial-scale=1" />


    <script src="../Files/B4/js/jquery.min.js"></script>
    <script src="../Files/B4/js/angular.min.js"></script>
    <script src="../Files/B4/js/popper.min.js"></script>
    <script src="../Files/B4/js/bootstrap.min.js"></script>
    <link href="../Files/B4/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Files/B4/css/font-awesome.min.css" rel="stylesheet" />

    <script>
        angular.module('attendanceApp', []);
        angular.module('attendanceApp')
                .controller('attendanceController', ['dataService', '$log', '$document', '$timeout', '$scope', '$filter',
                function (dataService, $log, $document, $timeout, $scope, $filter) {

                    $scope.course = {};
                    $scope.crnChoices = [
                        //{crn : '', termCode : ''}
                    ];
                    $scope.studentsCollection = "";

                    //$scope.teacherIdClick = function () {
                    //    debugger;
                    //    event.preventDefault();
                    //    $scope.keypressHandler(event,teacherId);                       
                    //};

                    //StaffId Enter
                    $scope.keypressHandler = function (event, teacherId) {
                        //debugger;
                        //event.preventDefault();
                        var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;                        
                        if (key == 13) {
                            var teacherId = teacherId ? teacherId.replace(/\D/g, '') : ''; //replace(/[^\w\s]/gi, '')
                            dataService.postGetCrn(teacherId) //$scope.course.teacherId
                                .then(function (data) {
                                    //debugger;
                                    if (data.data.d.length > 0) {
                                        $scope.crnChoices = [];
                                        angular.forEach(data.data.d, function (value, key) {
                                            //debugger;
                                            $scope.crnChoices.push(
                                                  {
                                                      'crn': value.crn,
                                                      'termCode': value.termCode
                                                  }
                                            );
                                        });
                                        //$scope.course.crn = $scope.crnChoices[0].crn;
                                    }
                                })
                                .catch(function (data) {
                                    debugger;
                                    $log.error(data);
                                });
                        } else {
                            //$scope.course.teacherId += event.key;
                            //$scope.course.teacherId = $scope.course.teacherId.replace(/\D/g, '')
                        }
                    }

                    //Show All Students on Button Click
                    $scope.showStudents = function () {
                        //debugger;
                        dataService.postGetAllStudents($scope.course.crn.crn)
                            .then(function (data) {
                                //debugger;
                                if (data.data.d.length > 0) {
                                    $scope.studentsCollection = data.data.d;
                                }
                            })
                            .catch(function (data) {
                                debugger;
                                $log.error(data);
                            });
                    }
                    //Image Handler
                    $scope.OpenAnExternalFile = function (filename) {
                        var URL = '../Handler/LoadImages.ashx?filename=' + encodeURIComponent(filename);
                        return URL;
                    }

                }]);
        angular.module('attendanceApp').factory("dataService", ["$http", "$q", function ($http, $q) {

                    var postGetCrn = function (staffId) {
                        debugger;
                        var deferred = $q.defer();
                        var urlSite = '<%=FromServerCurrentPage %>' + "/GetAllCrn";
                        //var urlSite = "Attendance.aspx/GetAllCrn";
                        $http({
                                url: urlSite,
                                method: "POST",
                                data: "{'staffId':" + JSON.stringify(staffId) + "}",
                                headers: {
                                    "accept": "application/json; charset=utf-8",
                                    "content-Type": "application/json; charset=utf-8"
                                }
                            })
                            .then(function (response) {
                                //debugger;
                                deferred.resolve(response);
                            })
                            .catch(function (jqXHR, textStatus, errorThrown) {
                                debugger;
                                deferred.reject(jqXHR);
                            });
                        return deferred.promise;
                    };

                    var postGetAllStudents = function (crn) {
                        //debugger;
                        var deferred = $q.defer();
                        //var urlSite = "Attendance.aspx/GetAllStudents";
                        var urlSite = '<%=FromServerCurrentPage %>' + "/GetAllStudents";
                        $http({
                                url: urlSite,
                                method: "POST",
                                data: "{'query':" + JSON.stringify(crn) + "}",
                                headers: {
                                    "accept": "application/json; charset=utf-8",
                                    "content-Type": "application/json; charset=utf-8"
                                }
                            })
                            .then(function (response) {
                                //debugger;
                                deferred.resolve(response);
                            })
                            .catch(function (jqXHR, textStatus, errorThrown) {
                                debugger;
                                deferred.reject(jqXHR);
                            });
                        return deferred.promise;
                    };

                   var createCsv = function (card, crn, termCode, exportDataJsp, heatId) {

                       var deferred = $.Deferred();

                        $.ajax({
                                url: '',
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
                                },

                                error: function (jqXHR, textStatus, errorThrown) {
                                    debugger;
                                    deferred.resolve(jqXHR);
                                },

                                complete: function (jqXHR, textStatus) {
                                   
                                }
                            });


                       return deferred.promise();
                  };
            return {
                createCsv: createCsv,
                postGetCrn: postGetCrn,
                postGetAllStudents: postGetAllStudents
            };
        }])
    </script>



</head>
<body data-ng-app="attendanceApp">

    <div data-ng-controller="attendanceController">
<%--        <div class="jumbotron jumbotron-fluid" style="background-color: #289ad7;">
            <div class="row">
                <div class="col">
                    <div class="text-white text-center" style="font-size: 5rem;">Student Attendance System</div>
                </div>
            </div>
        </div>--%>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="text-white text-center" style="font-size: 2rem; background-color: black;">Student Attendance System</div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row my-4">
                <div class="col-5">
                    <div class="form-group row">
                        <label for="teacherId" class="col-5 col-form-label">Swipe or Enter Staff ID</label>
                        <div class="col-6">
                            <input type="text" class="form-control" id="teacherId" name="teacherId" placeholder="Teacher ID" 
                                data-ng-model="course.teacherId" 
                                autofocus                                
                                data-ng-keydown= "keypressHandler($event, course.teacherId)" /> <%--data-ng-click="teacherIdClick()"--%>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-group row">
                        <label for="crn" class="col-4 col-form-label">Select CRN</label>
                        <div class="col-8">
                            <select class="form-control"
                                name="crn"
                                id="crn"
                                data-ng-model="course.crn"
                                data-ng-options="choice.crn for choice in crnChoices" data-ng-disabled="crnChoices.length==0">
                                <option value="" style="display: none"></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="form-group row">
                        <input type="button" class="btn btn-success mx-auto" value="Show Students" data-ng-disabled="crnChoices.length==0" data-ng-click="showStudents()"/>
                        <%--<label for="termCode" class="col-4 col-form-label">Select Term</label>
                        <div class="col-8">
                            <select class="form-control"
                                name="termCode"
                                id="termCode"
                                data-ng-model="course.termCode"
                                data-ng-options="idx as choice.termCode for (idx, choice) in crnChoices" data-ng-disabled="crnChoices.length==0">
                                <option style="display:none" value="">Term Code</option>
                            </select>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="text-white text-center" style="font-size: 2rem; background-color: black;">Student(s) List</div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="d-flex flex-row m-3" data-ng-repeat="eachStudentCard in studentsCollection track by $index">
                    <div class="d-flex flex-column">
                        <div style="position:relative; float: left; border: 0;">
                            <img data-ng-src="{{OpenAnExternalFile(eachStudentCard.image)}}" style="border-radius: 60px;"/>
                            <img src="//webapp01d-doc/sam/11Data/Tick1Gray.png" 
                                data-ng-if="true"
                                style="border-radius: 60px; border: 0; position: absolute; top: 0; right: 0; height: 40px;"/>
                            <img src="//webapp01d-doc/sam/11Data/Tick1Green.png" 
                                data-ng-if="false"
                                style="border-radius: 60px; border: 0; position: absolute; top: 0; right: 0; height: 40px;"/>
                        </div>
                        <p class="text-center">{{eachStudentCard.studentName}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
