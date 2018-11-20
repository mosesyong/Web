<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="Entity.Transaction"%>
<%@page import="Dao.AnalyticsDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.AnalyticsEntity"%>
<%@page import="Dao.TransactionDao"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"></script>
        <script type="text/javascript" src="design/js/html2canvas.js"></script>
        <script>
            function pdfFunction() {
                console.log("start");
                html2canvas(document.querySelector("#charts")).then(canvas => {
                    var doc = new jsPDF('p', 'mm', [230,400]);
                    var dataURL = canvas.toDataURL();
                    doc.text(10, 20, "Analytics Report");
                    doc.addImage(dataURL, 'PNG', 10, 35, 210, 370);
                    doc.save("Analytics");
                }); 
//                var specialElementHandlers = 
//                            function (element,renderer) {
//                            return true;
//                            }
//                            var doc = new jsPDF();
//                            doc.fromHTML($('#charts').html(), 15, 15, {
//                            'width': 170,
//                            'elementHandlers': specialElementHandlers
//                            });
//                            doc.output('dataurlnewwindow');
                
            };
        </script>
        <style>
            .aCard{
                border: 1px solid black;
            }
        </style>
   </head>
   <%AnalyticsDao.getAnalytics(u);%>
    
    <body>
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h3 class="title">Company Analytics</h3>
                                    </div>
                                    <div class="content">
                                        
                                            <div class="row">
                                                <form action='AnalyticsWebServlet' method='get'>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Enter Start Date Time:</label>
                                                        <input type="datetime-local" class="form-control" placeholder="Start Date Time" name="startDateTime">
                                                    </div> 
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Enter End Date Time:</label>
                                                        <input type="datetime-local" class="form-control" placeholder="End Date Time" name="endDateTime">
                                                    </div> 
                                                </div>
                                                <div class='col-md-2'>
                                                    <div class='form-group'>
                                                        <label>Select Filter</label>
                                                        <select name="filter" class="form-control" placeholder="Select Filter">
                                                            <option selected="true" disabled="disabled">Select Filter</option>
                                                            <option value='All'>All</option>
                                                            <option value='cash'>Cash</option>
                                                            <option value='card'>Credit Card</option>
                                                            <option value='snapcash'>SnapCash</option>
                                                            <option value='discounts'>Discounts</option>
                                                            <option value='refunds'>Refunds</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class='col-md-2'>
                                                    <div class='form-group'>
                                                        <label>Select Time-step</label>
                                                        <select name="timestep" class="form-control" placeholder="Select Time-step">
                                                            <option selected="true" disabled="disabled" value="auto">Auto</option>
                                                            <option value='hour'>Hour</option>
                                                            <option value='day'>Day</option>
                                                            <option value='week'>Week</option>
                                                            <option value='month'>Month</option>
                                                            <option value='year'>Year</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                <input type="submit" name="menu" class="btn pull-right" style="border: solid #9F9F9F 1px; margin-top: 28px" value="Submit">
                                                </div>
                                                </form>
                                                <%
                                                 String amount = (String)request.getAttribute("totalAmount");   
                                                if(amount != null){
                                                    String period = (String) request.getAttribute("period");
                                                %>
                                                <div class="col-md-2">
                                                    <button id="toPDF" class="btn pull-right" onclick="pdfFunction()" style='border: solid #9F9F9F 1px; margin-top: 35px'>Save page as PDF</button>
                                                </div>
                                            </div>
                                    
                                    <div id="charts">
                                        <div class="row">
                                                <div class="col-lg-3 col-md-6 col-sm-6">
                                                    <div class="card card-stats aCard">
                                                        <div class="card-body ">
                                                            <div class="row">
                                                                <div class="col-5 col-md-4">
                                                                  <div class="icon-big text-center icon-warning">
                                                                    <i class="pe-7s-cash text-success"></i>
                                                                  </div>
                                                                </div>
                                                                <div class="col-7 col-md-8">
                                                                  <div class="numbers">
                                                                    <p class="card-category">Total Value:</p>
                                                                    <p class="card-title">$<%=amount%></p>
                                                                  </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                    <%
                                        ArrayList<String> oldLabelList = (ArrayList<String>)request.getAttribute("labelList");
                                        ArrayList<String> labelList = new ArrayList<>();
                                        for(String s : oldLabelList){
                                            labelList.add("\"" + s + "\"");
                                        }
                                        System.out.println("Label List: " + labelList);
                                        HashMap<String,ArrayList<Double>> resultMap = (HashMap<String, ArrayList<Double>>) request.getAttribute("resultMap");
                                        ArrayList<Double> cashTransactions = resultMap.get("cash");
                                        ArrayList<Double> cardTransactions = resultMap.get("card");
                                        ArrayList<Double> snapcashTransactions = resultMap.get("snapcash");
                                    %>                                                   
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card aCard">
                                                        <div class="header">
                                                            <h4 class="title">Transactions Overview</h4>
                                                            <p class="category">For: <b><%=period%></b></p>
                                                        </div>
                                                        <div class="content">
                                                            <div id="chartPreferences" class="ct-chart" style="height:100%">
                                                                <canvas id="transactionsOverview"></canvas>
                                                            </div>
                                                            <script>
                                                                        var chartName = new String("transactionsOverview");
                                                                        var pieChart = document.getElementById(chartName).getContext("2d");
                                                                        var barChart = new Chart(pieChart, {
                                                                            type: 'bar',
                                                                            data: {
                                                                              labels: <%=labelList%>,
                                                                              datasets: [{
                                                                                label: 'Cash ($)',
                                                                                data: <%=cashTransactions%>,
                                                                                backgroundColor:'rgba(255, 99, 132, 0.6)'
                                                                              },
                                                                                  {
                                                                                label: 'Card ($)',
                                                                                data: <%=cardTransactions%>,
                                                                                backgroundColor:'rgba(54, 162, 235, 0.6)' 
                                                                              },
                                                                                  {
                                                                                label: 'SnapCash ($)',
                                                                                data: <%=snapcashTransactions%>,
                                                                                backgroundColor:'rgba(255, 206, 86, 0.6)' 
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
                                                                                        scaleLabel: {
                                                                                            display: true,
                                                                                            fontSize: 14,
                                                                                            labelString: "Time Period"
                                                                                        }
                                                                                    }],
                                                                                    yAxes:[{
                                                                                        stacked: true,
                                                                                        scaleLabel: {
                                                                                            display: true,
                                                                                            fontSize: 14,
                                                                                            labelString: "Cash Value ($)"
                                                                                        }
                                                                                        
                                                                                    }]
                                                                                },
                                                                                tooltips: {
                                                                                    enabled: true
                                                                                    }
                                                                                }
                                                                            }
                                                                         );
                                                            </script>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <% 
                                             ArrayList<AnalyticsEntity> entry = (ArrayList<AnalyticsEntity>) request.getAttribute("entry");
                                             System.out.println(entry);
                                             ArrayList<String> labels = new ArrayList<>();
                                             ArrayList<Double> cashValue = new ArrayList<>();
                                             ArrayList<Integer> quantity = new ArrayList<>();
                                             
                                             for(AnalyticsEntity e : entry){
                                                 String label = e.label;
                                                 Double cValue = e.amount;
                                                 int iQuantity = e.quantity;
                                                 labels.add("\"" + label + "\"");
                                                 cashValue.add(cValue);
                                                 quantity.add(iQuantity);
                                             }
                                                 
                                             
                                            %>                                                   
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card aCard">
                                                        <div class="header">
                                                            <h4 class="title">Top Selling Items</h4>
                                                            <p class="category">For: <b><%=period%></p>
                                                        </div>
                                                        <div class="content" >
                                                            <div id="chartPreferences" class="ct-chart" style="height:100%; width:100%;">
                                                                <canvas id="bestSellingItems"></canvas>
                                                            </div>
                                                            <script>
                                                            var chartName = new String("bestSellingItems");
                                                            var pieChart = document.getElementById(chartName).getContext("2d");
                                                            var barChart = new Chart(pieChart, {
                                                                type: 'bar',
                                                                data: {
                                                                   labels: <%=labels%>,
                                                                       datasets: [
                                                                            {
                                                                               label: 'Quantity',
                                                                               data: <%=quantity%>,
                                                                               backgroundColor: "rgba(255, 99, 132, 0.6)"

                                                                            },
                                                                            {
                                                                                label: 'Cash Value ($)',
                                                                                data: <%=cashValue%>,
                                                                                backgroundColor:"rgba(54, 162, 235, 0.6)"
                                                                            }]
                                                               },
                                                               options: {
                                                                   legend: {
                                                                       display: true,
                                                                       position: 'top'

                                                                   },
                                                                   scales: {
                                                                       xAxes:[{
                                                                               
                                                                               ticks: {
                                                                                    autoSkip: false
                                                                                },
                                                                                scaleLabel: {
                                                                                    display: true,
                                                                                    fontSize: 14,
                                                                                    labelString: "Item Name",
                                                                                }
                   //                                                        stacked: true,
                                                                       }],
                                                                   yAxes:[{
                                                                           ticks:{
                                                                           beginAtZero: true
                                                                       },
                                                                       scaleLabel: {
                                                                            display: true,
                                                                            fontSize: 14,
                                                                            labelString: "Value"
                                                                        }
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
                                            <%                                                  
                                            %>
                                   
                                    <div class="row">
                                        <div class="col-md-6 ">
                                        <%
                                            ArrayList<AnalyticsEntity> worstSellers = (ArrayList<AnalyticsEntity>) request.getAttribute("worstSellers");

                                        %>
                                            <div class="card aCard">
                                                <div class="header">
                                                    <h4 class="title">Least Selling Items</h4>
                                                    <p class="category">For: <b><%=period%></p>
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
                                            <div class="card aCard">
                                                <div class="header">
                                                    <h4 class="title">Refunds Overview</h4>
                                                    <p class="category">For: <b><%=period%></p>
                                                </div>
                                                <div class="content table-responsive table-full-width">
                                                    <table class="table table-hover table-striped">
                                                        <thead>
                                                        <th>Description</th>
                                                        <th>Quantity</th>
                                                        </thead>

                                                        <%
                                                        ArrayList<Transaction> tList = (ArrayList<Transaction>) request.getAttribute("tList");
                                                        ArrayList<Transaction> nonRList = (ArrayList<Transaction>) request.getAttribute("nonRList");
                                                        ArrayList<Transaction> rList = (ArrayList<Transaction>) request.getAttribute("rList");
                                                        
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
                                <% } %>
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
