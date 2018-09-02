<%-- 
    Document   : EditCategory
    Created on : 3 Sep 2018, 1:00:25 AM
    Author     : moses
--%>

<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%User u = (User)session.getAttribute("user");%> <!-- replace with import sidebar -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
    </head>
    <body>
        <h1>Sharon help me again thanks</h1>
        
        <%
                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            %>
        <form action="CreateCategoryWebServlet">
            Category: <input type="text" name="category" placeholder="Enter new category here" required>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
