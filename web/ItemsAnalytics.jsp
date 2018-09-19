<%-- 
    Document   : ItemsAnalytics
    Created on : 14 Aug, 2018, 8:13:40 PM
    Author     : sharonpurbowo
--%>

<%@page import="Entity.TransactionData"%>
<%@page import="Entity.Transaction"%>
<%@page import="Dao.TransactionDao"%>
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
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
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
         
        <script>
            /* When the user clicks on the button, 
            toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }

            // Close the dropdown menu if the user clicks outside of it
            window.onclick = function(event) {
              if (!event.target.matches('.dropbtn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                  var openDropdown = dropdowns[i];
                  if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                  }
                }
              }
            }
        </script>
          
   </head>
    
    <body>
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Company Analytics</h4>
                                    </div>

                                    <div class="content">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="dropdown">
                                                    <button onclick="myFunction()" class="dropbtn">Select Report</button>
                                                    <div id="myDropdown" class="dropdown-content">
                                                      <a href="SalesAnalytics.jsp">Sales Report</a>
                                                      <a href="ItemsAnalytics.jsp">Items Report</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <%
                                            ArrayList<String> weeklyItems = new ArrayList<>();
                                            ArrayList<String> weeklyItemsQty = new ArrayList<>();
                                            ArrayList<String> monthlyItems = new ArrayList<>();
                                            ArrayList<String> monthlyItemsQty = new ArrayList<>();
                                            ArrayList<String> yearlyItems = new ArrayList<>();
                                            ArrayList<String> yearlyItemsQty = new ArrayList<>();

                                            ArrayList<Transaction> transactionList = TransactionDao.getTransactions("items");
                                            for(Transaction i : transactionList){
                                                String period = i.getPeriod();
                                                if(period.equals("week")){
                                                    ArrayList<TransactionData> iDataList = i.getTransactionDataList();
                                                    for(TransactionData iData : iDataList){
                                                            String itemName = "\'" + iData.getName() + "\'";
                                                            weeklyItems.add(itemName);
                                                            String itemQty = "\'" + Integer.toString(iData.getQuantity()) + "\'";
                                                            weeklyItemsQty.add(itemQty);
                                                    }
                                                }else if(period.equals("month")){
                                                    ArrayList<TransactionData> iDataList = i.getTransactionDataList();
                                                    for(TransactionData iData : iDataList){
                                                            String itemName = "\'" + iData.getName() + "\'";
                                                            monthlyItems.add(itemName);
                                                            String itemQty = "\'" + Integer.toString(iData.getQuantity()) + "\'";
                                                            monthlyItemsQty.add(itemQty);
                                                    }
                                                }else if(period.equals("year")){
                                                    ArrayList<TransactionData> iDataList = i.getTransactionDataList();
                                                    for(TransactionData iData : iDataList){
                                                            String itemName = "\'" + iData.getName() + "\'";
                                                            yearlyItems.add(itemName);
                                                            String itemQty = "\'" + Integer.toString(iData.getQuantity()) + "\'";
                                                            yearlyItemsQty.add(itemQty);
                                                        }  
                                                }  
                                            }


                                        %>                        
                <div class="row">
                    <div class="col-md-5" style='height:400px;'>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Weekly Item Orders</h4>
                                <p class="category">Total Sales of Each Item for the Week</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square">
                                    <canvas id="weeklyItems"></canvas>
                                </div>
                                <script>
                                    var weeklyItems = document.getElementById('weeklyItems').getContext('2d');
                                    var weeklyItemsChart = new Chart(weeklyItems,{
                                        type:'bar',
                                        data: {
                                            labels:<%=weeklyItems%>,
                                            datasets:[{
                                                    label:'Orders',
                                                    data:<%=weeklyItemsQty%>,
                                                    backgroundColor:'#FFC925'  
                                                }]
                                            },
                                            options:{
                                                legend:{
                                                    display: true
                                                },
                                                scaleShowValues:true,
                                                scales:{
                                                    yAxes: [{
                                                        ticks:{
                                                            beginAtZero:true
                                                        }
                                                    }],
                                                    xAxes: [{
                                                        ticks:{
                                                            autoSkip:false
                                                        }
                                                    }]
                                                },
                                                responsive: true,
                                                maintainAspectRatio: false
                                            }
                                        }     
                                    );
                                </script>   
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7" style="height:50px;">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Monthly Item Orders</h4>
                                <p class="category">Total Sales of Each Item for the Month</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
                                    <canvas id="monthlyItems"></canvas>
                                </div>
                                
                                <script>
                                    var monthlyItems = document.getElementById('monthlyItems').getContext('2d');
                                    var monthlyItemsChart = new Chart(monthlyItems,{
                                        type:'bar',
                                        data: {
                                            labels:<%=monthlyItems%>,
                                            datasets:[{
                                                    label:'Orders',
                                                    data:<%=monthlyItemsQty%>,
                                                    backgroundColor:'#FFC925'  
                                                }]
                                            },
                                            options:{
                                                legend:{
                                                    display: true
                                                },
                                                scaleShowValues:true,
                                                scales:{
                                                    yAxes: [{
                                                        ticks:{
                                                            beginAtZero:true
                                                        }
                                                    }],
                                                    xAxes: [{
                                                        ticks:{
                                                            autoSkip:false
                                                        }
                                                    }]
                                                },
                                                responsive: true,
                                                maintainAspectRatio: false
                                            }
                                        }     
                                    );
                                </script>
                            </div>
                        </div>
                    </div>
                </div>   
                                                    
                <div class="row">
                    <div class="col-md-12" style='height:400px;'>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Annual Item Orders</h4>
                                <p class="category">Total Sales of Each Item for the Year</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
                                    <canvas id="yearlyItems"></canvas>
                                </div>
                                
                                <%
                                    System.out.println(yearlyItems);
                                    System.out.println(yearlyItemsQty);
;                                    %>
                                <script>
                                    var yearlyItems = document.getElementById('yearlyItems').getContext('2d');
                                    console.log("stop");                                
                                    var yearlyItemsChart = new Chart(yearlyItems,{
                                        type:'bar',
                                        data: {
                                            labels:<%=yearlyItems%>,
                                            datasets:[{
                                                    label:'Orders',
                                                    data:<%=yearlyItemsQty%>,
                                                    backgroundColor:'#FFC925'  
                                                }]
                                            },
                                            options:{
                                                legend:{
                                                    display: true
                                                },
                                                scaleShowValues:true,
                                                scales:{
                                                    yAxes: [{
                                                        ticks:{
                                                            beginAtZero:true
                                                        }
                                                    }],
                                                    xAxes: [{
                                                        ticks:{
                                                            autoSkip:false
                                                        }
                                                    }]
                                                },
                                                responsive: true,
                                                maintainAspectRatio: false
                                            }
                                        }     
                                    );
                                </script>   
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
</div>
</div>
       <!--                                            <div class="col-md-5">
                                                <div class="dropdown">
                                                    <button onclick="myFunction()" class="dropbtn">Select Report</button>
                                                    <div id="myDropdown" class="dropdown-content">
                                                      <a href="SalesAnalytics.jsp">Sales Report</a>
                                                      <a href="ItemsAnalytics.jsp">Items Report</a>
                                                    </div>
                                                </div>
                                            </div>-->
    </body>
    

              
</html>

