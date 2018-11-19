<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
     
        <%@include file="PanelBars.jsp"%>
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
            System.out.println("User info:");
            System.out.println(u);
            System.out.println();
            if(!u.isLastChild()){
                %>
            
        
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <%
                                   HashMap<String, ArrayList<Double>>resultsMap = TransactionDao.getMainPageTransactionsByPaymentType();
                                   ArrayList<Double> cashTrans = resultsMap.get("cash");
                                   ArrayList<Double> creditTrans = resultsMap.get("card"); 
                                   ArrayList<Double> snapcashTrans = resultsMap.get("snapcash");
                                   System.out.println(cashTrans);
                                   System.out.println(creditTrans);
                                   System.out.println(snapcashTrans);
                                %>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Transactions Overview</h4>
                                        <p class="category">Annual Report for: <b>2018</b></p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart" style="height:100%">
                                        <canvas id="totalTransactionsbyPaymentType"></canvas>
                                        </div>
                                        <script>
                                         var chartName = new String("totalTransactionsbyPaymentType");
                                         var pieChart = document.getElementById(chartName).getContext("2d");
                                         var barChart = new Chart(pieChart, {
                                             type: 'bar',
                                             data: {
                                                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September","October", "November", "December"],
                                                    datasets: [
                                                         {
                                                            label: 'Total Amount Paid By Cash',
                                                            data: <%=cashTrans%>,
                                                            backgroundColor: "rgba(255, 99, 132, 0.6)"
                                                            
                                                         },
                                                         {
                                                             label: 'Total Amount Paid by Card',
                                                             data: <%=creditTrans%>,
                                                             backgroundColor:"rgba(54, 162, 235, 0.6)"
                                                         },
                                                         {
                                                             label: 'Total Amount Paid by SnapCash',
                                                             data: <%=snapcashTrans%>,
                                                             backgroundColor:"rgba(255, 254, 110, 0.6)"
                                                                 
                                                        }]
                                            },
                                            options: {
                                                legend: {
                                                    display: true,
                                                    position: 'top'

                                                },
                                                scales: {
                                                    xAxes:[{
                                                        stacked: true,
                                                    }],
                                                yAxes:[{
                                                    stacked: true
                                                }]
                                                }
                                            }
                                          });
                                    </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                                    
                        <div class='row'>
                            <div class="col-md-12">
                                 <%
                                System.out.println(TransactionDao.getTransactionList());
                                ArrayList<String> items = new ArrayList<>();
                                ArrayList<Integer> quantity = new ArrayList<>();
                                ArrayList<Double> cashValue = new ArrayList<>();
                                ArrayList<AnalyticsEntity> entry = TransactionDao.getMainPageTransactions();
                                System.out.println(entry);
                                for(AnalyticsEntity aEntry : entry){
                                    String itemName = aEntry.label;
                                    int value = aEntry.quantity;
                                    double price = aEntry.amount;
                                    items.add("\"" + itemName + "\"");
                                    quantity.add(value);
                                    cashValue.add(price);
                                }
                                System.out.println(cashValue);
                            %>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Top Selling Items</h4>
                                        <p class="category">For: <b>2018</b></p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart" style="height:100%">
                                        <canvas id="bestSellingItems"></canvas>
                                    </div>
                                    <script>
                                         var chartName = new String("bestSellingItems");
                                         var pieChart = document.getElementById(chartName).getContext("2d");
                                         var barChart = new Chart(pieChart, {
                                             type: 'bar',
                                             data: {
                                                labels: <%=items%>,
                                                    datasets: [
                                                         {
                                                            label: 'Quantity',
                                                            data: <%=quantity%>,
                                                            backgroundColor: "rgba(255, 99, 132, 0.6)"
                                                            
                                                         },
                                                         {
                                                             label: 'Cash Value',
                                                             data: <%=cashValue%>,
                                                             backgroundColor:"rgba(54, 162, 235, 0.6)"
                                                         }]
                                            },
                                            options: {
                                                legend: {
                                                    display: true,
                                                    position: 'right'

                                                },
                                                scales: {
                                                    xAxes:[{
//                                                        stacked: true,
                                                    }],
                                                yAxes:[{
//                                                    stacked: true
                                                }]
                                                }
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
                                        <h4 class="title">Least Selling Items</h4>
                                        <p class="category">For: <b>2018</b></p>
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
                                            Double amt = e.amount;
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
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Transaction Types</h4>
                                        <p class="category">For: <b>2018</b></p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>Description</th>
                                            <th>Quantity</th>
                                            </thead>
                                            
                                            <%
                                            ArrayList<Transaction> tList = TransactionDao.getTransactionList();
                                            ArrayList<Transaction> nonRList = TransactionDao.getNonRefundedTransactionList();
                                            ArrayList<Transaction> rList = TransactionDao.getRefundedTransactionList();
                                            
                                            int totalTrans = tList.size();
                                            int totalNonRefunds = nonRList.size();
                                            int totalRefunds = rList.size();
                                            
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td>Total Transactions</td>
                                                    <td><%=totalTrans%></td>
                                                </tr>
                                                 <tr>
                                                    <td>Total Non-Refunded Transactions</td>
                                                    <td><%=totalNonRefunds%></td>
                                                </tr>
                                                 <tr>
                                                    <td>Total Refunded Transactions</td>
                                                    <td><%=totalRefunds%></td>
                                                </tr>
                                            </tbody>
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
