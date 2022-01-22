


<%@page import=" services.SalleService"%>
<%@page import=" beans.Salle"%>
<%@include file=" navigation.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Charts</title>
    <!-- base:css -->
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
    
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="script/chart1.js" type="text/javascript"></script>
       <link href="style/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        
        <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <h4 class="card-title">Bar chart</h4>
                  <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                </div>
    </body>
    
</html>
