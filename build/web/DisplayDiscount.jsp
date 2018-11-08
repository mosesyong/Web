<%-- 
    Document   : DisplayDiscount
    Created on : 8 Nov 2018, 7:15:37 PM
    Author     : moses
--%>

<%@page import="Dao.DiscountDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Discount</title>
    </head>
    <body>
        <h1>Display Discounts</h1>
        <%=DiscountDao.discountList%>
    </body>
</html>
