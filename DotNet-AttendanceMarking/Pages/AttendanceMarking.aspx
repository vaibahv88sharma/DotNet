﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceMarking.aspx.cs" Inherits="AttendanceMarking.Pages.AttendanceMarking" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


<meta name="viewport" content="width=device-width, initial-scale=1">
            
        
        <script src="../BKI/jquery.min.js"></script>
        <script src="../BKI/bootstrap.min.js"></script>      
        <script src="../BKI/angular.min.js"></script>
        <script src="../BKI/angular-resource.min.js"></script>
        
        <link rel="stylesheet" href="../BKI/bootstrap.min.css">
    <title></title>
<style>

input[type="text"]{
    border: 1px solid;
}
td{
    width: 33%
}

body{
    font-size: 20px;
}

input:not([type]), input[type="text"]
{
    width: 14em;
}


/*  3  */

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


/* Hide elements*/

/*     #titlerow {
        display: none;
    }
.ms-belltown-anonShow{ */
    /* #s4-ribbonrow { */
/*     display: none !important;
}
#suiteBarDelta {
    display: none;
} */
#angularBarcodeContainer{
    /* margin-top: -130px !important; */
}
</style>


</head>
<body data-ng-app="moduleApp">

        <div class="container-fluid" data-ng-controller="cardController" id="angularBarcodeContainer">
            
            
                  <!-- <h1>{{hyperlinkTitle}}</h1> -->
            
               
                        <div class="row">
                                <table class="table">
                                    <thead>
                                    <tr>
                                       
                                        <!-- <th colspan="3" ><h1 style="text-align: center; color: black;">Attendance Marking</h1></th> -->
                                        
                                    </tr>                          
                                    </thead>
                                    <tbody>

                                    <tr ng-hide="isCrnEntered && isteacherCardSwaped && isTermCodeEntered && hideTop3Div">
                                        <td colspan="3">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron" style="background-color: #289ad7;">
                                                        <!-- <h1 style="text-align: center; color: black;">Student Attendance System</h1> -->
                                                        <h1 style="margin-left: 3em;  text-align: center;  color: white; width: 14em;">Student Attendance System</h1>
                                                    </div>                                                                                                            
                                                </div>
                                                <div class="row" style="margin-top: 1em">
                                                     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                                                        Please Swipe Staff ID Card
                                                     </div>    
                                                     <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                                            <input type="text" name="magCard" id="f_1" 
                                                                tabindex="1"
                                                                style="font-size: 1.5em; width: 9.4em;"
                                                                    placeholder="Staff ID"
                                                                    data-ng-model="item.card"
                                                                    ng-disabled="isteacherCardSwaped" 
                                                                    ng-keydown= "keypressHandler($event, 2, item)" 
                                                                    autofocus>
                                                                    <!-- onload="this.contentWindow.focus()"> -->

                                                     </div>                                                                                                                                                                    
                                                </div> 
                                                <div class="row" ng-if="isteacherCardSwaped" style="margin-top: 2em">
                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                                                                Please Enter CRN
                                                        </div>    
                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="margin-left: -1em;">
                                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                                                    <input type="text" name="crn" id="f_2"  placeholder="CRN" 
                                                                        tabindex="2"
                                                                        style="font-size: 1.5em; width: 9.4em;"
                                                                            data-ng-model="item.crn"
                                                                            ng-disabled="isCrnEntered" 
                                                                            ng-keydown="keypressHandler($event, 3, item)" 
                                                                            ng-show="isteacherCardSwaped" focus-me-crn="isteacherCardSwaped"
                                                                    >
                                                            </div> 
                                                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                                                    <input type="button" class="btn btn-primary" 
                                                                    style="font-size: 1.5em; border-radius: 0.3em;"
                                                                    name="crnEditButton" value="Edit" 
                                                                    ng-hide="!isCrnEntered && isteacherCardSwaped" 
                                                                    ng-click="submitCRN(item)">      
                                                            </div> 
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                                    <input type="button" class="btn btn-primary pull-left"
                                                                    style="font-size: 1.5em; border-radius: 0.3em;" 
                                                                    name="crnButton" value="{{isCrnEntered === true ? 'Next' : 'Next'}}" 
                                                                    ng-hide="isCrnEntered && isteacherCardSwaped"                                                     
                                                                    ng-click="submitCRN(item)">
                                                                </input>
                                                            </div>                                                                                                                                                                                                                                          
                                                        </div>                                                                                                                                                                    
                                                </div>    
                                                <div class="row" ng-if="isCrnEntered && isteacherCardSwaped" style="margin-top: 1em">
                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="font-size: 1.5em;">
                                                                Please Enter Term Code
                                                        </div>    
                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="margin-left: -1em;">
                                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                                                <input type="text" name="termCode"id="f_3" 
                                                                    tabindex="3"                
                                                                    style="font-size: 1.5em; width: 9.4em;"                                                    
                                                                        data-ng-model="item.termCode" 
                                                                        placeholder="Term Code" 
                                                                        ng-keydown="keypressHandler($event, 4, item)"
                                                                        ng-disabled="isTermCodeEntered"
                                                                        focus-me-term="isCrnEntered && isteacherCardSwaped">
                                                            </div> 
                                                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                                                <input type="button" class="btn btn-primary"
                                                                style="font-size: 1.5em; border-radius: 0.3em;" 
                                                                    name="termCodeButton" value="Edit"
                                                                    ng-hide="isCrnEntered && isteacherCardSwaped && !isTermCodeEntered"                                                
                                                                    ng-click="submitTermCode($event, item)">
                                                                </input>      
                                                            </div> 
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                                <input type="button" class="btn btn-primary pull-left" 
                                                                style="font-size: 1.5em; border-radius: 0.3em;"
                                                                    name="termCodeButton" value="{{isTermCodeEntered === true ? 'Next' : 'Next'}}"
                                                                    ng-hide="isCrnEntered && isteacherCardSwaped && isTermCodeEntered"
                                                                    ng-click="submitTermCode($event, item)">
                                                                </input>
                                                            </div>                                                                                                                                                                                                                                          
                                                        </div>                                                                                                                                                                    
                                                </div>                                                                                                                                             
                                            </div>
                                        </td>
                                            <!-- <td colspan="3" ><h1 style="text-align: center; color: black;">Attendance Marking</h1></td> -->
                                    </tr>                                                     
                                    <!--<tr>
                                        <td>Please Swipe your Staff ID Card</td>
                                        <td><input type="text" name="magCard" id="f_1" 
                                            tabindex="1"
                                                    placeholder="Staff ID"
                                                    data-ng-model="item.card"
                                                    ng-disabled="isteacherCardSwaped" 
                                                    ng-keydown= "keypressHandler($event, 2, item)"                                                     
                                                    autofocus></td>
                                        <td>&nbsp;</td>
                                    </tr>                            
                                    <tr ng-if="isteacherCardSwaped">
                                        <td>
                                                Please Enter CRN
                                        </td>

                                        <td>
                                            <input type="text" name="crn" id="f_2"  placeholder="CRN" 
                                            tabindex="2"
                                                    data-ng-model="item.crn"
                                                    ng-disabled="isCrnEntered" 
                                                    ng-keydown="keypressHandler($event, 3, item)" 
                                                    ng-show="isteacherCardSwaped" focus-me-crn="isteacherCardSwaped"
                                                    >
                                            <input type="button" class="btn btn-primary" 
                                            name="crnEditButton" value="Edit" 
                                            ng-hide="!isCrnEntered && isteacherCardSwaped" 
                                            ng-click="submitCRN(item)">                                            
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-primary pull-left" 
                                                    name="crnButton" value="{{isCrnEntered === true ? 'Next' : 'Next'}}" 
                                                    ng-hide="isCrnEntered && isteacherCardSwaped"                                                     
                                                    ng-click="submitCRN(item)">
                                            </input>
                                        </td>
                                    </tr>-->
                                    <!-- <tr ng-if="isCrnEntered && isteacherCardSwaped">
                                        <td>Please Enter Term Code</td>
                                        <td>
                                            <input type="text" name="termCode"id="f_3" 
                                            tabindex="3"
                                                data-ng-model="item.termCode" 
                                                placeholder="Term Code" 
                                                ng-keydown="keypressHandler($event, 4, item)"
                                                ng-disabled="isTermCodeEntered"
                                                focus-me-term="isCrnEntered && isteacherCardSwaped">
                                            <input type="button" class="btn btn-primary" 
                                                name="termCodeButton" value="Edit"
                                                ng-hide="isCrnEntered && isteacherCardSwaped && !isTermCodeEntered"                                                
                                                ng-click="submitTermCode($event, item)">
                                        </input>                                               
                                        </td>
                                        <td>                                         
                                            <input type="button" class="btn btn-primary pull-left" 
                                                    name="termCodeButton" value="{{isTermCodeEntered === true ? 'Next' : 'Next'}}"
                                                    ng-hide="isCrnEntered && isteacherCardSwaped && isTermCodeEntered"
                                                    ng-click="submitTermCode($event, item)">
                                            </input>
                                        </td>
                                    </tr> -->
                                    <tr ng-show="isCrnEntered && isteacherCardSwaped && isTermCodeEntered">
                                        <td colspan="3">
                                                
                                                <button type="button" class="btn btn-large btn-primary pull-right" 
                                                    ng-click="hideTop3Div = !hideTop3Div" 
                                                    name="showTop3Div">
                                                        <i class="glyphicon glyphicon-plus" ng-show="hideTop3Div"></i>
                                                        <i class="glyphicon glyphicon-minus" ng-show="!hideTop3Div"></i>
                                                </button>                                           
                                        </td>
                                    </tr>
                                    <tr ng-if="(isCrnEntered && isteacherCardSwaped && isTermCodeEntered) || (studentCardsArray.length>0)">
                                        <!-- <tr ng-if="(isCrnEntered && isteacherCardSwaped && isTermCodeEntered)"> -->
                                       <!--  <td><p ng-class="studentCardsArray.length>0 ? '' : 'transColor' " style="display: inline-block;">Ready for Students Swipe Cards</p></td> -->
                                        <td colspan="3"><p id="f_4"
                                                ng-style="(isCrnEntered && isteacherCardSwaped && isTermCodeEntered) ?  {'font-size':'30px' ,'text-align':'center' ,'background-color':'#289ad7','color':'white ' } : '' " 
                                            >
                                            
                                            Ready for Students Swipe Cards
                                                </p>
                                        </td>
                                        <!-- <td>
                                                &nbsp;                                                
                                        </td> -->
          <!--                               <td colspan="3">                            
                                            <div class="row">                                   
                                               <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="text-align: right;">
                                                   Count of Students
                                               </div>                                                                                                    
                                            </div>  
                                        </td> -->
                                    </tr>                        
                                    <!-- <tr ng-if="isCrnEntered && isteacherCardSwaped && isTermCodeEntered && studentCardsArray.length > 0" data-ng-repeat="eachStudentCard in studentCardsArray">  -->
                                     <!-- <tr ng-if="isCrnEntered && isteacherCardSwaped && isTermCodeEntered && studentCardsArray.length > 0" data-ng-repeat="eachStudentCard in studentCardsArray track by $index">  -->
                                    <tr ng-if="(isCrnEntered && isteacherCardSwaped && isTermCodeEntered) || (studentCardsArray.length>0)" data-ng-repeat="eachStudentCard in studentCardsArray track by $index">
                                          <td style="vertical-align: middle;">
                                              <!-- <p>New Student ID</p> -->
                                              <input type="checkbox" 
                                                    style="transform: scale(3); margin-left: 2em;"
                                                      name="{{ 'cardName-' + $index }}"
                                                      id="{{ 'cardId-' + $index }}"
                                                      ng-click="editStudentCard($event, eachStudentCard)"      
                                                      ng-checked="eachStudentCard.editable"                                                
                                              >
                                          </td>
                                          <!-- <td colspan="2"> -->
                                          <td>
                                                  <!-- ng-disabled="{{1==1 || !isStudentCardDisabled}}" -->
                                              <input id="{{ 'studentCard-' + $index }}"
                                                    style="font-size: 1.5em; width: 9.4em;"
                                                      name="{{ 'studentCard-' + $index }}"
                                                      ng-disabled="!eachStudentCard.editable"
                                                      type="text"                                         
                                                      data-ng-model="eachStudentCard.studentCard">
                                          </td>
                                          <td><input type="button" 
                                                    style="font-size: 1.5em; border-radius: 0.3em;"
                                                    class="btn btn-danger"
                                                      name="deleteStudentCard" 
                                                      ng-click="deleteStudent($event, eachStudentCard, $index)" 
                                                      ng-hide="!eachStudentCard.editable"
                                                      value="Delete"></td> <!-- new($event, eachStudentCard.studentCard) -->
                                    </tr> 
                                    <tr ng-if="(isCrnEntered && isteacherCardSwaped && isTermCodeEntered) || (studentCardsArray.length>0)">
                                    <!-- <tr ng-if="isCrnEntered && isteacherCardSwaped && isTermCodeEntered"> -->
                                        <td colspan="2"
                                            style="height: 100px; padding: 50px 5px;">
                                                <div class="spinnerCircle pull-left">
                                                        <div class="double-bounce1"></div>
                                                        <div class="double-bounce2"></div>
                                                      </div>                                           
                                        </td>
                                        <!-- <td colspan="2"> -->
                                        <!-- <td style="height: 100px; padding: 30px;" >
                                                <p style="display: inline-block;
                                                        vertical-align: middle;
                                                        line-height: 50px;
                                                        font-size: 25px;">
                                                Awaiting for Card Scanning</p>
                                        </td> -->
                                        <td style="height: 100px; padding: 30px;">
                                                <!-- <span style="border-radius:50%; border:solid black 1px;padding:20px; font-size: 20px;">{{cardsCount}}</span>   -->
                                                
                                                <div class="container" style="width: 100%;">                                                    
                                                    <div class="row pull-right" style="text-align: center; background-color: lightgrey; border-radius: 15px;">                                                        
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="color:darkmagenta; font-size: 4em;">
                                                                {{studentCardsArray.length}}
                                                        </div>                                                            
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="font-weight: bold; font-size: 1.3em;">
                                                                # Students Attended
                                                        </div>                                                                                                               
                                                    </div>                                                    

