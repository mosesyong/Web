<%-- 
    Document   : EmployeePasswordChange
    Created on : 29 Jul 2018, 5:44:48 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Password Change</title>
        <%String username = (String)request.getAttribute("username");%>
    </head>
    <body>
        <h1>Change <%=username%>'s Password</h1>
        <form type='post' action='PasswordChangeWebServlet'>
            Enter new password:
            <input type='hidden' name='username' value='<%=username%>'>
            <input type='password' name='newPassword' requried><br>
            <input type='Submit' value='Change password'>
        </form>
    </body>
</html>
