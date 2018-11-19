<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

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
                    var doc = new jsPDF('p', 'mm', 'a4');
                    var dataURL = canvas.toDataURL();
                    doc.text(20, 20, "Company Analytics");
                    doc.addImage(dataURL, 'PNG', 10, 35, 200, 200);
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
                                        <form action='AnalyticsWebServlet' method='get'>
                                            <div class="row">
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
                                                        <label>Select Category</label>
                                                        <select name="analyticsType" class="form-control" placeholder="Select Category">
                                                            <option selected="true" disabled="disabled">Select Category</option>
                                                            <option value='Sales'>Sales</option>
                                                            <option value='ItemsQuantity'>Item's Quantity</option>
                                                            <option value='ItemsAmount'>Item's Cash Value</option>  
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class='col-md-2'>
                                                    <div class='form-group'>
                                                        <label>Select Filter</label>
                                                        <select name="paymentType" class="form-control" placeholder="Select Filter">
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
                                                <div class="col-md-2">
                                                <input type="submit" name="menu" class="btn pull-right" style="border: solid #9F9F9F 1px; margin-top: 28px" value="Submit">
                                                </div>   
                                            </div>
                                        </form> 
                                    </div>
                                        <div id="charts">
                                            <div class="row">
                                                
                                            
                                            <%
                                             String analyticsType = (String) request.getAttribute("analyticsType");
                                             String paymentType = (String) request.getAttribute("paymentType");
                                             String outlet = (String) request.getAttribute("outletName");
                                             HashMap<String, ArrayList<AnalyticsEntity>> analyticsMap = new HashMap<>();
                                             analyticsMap = (HashMap<String, ArrayList<AnalyticsEntity>>) request.getAttribute("analyticsResults");
                                             System.out.println(analyticsType);
                                             System.out.println(paymentType);
                                             System.out.println(outlet);
                                             System.out.println("Start");
                                             ArrayList<String> periodList = new ArrayList<>();
                                             periodList.add("All");
                                             periodList.add("Year");
                                             periodList.add("Month");
                                             periodList.add("Week");
                                             periodList.add("Day");
                                             System.out.println("Here 1");
                                             DecimalFormat df = new DecimalFormat(".##");
                                             System.out.println(analyticsMap);
                                             if(analyticsType == null && analyticsMap == null){    
                                                
                                             } else if(analyticsType.equals("Sales")){
                                                 System.out.println(analyticsMap);
                                                 
                                                 for(String period : periodList){
                                                    ArrayList<AnalyticsEntity> entry =  analyticsMap.get(period);
                                                    System.out.println(period);
                                                    System.out.println(entry);
                                                    System.out.println("about to loop");
                                                    for(AnalyticsEntity entity : entry){
                                                        String label = entity.label;
                                                        Double amount = (double) entity.amount;
                                                        String properAmount = df.format(amount);
                                                        System.out.println("inLoop");
                                                        System.out.println(label);
                                                        System.out.println(amount); 
                                                        System.out.println(properAmount);
                                                         %>
                                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                                            <div class="card card-stats">
                                                                <div class="card-body ">
                                                                    <div class="row">
                                                                        <div class="col-5 col-md-4">
                                                                          <div class="icon-big text-center icon-warning">
                                                                            <i class="pe-7s-cash text-success"></i>
                                                                          </div>
                                                                        </div>
                                                                        <div class="col-7 col-md-8">
                                                                          <div class="numbers">
                                                                            <p class="card-category"><%=label%></p>
                                                                            <p class="card-title"><% out.println("$ " + properAmount); %><p>
                                                                          </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>   
                                            <%
                                                     }
                                                 }
                                             } else if(analyticsType.equals("ItemsAmount")){
                                                 
                                                ArrayList<String> itemLabels = new ArrayList<>();
                                                ArrayList<Double> itemAmount = new ArrayList<>();
                                                int counter = 1;
                                                
                                                for(String period : periodList){
                                                    String chartID = counter + "chart";
                                                     

                                                     ArrayList<AnalyticsEntity> entry = analyticsMap.get(period);
                                                     for (AnalyticsEntity entity : entry){
                                                         String label = "\"" + entity.label + "\"";
                                                         Double amount = entity.amount;
                                                         itemLabels.add(label);
                                                         itemAmount.add(amount);
                                                     }
                                                     
                                                     if(period.equals("All")){
                                                        period = "from the Beginning of Time";
                                                     }else{
                                                        period = "for the " + period; 
                                                     }

                                                     System.out.println(itemLabels);
                                                     System.out.println(itemAmount);
%>                                                   

                                            
                                                    <div class="col-md-6">
                                                        <div class="card">
                                                            <div class="header">
                                                                <h4 class="title"><% out.println("Item's Cash Value " + period); %></h4>
                                                                <p class="category"></p>
                                                            </div>
                                                            <div class="content">
                                                                <div id="chartPreferences" class="ct-chart" style="height:100%">
                                                                    <% System.out.println(chartID); %>
                                                                    <canvas id="<%=chartID%>"></canvas>
                                                                </div>
                                                                <script>
                                                                    var chartName = new String("<%=chartID%>");
                                                                    var pieChart = document.getElementById(chartName).getContext("2d");
                                                                    var barChart = new Chart(pieChart, {
                                                                        type: 'pie',
                                                                        data: {
                                                                          labels: <%=itemLabels%>,
                                                                          datasets: [{
                                                                            label: 'Amount',
                                                                            data: <%=itemAmount%>,
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
                                                                                display: true,
                                                                                position: 'right'
                                                                                       
                                                                            }
                                                                        }
                                                                      });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
<%                                                  itemLabels.clear();
                                                    itemAmount.clear();
                                                    counter++;
                                                    System.out.println(counter);
                                                    }
                                                }else if(analyticsType.equals("ItemsQuantity")){
                                                 
                                                ArrayList<String> itemLabels = new ArrayList<>();
                                                ArrayList<Integer> itemQuantity = new ArrayList<>();
                                                int counter = 1;
                                                
                                                for(String period : periodList){
                                                    String chartID = counter + "chart";
                                                     

                                                     ArrayList<AnalyticsEntity> entry = analyticsMap.get(period);
                                                     for (AnalyticsEntity entity : entry){
                                                         String label = "\"" + entity.label + "\"";
                                                         int quantity = entity.quantity;
                                                         itemLabels.add(label);
                                                         itemQuantity.add(quantity);
                                                     }
                                                     
                                                     if(period.equals("All")){
                                                        period = "from the Beginning of Time";
                                                     }else{
                                                        period = "for the " + period; 
                                                     }

                                                     System.out.println(itemLabels);
                                                     System.out.println(itemQuantity);
%>                                                   

                                            
                                                    <div class="col-md-6">
                                                        <div class="card">
                                                            <div class="header">
                                                                <h4 class="title"><% out.println("Item's Quantity " + period); %></h4>
                                                                <p class="category"></p>
                                                            </div>
                                                            <div class="content">
                                                                <div id="chartPreferences" class="ct-chart" style="height:100%">
                                                                    <% System.out.println(chartID); %>
                                                                    <canvas id="<%=chartID%>"></canvas>
                                                                </div>
                                                                <script>
                                                                    var chartName = new String("<%=chartID%>");
                                                                    var pieChart = document.getElementById(chartName).getContext("2d");
                                                                    var barChart = new Chart(pieChart, {
                                                                        type: 'pie',
                                                                        data: {
                                                                          labels: <%=itemLabels%>,
                                                                          datasets: [{
                                                                            label: 'Quantity',
                                                                            data: <%=itemQuantity%>,
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
                                                                                display: true,
                                                                                position: 'right'
                                                                                       
                                                                            }
                                                                        }
                                                                      });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
<%                                                  itemLabels.clear();
                                                    itemQuantity.clear();
                                                    counter++;
                                                    System.out.println(counter);
                                                    }
                                                }
                                            

                                                %>
                                          </div>
                                        
                                            </div>
                                          <button id="toPDF" onclick="pdfFunction()" style='margin-left: 15px'>PDF</button>
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
