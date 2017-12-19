<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HasCrn.aspx.cs" Inherits="AttendanceMarking.Pages.HasCrn" %>

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

</head>
<body>

    <div class="jumbotron jumbotron-fluid bg-primary">
        <p class="h1 text-white text-center">Student Attendance System</p>
    </div>
    <div class="container container-fluid">
        <div class="row">
            <div class="col-6">
                <button type="button" class="btn btn-success btn-block font-weight-bold" style="height: 20rem; font-size:1.8rem;"
                    onclick="window.location='<%=FromServerSingleCRN%>';">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <span>Click here for Single CRN</span>
                </button>
            </div>
            <div class="col-6">
                <button type="button" class="btn btn-success btn-block font-weight-bold" style="height: 20rem; font-size:1.8rem;"
                    onclick="window.location='<%=FromServerMultiCRN%>';">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <span>Click here for Cluster CRN</span>
                </button>
            </div>
        </div>
<%--        <div class="row mt-5">
            <div class="col">
                <div class="d-flex bg-success text-white align-items-center justify-content-center" style="height: 20rem;" 
                            onclick="window.location='<%=FromServerSingleCRN%>';">
                    <div class="h1"> Click here for Single CRN</div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex bg-success text-white align-items-center justify-content-center" style="height: 20rem;" 
                            onclick="window.location='<%=FromServerMultiCRN%>';">
                    <div class="h1"> Click here for Cluster Class</div>
                </div>                
            </div>
        </div>--%>
    </div>

</body>
</html>
