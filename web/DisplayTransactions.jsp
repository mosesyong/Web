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
        <%@ include file ="sidebar.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Transactions</title>
    </head>
    <body>
        <div class='wrapper'>
            <div class='main-panel'>
                <div class="content">
                    <div class="container-fluid">
                        <%=TransactionDao.getTransactionList()%>
                        <%=u%>
                        <h1>List past 3 hour's transactions</h1>
                        <form action='TransactionListWebServlet' method='get'>
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
                            <input type ='submit' name='submit' value='submit'>
                        </form>
                         <%
                                Object obj = request.getAttribute("transactionResults");
                                if(obj != null){
                         %>    
                         <br>
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
    </body>
</html>
