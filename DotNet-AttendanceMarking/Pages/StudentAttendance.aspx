<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="AttendanceMarking.Pages.StudentAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

 <meta name="viewport" content="width=device-width, initial-scale=1" />


    <script src="../Files/B4/js/jquery.min.js"></script>
    <script src="../Files/B4/js/angular.min.js"></script>
    <script src="../Files/B4/js/popper.min.js"></script>
    <script src="../Files/B4/js/bootstrap.min.js"></script>
    <link href="../Files/B4/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Files/B4/css/font-awesome.min.css" rel="stylesheet" />


    <script>
        angular.module('attendanceApp', []);
        //
        //angular.module('attendanceApp').directive('myEnter', function () {
        //    return function (scope, element, attrs) {
        //        element.bind("keydown keypress", function (event) {
        //            debugger;
        //            if (event.which === 13) {
        //                scope.$apply(function () {
        //                    //debugger;
        //                    scope.$eval(attrs.myEnter);
        //                });
        //
        //                event.preventDefault();
        //            }
        //        });
        //    };
        //});
        angular.module('attendanceApp')
                .controller('attendanceController', ['dataService', '$log', '$document', '$timeout', '$scope', '$filter', 'filterFilter',
                function (dataService, $log, $document, $timeout, $scope, $filter, filterFilter) {

                    $scope.course = {};
                    $scope.crnChoices = [
                        //{crn : '', termCode : ''}
                    ];
                    //$scope. = "";
                    $scope.showSubmit = false; //Submit Button
                    $scope.studentInitialValue = "";    // Student Swipe Card Initial Value
                    $scope.studentCardTemp = "";        // Student Swipe Card Temp Value
                    $scope.studentsCollection = [];      // Student Swipe Card Temp Value

                    //StaffId Enter
                    $scope.keypressHandler = function (event, teacherId) {
                        //debugger;
                        //event.preventDefault();
                        var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;                        
                        if (key == 13) {
                            var teacherId = teacherId ? teacherId.replace(/\D/g, '') : ''; //replace(/[^\w\s]/gi, '')
                            //debugger;
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
                                                      'termCode': value.termCode,
                                                      'staffName': value.staffName
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
                            //$scope.studentInitialValue += event.key;
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
                                    $scope.showSubmit = true;
                                    $document.bind("keydown", $scope.studentAttend);
                                }
                            })
                            .catch(function (data) {
                                debugger;
                                $log.error(data);
                            });
                    }
                    //Image Handler
                    $scope.OpenAnExternalFile = function (filename) {
                        //var URL = '../Handler/LoadImages.ashx?filename=' + encodeURIComponent(filename);
                        var URL = '<%=FromServerImageHandler %>'+'/?filename=' + encodeURIComponent(filename);
                        return URL;
                    }
                    
                    // Key Press for Student Attendance
                    $scope.studentAttend = function (event) {
                        //debugger;
                        var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                        if (key == 13) {
                            //debugger;
                            event.preventDefault();
                            event.stopPropagation();
                            $scope.studentInitialValue = $scope.studentInitialValue ? $scope.studentInitialValue.replace(/[^\w\s]/gi, '') : "";

                            $scope.$apply(function () {
                                $scope.studentsCollection[
                                    $scope.studentsCollection.findIndex(x=>x.login === $scope.studentInitialValue)
                                ]["checkBox"] = true;
                                //$scope.studentCardTemp = $scope.studentInitialValue;
                                $scope.studentInitialValue = "";
                            });
                            //$scope.studentCard = "";
                        } else if (key == 20 /* Caps lock */
                                 || key == 16 /* Shift */
                                 || key == 9 /* Tab */
                                 || key == 27 /* Escape Key */
                                 || key == 17 /* Control Key */
                                 || key == 91 /* Windows Command Key */
                                 || key == 19 /* Pause Break */
                                 || key == 18 /* Alt Key */
                                 || key == 93 /* Right Click Point Key */
                                 || (key >= 35 && key <= 40) /* Home, End, Arrow Keys */
                                 || key == 45 /* Insert Key */
                                 || (key >= 33 && key <= 34) /*Page Down, Page Up */
                                 || (key >= 112 && key <= 123) /* F1 - F12 */
                                 || (key >= 144 && key <= 145)  /* Num Lock, Scroll Lock */
                            ) {
                            //debugger;
                        } else {
                            //debugger;
                            $scope.studentInitialValue += event.key;
                        }

                    };

                    //Watch to check new attendance entry
                    $scope.$watch('studentCardTemp', function (newValue, oldValue) {
                        //debugger;
                        if ((newValue != oldValue) && (newValue != "")) {
                            debugger;
                            var filteredArray = filterFilter($scope.studentsCollection, { login: newValue })[0];
                            //$scope.studentsCollection
                            //if ($scope.ifExistsStudentCard($scope.studentCardsArray, newValue) != 0) {
                            //    $scope.studentCardsArray.push(
                            //        {
                            //            "studentCard": newValue,
                            //            "editable": false
                            //        }
                            //    );
                            //
                            //    $scope.cardsCount = $scope.studentCardsArray.length;
                            //    document.getElementById("lastTD").scrollIntoView();
                            //}
                        }
                    }, true);

                    //Student Attendance Image Click
                    $scope.imageClick = function (eachStudentCard) {
                        $scope.studentsCollection[
                            $scope.studentsCollection.findIndex(x=>x.login === eachStudentCard.login)
                        ]["checkBox"] = !eachStudentCard.checkBox;
                        $scope.studentInitialValue = "";
                    }

                }]);
        angular.module('attendanceApp').factory("dataService", ["$http", "$q", function ($http, $q) {

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

                    var postGetCrn = function (staffId) {
                        //debugger;
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

            return {
                postGetCrn: postGetCrn,
                postGetAllStudents: postGetAllStudents
            };
        }])
    </script>




</head>
<body data-ng-app="attendanceApp">

    <div data-ng-controller="attendanceController">
        <div class="container-fluid">
            <div class="row" style="font-size: 2rem; background-color: black;">
                <div class="col">
                    <div class="text-white text-center" style="font-size: 2rem; padding-left: 17rem;">Student Attendance System</div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 float-right d-flex align-items-center justify-content-end">
                    <a href="HasCrn.aspx" class="text-white" style="font-size: 1.2rem;">
                    <i class="fa fa-hand-o-left" aria-hidden="true"></i>
                        Back to Main Page
                    </a>
                </div>
<%--                <div class="col">
                    <div class="text-white" style="padding-left: 14em;">Student Attendance System</div>
                </div>
                <div class="col-2 float-left">
                    <a href="HasCrn.aspx" class="text-white">
                    <i class="fa fa-hand-o-left" aria-hidden="true"></i>
                        Back to Main Page
                    </a>
                </div>--%>
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
                            <div class="h5 text-primary mt-2">{{crnChoices[0].staffName}}</div>
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
            <%--<div class="row" my-enter="studentAttend($event)">--%>
                <div class="d-flex flex-row m-3" data-ng-repeat="eachStudentCard in studentsCollection track by $index">
                    <div class="d-flex flex-column">
                        <div style="position:relative; float: left; border: 0;" data-ng-click="imageClick(eachStudentCard)">
                            <img data-ng-src="{{OpenAnExternalFile(eachStudentCard.image)}}" style="border-radius: 60px;"/>
                            <img src="//webapp01d-doc/sam/11Data/Tick1Gray.png" 
                                data-ng-if="eachStudentCard.checkBox === true ? false : true"
                                style="border-radius: 60px; border: 0; position: absolute; top: 0; right: 0; height: 40px;"/>
                            <img src="//webapp01d-doc/sam/11Data/Tick1Green.png" 
                                data-ng-if="eachStudentCard.checkBox === true ? true : false"
                                style="border-radius: 60px; border: 0; position: absolute; top: 0; right: 0; height: 40px;"/>
                        </div>
                        <p class="text-center">{{eachStudentCard.studentName}}</p>
                    </div>
                </div>
            </div>
            <div class="row my-3" data-ng-show="showSubmit">
                <div class="col-10">
                    <div class="row">
                        <div class="col-1">
                            <label style="font-size: 25px;"><input type="checkbox" value="" style="transform: scale(3);" ng-model="yesUnderstand"/></label>
                        </div>
                        <div class="col">
                            <span class="h5">I <b>{{crnChoices[0].staffName}}</b> certify that I am submitting this attendance in accordance with the BKI policy</span>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <input type="button" class="btn btn-success float-right p-3 font-weight-bold" value="Submit" style="font-size: 20px;" data-ng-disabled="yesUnderstand !== true"/><%--crnChoices.length>0--%>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
