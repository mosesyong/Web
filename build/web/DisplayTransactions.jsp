<%-- 
    Document   : DisplayTransactions
    Created on : 14 Aug 2018, 7:29:34 PM
    Author     : moses, sharon
--%>

<%@page import="Entity.Transaction"%>
<%@page import="Dao.TransactionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <!-- Display Transactions displays all the transactions depending on the time period the user wishes to view --> 
    
    
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
                                <h4 class="title">List Past Transactions</h4>
                            </div>
                            
                            <div class="content">
                                <form action='TransactionListWebServlet' method='get'>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Select Outlet</label>
                                                <select name="outletName" class="form-control" placeholder="Select Outlet">
                                                    <option value="all" selected>All</option>"
                                                    <%
                                                        for(String oName : u.getOutletNames()){
                                                    %>
                                                    <option value="<%=oName%>"><%=oName%></option>"
                                                    <%
                                                        }
                                                    %>
                                            </select>
                                                
                                            </div> 
                                        </div>
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
                                        <div class="col-md-4">
                                            <input type="submit" name="menu" class="btn pull-right" style="border: solid #9F9F9F 1px; margin-top: 28px" value="Submit">
                                        </div>
                                    </div>
                                </form>
                                <br>
                        
                         <%
                                Object obj = request.getAttribute("transactionResults");
                                if(obj != null){
                         %>    
                         <div class="row" style="margin-bottom: 10px">
                             <div class="optionsDiv" style="float: right; margin-right: 25px">
                                 Filter By
                                 <select id="filterText" style="display: inline-block" onchange="filterText()"> 
                                     <option disabled selected>Select Filter</option>
                                     <option value="all" selected>All</option>
                                     <option value="yes">Refunds</option>
                                     <option value="no">Non Refunds</option>
                                 </select>
                             </div>
                             
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                   <div class="content table-responsive table-full-width">
                                   <table class="table table-fixed table-hover table-striped table-earning" id="resultsTable">
                                     <thead id="headRow">
                                              <%

                                                  out.println("<th>Outlet Name</th><th>Cashier Name</th><th>Total Amount</th><th>Payment Type</th><th>Dine In/Takeaway</th><th>Date</th><th>DiscountName</th><th>Refunded</th><th>Refunded By</th><th>Refunded Date</th>");

                                                  %>
                                            </thead>
                                            <tbody id="myTable">
                                        <%
                                            ArrayList<Transaction> transactionDataList = (ArrayList<Transaction>)obj;
                                            for(Transaction t : transactionDataList){
                                                if(t.refunded == false){
                                                    out.println("<tr class='content'><td align='center'>" + t.outletName + "</td><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.isDineIn() +  "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.discountName + "</td><td align='center'>" + t.isRefunded() + "</td><td align='center'>" + t.isNull(t.refundedBy) + "</td><td align='center'>" + t.isNull(t.refundDate) + "</td></tr>");
                                                }else if(t.refunded != false){
                                                    out.println("<tr class='content'><td align='center'>" + t.outletName + "</td><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.isDineIn() +  "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.discountName + "</td><td align='center'>" + t.isRefunded() + "</td><td align='center'>" + t.isNull(t.refundedBy) + "</td><td align='center'>" + t.isNull(t.refundDate) + "</td></tr>");
                                                }
                                            }
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>
        function filterText()
        {  
            var rex = new RegExp($('#filterText').val());
            if(rex =="/all/"){clearFilter()}else{
                $('.content').hide();
                $('.content').filter(function() {return rex.test($(this).text());
                }).show();
            }
        }

        function clearFilter()
        {
            $('.filterText').val('');
            $('.content').show();
        }
    </script>
    </body>
</html>
