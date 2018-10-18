<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="Dao.AnalyticsDao"%>
<%@page import="Entity.AnalyticsEntity"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDateTime"%>
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

   </head>
   

   
   
    <body>
        
        <%
            AnalyticsDao.getAnalytics(u);
            System.out.println(u);
            if(!u.isLastChild()){
                %>
            
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class='row'>
                            <div class="col-md-6">
                                 <%
                            ArrayList<String> items = new ArrayList<>();
                            ArrayList<Integer> quantity = new ArrayList<>();
                            ArrayList<AnalyticsEntity> entry = TransactionDao.getTopSellersByQuantity("Year",5);
                            for(AnalyticsEntity aEntry : entry){
                                String itemName = aEntry.label;
                                int value = aEntry.quantity;
                                items.add("\"" + itemName + "\"");
                                quantity.add(value);
                            }
                            %>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Best Selling Item</h4>
                                        <p class="category">Based on Quantity</p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart" style="height:100%">
                                        <canvas id="bestSellingItems"></canvas>
                                    </div>
                                    <script>
                                        var chartName = new String("bestSellingItems");
                                        var pieChart = document.getElementById(chartName).getContext("2d");
                                        var barChart = new Chart(pieChart, {
                                            type: 'horizontalBar',
                                            data: {
                                              labels: <%=items%>,
                                              datasets: [{
                                                label: 'Quantity',
                                                data: <%=quantity%>,
                                                backgroundColor: [
                                                  'rgba(255, 99, 132, 0.6)',
                                                  'rgba(54, 162, 235, 0.6)',
                                                  'rgba(255, 206, 86, 0.6)',
                                                  'rgba(75, 192, 192, 0.6)',
                                                  'rgba(153, 102, 255, 0.6)',
                                                  'rgba(255, 159, 64, 0.6)',
                                                  'rgba(255, 254, 154, 0.6)',
                                                  'rgba(173, 154, 255, 0.6)',
                                                  'rgba(255, 199, 153, 0.6)',
                                                  'rgba(255, 165, 153, 0.6)',
                                                  'rgba(153, 177, 255, 0.6)'
                                                ]
                                              }]
                                            },
                                            options: {
                                                legend: {
                                                    display: false,
                                                    position: 'right'

                                                },
                                                scales: {
                                                    xAxes:[{
                                                        display: true,
                                                        ticks:{
                                                            beginAtZero: true
                                                        }
                                                    }]
                                                }
                                            }
                                          });
                                    </script>
                                    </div>
                                </div>
                            </div>
                                                
                           <div class="col-md-6">
                            <%
                            items = new ArrayList<>();  
                            ArrayList<Double> totalAmount = new ArrayList<>();
                            entry = TransactionDao.getTopSellersByAmount("Year",5);
                            for(AnalyticsEntity aEntry : entry){
                                String itemName = aEntry.label;
                                double value = aEntry.amount;
                                items.add("\"" + itemName + "\"");
                                totalAmount.add(value);
                            }
                            %>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Best Selling Item</h4>
                                        <p class="category">Based on Cash Value</p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart" style="height:100%">
                                        <canvas id="mostSellingItems"></canvas>
                                    </div>
                                    <script>
                                        var chartName = new String("mostSellingItems");
                                        var pieChart = document.getElementById(chartName).getContext("2d");
                                        var barChart = new Chart(pieChart, {
                                            type: 'horizontalBar',
                                            data: {
                                              labels: <%=items%>,
                                              datasets: [{
                                                label: 'Cash Value',
                                                data: <%=totalAmount%>,
                                                backgroundColor: [
                                                  'rgba(255, 99, 132, 0.6)',
                                                  'rgba(54, 162, 235, 0.6)',
                                                  'rgba(255, 206, 86, 0.6)',
                                                  'rgba(75, 192, 192, 0.6)',
                                                  'rgba(153, 102, 255, 0.6)',
                                                  'rgba(255, 159, 64, 0.6)',
                                                  'rgba(255, 254, 154, 0.6)',
                                                  'rgba(173, 154, 255, 0.6)',
                                                  'rgba(255, 199, 153, 0.6)',
                                                  'rgba(255, 165, 153, 0.6)',
                                                  'rgba(153, 177, 255, 0.6)'
                                                ]
                                              }]
                                            },
                                            options: {
                                                legend: {
                                                    display: false,
                                                    position: 'right'

                                                },
                                                scales: {
                                                    xAxes:[{
                                                        display: true,
                                                        ticks:{
                                                            beginAtZero: true
                                                        }
                                                    }]
                                                },
//                                                tooltips: {
//                                                 callbacks: {
//                                                    label: function(tooltipItem, data) {
//                                                        var label = data.datasets[tooltipItem.datasetIndex].label || '';
//
//                                                            if (label) {
//                                                                label += ' = $' + data ;
//                                                            }
//                                                            return label;
//                                                        }
//                                                    }
//                                                }
                                            }
                                          });
                                    </script>
                                    </div>
                                </div>
                            </div>              
                        </div>
                        
                                                
                        <div class="row">
                            <div class="col-md-6">
                            <%
                                ArrayList<AnalyticsEntity> worstSellers = TransactionDao.getBottomSellersByQuantity("Year",5);
                                
                            %>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Least Selling Item</h4>
                                        <p class="category">Based on Quantity</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>Item Name</th>
                                            <th>Quantity</th>
                                            </thead>
                                            
                                            <%
                                            for(AnalyticsEntity e : worstSellers){
                                            String label = e.label;
                                            int qty = e.quantity;
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td><%=label%></td>
                                                    <td><%=qty%></td>
                                                </tr>
                                            </tbody>
                                            <%
                                                }
                                            %>
                                        </table>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                            <%
                                ArrayList<AnalyticsEntity> worstSellersAmount = TransactionDao.getBottomSellersByAmount("Year",5);
                            %>
                                       
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Least Selling Item</h4>
                                        <p class="category">Based on Cash Value</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>Item Name</th>
                                            <th>Cash Value</th>
                                            </thead>

                                        <%
                                        for(AnalyticsEntity e : worstSellersAmount){
                                        String label = e.label;
                                        double amount = e.amount;
                                        %>
                                            <tbody>
                                                <tr>
                                                    <td><%=label%></td>
                                                    <td><% out.println("$" + amount); %></td>
                                                </tr>
                                            </tbody>
                                            <%
                                                }
                                            %>
                                        </table>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>           
        </div>
</body>
<% }%>       
              
</html>
