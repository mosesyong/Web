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
                                <h3>List Past Transactions</h3>
                            </div>
                            
                            <div class="content">
                                <form action='TransactionListWebServlet' method='get'>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                Select Outlet:<br>
                                            <select name="outletName" style='width:135px; margin-top:2px'>
                                                <option value="" selected hidden></option>
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
                                        <div class="col-md-4">   
                                            <div class="form-group">
                                                Select Time: <br>
                                                <input type="number" step="1" name="time"/>
                                            </div>
                                        </div>
                                            
                                    <input type="submit" name="menu" class="btn btn-info btn-fill pull-right" style="border-color: #FFE37C; margin: 10px 20px" value="Submit">
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

                                                  out.println("<th>Cashier Name</th><th>Total Amount</th><th>Payment Type</th><th>Date</th><th>Refunded</th><th>Refunded By</th><th>Refunded Date</th>");

                                                  %>
                                            </thead>
                                            <tbody id="myTable">
                                        <%
                                            ArrayList<Transaction> transactionDataList = (ArrayList<Transaction>)obj;
                                            for(Transaction t : transactionDataList){
                                                if(t.refunded == false){
                                                    out.println("<tr class='content'><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.isRefunded() + "</td><td align='center'>" + t.isNull(t.refundedBy) + "</td><td align='center'>" + t.isNull(t.refundDate) + "</td></tr>");
                                                }else if(t.refunded != false){
                                                    out.println("<tr class='content'><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.isRefunded() + "</td><td align='center'>" + t.isNull(t.refundedBy) + "</td><td align='center'>" + t.isNull(t.refundDate) + "</td></tr>");
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
