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
            <div class='main-panel' style="margin-top:-530px">
                <div class="content">
                    <div class="container-fluid">
                        <div class="card">
                            <div class="header">
                                <h3>List past transactions</h3>
                            </div>
                            
                            <div class="content">
                                <form action='TransactionListWebServlet' method='get'>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                            <select name="outletName">
                                                <option value="">Select Outlet</option>
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
                                        <div class="col-md-2">   
                                            <div class="form-group">
                                        <select name="time">
                                           <option value="">Select Time</option>
                                           <option value="3">3 Hours</option>
                                           <option value="all">All</option>
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
                                <div class="row">
                                    <div class="col-md-12">
                                       <div class="card">
                                          <div class="content table-responsive table-full-width">
                                          <table class="table table-hover table-striped">
                                              <thead>
                                              <%

                                                  out.println("<th>Cashier Name</th><th>Total Amount</th><th>Payment Type</th><th>Date</th>");

                                                  %>
                                              </thead>
                                            <tbody>
                                        <%
                                            ArrayList<Transaction> transactionDataList = (ArrayList<Transaction>)obj;
                                            for(Transaction t : transactionDataList){
                                                out.println("<tr><td align='center'>" + t.cashierName + "</td><td align='center'>" + t.totalPrice + "</td><td>" + t.paymentType + "</td><td>" + t.dateTime + "</td></tr>");
                                            }
                                            out.println("</table>");
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
