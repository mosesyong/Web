<%-- 
    Document   : DisplayTransactions
    Created on : 14 Aug 2018, 7:29:34 PM
    Author     : moses, sharon
--%>

<%@page import="Dao.TransactionDao"%>
<%@page import="Entity.TransactionData"%>
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
                        <h1>List all transactions</h1>
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
                                    
                                    out.println("<th>Name</th><th>Total Amount</th><th>Date</th>");
                                    
                                    %>
                                </thead>
                                <tbody>
                                    <%
                                    ArrayList<TransactionData> transactionDataList = (ArrayList<TransactionData>)obj;
                                    for(TransactionData t : transactionDataList){
                                        out.println("<tr><td align='center'>" + t.getName() + "</td><td align='center'>" + t.getTotalPrice() + "</td><td>" + t.getDate() + "</td></tr>");
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
