<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultipleCRN.aspx.cs" Inherits="AttendanceMarking.Pages.MultipleCRN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

 <meta name="viewport" content="width=device-width, initial-scale=1" />


    <script src="../Files/B4/js/jquery.min.js"></script>
    <script src="../Files/B4/js/angular.min.js"></script>
    <script src="../Files/B4/js/popper.min.js"></script>
    <script src="../Files/B4/js/bootstrap.min.js"></script>
    <link href="../Files/B4/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Files/B4/css/font-awesome.min.css" rel="stylesheet" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.js"></script>

    <title>Attendance</title>

    <style>
.spinnerCircle {
    width: 2em;
    height: 2em;
    position: relative;
    margin: auto 1.5em;
}

.double-bounce1, .double-bounce2 {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: darkgreen;/* #008080;*/
  opacity: 0.6;
  position: absolute;
  top: 0;
  left: 0;
  
  -webkit-animation: sk-bounce 2.0s infinite ease-in-out;
  animation: sk-bounce 2.0s infinite ease-in-out;
}

.double-bounce2 {
  -webkit-animation-delay: -1.0s;
  animation-delay: -1.0s;
}

@-webkit-keyframes sk-bounce {
  0%, 100% { -webkit-transform: scale(0.0) }
  50% { -webkit-transform: scale(1.0) }
}

