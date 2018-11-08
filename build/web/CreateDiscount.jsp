<%-- 
    Document   : CreateDiscount
    Created on : 8 Nov 2018, 7:15:26 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Discount</title>
    </head>
    <body>
        <h1>Create Discount</h1>
        
        <form action="CreateDiscountWebServlet">
            Discount Name <input type ="text" name ="discountName"><br>
            Discount Percentage <input type ="number"  name = "discountPercentage" min="0" max ="100" step="0.01"><br>
            <input type ="submit" name ="submit" value ="submit">
        </form>
        
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
    </body>
</html>
