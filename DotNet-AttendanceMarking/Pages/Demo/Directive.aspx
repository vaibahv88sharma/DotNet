<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Directive.aspx.cs" Inherits="AttendanceMarking.Pages.Demo.Directive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <%--<script src="../../BKI/jquery.min.js"></script>--%>
    <script src="../../BKI/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    
    <%--<script src="../../BKI/angular.1.0.min.js"></script>--%>
    <script src="../../BKI/angular.min.js"></script>

    <script src="../../BKI/bootstrap.min.js"></script>

    <%--<script src="../BKI/angular-resource.min.js"></script>--%>

    <link rel="stylesheet" href="../../BKI/bootstrap.min.css" />

    <title>Demo</title>


<script>

angular.module('MyModule', []).controller('DefaultCtrl',['$scope', function($scope) {}])

.factory('autoCompleteDataService', [function() {
return {
    getSource: function() {
        //this is where you'd set up your source... could be an external source, I suppose. 'something.php'
        return ['apples', 'oranges', 'bananas'];
    }
}
}])

.directive('autoComplete', function(autoCompleteDataService) {
return {
    restrict: 'A',
    link: function(scope, elem, attr, ctrl) {
                // elem is a jquery lite object if jquery is not present,
                // but with jquery and jquery ui, it will be a full jquery object.
        //debugger;
        elem.autocomplete({
            //source: autoCompleteDataService.getSource(), //from your service
						///*
            source:function (request, response) {
                //var i = 1;
                debugger;
                response(autoCompleteDataService.getSource());
            }, 
            //*/
            minLength: 2
        });
    }
};
});

$(function () {
    var yerler = [{
        "value": 3,
        "label": "Adana Seyhan"
    }, {
        "value": 78,
        "label": "Seyhan Adana"
    }, {
        "value": 17,
        "label": "Paris Fransa"
    }, {
        "value": 123,
        "label": "Tokyo Japan"
    }];
    $("#tags").autocomplete({
        source: yerler,
        minLength: 2,
        focus: function (event, ui) {
            event.preventDefault();
            $("#tags").val(ui.item.label);
        },
        select: function (event, ui) {
            event.preventDefault();
            $("#projeKatmanRaporCbx").val(ui.item.value);
            $("#tags").val(ui.item.label);
        }
    });
});



</script>


</head>
<body>
    

    <div ng-app='MyModule'>
        <div ng-controller='DefaultCtrl'>
            <input type="text" ng-model="foo" auto-complete/>
                      Foo = {{foo}}

            <%--<div class="ui-widget">
                <label for="tags">Tags:</label>
                <input id="tags" />
                <input type="text" id="projeKatmanRaporCbx" />
            </div>--%>

            <div class="">
                <label for="tags">Tags:</label>
                <input id="tags" ng-model="data" /> 
                <input type="text" id="projeKatmanRaporCbx" />
            </div>

            <br />
            {{data}}



        </div>
    </div>

</body>
</html>
