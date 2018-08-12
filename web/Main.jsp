<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="sidebar.jsp"%>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>

        <!-- Bootstrap core CSS     -->
        <link href="design/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="design/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="design/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="design/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="design/css/pe-icon-7-stroke.css" rel="stylesheet" />
   </head>
    
    <body>
            
        <div class ="wrapper">
            <div class="main-panel">
                
            <div class="content">
            <div class="container-fluid">
           
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">

                            <div class="header">
                                <h4 class="title">Today's Revenue</h4>
                                <p class="category">Total Sales for the Day</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
                                    <canvas id="salesChart"></canvas>
                                </div>
                                
                                <script>
                                    var salesChart = document.getElementById('salesChart').getContext('2d');
                                    
                                   
                                
                                    var salesPerformanceChart = new Chart(salesChart,{
                                        type:'doughnut',
                                        data: {
                                            labels:['achieved', 'targeted'],
                                            datasets:[{
                                                    label:'$',
                                                    data:[5204, 7500],
                                                    backgroundColor:['#FFC925',
                                                    '#42B3C5']   
                                                }]
                                            },
                                            options:{
                                                legend:{
                                                    display: false
                                                }
                                            }
                                        }     
                                    )
                                </script>
                                    
                                   

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-warning"></i> Achieved
                                        <i class="fa fa-circle text-info"></i> Targeted
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Consumer Behavior</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
                                    <canvas id="behaviourChart"></canvas>
                                </div>
                                
                                <script>
                                    var salesChart = document.getElementById('behaviourChart').getContext('2d');
                                    
                                   
                                
                                    var salesPerformanceChart = new Chart(behaviourChart,{
                                        type:'bar',
                                        data: {
                                            labels:['Breakfast', 'Lunch', 'Dinnner'],
                                            datasets:[{
                                                    label:'tables',
                                                    data:[24,69,97],
                                                    backgroundColor:['#1DC7EA','#FF4A55','#87CB16']   
                                                }]
                                            },
                                            options:{
                                                legend:{
                                                    display: false
                                                }
                                            }
                                        }     
                                    )
                                </script>
                                
                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Breakfast
                                        <i class="fa fa-circle text-danger"></i> Lunch
                                        <i class="fa fa-circle text-success"></i> Dinner
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            </div>
            </div>
            
        </div>
    </body>
    
    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
                    
              
</html>