@keyframes sk-bounce {
  0%, 100% { 
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 50% { 
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  }
}

/*  All Table */
        table.table-hover td{
            font-size: 1.25rem;
            font-weight: 500;
            line-height: 1.1;
            padding: 20px;
        }

    </style>

<script>
    angular.module('multicrnApp', ['ui']);

    angular.module('multicrnApp').directive('onErrorSrc', function () {
        return {
            link: function (scope, element, attrs) {
                element.bind('error', function () {
                    debugger;
                    if (attrs.src != attrs.onErrorSrc) {
                        debugger;
                        attrs.$set('src', attrs.onErrorSrc);
                    }
                });
            }
        }
    });

    angular.module('multicrnApp')
            .controller('multicrnAppController', ['dataService', '$log', '$document', '$timeout', '$scope', '$filter', 'filterFilter',
            function (dataService, $log, $document, $timeout, $scope, $filter, filterFilter) {

                $scope.studentsCollection = [];
                $scope.crnArray = [];
                $scope.teacherArray = [];

                $scope.crnInsert = function (event) {
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                    if (key == 13) {
                        $scope.addCrn();
                    }
                }

                $scope.addCrn = function () {
                    var crnInput = $scope.crnInput.replace(/[^0-9]/gi, '');

                    if (!filterFilter($scope.crnArray, crnInput)[0]) {
                        $scope.crnArray.push(
                            $scope.crnInput ? crnInput : ""
                        );
                        $scope.crnInput = "";
                    }
                }

                //Image Handler
                $scope.OpenAnExternalFile = function (filename) {
                    //var URL = '../Handler/LoadImages.ashx?filename=' + encodeURIComponent(filename);
                    var URL = '<%=FromServerImageHandler %>'+'/?filename=' + encodeURIComponent(filename);
                    return URL;
                }

                $scope.defaultImage = $scope.OpenAnExternalFile('\\\\SMSODBPWV01\\photos$\\PROD\\NoImage.jpg');

                $scope.postGetCrnMethod = function (crnArray) {
                    //debugger;
                    dataService.postGetAllstudents(crnArray)
                        .then(function (data) {
                            //debugger;
                            if (data.data.d.length > 0) {
                                $scope.studentsCollectionInMemory = data.data.d;
                                //angular.forEach(data.data.d, function (value, key) {
                                //    $scope.enrolmentData.vrt_courseArray.push(
                                //          {
                                //              'CourseCode': value.CourseCode,
                                //              'CourseID': value.CourseID,
                                //              'CourseName': value.CourseName
                                //          }
                                //    );
                                //});
                            }
                        })
                        .catch(function (data) {
                            debugger;
                            $log.error(data);
                        });
                }


                $scope.$watch('studentCardTemp', function (newValue, oldValue) {
                    //debugger;
                    if ((newValue != oldValue) && (newValue != "")) {
                        //debugger;
                        if (filterFilter($scope.studentsCollectionInMemory, { loginId: newValue })[0]) {
                            debugger;
                            $scope.studentsCollection.push({
                                'image': "\\\\SMSODBPWV01\\photos$\\PROD\\" + newValue + ".jpg",
                                // @"\\SMSODBPWV01\photos$\PROD\" + "NoImage" + ".jpg"
                                'leagacyId': filterFilter($scope.studentsCollectionInMemory, { loginId: newValue })[0].leagacyId,
                                'loginId': newValue,
                                'fullName': filterFilter($scope.studentsCollectionInMemory, { loginId: newValue })[0].fullName,
                                'crn': filterFilter($scope.studentsCollectionInMemory, { loginId: newValue })[0].crn,
                                'teacher': filterFilter($scope.studentsCollectionInMemory, { loginId: newValue })[0].teacher
                            });
                        } else {
                            debugger;
                            $scope.studentsCollection.push({
                                'image': newValue,
                                'leagacyId': "",
                                'loginId': newValue,
                                'fullName': '',
                                'crn': '',
                                'teacher': ''
                            });
                        }
                    }
                }, true);

                // Key Press for Student Attendance
                $scope.studentAttend = function (event) {
                    //debugger;
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                    if (key == 13) {
                        //debugger;
                        event.preventDefault();
                        event.stopPropagation();

                        var a = $scope.studentInitialValue.replace(/[^0-9]/gi, '');

                        $scope.studentInitialValue = $scope.studentInitialValue ? $scope.studentInitialValue.replace(/[^0-9]/gi, '') : ""; //filter numbers only

                        $scope.$apply(function () {
                            //$scope.studentsCollection[
                            //    $scope.studentsCollection.findIndex(x=>x.login === $scope.studentInitialValue)
                            //]["checkBox"] = true;
                            $scope.studentCardTemp = $scope.studentInitialValue;
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

                $scope.beginScanning = function () {
                    $scope.postGetCrnMethod($scope.crnArray);
                    $document.bind("keydown", $scope.studentAttend);
                    $scope.scanningInit = true;
                    $scope.showPlusButton = true;
                }

            }]);

    angular.module('multicrnApp').factory("dataService", ["$http", "$q", function ($http, $q) {

        var postGetAllstudents = function (crnArray) {
            //debugger;
            var deferred = $q.defer();
            var urlSite = '<%=DataAPI %>' + "/GetAllstudents";

            var parameters = {
                crnCollection: [
                    crnArray
                ]
            };

            $http({
                url: urlSite,
                method: "POST",
                //data: JSON.stringify(parameters),//"{'staffId':" + JSON.stringify(crnInput) + "}",
                data: JSON.stringify({
                    crnCollection: crnArray
                }),
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
        }

        return {
            postGetAllstudents: postGetAllstudents
        };

    }]);

</script>

</head>
<body data-ng-app="multicrnApp">
    <div data-ng-controller="multicrnAppController">
        <div class="container-fluid">
            <div class="row" ng-hide="scanningInit">
                <div class="col">
                    <div class="text-white text-center" style="font-size: 2rem; background-color: black;">Student Attendance System</div>
                </div>
            </div>
            <div class="row mt-3" ng-hide="scanningInit">
                <div class="col-3 h5">                    
                    <label for="crnInput" style="right: 0; position: absolute; padding-right: 1em; padding-top: 0.3em;" class="form-control-label">Please enter CRN</label>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" id="crnInput" placeholder="CRN" ng-model="crnInput" ng-keydown="crnInsert($event)"/>        
                </div>
                <div class="col-2">
                    <button type="button" class="btn btn-success" ng-click="addCrn()" ng-disabled="!crnInput">
                        Add CRN
                        <i class="fa fa-arrow-circle-right fa-lg" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="col-3">
                    <table class="table" ng-if="crnArray.length > 0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>CRN(s)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="crn in crnArray track by $index">
                                <th scope="row">{{$index+1}}</th>
                                <td>{{crn}}</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button type="button" class="btn btn-success" style="right: 0; position: absolute;" ng-click="beginScanning()">
                                        Start Attendance
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div ng-show="scanningInit || showPlusButton" class="row my-2">
                <div class="col">
                    <hr class="border border-dark"/>
                    <button type="button" class="btn btn-primary float-right" ng-click="scanningInit = !scanningInit" style="margin-top: -2.3em;">
                        <i class="fa fa-plus fa-3" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="row my-3" ng-if="scanningInit">
                <div class="col-12">
                    <div class="spinnerCircle pull-left">
                        <div class="double-bounce1"></div>
                        <div class="double-bounce2"></div>
                    </div>
                    <div class="text-center h5" style="font-size: 2rem;">Ready for Students Swipe Cards</div>
                </div>
            </div>
            <div class="col-12" ng-if="studentsCollection.length > 0">
                <div class="text-white text-center" style="font-size: 2rem; background-color: black;">Student(s) List</div>
            </div>

            <div class="row h4 my-3 pl-5" ng-if="studentsCollection.length>0">
                <div class="col-3">
                    &nbsp;
                </div>
                <div class="col-3">
                    Name
                </div>
                <div class="col-3">
                    CRN
                </div>
                <div class="col-3">
                    Teacher
                </div>
            </div>
            <div class="row" ng-if="studentsCollection.length>0">
                <div class="col">
                    <table class="table table-hover">
                        <tbody>
                            <tr class="row h6" data-ng-repeat="eachStudentCard in studentsCollection track by $index">
                                <td class="col-3 text-center">
                                    <img data-ng-src="{{OpenAnExternalFile(eachStudentCard.image)}}" class="rounded-circle" 
                                        on-error-src="{{defaultImage}}" />
                                       <%--style="border-radius: 60px;"--%>
                                </td>
                                <td class="col-3">
                                    {{eachStudentCard.fullName}}
                                </td>
                                <td class="col-3">
<%--                                    <select name="crn" id="crn"
                                        class="form-control" style="width:70%"
                                        ng-if="(crnArray | filter:eachStudentCard.crn).length > 1"
                                        data-ng-model="eachStudentCard.crn"
                                        data-ng-options="crn for crn in crnArray | filter:eachStudentCard.crn">
                                        <option style="display:none" value=""></option>
                                    </select>--%>
                                    <select name="crn" id="crn" class="form-control" style="width:70%"
                                        ng-model="eachStudentCard.crn" ng-if="(crnArray | filter:eachStudentCard.crn).length > 1">
                                        <option style="display:none" value=""></option>
                                        <option ng-repeat="crn in crnArray | filter:eachStudentCard.crn"
                                                value="{{crn}}">     <!--ng-selected="{{operator.value == filterCondition.operator}}"-->
                                          {{crn}}
                                        </option>
                                    </select>
                                    <span class="pl-2" ng-if="(crnArray | filter:eachStudentCard.crn).length = 1">{{eachStudentCard.crn}}</span>
                                </td>
	                            <td class="col-3">
<%--                                    <select name="teacher" id="teacher"
                                        data-ng-model="eachStudentCard.teacher"
                                        class="form-control" style="width:70%"
                                        data-ng-options="select.teacher for select in teacherArray track by select.teacher">
                                        <option style="display:none" value=""></option>
                                    </select>--%>

                                    <select name="teacher" id="teacher" class="form-control" style="width:70%"
                                        ng-model="eachStudentCard.teacher" ng-if="(studentsCollectionInMemory | unique:'teacher' | filter:eachStudentCard.teacher).length > 1">
                                        <option style="display:none" value=""></option>
                                        <option ng-repeat="operator in studentsCollectionInMemory | unique:'teacher' | filter:eachStudentCard.teacher"
                                                value="{{operator.teacher}}">     <!--ng-selected="{{operator.value == filterCondition.operator}}"-->
                                          {{operator.teacher}}
                                        </option>
                                    </select>
<%--                                    <select name="teacher" id="teacher"
                                        class="form-control" style="width:70%"
                                        ng-if="(studentsCollectionInMemory | unique:'teacher' | filter:eachStudentCard.teacher).length > 1"
                                        data-ng-model="eachStudentCard.teacher"
                                        data-ng-options="teacher for teacher in studentsCollectionInMemory | unique:'teacher' | filter:eachStudentCard.teacher">
                                        <option style="display:none" value=""></option>
                                    </select>--%>
                                    <span class="pl-2" ng-if="(studentsCollectionInMemory | unique:'teacher' | filter:eachStudentCard.teacher).length = 1">
                                        {{eachStudentCard.teacher}}
                                    </span>
	                            </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
                
    </div>




<%--        </div>
    </div>--%>
</body>
</html>
