<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSubmit.aspx.cs" Inherits="AttendanceMarking.Pages.AttendanceSubmit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <%--<script src="../BKI/jquery.min.js"></script>--%>
    <script src="../BKI/jquery-1.12.4.min.js"></script>
    <script src="../BKI/jquery-ui.min.js"></script>
    
    <script src="../BKI/angular.min.js"></script>
    <script src="../BKI/bootstrap.min.js"></script>

    <%--<script src="../BKI/angular-resource.min.js"></script>--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />
    <link rel="stylesheet" href="../BKI/bootstrap.min.css" />



    <script>

         $(document).ready(function() {           
             var servervalue = '<%=FromServer %>';
             //alert(servervalue);
         });

        angular.module('attendanceApp', []);

        //Directive

        angular.module('attendanceApp').directive('autoComplete', ['details', function (details) {
            return {
                restrict: 'A',
                link: function (scope, elem, attr, ctrl) {
                    elem.autocomplete({
                        source: function (request, response) {

                            details.postGetStudents(request.term)
                                  .then(function (data) {
                                      response(data.data.d);
                                  })
                                  .catch(function (data) {
                                      console.log(data);
                                  });

                        },
                        minLength: 2
                    });
                }
            };
        }]);

  //     angular.module('attendanceApp').directive('autoComplete', ['details', function (details) {       
  //        return {
  //            restrict: 'A',
  //            link: function (scope, elem, attr, ctrl) {
  //                elem.autocomplete({
  //                    source: function (request, response) {
  //                        debugger;
  //
  //                        details.postGetStudents(request.term)
  //                              .then(function (data) {
  //                                  response(data.data.d);
  //                              })
  //                              .catch(function (data) {
  //                                  console.log(data);
  //                              });
  //
  //                    },
  //                    minLength: 2
  //                });
  //            }
  //        };
  //    }]);

        //Controller
        angular.module('attendanceApp')
                .controller('attendanceController', ['details', '$log', '$document', '$timeout', '$scope', '$filter',
                function (details, $log, $document, $timeout, $scope, $filter) {

                    // Initialize Student record array
                    $scope.studentCardsArray = [
                        {
                            "studentCard": "",
                            "editable": true,
                            "showCheckbox": false,
                            "showDeleteButton": false,
                            "showNextButton": false
                        }
                    ];
                    $scope.studentCard = "";
                    $scope.studentCardTemp = ""; // for $watch
                    $scope.submitDisabled = false; // Submit Button at Bottom
                    $scope.studentSearched = "";


                    // Get All Students on Page Load
               //    details.postGetAllStudents()
               //      .then(function (data) {
               //          debugger;
               //          //data.data.d.length
               //          $log.info(data);
               //
               //          if (data.data.d.length) {
               //              $scope.studentsCollection = data.data.d;
               //            //  angular.forEach(data.data.d, function (student) {
               //            //      if (eachStudentCard.FirstName != "") {
               //            //        //
               //            //      }
               //            //  });
               //          }
               //
               //      })
               //      .catch(function (data) {
               //          debugger;
               //          $log.error(data);
               //      });

                    // Submit Button At Bottom Enable
                    $scope.saveButtonEnable = function () {
                        //debugger;
                        //if ($scope.studentCardsArray.length == 1 && $scope.studentCardsArray[0]["studentCard"] == "") {
                        if ($scope.studentCardsArray.length > 1) {
                            return true;
                        }
                        return false;
                    };

                    // $watch when Enter is pressed on Input Box 
                    $scope.$watch('studentCardTemp', function (newValue, oldValue) {
                        if ((newValue != oldValue) && (newValue != "")) {
                            //debugger;
                            $scope.studentCardsArray.push(
                                {
                                    "studentCard": "",
                                    "editable": true,
                                    "showCheckbox": false,
                                    "showDeleteButton": false,
                                    "showNextButton": false
                                }
                            );
                            
                       //   if ($scope.ifExistsStudentCard($scope.studentCardsArray, newValue) != 0) {
                       //       debugger;
                       //       $scope.studentCardsArray.push(
                       //           {
                       //               "studentCard": "",
                       //               "editable": true,
                       //               "showCheckbox": false,
                       //               "showDeleteButton": false,
                       //               "showNextButton": false
                       //           }
                       //       );
                       //       //$scope.studentCardsArray.push(
                       //       //    {
                       //       //        "studentCard": "",
                       //       //        "editable": false
                       //       //    }
                       //       //);
                       //       //document.getElementById("lastTD").scrollIntoView();
                       //   }
                       //   else {
                       //       debugger;
                       //       $scope.studentCardsArray.push(
                       //           {
                       //               "studentCard": "",
                       //               "editable": true,
                       //               "showCheckbox": false,
                       //               "showDeleteButton": false,
                       //               "showNextButton": false
                       //           }
                       //       );
                       //   }

                            document.getElementById("lastTD").scrollIntoView();
                 
                        }
                    }, true);

                    // Not Used
                    $scope.ifExistsStudentCard = function (editStudentCard, newValue) {
                        var hasValue = 0;
                        var returnValue = 0;
                        if (editStudentCard.length > 0) {
                            for (i = 0; i < editStudentCard.length; i++) {
                                if (editStudentCard[i]['studentCard'] == newValue) {
                                    hasValue = hasValue + 1;
                                }
                            }
                            if (hasValue != 0) {
                                returnValue = 0;
                            }
                            else {
                                returnValue = 1;
                            }
                        }
                        else {
                            returnValue = 1;
                        }
                        return returnValue;
                    }

                    // Input Box Enter //Not Used
                    $scope.submitAttendence = function (event, item, index) {
                        //debugger;
                        //event.preventDefault();
                        //event.stopPropagation();

                        var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                        if (key == 13) {
                            item.editable = false;
                            item.showCheckbox = true;
                            item.studentCard = item.studentCard.replace(/[^\w\s]/gi, '');
                            $scope.studentCardTemp = $scope.studentCard.replace(/[^\w\s]/gi, '');
                            console.log("Typed value :- " + $scope.studentCard.replace(/[^\w\s]/gi, ''));
                            $scope.studentCard = "";
                        } else {
                            if (key <= 90 && key >= 48) {
                            //if (event.which <= 90 && event.which >= 48) {
                            //if (event.key !== undefined) {
                                $scope.studentCard += event.key;
                                //item.studentCard += event.key;
                            }
                        }

                        if ($scope.studentCard) {
                            item.showNextButton = true;
                        }

                    }

                    //Searched Student Button redirect to Next Button Click Function
                    $scope.submitAttendenceOnSearch = function (event, item) {
                        //debugger;
                        //var str = 'one:two;three';
                        //str.split(':').pop().split(';').shift(); // returns 'two'

                        //var afterFiltering = item.split('Name:').pop().split('MobilePersonal').shift(); // returns 'two'
                        //var afterRegex = afterFiltering.replace(/[^\w\s]/gi, '');

                        //console.log(item.split('Barcode:')[1].replace(/\s/g, ''));

                        var searchedStudent =
                            {
                                "studentCard": item.split('Barcode:')[1].replace(/\s/g, ''),
                                "editable": true,
                                "showCheckbox": false,
                                "showDeleteButton": false,
                                "showNextButton": false
                            };
                        
                        $scope.studentCardsArray[$scope.studentCardsArray.length - 1]["studentCard"] = item.split('Barcode:')[1].replace(/\s/g, '');
                        $scope.studentCardsArray[$scope.studentCardsArray.length - 1]["editable"] = false;
                        $scope.studentCardsArray[$scope.studentCardsArray.length - 1]["showCheckbox"] = true;

                        $scope.studentSearched = "";

                        $scope.submitAttendenceOnClick(event, searchedStudent, -1);
                    }

                    // Next Button Click
                    $scope.submitAttendenceOnClick = function (event, item, index) {
                        //debugger;
                        item.editable = false;
                        item.showCheckbox = true;
                        item.studentCard = item.studentCard.replace(/[^\w\s]/gi, '');
                        $scope.studentCardTemp = item.studentCard;
                        console.log("Typed value :- " + $scope.studentCardTemp);
                        $scope.saveButtonEnable();
                    }
                    

                    // CheckBox Click
                    $scope.editStudentCard = function (event, item) {
                        item.editable = !item.editable;
                        item.showDeleteButton = !item.showDeleteButton;
                    }

                    //Delete Button
                    $scope.deleteStudent = function (event, student, index) {
                        for (var i = $scope.studentCardsArray.length - 1; i >= 0; i--) {
                            if ($scope.studentCardsArray[i]["studentCard"] === student.studentCard) {
                                $scope.editStudentCard(event, $scope.studentCardsArray[i]);
                        
                                $scope.studentCardsArray.splice(i, 1);
                            }
                        }
                        $scope.cardsCount = $scope.studentCardsArray.length;
                        console.log(student);
                    }


                    // Save Button - Close Ticket


                    $scope.closeTicket = function () {
                        //debugger;
                        $scope.submitDisabled = true;
                        ////////////// Creating Array
                                    $scope.exportDataJsp = [];
                                    $scope.exportDataJsp.push(["StudentCard",
                                                            "StaffCard",
                                                            "CRN",
                                                            "TermCode",
                                                            "Date",
                                                            "Day"
                                    ]);
                                    angular.forEach($scope.studentCardsArray, function (value, key) {
                                        //debugger;
                                        if (value.studentCard != "") {
                                            //studentsData.push(value.studentCard);

                                            var d1 = new Date();
                                            var n1 = d1.getMonth() + 1;
                                            //debugger;//   
                                            $scope.exportDataJsp.push([
                                                    value.studentCard,
                                                  '<%=FromServerTeacherId %>',//$scope.item.card,
                                                  '<%=FromServerCrn %>',//$scope.item.crn,
                                                  '<%=FromServerTermCode %>',//$scope.item.termCode,
                                                  new Date().getDate() + "/" + n1 + "/" + new Date().getFullYear(),
                                                  new Date().getDay()
                                            ]);
                                        }
                                    });                        
                        /////////////
          


                        saveToCsv($scope.exportDataJsp)
                            .then(
                                function (data) {
                                    debugger;
                                    details.postCloseHeatTicket($scope.studentCardsArray)
                                        .then(function (data) {
                                            //debugger;
                                            //if (data.data.d == "Ticket Closed") {}
                                            //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                                            window.location.href = '<%=FromServerThankYou %>';
                                            $log.info(data);
                                        })
                                        .catch(function (data) {
                                            debugger;
                                            //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                                            window.location.href = '<%=FromServerThankYou %>';
                                            $log.error(data);
                                        });
                                    console.log(data);
                                },
                                function (data) {
                                    debugger;
                                    console.log(data);
                                }
                            );



                              //                                                                 details.postCloseHeatTicket($scope.studentCardsArray)
                              //                                                                     .then(function (data) {
                              //                                                                         debugger;
                              //                                                                         //if (data.data.d == "Ticket Closed") {}
                              //                                                                         $log.info(data);
                              //                                                                     })
                              //                                                                     .catch(function (data) {
                              //                                                                         debugger;
                              //                                                                         $log.error(data);
                              //                                                                     });



                    // End of Submit Button
                    }


                    // Watch for AUtoPopulate user field
                    $scope.$watch('UserSearch', function (UserSearch) {
                        if (UserSearch && UserSearch.length > 3) {

                            // $http.get('/api/getAllUser?SearchUser=' + UserSearch).success(function (users) {
                            //     $scope.AllUser = users;
                            // }).error(function () {
                            //     $scope.AllUser = [{ name: 'test' }, { name: 'example' }];
                            // });

                            details.postGetStudents(UserSearch)
                                  .then(function (data) {
                                      //debugger;
                                      $scope.AllUser = data.data.d;
                                      $log.info(data);
                                  })
                                  .catch(function (data) {
                                      debugger;
                                      $scope.AllUser = [{ Name: 'test', Id: 1 }, { Name: 'example222', Id: 2 }]
                                      $log.error(data);
                                  });


                        }
                    });


                }]);


        angular.module('attendanceApp').factory('autoCompleteDataService', [function () {
            return {
                getSource: function() {
                    //this is where you'd set up your source... could be an external source, I suppose. 'something.php'
                    return ['apples', 'oranges', 'bananas'];
                }
            }
        }])

        angular.module('attendanceApp').factory("details", ["$http", "$q", '$log', function ($http, $q, $log) {

            var postCloseHeatTicket = function (studentCardsArray) {
                debugger;
                var heatId = '<%=FromServer %>';
                var studentsData = [];
                
                angular.forEach(studentCardsArray, function (eachStudentCard) {
                    //debugger;
                //   if (eachStudentCard.studentCard != "") {
                //       studentsData.StudentId = "1233";
                //   }

                    if (eachStudentCard.studentCard != "") {
                        studentsData.push(eachStudentCard.studentCard);
                    }
                    
                 //   $scope.studentCardsArray.push(
                 //       {
                 //           "studentCard": "",
                 //           "editable": true,
                 //           "showCheckbox": false,
                 //           "showDeleteButton": false,
                 //           "showNextButton": false
                 //       }
                 //   );

                    //data: "{'myArray1':"+JSON.stringify(myArray1)+",'myArray2':"+JSON.stringify(myArray2)+"}",

                });

                var deferred = $q.defer();
                var urlSite = "AttendanceSubmit.aspx/CloseTicket";
                $http({
                        url: urlSite,
                        method: "POST",

                        //data: JSON.stringify({
                        //    data: "test"
                        //}),
                        data: "{studentsData:" + JSON.stringify(studentsData)
                                    + ",'heatId':" + JSON.stringify('<%=FromServerHeatId %>')
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

            var postStudentAttendence = function (studentCardsArray) {
                debugger;

                var deferred = $q.defer();
                $http({
                    url: '<%=FromServerThankYou %>',
                    method: "POST",
                    cache: false,
                    data: {
                        "teacherCard":'<%=FromServerTeacherId %>',
                        "crnNumber": '<%=FromServerCrn %>',
                        "termCode": '<%=FromServerTermCode %>',
                        "test[]": studentCardsArray
                    },
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

            var postGetAllStudents = function () {  ////////////////////////////////////////////////////////  Not Used Give error at 500 rows
                

                var deferred = $q.defer();
                $http({
                    url: '<%=FromHeatTicketClose %>' + "/GetStudentsOnLoad",
                    method: "POST",
                    //cache: false,
                    async: false,
                    //dataType: "json",
                    data: '{}',
                        headers: {
                            //"accept": "application/json; charset=utf-8",
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
            }

            var postGetStudents = function (query) {
                
                //debugger;
                var deferred = $q.defer();
                $http({
                        url: '<%=FromHeatTicketClose %>' + "/GetStudents",
                        method: "POST",
                        //cache: false,
                        async: false,
                        //dataType: "json",
                        data: {
                            //"query": JSON.stringify(query)
                            "query": query
                        },
                        headers: {
                            //"accept": "application/json; charset=utf-8",
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
            }

            return {
                postStudentAttendence: postStudentAttendence,
                postCloseHeatTicket: postCloseHeatTicket,
                postGetAllStudents: postGetAllStudents,
                postGetStudents: postGetStudents
            };
        }]);


        function saveToCsv(studentCardsArray) {
            //debugger;
            var deferred = $.Deferred();


                            $.ajax({
                                //url: "ThankYou.jsp",
                                //url: "http://kismsbat-dev:8082/barCode/ThankYou.jsp",
                                url: '<%=FromServerThankYou %>',
                                type: "POST",
                                cache: false,
                                /*
                                        dataType: "jsonp",
                                        crossDomain: true,
                                        async: "false",                                
                                */
                                data: {
                                  "teacherCard": '<%=FromServerTeacherId %>',
                                  "crnNumber": '<%=FromServerCrn %>',
                                  "termCode": '<%=FromServerTermCode %>',
                                    "test[]": studentCardsArray
                                },
                                success: function (data, textStatus, jqXHR) {
                                    //debugger;
                                    deferred.resolve(data);
                                    //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"

                                },
                                error: function (sender, args) {
                                //error: function (jqXHR, textStatus, errorThrown) {
                                    debugger;
                                    //console.log('The following error occurred: ' + textStatus, errorThrown);
                                    deferred.reject(sender, args);
                                    //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                                }
                            });

            return deferred.promise();
        }



        //$(function () {
        //    var yerler = [{
        //        "value": 3,
        //        "label": "Adana Seyhan"
        //    }, {
        //        "value": 78,
        //        "label": "Seyhan Adana"
        //    }, {
        //        "value": 17,
        //        "label": "Paris Fransa"
        //    }, {
        //        "value": 123,
        //        "label": "Tokyo Japan"
        //    }];
        //    $("#tags").autocomplete({
        //        source: yerler,
        //        minLength: 2,
        //        focus: function (event, ui) {
        //            event.preventDefault();
        //            $("#tags").val(ui.item.label);
        //        },
        //        select: function (event, ui) {
        //            event.preventDefault();
        //            $("#projeKatmanRaporCbx").val(ui.item.value);
        //            $("#tags").val(ui.item.label);
        //        }
        //    });
        //});



    </script>



    <title>Attendance Submit</title>
</head>
<body data-ng-app="attendanceApp">


        <form id="form1" runat="server">


        <div class="container-fluid" data-ng-controller="attendanceController" id="attendanceController">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron" style="background-color: #289ad7;">
                    <h1 style="margin-left: 0.1em;  text-align: center;  color: white; ">Student Attendance System (Update)</h1>
                </div> <%--width: 15em;--%>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                       Staff ID
                    </div>    
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-left: 1em;">
                        <asp:TextBox ID="teacherCardInput" Enabled="false" Font-Size="1.5em" Width="12em" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top: 1em;">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                       CRN
                    </div>    
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-left: 1em;">
                        <asp:TextBox ID="crnInput" Enabled="false" Font-Size="1.5em" Width="12em" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top: 1em;">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                       Term Code
                    </div>    
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-left: 1em;">
                        <asp:TextBox ID="termcodeInput" Enabled="false" Font-Size="1.5em" Width="12em" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top: 1em;">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                       Date of Class
                    </div>    
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-left: 1em;">
                        <asp:TextBox ID="dateInput" Enabled="false" Font-Size="1.5em" Width="12em" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style="font-size: 1.5em; text-align: center; background-color: #289ad7; color: white; margin-top: 1em; padding: 0.4em 0;">
                            Please Enter Student ID(s)
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="col-sm-12 col-md-2 col-lg-2">
                        <label for="studentSearchTxtbx">Enter student</label>
                    </div>
                    <div class="col-sm-12 col-md-10 col-lg-10">
                        <asp:TextBox ID="studentSearchTxtbx" runat="server" Visible="false" OnTextChanged="studentSearchTxtbx_TextChanged"></asp:TextBox>

                        
                            
                            <div class="input-group">
                                <input type="text" ng-model="studentSearched" auto-complete class="form-control" placeholder="Name of Student"/>
                                <span class="input-group-btn">
                                    <button  class="btn btn-primary" type="button" ng-click="submitAttendenceOnSearch($event, studentSearched)">Submit
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </span>
                               <br />
                            </div>


<%--                            <div class="input-group">
                                <input ng-model="UserSearch" list="title" type="text" class="form-control" placeholder="Name to search">
                                <span class="input-group-btn">
                                    <button  class="btn btn-primary" type="button">Submit
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </span>
                                <datalist id="title">
                                    <option ng-repeat="user in AllUser" value="{{user.Name}}">
                                </datalist>
                            </div>--%>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12" data-ng-repeat="eachStudentCard in studentCardsArray track by $index" style="margin-top: 1.5em;">
                    <div class="col-sm-1 col-md-1 col-lg-1">
                        <input type="checkbox" 
                              style="transform: scale(3); margin-left: 2em; margin-top: 0.9em;"
                                name="{{ 'cardName-' + $index }}"
                                id="{{ 'cardId-' + $index }}"
                                ng-show="eachStudentCard.showCheckbox"
                                ng-click="editStudentCard($event, eachStudentCard)"      
                                ng-checked="eachStudentCard.editable"                                                
                        />                        
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3"  style="font-size: 1.5em;">
                        <span>Please Enter Student ID</span>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <input id="{{ 'studentCard-' + $index }}"
                              style="font-size: 1.5em; width: 12em;"
                                name="{{ 'studentCard-' + $index }}"
                                ng-disabled="!eachStudentCard.editable"
                                placeholder="Student ID"         
                                data-ng-model="eachStudentCard.studentCard"
                                type="text"/>
                    </div>
                    <div class="col-sm-5 col-md-5 col-lg-5">
                        <div class="col-sm-3 col-md-3 col-lg-3">
                        <input type="button" 
                              style="font-size: 1.5em; border-radius: 0.3em;"
                              class="btn btn-success"
                                name="nextBtn" 
                                ng-show="true"
                                ng-click="submitAttendenceOnClick($event, eachStudentCard, $index)"
                                value="Next" /> <%--ng-show="eachStudentCard.showNextButton"--%>
                        </div>
                        <div class="col-sm-7 col-md-7 col-lg-7">
                        <input type="button" 
                              style="font-size: 1.5em; border-radius: 0.3em;"
                              class="btn btn-danger"
                                name="deleteStudentCard" 
                                ng-click="deleteStudent($event, eachStudentCard, $index)" 
                                ng-show="eachStudentCard.showDeleteButton"
                                value="Delete" />
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <input type="button" 
                        value="Submit"  
                        style="font-size: 1.5em; border-radius: 0.3em; width: 5em;"
                        class="btn btn-primary pull-right"
                        ng-show="saveButtonEnable()"
				    	ng-disabled="submitDisabled" 
                        ng-click="closeTicket()" />
                        <%--ng-click="submitCardDetails(studentCardsArray)" />    ng-show=" saveEnable() "
                            ng-show="{{(studentCardsArray.length = 1) ? true : false}}"
                        --%>
                </div>
            </div>
        </div>
            <asp:Label ID="heatIdLbl" runat="server" Visible="false" Text="Label"></asp:Label>
            <div id="lastTD" style="padding-top: 50px;">&nbsp;</div>

<%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>

        </form>



</body>
</html>
