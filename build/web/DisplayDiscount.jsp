<%-- 
    Document   : DisplayDiscount
    Created on : 8 Nov 2018, 7:15:37 PM
    Author     : moses
--%>

<%@page import="Entity.Discount"%>
<%@page import="Dao.DiscountDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@include file="PanelBars.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SnapDash</title>
    </head>
    <body>
        <div class='wrapper'>
            <div class='main-panel'>
                <div class="content">
                    <div class="container-fluid">
                        <div class="card">
                            <div class="header">
                                <h3>Display Discounts</h3>
                            </div>
                            
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="content table-responsive table-full-width">
                                                <table class="table table-fixed table-hover table-striped" id="resultsTable">
                                                    <thead id="headRow">
                                                    <th>Discount Type</th>
                                                    <th>Discount Value</th>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                          ArrayList<Discount> discountList = new ArrayList();
                                                          discountList = DiscountDao.discountList;
                                                          
                                                         System.out.println(discountList);
                                                          for(Discount d : discountList){
                                                              String discountType = d.discountName;
                                                              Double value = d.discountPercentage;
                                                              
                                                              out.println("<tr><td>"+discountType+"</td><td>"+value+"</td></tr>");
                                                          }
                                                            
                                                            
                                                        %>
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
            </div>
        </div>
    </body>
</html>
