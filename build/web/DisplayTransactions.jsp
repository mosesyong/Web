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
        <%@ include file ="testSidebar.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Transactions</title>
        
       
    </head>
    <body>
        <div class='wrapper'>
            <div class='main-panel'>
                <div class="content">
                    <div class="container-fluid">
                        <div class="card">
                            <div class="header">
                                <h3>List past transactions</h3>
                            </div>
                            
                            <div class="content">
                                <form action='TransactionListWebServlet' method='get'>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                            Select Outlet:
                                            <select name="outletName">
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
<!--                                        <div class="col-md-3">   
                                            <div class="form-group">
                                            Select Time: <input type="number" step="1" name="time"/>
                                            </div>
                                        </div>-->
                                        <div class="col-md-3">   
                                            <div class="form-group">
                                                Select Duration:
                                                <select name="time">
                                                    <option value="" selected hidden></option>
                                                    <option value="1">1 hour</option>
                                                    <option value="3">3 hours</option>
                                                    <option value="12">12 hours</option>
                                                    <option value="24">24 hours</option>
                                                </select>
                                            </div>
                                        </div>
                                    <input type="submit" name="menu" class="btn btn-info btn-fill" style="border-color: #FFE37C" value="Submit">
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
                                 <select id="selectField">
                                     <option value="all" selected>All</option>
                                     <option value="refunds">Refunds</option>
                                     <option value="nonRefunds">Non Refunds</option>
                                 </select>
                             </div>
                             <script src="design/js/filter.js" type="text/javascript"></script>
                         </div>
                         <div class="row">
                                    <div class="col-md-12">
                                       <div class="card">
                                          <div class="content table-responsive table-full-width">
                                          <table class="table table-fixed table-hover table-striped" id="resultsTable">
                                            <thead id="headRow">
                                              <%

                                                  out.println("<th>Cashier Name</th><th>Total Amount</th><th>Payment Type</th><th>Date</th><th>Refunded</th><th>Refunded By</th><th>Refunded Date</th>");

                                                  %>
                                            </thead>
                                            <tbody>
                                        <%
                                            ArrayList<Transaction> transactionDataList = (ArrayList<Transaction>)obj;
                                            for(Transaction t : transactionDataList){
                                                if(t.refunded == false){
                                                    out.println("<tr position='nonRefunds'><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.refunded + "</td><td align='center'>" + t.refundedBy + "</td><td align='center'>" + t.refundDate + "</td></tr>");
                                                }else if(t.refunded != false){
                                                    out.println("<tr position='refunds'><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td align='center'>" + t.paymentType + "</td><td align='center'>" + t.dateTime + "</td><td align='center'>" + t.refunded + "</td><td align='center'>" + t.refundedBy + "</td><td align='center'>" + t.refundDate + "</td></tr>");
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
    </body>
</html>
