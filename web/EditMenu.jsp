<%-- 
    Document   : EditMenu
    Created on : 11 Sep 2018, 12:56:29 AM
    Author     : moses
--%>

<%@page import="Entity.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Menu m = (Menu)session.getAttribute("menuItem");%>
        
        <%=m.name%></br>
        <%=m.desc%></br>
        <%=m.price%></br>
        <%=m.cost%></br>
        <%=m.url%></br>
        <%=m.categoryList%>
        
    </body>
</html>
