<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.AnalyticsEntity"%>
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
                                        <h3 class="title">Company Analytics</h3>
                                    </div>
                                    <div class="content">
                                        <div class="row">
                                            <div class='col-md-12'>
                                                <div class='form-group'>
                                                    <form action='AnalyticsWebServlet' method='get'>
                                                        <select name='analyticsType' style='width: 25%'>
                                                            <option selected="true" disabled="disabled">Select Category</option>
                                                            <option value='Sales'>Sales</option>
                                                            <option value='Items'>Items</option>
                                                        </select>
                                                        <select name='paymentType' style='width: 25%'>
                                                            <option selected="true" disabled="disabled">Select Payment Type</option>
                                                            <option value='All'>All</option>
                                                            <option value='cash'>Cash</option>
                                                            <option value='card'>Card</option>
                                                            <option value='snapcash'>SnapCash</option>
                                                        </select>
                                                        <select name="outletName" style='width: 25%'>
                                                            <option selected="true" disabled="disabled">Select Outlet</option>
                                                            <option value='All'>All</option>
                                                            <%
                                                                for(String oName : u.getOutletNames()){
                                                                    %>
                                                            <option value="<%=oName%>"><%=oName%></option>"
                                                                    <%
                                                                    }
                                                                    %>
                                                         </select>
                                                         <button type="submit" class="btn btn-info btn-fill" style="border-color: #FFE37C">Submit</button>
                                                    </form> 
                                                </div>
                                            </div>
                                        
                                        </div>
                                        
                                        <div class="row">
                                            
                                            <%
                                             String analyticsType = (String) request.getAttribute("analyticsType");
                                             String paymentType = (String) request.getAttribute("paymentType");
                                             String outlet = (String) request.getAttribute("outletName");
                                             HashMap<String, ArrayList<AnalyticsEntity>> analyticsMap = new HashMap<>();
                                             analyticsMap = (HashMap<String, ArrayList<AnalyticsEntity>>) request.getAttribute("analyticsResults");
                                             
                                             DecimalFormat df = new DecimalFormat(".##");
                                             
                                             if(analyticsType == null && analyticsMap == null){    
                                                
                                             } else if(analyticsType.equals("Sales")){
                                                 
                                                 for(HashMap.Entry<String, ArrayList<AnalyticsEntity>> entry : analyticsMap.entrySet()){
                                                     String timePeriod = entry.getKey();
                                                     ArrayList<AnalyticsEntity> record = entry.getValue();
                                                     for (AnalyticsEntity entity : record){
                                                         
                                                         String label = entity.label;
                                                         Double amount = (double) entity.amount;
                                                         String properAmount = df.format(amount);
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
                                             } else if(analyticsType.equals("Items")){
                                                 
                                                ArrayList<String> itemLabels = new ArrayList<>();
                                                ArrayList<Double> itemQuantity = new ArrayList<>();
                                                int counter = 1;
                                                
                                                

                                                for(HashMap.Entry<String, ArrayList<AnalyticsEntity>> entry : analyticsMap.entrySet()){
                                                     
                                                     String chartID = counter + "chart";
                                                     System.out.println(chartID);
                                                     String period = entry.getKey();

                                                     String timePeriod = "";
                                                     if(period.equals("All")){
                                                        timePeriod = "from the Beginning of Time";
                                                     }else{
                                                        timePeriod = "for the " + period; 
                                                     }
                                                     ArrayList<AnalyticsEntity> record = entry.getValue();
                                                     for (AnalyticsEntity entity : record){
                                                         String label = "\"" + entity.label + "\"";
                                                         Double amount = entity.amount;
                                                         itemLabels.add(label);
                                                         itemQuantity.add(amount);
                                                     }

                                                     System.out.println(itemLabels);
                                                     System.out.println(itemQuantity);
%>                                                   

                                            
                                                    <div class="col-md-6">
                                                        <div class="card">
                                                            <div class="header">
                                                                <h4 class="title"><% out.println("Item Orders " + timePeriod); %></h4>
                                                                <p class="category"></p>
                                                            </div>
                                                            <div class="content">
                                                                <div id="chartPreferences" class="ct-chart">
                                                                    <% System.out.println(chartID); %>
                                                                    <canvas id="<%=chartID%>"></canvas>
                                                                </div>
                                                                <script>
                                                                    var chartName = new String("<%=chartID%>")
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
                                                                              'rgba(255, 99, 132, 0.6)',
                                                                              'rgba(54, 162, 235, 0.6)',
                                                                              'rgba(255, 206, 86, 0.6)',
                                                                              'rgba(75, 192, 192, 0.6)',
                                                                              'rgba(153, 102, 255, 0.6)'
                                                                            ]
                                                                          }]
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    

              
</html>
