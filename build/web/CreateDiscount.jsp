<%-- 
    Document   : CreateDiscount
    Created on : 8 Nov 2018, 7:15:26 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <!-- Create Discount allows the user to create new discounts for their menu items or promotions -->
    
    <head>
        <%@include file="PanelBars.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SnapDash</title>
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
                                        <h4 class="title">Create Discount</h4>
                                    </div>
                                    <div class="content">
                                        <form action="CreateDiscountWebServlet" method='post'>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Discount Name</label>
                                                            <input type="text" class="form-control" placeholder="Discount Name" name="discountName">
                                                        </div>
                                                    </div>
                                                
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Discount Percentage</label>
                                                            <input type="number" class="form-control" placeholder="Discount Percentage (%)" name="discountPercentage" min="0" max ="100" step="0.01">
                                                            </div>
                                                    </div>
                                                </div>             
                                            <button type="submit" class="btn btn-info btn-fill pull-right" style="border-color: #FFE37C">Create Discount</button>
                                            <div class="clearfix"></div>
                                        </form>      
                                    </div>       
                                </div>
                            </div>       
                        </div>
                    </div>
                    <%
                        String successMsg = (String)request.getAttribute("successMsg");
                        if(successMsg != null){
                            out.println("<font color='green'>"  + successMsg + "</font>");
                        }   
                        String errorMsg = (String)request.getAttribute("errorMsg");
                        if(errorMsg != null){
                            out.println("<font color='red'>"  + errorMsg + "</font>");
                        }   
                    %>
                </div>
            </div>
        </div>
        
        
    </body>
</html>