<!--                                                     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right;">
                                                            <span style="border-radius:50%; border:solid black 1px;padding:20px; font-size: 50px;">{{studentCardsArray.length}}</span>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                            <span style="display: inline-block;
                                                            vertical-align: middle;
                                                            line-height: 50px;
                                                            font-size: 25px;">Student Count</span>                                                        
                                                    </div>  -->                                                   
                                                </div>
                                                
                                                <!-- <span style="border-radius:50%; border:solid black 1px;padding:20px; font-size: 50px;">{{studentCardsArray.length}}</span>  
                                                <span style="font-size: 25px;">Student Count</span>                                             -->
                                        </td>
                                    </tr>
                                    <!-- <tr ng-if="cardsCount"> -->
                                        <tr ng-if="studentCardsArray.length > 0">
                                            <td colspan="3"> 

                                                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left: 2em; font-size: 1.1em; font-weight: bold;">                                                    
                                                    <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-left: 9em;">
                                                            Did all students have their ID and tagged in ?
                                                    </div>  -->                                                                                                       
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top: 2.4em; background-color: lavender; height: 6em;" ng-show="showMessage === true">  
                                                        <br>                                                      
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                                                <b>Note: </b>
                                                        </div>                                                                       
                                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                                Please capture first name, last name, mobile or username. You will be assigned a task via email to enter missed students. 
                                                        </div>                                                                                                 
                                                    </div>                                                    
                                                </div>                                                
                                                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-top: 10px;"> 
												
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="font-size: 1.2em; font-weight: bold; margin-left: 1.2em;">
                                                                Did all students have their ID and tagged in ?
                                                        </div>
                                                        
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: right; margin-left: 2.4em;">
                                                            <!-- <label ng-repeat="checkbox in checkboxOptions"
                                                                style="font-size: 3em; margin-right: .7em;">
                                                                    <input type="checkbox" 
                                                                    ng-change="toggleMessage(checkbox)"
                                                                    ng-model="checkbox.isChecked"
                                                                    style="transform: scale(3.5);"
                                                                    > {{checkbox.displayValue}} 
                                                                </label> -->             
                                                                <label ng-repeat="checkbox in checkboxOptions"
                                                                style="display: block; font-size: 2em; text-align:left;">
                                                                    <input type="checkbox" 
                                                                    ng-change="toggleMessage(checkbox)"
                                                                    ng-model="checkbox.isChecked"
                                                                    style="transform: scale(3.5);"
                                                                    > &nbsp;{{checkbox.displayValue}} 
                                                                </label>                                                                                                                              
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-top: 1.5em; margin-left: 1.4em;">
                                                            <input type="button" 
                                                                value="Submit"  
                                                                style="font-size: 1.5em; border-radius: 0.3em; width: 5em;"
                                                                class="btn btn-primary"
                                                                ng-show=" anyCheckboxChecked() "
																ng-disabled="!fileSaved"																
                                                                ng-click="submitCardDetails(studentCardsArray)" >
                                                                <!-- ng-disabled="!fileSaved"  -->
                                                        </div>  <!-- ng-disabled="{{fileSaved == true ? false : true}}"  -->                                                                                                        
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" 
                                                            style="font-size: 1.4em; font-weight: bold; margin-top: 0.5em; background-color: aliceblue;"
                                                            ng-if="false">
                                                        <p>Thanks for submiting the attendance details</p>
														<!--ng-if="!fileSaved">-->
                                                    </div>  
                                                </div>                                                
                                            
                                            </td>
