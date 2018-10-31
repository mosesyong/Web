<%-- 
    Document   : home
    Created on : 24 Oct 2018, 10:56:02 PM
    Author     : sharonpurbowo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="design/img/topbaricon.ico"> 
        <%@include file="testSidebar.jsp"%>
        <title>SnapDash</title>
        
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

    </head>
    <body>
         <div class ="wrapper">
            <div class="main-panel" style="margin-top: -750px">
                <div class="content">
                    <div class="container-fluid">
                        <div class='row'>
                            <div class='col-md-6'>
                                <div class='card'>
                                    <div class="header">
                                        <h4 class="title">Today's Overview</h4>
                                        <p class="category">Review of Today's Performance</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>Description</th>
                                            <th>Value</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Total Sales</td>
                                                    <td>$315.45</td>
                                                </tr>
                                                <tr>
                                                    <td>Total Transactions</td>
                                                    <td>12</td>
                                                </tr>
                                                <tr>
                                                    <td>Total Number of Tables Served</td>
                                                    <td>7</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                            </div>
                            <div class='col-md-6'>
                                <div class='card'>
                                    <div class="header">
                                        <h4 class="title">Last Year's Overview</h4>
                                        <p class="category">Review of Today's Performance from Last Year</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>Description</th>
                                            <th>Value</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Total Sales</td>
                                                    <td>$245.75</td>
                                                </tr>
                                                <tr>
                                                    <td>Total Transactions</td>
                                                    <td>8</td>
                                                </tr>
                                                <tr>
                                                    <td>Total Number of Tables Served</td>
                                                    <td>5</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class='row'>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Sales Figures</h4>
                                        <p class="category">Annual Sales Review</p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart" style="height:100%">
                                        <canvas id="salesFigures"></canvas>
                                    </div>
                                        <script>
                                        var chartName = new String("salesFigures");
                                        var pieChart = document.getElementById(chartName).getContext("2d");
                                        var barChart = new Chart(pieChart, {
                                            type: 'bar',
                                            data: {
                                              datasets: [{
                                                    label: 'This Year Sales',
                                                    data: [1245.90, 1829.50, 1928.30, 1992.80,1748.40,1720.30,2040.10,1729.30,970.20,1304.40],
                                                    backgroundColor: [
                                                  'rgba(255, 99, 132, 0.6)',
                                                  'rgba(54, 162, 235, 0.6)',
                                                  'rgba(255, 206, 86, 0.6)',
                                                  'rgba(75, 192, 192, 0.6)',
                                                  'rgba(153, 102, 255, 0.6)',
                                                  'rgba(255, 99, 132, 0.6)',
                                                  'rgba(54, 162, 235, 0.6)',
                                                  'rgba(255, 206, 86, 0.6)',
                                                  'rgba(75, 192, 192, 0.6)',
                                                  'rgba(153, 102, 255, 0.6)'
                                                    ]
                                                  }, {
                                                    label: 'Previous Year Sales',
                                                    data: [1502.34, 1890.27, 1690.40, 1894.20,1740.29, 1029.48,1840.20,1283.59,1023.20,1029.30],

                                                    // Changes this dataset to become a line
                                                type: 'line'
                                                  }],
                                              labels: ['January', 'February', 'March', 'April','May','June','July','August','September','October']
                                            },
                                            options: {}
                                          });
                                        
                                        </script>
                                    </div>
                                    <div class="footer">
                                    <hr>
                                    <div class="stats">
                                        
                                        <i class="pe-7s-refresh-2" style='padding-left:5px'></i> As of October 2018
                                    </div>
                                </div>
                                </div>
                            </div>  
                            <div class='row'>
                            <div class="col-md-6">
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
                                              labels: ['Hanger Steak', 'Buttered Chicken', 'Truffle Fries'],
                                              datasets: [{
                                                label: 'Amount',
                                                data: [450, 315, 144],
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
                                              labels: ['Hanger Steak', 'Buttered Chicken', 'Truffle Fries'],
                                              datasets: [{
                                                label: 'Cash Value',
                                                data: [525, 330, 252],
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
                                            <tbody>
                                                <tr>
                                                    <td>Chef's Selected Wagyu</td>
                                                    <td>4</td>
                                                </tr>
                                                <tr>
                                                    <td>Seared Foie Gras</td>
                                                    <td>2</td>
                                                </tr>
                                                <tr>
                                                    <td>Miso Butter Corn</td>
                                                    <td>0</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-md-6">       
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
                                            <tbody>
                                                <tr>
                                                    <td>Chef's Selected Wagyu</td>
                                                    <td>$152</td>
                                                </tr>
                                                <tr>
                                                    <td>Seared Foie Gras</td>
                                                    <td>$22</td>
                                                </tr>
                                                <tr>
                                                    <td>Miso Butter Corn</td>
                                                    <td>0</td>
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
</html>
