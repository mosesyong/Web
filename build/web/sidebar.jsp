<%-- 
    Document   : sidebar
    Created on : Jun 28, 2018, 1:34:05 PM
    Author     : sharon
--%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" href="CSS/sidebar.css">
        
        </head>
    </head>
    <body>

        <div id="sidebar-wrapper">
            <div class='col-12 user-image'>
                    <img src='img/snapcoin-logo.png'>
            </div>
            <hr>
            <div class ="col-12 user-type">
                <i class="fas fa-user"></i>
            <%   
              String type = u.getType();
              if(type.equals("1")){
                  out.println("Admin");
              }else if(type.equals("2")){
                  out.println("Manager");
              }else if(type.equals("3")){
                  out.println("Cashier");
              }
            %>
            </div>
            <hr>
            <ul class="sidebar-nav">
                <li><a href="Main.jsp">Home</a></li>
                <li><a href="CreateUser.jsp">Create User</a></li>
                <li><a href="Settings.jsp">Edit User Settings</a></li>
                <li><a href="UserManagement.jsp">Manage Employees</a></li>
                 <%
            if(((User)session.getAttribute("user")).getAccess().contains("menu")){
            %>
                <li><a href="Menu.jsp">Add item to Menu</a></li> <!-- not completed -->
        <%
            }
            %>
                <li><a href="Analytics.jsp">View Analytics</a></li>
                <li><a href="LogoutServlet">Logout</a></li>

            </ul>
        </div>
            
            <br><br>
            
    </body>
</html>
