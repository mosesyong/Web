<%-- 
    Document   : monthly
    Created on : Jul 28, 2018, 3:19:02 PM
    Author     : sharon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Analytics</title>
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/mainbody.css">
        
        <style>           
            .btn:hover{
                position: relative;
                background:#D08D29;
                color:white;
            }
            
            .dropdown-menu{
                position: absolute;
                left: 120px;
            }
          
        </style>

    </head>
    <body>
    <div id="page-content-wrapper">
            <div class="containter-fluid">    
                <div class="row">
                    <div class="col-12">
                        <h1>Monthly Performance Report</h1>
                        <div class="dropdown">
                            Select Report Type: 
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                            Select Report 
                            <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><a role="reportType" href="daily.jsp">Daily Sales</a></li>
                                <li role="presentation"><a role="reportType" href="weekly.jsp">Weekly Sales</a></li>
                                <li role="presentation"><a role="reportType" href="monthly.jsp">Monthly Performance</a></li>
                                <li role="presentation"><a role="reportType" href="annual.jsp">Annual Performance</a></li>
                                <li role="presentation"><a role="reportType" href="itemSales.jsp">Total Items Sold</a></li>
                            </ul>
                        </div>
                        
                       <canvas id='monthlyPerf' width="165" height="80"></canvas> 
                        
                    </div>
                    <script>
                        var monthlyPerf = document.getElementById('monthlyPerf').getContext('2d');
            
                        //Global Options
                        Chart.defaults.global.defaultFontFamily = 'Lato';
                        Chart.defaults.global.defaultFontSize = 12;
                        Chart.defaults.global.defaultFontColor = 'black';

                        var mChart = new Chart(monthlyPerf, {
                        type:'bar',//bar, horizontalBar, pie, line, doughnut, radar, polarArea
                        data:{
                            labels:['January','February','March','April','May','June','July','August','September','October','November','December'],
                            datasets:[{
                                label:'Total Sales',
                                data:[
                                    6123, 
                                    12873, 
                                    8490, 
                                    10939, 
                                    9208, 
                                    10283,
                                    11093,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0
                                    ],
                                backgroundColor: '#FDCC1A',
                                borderWidth: 1,
                                borderColor: 'white'                           
                            }],
                    
                        },
                options:{
                    title:{
                        display:true,
                        text:'2018 Monthly Sales Performance',
                        fontSize: 16
                    },
                    layout:{
                        padding:{
                            left: 50,
                            right: 50,
                            bottom: 50,
                            top:0
                            
                        },
                        
                    } 
                }
            });     
                    </script>
                </div>
            </div>
         </div>
    </body>
</html>