<!--                                             <td colspan="2">
                                                
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-left: 15em;">
                                                    Did all students have their ID and tagged in ?
                                                </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" ng-show="showMessage === true" style="padding-left: 10em;">                                                        
                                                    <br>
                                                    
                                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                                    <b>Note: </b>    
                                                    </div>
                                                                                                       
                                                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                            Please capture first name, last name, mobile or username. You will be assigned a task via email to enter missed students. 
                                                    </div>    
                                            </td>

                                            <td>
                                                    <div class="container" style="width: 100%;">
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right;">
                                                                        <label ng-repeat="checkbox in checkboxOptions"
                                                                            style="padding: 2em; font-size: 30px">
                                                                                <input type="checkbox" 
                                                                                ng-change="toggleMessage(checkbox)"
                                                                                ng-model="checkbox.isChecked"
                                                                                style="transform: scale(2.5);"
                                                                                > {{checkbox.displayValue}} 
                                                                            </label>                                                                        
                                                            </div>
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                                <input type="button" value="Submit"  
                                                                    ng-show=" anyCheckboxChecked() " 
                                                                    ng-click="submitCardDetails(studentCardsArray)" >
                                                            </div>                                                 
                                                        </div>
                                            </td> -->

<!--                                             <td>
                                                <div class="container" style="width: 100%;">
                                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right;">
                                                        <select ng-model="optionsSelected"
                                                            ng-options="option.value as option.name for option in typeOptions" >
                                                            <option style="display:none" value="">Confirm Options</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                        <input type="button" value="Submit"  ng-hide=" optionsSelected == null  " ng-click="submitCardDetails(studentCardsArray)" >
                                                    </div>                                                 
                                                </div>    
                                            </td>                                             -->



                                      </tr>   
									  <tr>  
										  <td colspan="3"	id="lastTD" style="padding-top: 50px;" >&nbsp;
										  </td>
									  </tr>  									  
<!--                                     <tr hidden="true">
                                        <td>
                                            <p class="transColor">Start Swiping</p>
                                        </td>
                                        <td>
                                                <div class="loader">Loading...</div>
                                        </td>
                                        <td>
                                                <div class="spinner">
                                                        <div class="double-bounce1"></div>
                                                        <div class="double-bounce2"></div>
                                                      </div>
                                        </td>
                                    </tr>                                    
                                    <tr hidden="true">
                                        <td>
                                                <div class="sk-cube-grid">
                                                        <div class="sk-cube sk-cube1"></div>
                                                        <div class="sk-cube sk-cube2"></div>
                                                        <div class="sk-cube sk-cube3"></div>
                                                        <div class="sk-cube sk-cube4"></div>
                                                        <div class="sk-cube sk-cube5"></div>
                                                        <div class="sk-cube sk-cube6"></div>
                                                        <div class="sk-cube sk-cube7"></div>
                                                        <div class="sk-cube sk-cube8"></div>
                                                        <div class="sk-cube sk-cube9"></div>
                                                      </div>
                                        </td>
                                        <td>
                                                <div class="sk-folding-cube">
                                                        <div class="sk-cube1 sk-cube"></div>
                                                        <div class="sk-cube2 sk-cube"></div>
                                                        <div class="sk-cube4 sk-cube"></div>
                                                        <div class="sk-cube3 sk-cube"></div>
                                                      </div>                                            
                                        </td>
                                        <td>
                                                <div class="spinner">
                                                        <div class="cube1"></div>
                                                        <div class="cube2"></div>
                                                      </div>                                            
                                        </td>
                                    </tr> -->
                                    </tbody>
                                </table>
                        </div>
            
                    </div>
            <script>
