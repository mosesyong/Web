<%-- 
    Document   : PasswordReset
    Created on : 4 Oct 2018, 12:36:56 AM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset for Snapcoin</title>
    </head>
    <body>
        <h1>Password Reset</h1>
        <form action = "PasswordResetWebServlet">
            Username <input type = "text" name = "username" placeholder = "Enter username"><br>
            Email <input type = "text" name = "email" placeholder = "Enter email"><br>
            <input type = "submit" name = "submit" value = "Submit">
        </form>
    </body>
</html>
