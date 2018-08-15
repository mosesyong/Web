<%-- 
    Document   : SalesAnalytics
    Created on : 14 Aug, 2018, 6:55:09 PM
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
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

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
                                                          <p class="card-category">Daily Total Sales</p>
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
