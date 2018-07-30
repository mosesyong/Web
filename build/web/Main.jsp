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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <title>Main Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>
        <link rel="stylesheet" href="CSS/sidebar.css">
        <link rel="stylesheet" href="CSS/mainbody.css">
        
    </head>
    
    <body>
        <div id="page-content-wrapper">
            <div class="containter-fluid">
                <%=u%>
                <br>
                 <div class="row">
                    <div class="col-12">
                        <canvas id='outletChart' width="200" height="100"></canvas> 
                    </div>
                    <script>
            var outletChart = document.getElementById('outletChart').getContext('2d');
            
            //Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 12;
            Chart.defaults.global.defaultFontColor = 'black';
            
            var oChart = new Chart(outletChart, {
                type:'bar',//bar, horizontalBar, pie, line, doughnut, radar, polarArea
                data:{
                    labels:['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday'],
                    datasets:[{
                            label:'Total Sales',
                            data:[
                                240, 
                                318, 
                                362, 
                                650, 
                                810, 
                                912,
                                928
                                ],
                            backgroundColor: '#FDCC1A',
                            borderWidth: 1,
                            borderColor: 'white'                           
                    }],
                    
                },
                options:{
                    title:{
                        display:true,
                        text:'Daily Sales for 22 July - 28 July',
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
              <!--<div class ="col-12">
                        <canvas id='branchesChart' width="200" height="100"></canvas>   
              </div>-->
            </div>
            </div>
            <script>
            /*var branchesChart = document.getElementById('branchesChart').getContext('2d');
            
            //Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 12;
            Chart.defaults.global.defaultFontColor = 'black';
            
            var bChart = new Chart(branchesChart, {
                type:'bar',//bar, horizontalBar, pie, line, doughnut, radar, polarArea
                data:{
                    labels:['outlet1', 'outlet2', 'outlet3', 'outlet4', 'outlet5', 'outlet6'],
                    datasets:[{
                            label:'Total Sales',
                            data:[
                                1870, 
                                1235, 
                                857, 
                                1149, 
                                2301, 
                                838
                                ],
                            backgroundColor: '#FDCC1A',
                            borderWidth: 1,
                            borderColor: 'white'                           
                    }]
                },
                options:{
                    title:{
                        display:true,
                        text:'Weekly Sales for 22 July - 28 July',
                        fontSize: 16
                    },
                    layout:{
                        padding:{
                            left: 550,
                            right: 50,
                            bottom: 50,
                            top:0
                        }
                    }
                        
                    
                }
            });
                
                
             */   
            </script>
                
                
            </div>
        
    </body>
</html>
