<%-- 
    Document   : CopyMenu
    Created on : 1 Oct 2018, 6:10:49 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="sidebar.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Copy Menu</title>
    </head>
    <body>
        <h1>Copy Menu</h1>
        <%
                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            %>
        <form action="CopyMenuWebServlet">
            <select name="sourceOutletName">
                <%
                    for(String sister : u.getSisterOutlets()){
                %> 
                <option value="<%=sister%>"><%=sister%></option>
                <%
                    }
                %>
            </select><br>
            <input type="checkbox" name="append" value="true">Append<br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>
