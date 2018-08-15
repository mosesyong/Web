<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="Entity.TransactionData"%>
<%@page import="Dao.TransactionDao"%>
<%@page import="Entity.Transaction"%>
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
                        <%
                                        double dailySales = 0.0;
                                        double weeklySales = 0.0;
                                        double monthlySales = 0.0;
                                        double yearlySales = 0.0;
                                        double sales = 0.0;
                                        ArrayList<Double> totalPriceList = new ArrayList<>();
                                        
                                        ArrayList<Transaction> transactionList = TransactionDao.getTransaction("sales");  
                                        for (Transaction t : transactionList){
                                            ArrayList<TransactionData> tDataList = t.getTransactionDataList();
                                            
                                            for (TransactionData tData : tDataList){
                                                sales = tData.getTotalPrice();
                                                totalPriceList.add(sales);
                                            }
                                        }
                                        
                                       
                                        
                                        dailySales = totalPriceList.get(0);
                                        weeklySales = totalPriceList.get(1);
                                        monthlySales = totalPriceList.get(2);
                                        yearlySales = totalPriceList.get(3); 

                                        %>
                        
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="card card-stats">
                                  <div class="card-body ">
                                    <div class="row">
                                      <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                          <i class="pe-7s-cash text-warning"></i>
                                        </div>
                                      </div>
                                      <div class="col-7 col-md-8">
                                        <div class="numbers">
                                          <p class="card-category">Today's Sales</p>
                                          <p class="card-title"><%out.println(dailySales);%><p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="card card-stats">
                                  <div class="card-body ">
                                    <div class="row">
                                      <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                          <i class="pe-7s-cup text-success"></i>
                                        </div>
                                      </div>
                                      <div class="col-7 col-md-8">
                                        <div class="numbers">
                                          <p class="card-category">Weekly Total Sales</p>
                                          <p class="card-title"><%out.println(weeklySales);%><p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="card card-stats">
                                  <div class="card-body ">
                                    <div class="row">
                                      <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                          <i class="pe-7s-like text-danger"></i>
                                        </div>
                                      </div>
                                      <div class="col-7 col-md-8">
                                        <div class="numbers">
                                          <p class="card-category">Monthly Total Sales</p>
                                          <p class="card-title"><%out.println(monthlySales);%><p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="card card-stats">
                                  <div class="card-body ">
                                    <div class="row">
                                      <div class="col-5 col-md-4">
                                        <div class="icon-big text-center icon-warning">
                                          <i class="pe-7s-attention text-primary"></i>
                                        </div>
                                      </div>
                                      <div class="col-7 col-md-8">
                                        <div class="numbers">
                                          <p class="card-category">Annual Total Sales</p>
                                          <p class="card-title"><%out.println(yearlySales);%></p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </div>
            <%
                ArrayList<String> weeklyItems = new ArrayList<>();
                ArrayList<String> weeklyItemsQty = new ArrayList<>();
                ArrayList<String> monthlyItems = new ArrayList<>();
                ArrayList<String> monthlyItemsQty = new ArrayList<>();
                ArrayList<String> yearlyItems = new ArrayList<>();
                ArrayList<String> yearlyItemsQty = new ArrayList<>();
                
                transactionList = TransactionDao.getTransaction("items");
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
                                String itemName =  "\'" + iData.getName()+ "\'";
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
                                <h4 class="title">Item's Weekly Sales</h4>
                                <p class="category">Total Sales of Each Item for the Week</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
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
                                                scales:{
                                                    yAxes: [{
                                                        ticks:{
                                                        beginAtZero:true
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
                                <h4 class="title">Items Monthly Sales</h4>
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
                                            scales:{
                                                yAxes: [{
                                                    ticks:{
                                                        beginAtZero:true
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
                                <h4 class="title">Item's Annual Sales</h4>
                                <p class="category">Total Sales of Each Item for the Year</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-square" >
                                    <canvas id="yearlyItems"></canvas>
                                </div>
                                <script>
                                    var yearlyItems = document.getElementById('yearlyItems').getContext('2d');
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
                                                scales:{
                                                    yAxes: [{
                                                        ticks:{
                                                        beginAtZero:true
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
</body>
             
              
</html>