function setFocusToTextBox(){
	alert("hello");
	document.getElementById("f_1").focus();
}
</script>
            
            <script>      
            
            angular.module('moduleApp', ['ng']); 


                //Directive

                angular.module('moduleApp').directive('focusMeCrn', ['$timeout', '$parse', function ($timeout, $parse) {
                    return {
                        //scope: true,   // optionally create a child scope
                        link: function (scope, element, attrs) {
                            //debugger;
                            var model = $parse(attrs.focusMeCrn);
                            scope.$watch(model, function (value) {
                                //debugger;
                                console.log('value=', value);
                                if (value === true) {
                                    $timeout(function () {
                                        element[0].focus();
                                    });
                                }
                            });
                            // to address @blesh's comment, set attribute value to 'false'
                            // on blur event:
                            //element.bind('blur', function () {
                            //    debugger;
                            //    console.log('blur');
                            //    scope.$apply(model.assign(scope, false));
                            //});
                        }
                    };
                }]);
                angular.module('moduleApp').directive('focusMeTerm', ['$timeout', '$parse', function ($timeout, $parse) {
                    return {
                        //scope: true,   // optionally create a child scope
                        link: function (scope, element, attrs) {
                            //debugger;
                            var model = $parse(attrs.focusMeTerm);
                            scope.$watch(model, function (value) {
                                //debugger;
                                console.log('value=', value);
                                if (value === true) {
                                    $timeout(function () {
                                        element[0].focus();
                                    });
                                }
                            });
                            // to address @blesh's comment, set attribute value to 'false'
                            // on blur event:
                            //element.bind('blur', function () {
                            //    debugger;
                            //    console.log('blur');
                            //    scope.$apply(model.assign(scope, false));
                            //});
                        }
                    };
                }]);

                angular.module('moduleApp').directive('focusMe', ['$timeout', '$parse', function ($timeout, $parse) {
                    return {
                        //scope: true,   // optionally create a child scope
                        link: function (scope, element, attrs) {
                            debugger;
                            var model = $parse(attrs.focusMe);
                            scope.$watch(model, function (value) {
                                debugger;
                                console.log('value=', value);
                                if (value === true) {
                                    $timeout(function () {
                                        element[0].focus();
                                    });
                                }
                            });
                            // to address @blesh's comment, set attribute value to 'false'
                            // on blur event:
                            element.bind('blur', function () {
                                debugger;
                                console.log('blur');
                                scope.$apply(model.assign(scope, false));
                            });
                        }
                    };
                }]);

            /* angular.module('moduleApp') */
                //Controller
                angular.module('moduleApp')
                        .controller('cardController', ['cardDetails', '$log', '$document', '$timeout', '$scope', '$filter',
                        function (cardDetails, $log, $document, $timeout, $scope, $filter) {
                          //debugger;
                    $scope.hyperlinkTitle = "Card Reader";
                    $scope.isSubmittingForButton = false;
            
                    $scope.isteacherCardSwaped = false;        
                    $scope.isCrnEntered = false;
                    $scope.isTermCodeEntered = false;
                    $scope.hideTop3Div = true;
                    $scope.isStudentCardDisabled = false;
            
                    $scope.studentCard ="";
                    $scope.studentCardTemp ="";
            
                    $scope.studentCardsArray = [];
                    
                    $scope.cardsCount = 0;
          
                    $scope.item = [];
            
                    
                    $scope.typeOptions = [
                        { name: 'Count is verified', value: '1' },
                        { name: 'Need Follow up', value: '2' }
                    ];

                    //$scope.checkboxOptions = {Yes: false, No: false};
                    $scope.checkboxOptions = [
                        { displayValue: "Yes", isChecked: false },
                        { displayValue: "No", isChecked: false },
                    ];

/*                     $scope.checkboxClick = function(item) {
                        angular.forEach($scope.checkboxOptions, function(product) {
                            debugger;
                        if(product != item) {
                            product.isChecked = false;  
                        }
                        });
                    }; */

                    
                    $scope.anyCheckboxChecked = function() {
                        //debugger;
                        var trues = [];
                        trues = $filter("filter")( $scope.checkboxOptions , {isChecked:true} );
                        if (trues.length>0){
                            $scope.item.checkboxDisplay = trues[0].displayValue; 
                            $scope.item.checkboxValue = trues[0].isChecked;                            
/*                             $scope.item.checkboxSelected.displayValue = trues[0].displayValue; 
                            $scope.item.checkboxSelected.isChecked = trues[0].isChecked; */
                        }

                        
                        return trues.length;
                    }

                    $scope.toggleMessage = function(item) {  
                        if (item.displayValue == 'No'){                           
                            $scope.showMessage = item.isChecked;
                        }       
                        else{
                            $scope.showMessage = false;
                        } 
                        angular.forEach($scope.checkboxOptions, function(product) {
                            //debugger;
                            if(product != item) {
                                product.isChecked = false;  
                            }

                        });    

                        $scope.anyCheckboxChecked();


                        document.getElementById("lastTD").scrollIntoView();

/*                         if (item.displayValue == 'No' && item.isChecked == true){
                            debugger;
                            $scope.showMessage = true;
                        }
                        if (item.displayValue == 'No' && item.isChecked == false){
                            debugger;
                            $scope.showMessage = false;
                        }     */                    
                    };                    
                    
                    //$scope.optionsSelected = "";
                    //$scope.optionsSelected = {type : ""};
                    /* $scope.optionsSelected = {type : $scope.typeOptions[0].value}; */
                    //$scope.showF_2 = false;
                    $scope.keypressHandler = function(event, nextIdx, item){
                        //debugger;
                        if(event.keyCode == 13){
                            //ng-keypress="submitStaffCard($event, item)" 
                            event.preventDefault();
                            if (nextIdx==2){
                                //debugger;
                                
                                $scope.submitStaffCard(event, item);
                                //$scope.$apply(function () {
                                    //$scope.f_2Focus = true;    
                                //})
                                
                            }                            
                            if (nextIdx==3){
                                //debugger;
                                $scope.submitCRN(event, item);
                            }
                            if (nextIdx==4){
                                //debugger;
                                $scope.submitTermCode(event, item);
                            }
                            //nextIdx++;
                            //debugger;
                            //angular.element(
                            //    
                            //        document.querySelector('#f_'+1)
                            //        //document.querySelector('#f_'+nextIdx)
                            //    )[0].focus();
                            //    document.getElementById("f_1").focus();
                                //$scope.showF_2 = true;
                        }
                        else{ // Need to check if this gets executed
                            if (nextIdx==1){
                                //debugger;
                                $scope.submitStaffCard(event, item);
                            }                              
                        }
                    }

                    $scope.submitStaffCard = function (event, item) {  
                        //debugger; 
          
                        var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                        //debugger; 
                                    /* if ( (key == 13) && (item.card) ) { */
                                    if ( key == 13 ) {
                                        //debugger; 
                                        //$scope.$apply(function () {
                                            //$scope.cardData = item.card.replace(/[^\w\s]/gi, '');
                                            
                                            //$scope.cardData = $scope.item.card.replace(/[^\w\s]/gi, '');
                                            $scope.cardData = $scope.item.card ? $scope.item.card.replace(/[^\w\s]/gi, '') : ''; //Replacing wtij blank if in case of null
                                            
                                            //console.log($scope.card);
                                            $scope.isteacherCardSwaped = !$scope.isteacherCardSwaped;
                                            $scope.item.card = $scope.cardData;      
                                            //debugger;
                                            //$scope.focusTrigger=true;
                                      //});
                                        //event.preventDefault();  
                                        //$scope.new(event, $scope.studentCard.replace(/[^\w\s]/gi, ''));
                                        //console.log("Typed value :- "+$scope.studentCard.replace(/[^\w\s]/gi, ''));
                                        $scope.cardData = "";
                                    /* } else if ( (key != 13) && (item.card) ) { */
                                    } else {
                                        $scope.cardData += event.key;
                                    }
                                    
          
          /*               $scope.cardData = item.card.replace(/[^\w\s]/gi, '');
                        console.log($scope.cardData);
                        $scope.isteacherCardSwaped = !$scope.isteacherCardSwaped;
                        $scope.item.card = $scope.cardData; */
                    };
                                                  
                    $scope.submitCRN = function (item) {
                        console.log(item);
                        $scope.isCrnEntered = !$scope.isCrnEntered;   

                        //debugger;
                        if($scope.isCrnEntered && $scope.isteacherCardSwaped && $scope.isTermCodeEntered){
                            $document.bind("keydown", $scope.keyPressEvent );
                        }
                        else if(!$scope.isCrnEntered && $scope.isteacherCardSwaped){
                            $document.unbind("keydown", $scope.keyPressEvent );
                        }                                             
                    };      
            
            /*         $scope.saveTask = function (event){
                        debugger;
                        if ($scope.isCrnEntered && $scope.isteacherCardSwaped && $scope.isTermCodeEntered && event.keyCode == 13){
                            debugger;
                                 $scope.studentCardsArray.push({
                                    "studentCard": $scope.studentCard.replace(/[^\w\s]/gi, ''),
                                }); 
                        }
                    } */
            
                    $scope.new = function(event, value){
                        //debugger;
                        if (value){
                            $scope.studentCardsArray.push(
                                {
                                    "studentCard": value,
                                    "editable": false
                                }
                            );                 
                        }
                    }
            
                    $scope.deleteStudent = function(event, student, index){
                        //debugger;
                            
                            //$scope.$apply(function () {
                                            
                                            
                                                         
                              for(var i = $scope.studentCardsArray.length - 1; i >= 0; i--) {
                                  if($scope.studentCardsArray[i]["studentCard"] === student.studentCard) {
                                    //$scope.studentCardsArray[i]["editable"] = !$scope.studentCardsArray[i]["editable"]; 
                                    $scope.editStudentCard(event, $scope.studentCardsArray[i]);

                                      $scope.studentCardsArray.splice(i, 1);
                                  }
                              }
                              $scope.cardsCount   = $scope.studentCardsArray.length;
                            console.log(student);
                          //}); 
                    }

                    $scope.ifExistsStudentCard = function(editStudentCard, newValue){
                        var hasValue = 0;
                        var returnValue = 0;
                        if(editStudentCard.length>0){
                            for(i=0; i < editStudentCard.length; i++){
                                if (editStudentCard[i]['studentCard']==newValue){
                                    hasValue = hasValue +1;
                                }                                
                            }
                            if (hasValue != 0){
                                returnValue = 0;
                            }
                            else{
                                returnValue = 1;
                            }
                        }
                        else{
                            returnValue = 1;
                        }
                        return returnValue;
                    }

                    $scope.$watch('studentCardTemp', function (newValue, oldValue) {
                        //debugger;
                        if((newValue != oldValue) && (newValue != "")){
                            if ($scope.ifExistsStudentCard($scope.studentCardsArray, newValue) !=0){
                                $scope.studentCardsArray.push(
                                    {
                                        "studentCard": newValue,
                                        "editable": false
                                    }
                                );
                            
                                $scope.cardsCount   = $scope.studentCardsArray.length;
								document.getElementById("lastTD").scrollIntoView();
                            }
                            //$scope.studentCardsArray.push(
                            //    {
                            //        "studentCard": newValue,
                            //        "editable": false
                            //    }
                            //);
                            //
                            //$scope.cardsCount   = $scope.studentCardsArray.length;               
          
                            }
                    },true); 
            
                    $scope.editStudentCard = function (event, item) {
                      //$scope.isStudentCardDisabled = !$scope.isStudentCardDisabled;
                      //debugger;
                      item.editable = !item.editable; 
                    }
          
                    $scope.keyPressEvent = function(event){
                        //debugger;
                        if($scope.isCrnEntered && $scope.isteacherCardSwaped && $scope.isTermCodeEntered){
                                //debugger;
                                
                                event.preventDefault();
                                event.stopPropagation();
                                var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                                        if ( key == 13 ) {
                                            //debugger; 
                                            $scope.$apply(function () {
                                                $scope.studentCardTemp = $scope.studentCard;
                                                //$scope.studentCardTemp = $scope.studentCard.replace(/[^\w\s]/gi, '');
                                            });
                                            //event.preventDefault();  
                                            //$scope.new(event, $scope.studentCard.replace(/[^\w\s]/gi, ''));
                                            console.log("Typed value :- "+$scope.studentCard.replace(/[^\w\s]/gi, ''));
                                            $scope.studentCard = "";
                                        }else {
                                            $scope.studentCard += event.key;
                                        } 
                                }
                    }

                    $scope.submitTermCode = function (event, item) {
                        $scope.isTermCodeEntered = ! $scope.isTermCodeEntered;
                        //debugger;
            
                         /* $scope.studentCardsArray.push(
                            {"studentCard": "111"}
                        ); */  
                        if($scope.isCrnEntered && $scope.isteacherCardSwaped && $scope.isTermCodeEntered){
                            $document.bind("keydown", $scope.keyPressEvent );
                        }
                        else if($scope.isCrnEntered && $scope.isteacherCardSwaped && !$scope.isTermCodeEntered){
                            $document.unbind("keydown", $scope.keyPressEvent );
                        }
                            

                    //    $document.bind("keydown", function(event) {
                    //    //$document.bind("keypress", function(event) {
                    //            if($scope.isCrnEntered && $scope.isteacherCardSwaped && $scope.isTermCodeEntered){
                    //            //debugger;
                    //            
                    //            event.preventDefault();
                    //            event.stopPropagation();
                    //            var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                    //                    if ( key == 13 ) {
                    //                        //debugger; 
                    //                        $scope.$apply(function () {
                    //                            $scope.studentCardTemp = $scope.studentCard;
                    //                            //$scope.studentCardTemp = $scope.studentCard.replace(/[^\w\s]/gi, '');
                    //                        });
                    //                        //event.preventDefault();  
                    //                        //$scope.new(event, $scope.studentCard.replace(/[^\w\s]/gi, ''));
                    //                        console.log("Typed value :- "+$scope.studentCard.replace(/[^\w\s]/gi, ''));
                    //                        $scope.studentCard = "";
                    //                    }else {
                    //                        $scope.studentCard += event.key;
                    //                    } 
                    //            }
                    //        }
                    //    );
                    


                    };
            



            
                    $scope.exportData = [];
                    $scope.exportData1 = [];
                    var blob;
                    $scope.fileSaved = true;
                    $scope.submitCardDetails = function(studentCardsArray){
                        $scope.fileSaved = false;

            //           /// JSP : Begin
            //           $scope.exportDataJsp = [];
            //           $scope.exportDataJsp.push(["StudentCard",
            //                                   "StaffCard",
            //                                   "CRN",
            //                                   "TermCode",
            //                                   "Date",
            //                                   "Day"
            //           ]);
            //
            //           angular.forEach(studentCardsArray, function (value, key) {
            //               //debugger;
            //               var d1 = new Date();
            //               var n1 = d1.getMonth() + 1;
            //               //debugger;//   
            //               $scope.exportDataJsp.push([value.studentCard,
            //                     $scope.item.card,
            //                     $scope.item.crn,
            //                     $scope.item.termCode,
            //                     new Date().getDate() + "/" + n1 + "/" + new Date().getFullYear(),
            //                     new Date().getDay()
            //               ]);
            //           });
            //
            //       /// JSP : End

                        angular.forEach(studentCardsArray, function(value, key) {
                          //debugger;
                          var d1 = new Date();
                            var n1 = d1.getMonth()+1;
                            //debugger;//   
                            $scope.exportData1.push([value.studentCard
                                ]);
                          });

                          var d = new Date();
                            var n = d.getMonth()+1;
                            //debugger;
                        //dateMonth = dateMonth+1;

                            var obj = {};
                            obj.name = 11;
                            obj.age = 22;

                           // var jsonData = "{'jsonData':'" + JSON.stringify(keywords) + "'}";//create string representation of the js object

                                                       //         $.post('ThankYou.aspx', {
                                                       //             "teacherCard": $scope.item.card,
                                                       //             "crnNumber": $scope.item.crn,
                                                       //             "termCode": $scope.item.termCode,
                                                       //             "test": JSON.stringify($scope.exportData1)
                                                       //         }, function (data) {
                                                       //             debugger;
                                                       //             console.log(data);
                                                       //             window.location.href = "ThankYou.aspx"
                                                       //         })
                                                       //       .done(function () {
                                                       //           console.log("success");
                                                       //           window.location.href = "ThankYou.aspx"
                                                       //       })
                                                       //       .fail(function () {
                                                       //           console.log("fail");
                                                       //           window.location.href = "ThankYou.aspx"
                                                       //       })
                                                       //       .always(function () {
                                                       //           console.log("always");
                                                       //           window.location.href = "ThankYou.aspx"
                                                       //       });

                            //$scope.datatoSend();

                            //debugger;
                            if ($scope.checkboxOptions[1]["isChecked"] === true) {
                                cardDetails.createHeatTkt($scope.item.card, $scope.item.crn, $scope.item.termCode)
                                  .then(function (data) {
                                      //debugger;
                                      if (data.d[0]["message"] === 'True') {
                                          //$scope.dataToSend($scope.item.card, $scope.item.crn, $scope.item.termCode, studentCardsArray, data.d[0]["heatId"]);

                                          cardDetails.createCsv(
                                                $scope.item.card,
                                                $scope.item.crn,
                                                $scope.item.termCode,
                                                $scope.dataToSend($scope.item.card, $scope.item.crn, $scope.item.termCode, studentCardsArray, data.d[0]["heatId"], data.d[0]["sentToEmail"]),
                                                data.d[0]["heatId"])
                                          //cardDetails.createCsv($scope.item.card, $scope.item.crn, $scope.item.termCode, $scope.exportDataJsp, data.d[0]["heatId"])
                                              .then(function (data) {
                                                  //debugger;
                                                  window.location.href =  '<%=FromServerThankYou %>';
                                              })
                                              .catch(function (data) {
                                                  debugger;
                                                  $log.error(data);
                                                  window.location.href = '<%=FromServerThankYou %>';
                                              });
                                      }

                                  })
                                  .catch(function (data) {
                                      debugger;
                                      $log.error(data);
                                  });
                            } else {
                                //debugger;
                                //$scope.dataToSend($scope.item.card, $scope.item.crn, $scope.item.termCode, studentCardsArray, "NoneId");

                                cardDetails.createCsv(
                                      $scope.item.card,
                                      $scope.item.crn,
                                      $scope.item.termCode,
                                      $scope.dataToSend($scope.item.card, $scope.item.crn, $scope.item.termCode, studentCardsArray, "NoneId", "NoneEmail"),
                                      //$scope.exportDataJsp,
                                      "NoneId")
                                //cardDetails.createCsv($scope.item.card, $scope.item.crn, $scope.item.termCode, $scope.exportDataJsp, "None")
                                    .then(function (data) {
                                        //debugger;
                                        window.location.href = '<%=FromServerThankYou %>';
                                    })
                                    .catch(function (data) {
                                        debugger;
                                        $log.error(data);
                                        window.location.href = '<%=FromServerThankYou %>';
                                    });
                            }




                     //     $.ajax({
                     //         //url: "ThankYou.jsp",
                     //         //url: "http://kismsbat-dev:8082/barCode/ThankYou.jsp",
                     //         url: '<%=FromServerThankYou %>',
                     //         type: "POST",
                     //         cache: false,
                     //         /*
                     //                 dataType: "jsonp",
                     //                 crossDomain: true,
                     //                 async: "false",                                
                     //         */
                     //         data: {
                     //             "teacherCard": $scope.item.card,
                     //             "crnNumber": $scope.item.crn,
                     //             "termCode": $scope.item.termCode,
                     //             "test[]": $scope.exportDataJsp
                     //         },
                     //         success: function (data, textStatus, jqXHR) {
                     //             //debugger;
                     //             //isChecked//
                     //             if ($scope.checkboxOptions[1]["isChecked"] === true) {
                     //
                     //                 $.ajax({
                     //                     type: "POST",
                     //                     url: '<%=FromServerAttendanceMarking %>' + "/CreateTicket",
                     //                     //url: "AttendanceMarking.aspx/CreateTicket",
                     //                     //data: '{staffNumber: "' + $scope.item.card + '" }',
                     //                     data: JSON.stringify({
                     //                         staffNumber: $scope.item.card,
                     //                         crn: $scope.item.crn,
                     //                         termCode: $scope.item.termCode
                     //                     }),
                     //                     contentType: "application/json; charset=utf-8",
                     //                     dataType: "json",
                     //                     //crossDomain: true,
                     //                     //async: "false",
                     //                     //cache: "false",
                     //                     success: function (msg) {
                     //                         debugger;
                     //                         window.location.href = '<%=FromServerThankYou %>'//"http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //                     },
                     //                     Error: function (x, e) {
                     //                         debugger;
                     //                         window.location.href = '<%=FromServerThankYou %>'//"http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //                     }
                     //                 });
                     //             }
                     //
                     //             //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //
                     //
                     //             $scope.exportData1 = "";
                     //             if (data) {
                     //                 console.log(data);
                     //             }
                     //         },
                     //
                     //         error: function (jqXHR, textStatus, errorThrown) {
                     //             debugger;
                     //
                     //             if ($scope.checkboxOptions.displayValue === "Yes") {
                     //
                     //                 $.ajax({
                     //                     type: "POST",
                     //                     url: '<%=FromServerAttendanceMarking %>' + "/CreateTicket",
                     //                     //url: "AttendanceMarking.aspx/CreateTicket",
                     //                     data: '{name: "' + "valueTest" + '" }',
                     //                     contentType: "application/json; charset=utf-8",
                     //                     dataType: "json",
                     //                     //crossDomain: true,
                     //                     //async: "false",
                     //                     //cache: "false",
                     //                     success: function (msg) {
                     //                         //debugger;
                     //                         window.location.href = '<%=FromServerThankYou %>'//"http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //                     },
                     //                     Error: function (x, e) {
                     //                         debugger;
                     //                         window.location.href = '<%=FromServerThankYou %>'//"http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //                     }
                     //                 });
                     //             }
                     //
                     //
                     //             console.log('The following error occurred: ' + textStatus, errorThrown);
                     //             //window.location.href = "http://kismsbat-dev:8082/barCode/ThankYou.jsp"
                     //         },
                     //
                     //         complete: function (jqXHR, textStatus) {
                     //         }
                     //     });








                ///   $.ajax({
                ///   
                ///       type: "POST",
                ///       url: "ThankYou.aspx/AttendanceData",
                ///       data: JSON.stringify(obj),
                ///       contentType: "application/json; charset=utf-8",
                ///       dataType: "json",
                ///       success: function (data, textStatus, jqXHR){
				///   		debugger;
                ///           //window.location.href = "ThankYou.aspx"
				///   		$scope.exportData1 = "";
                ///           if(data){
                ///               console.log(data);
                ///           }
                ///       },
                ///   
                ///       error: function (jqXHR, textStatus, errorThrown) {
				///   		debugger;
				///   		
                ///           console.log('The following error occurred: ' + textStatus, errorThrown);
                ///           //window.location.href = "ThankYou.aspx"
                ///       },
                ///   
                ///       complete: function (jqXHR, textStatus) {
                ///       }
                ///   });

                        $scope.exportData.push(["StudentCard",
                                                //"",//StaffCard",
                                                "StaffCard",
                                               // "",//"CRN",
                                                "CRN",
                                                //"",//"TermCode",
                                                "TermCode",
                                                //"",
                                                "Date",
                                                "Day"
                                                //""
                                              ]);

                    //  $scope.exportData.push(["", 
                    //                            "",//StaffCard",
                    //                            $scope.item.card,                                            
                    //                            "",//"CRN",
                    //                            $scope.item.crn,                                            
                    //                            "",//"TermCode",
                    //                            $scope.item.termCode,                                            
                    //                            "",
                    //                            Date(),
                    //                            ""//"Date",
                    //                          ]);

                    

                        angular.forEach(studentCardsArray, function(value, key) {
                          //debugger;
                          $scope.exportData.push([value.studentCard, 
                                $scope.item.card,                                            
                                $scope.item.crn,
                                $scope.item.termCode,
                                new Date().getDate()+"/"+new Date().getMonth()+1+"/"+new Date().getFullYear(),
                                new Date().getDay()
                                ]);
                                //                      "",
                                //                      "",
                                //                      "",
                                //                      "",
                                //                      "",
                                //                      Date(),
                                //                      ""
                                //                      ]);
                          });           
                  //     $scope.filename = $scope.item.card + "_" +
                  //                         $scope.item.crn + "_" +
                  //                         $scope.item.termCode+ "_" +
                  //                         //Date()+ "_" +
                  //                         new Date().getDate()+"_"+new Date().getMonth()+1+"_"+new Date().getFullYear()
                  //                              +"_" +new Date().getHours()+"_" +new Date().getMinutes()+
                  //                         ".csv";
                          //debugger;
                //         var processRow = function (row) {
                //             var finalVal = '';
                //             for (var j = 0; j < row.length; j++) {
                //                 var innerValue = row[j] === null ? '' : row[j].toString();
                //                 if (row[j] instanceof Date) {
                //                     innerValue = row[j].toLocaleString();
                //                 };
                //                 var result = innerValue.replace(/"/g, '""');
                //                 if (result.search(/("|,|\n)/g) >= 0)
                //                     result = '"' + result + '"';
                //                 if (j > 0)
                //                     finalVal += ',';
                //                 finalVal += result;
                //             }
                //             return finalVal + '\n';
                //         };
          
                  //       var csvFile = '';
                  //       for (var i = 0; i < $scope.exportData.length; i++) {
                  //           csvFile += processRow($scope.exportData[i]);
                  //       }
          
                          //var blob = new Blob([csvFile], { type: 'text/csv;charset=utf-8;' });
                  //        blob = new Blob([csvFile], { type: 'text/csv;charset=utf-8;' });
                    //    if (navigator.msSaveBlob) { // IE 10+
                    //        navigator.msSaveBlob(blob, $scope.filename);
                    //    } else {
                    //        var link = document.createElement("a");
                    //        if (link.download !== undefined) { // feature detection
                    //            // Browsers that support HTML5 download attribute
                    //            var url = URL.createObjectURL(blob);
                    //            link.setAttribute("href", url);
                    //            link.setAttribute("download", $scope.filename);
                    //            link.style.visibility = 'hidden';
                    //            document.body.appendChild(link);
                    //            //$scope.initSaveFileToSp();
                    //            //link.click();
                    //            document.body.removeChild(link);
                    //        }
                    //    }            
                    };
            
             //      $scope.initSaveFileToSp =function() {
	         //          //debugger;
             //          SP.SOD.executeFunc('sp.js', 'SP.ClientContext', readFile);
	         //          //alert("Operation Successfully Completed");
	         //
	         //          //initRetrieve();
             //      }


  //     function readFile()  
  //     {  
  //         //Get File Input Control and read th file name  
  //         //var element = document.getElementById("getFile");  
  //         //var file = element.files[0]; 
  //         //var file = link.files[0]; 
  //         //var parts = element.value.split("\\");  
  //         //var fileName = parts[parts.length - 1];  
  //         //Read File contents using file reader  
  //         var reader = new FileReader();  
  //         //debugger;
  //         reader.onload = function(e)  
  //         {  
  //             //uploadFile(e.target.result, fileName);  
  //             //uploadFile(e.target.result, blob);// $scope.filename
  //             addItem(e.target.result, blob);
  //         }  
  //         reader.onerror = function(e)  
  //         {  
  //             alert(e.target.error);  
  //         }  
  //         reader.readAsArrayBuffer(blob);  
  //     }           

   // function addItem(buffer, fileName) {
   //     var call = uploadDocument(buffer, fileName);
   //     call.done(function (data, textStatus, jqXHR) {
   //         //$scope.fileSaved = true;
   //         var call2 = getItem(data.d);
   //         call2.done(function (data, textStatus, jqXHR) {
   //             var item = data.d;
   //             var call3 = updateItemFields(item);
   //             call3.done(function (data, textStatus, jqXHR) {
   //                 $scope.fileSaved = true;
   //                 var div = jQuery("#message");
   //                 div.text("Item added");
   //             });
   //             call3.fail(function (jqXHR, textStatus, errorThrown) {
   //                 failHandler(jqXHR, textStatus, errorThrown);
   //             });
   //         });
   //         call2.fail(function (jqXHR, textStatus, errorThrown) {
   //             failHandler(jqXHR, textStatus, errorThrown);
   //         });
   //     });
   //     call.fail(function (jqXHR, textStatus, errorThrown) {
   //         failHandler(jqXHR, textStatus, errorThrown);
   //     });
   // }
  // function uploadDocument(buffer, fileName) {
  //     var url = String.format(
  //         "{0}/_api/Web/Lists/getByTitle('Project Documents')/RootFolder/Files/Add(url='{1}', overwrite=true)",
  //         _spPageContextInfo.webAbsoluteUrl, $scope.filename);//fileName+$scope.filename
  //     var call = jQuery.ajax({
  //         url: url,
  //         type: "POST",
  //         data: buffer,
  //         processData: false,
  //         headers: {
  //             Accept: "application/json;odata=verbose",
  //             "X-RequestDigest": jQuery("#__REQUESTDIGEST").val(),
  //             "Content-Length": buffer.byteLength
  //         }
  //     });
  //
  //     return call;
  // }
  // function getItem(file) {
  //     var call = jQuery.ajax({
  //         url: file.ListItemAllFields.__deferred.uri,
  //         type: "GET",
  //         dataType: "json",
  //         headers: {
  //             Accept: "application/json;odata=verbose"
  //         }
  //     });
  //
  //     return call;
  // }
  //  function updateItemFields(item) {
  //      var now = new Date();
  //      var call = jQuery.ajax({
  //          url: _spPageContextInfo.webAbsoluteUrl +
  //              "/_api/Web/Lists/getByTitle('Project Documents')/Items(" +
  //              item.Id + ")",
  //          type: "POST",
  //          data: JSON.stringify({
  //              "__metadata": { type: "SP.Data.Project_x0020_DocumentsItem" },
  //              //Year: now.getFullYear()
  //          }),
  //          headers: {
  //              Accept: "application/json;odata=verbose",
  //              "Content-Type": "application/json;odata=verbose",
  //              "X-RequestDigest": jQuery("#__REQUESTDIGEST").val(),
  //              "IF-MATCH": item.__metadata.etag,
  //              "X-Http-Method": "MERGE"
  //          }
  //      });
  //
  //      return call;
  //  }
  //  function failHandler(jqXHR, textStatus, errorThrown) {
  //      var response = JSON.parse(jqXHR.responseText);
  //      var message = response ? response.error.message.value : textStatus;
  //      alert("Call failed. Error: " + message);
                            //  }

                            //$scope.dataToSend = function (card, crn, termCode, studentCardsArray, heatIdGenerated) {
                            $scope.dataToSend = function (card, crn, termCode, studentCardsArray, heatIdGenerated, emailId) {

                                //debugger;
                                console.log(studentCardsArray);
                                var heatId = heatIdGenerated == "NoneId" ? "NoneId" : heatIdGenerated;

                                var exportDataJsp = [];
                                exportDataJsp.push(["StudentCard",
                                                        "StaffCard",
                                                        "CRN",
                                                        "TermCode",
                                                        "Date",
                                                        "Day",
                                                        "heatId"
                                                        , "emailId"
                                ]);

                                angular.forEach(studentCardsArray, function (value, key) {
                                    //debugger;
                                    var d1 = new Date();
                                    var n1 = d1.getMonth() + 1;
                                    //debugger;//   
                                    exportDataJsp.push([
                                          //value[key].studentCard,
                                          //value[0],
                                          value.studentCard,
                                          card,
                                          crn,
                                          termCode,
                                          new Date().getDate() + "/" + n1 + "/" + new Date().getFullYear(),
                                          new Date().getDay(),
                                          heatId,
                                          emailId
                                    ]);
                                });

                                /// JSP : End

                            //    angular.forEach(studentCardsArray, function (value, key) {
                            //        //debugger;
                            //        var d1 = new Date();
                            //        var n1 = d1.getMonth() + 1;
                            //        //debugger;//   
                            //        $scope.exportData1.push([value.studentCard
                            //        ]);
                            //    });



                                return exportDataJsp;
                            }

                    $scope.submitForm = function (item) {
                        //debugger;
                        $scope.isSubmittingForButton = true;
                        
               /*         //cardDetails.getRequest()
                         details.postNewResource(item).then(function (data) {
                            console.log(data);
                            var userNameBkp = $scope.item.userName;
                            $scope.item = [];
                            $scope.item.userName = userNameBkp;
            
                            $scope.isSubmittingForButton = false;
                        }); */
                    };
            
                    }]); 
            
                // Factory Service
               angular.module('moduleApp').factory("cardDetails", ["$http", "$q", function ($http, $q) {




                   var createHeatTkt = function (card, crn, termCode) {
                       //debugger;
                       var deferred = $.Deferred();

                       $.ajax({
                           type: "POST",
                           url: '<%=FromServerAttendanceMarking %>' + "/CreateTicket",
                           data: JSON.stringify({
                               staffNumber: card,
                               crn: crn,
                               termCode: termCode
                           }),
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: function (msg) {
                               //debugger;
                               deferred.resolve(msg);
                           },
                           Error: function (x, e) {
                               debugger;
                               deferred.resolve(x);
                           }
                       });


                       return deferred.promise();
                  };

                   var createCsv = function (card, crn, termCode, exportDataJsp, heatId) {

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
                      createHeatTkt: createHeatTkt
                  };
              }]);	
                    
            </script>


</body>
</html>
