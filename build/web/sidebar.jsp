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
        <%
    
            Object o = session.getAttribute("user");
            if(o == null){
                response.sendRedirect("Login.jsp");
                return;
            }
            User u = (User)o;
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <!--<link rel="stylesheet" href="CSS/sidebar.css">-->
        
        
        <!-- Bootstrap core CSS     -->
        <link href="design/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="design/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="design/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="design/css/pe-icon-7-stroke.css" rel="stylesheet" />
        
        
    </head>
    <body>
        <div class ="wrapper">
            <div class="sidebar" data-color="purple" data-image="design/img/sidebar-5.jpg">
                
                <div class="sidebar-wrapper">
                    <div class="logo">
                         <img src="design/img/snapcoin-logo.png">
                    </div>

                    <ul class="nav">
                        <li class="active">
                            <a href="Main.jsp">
                            <i class="pe-7s-graph"></i>
                            <p>Home</p>
                            </a>
                        </li>
                        <li>
                            <a href="CreateUser.jsp">
                            <i class="pe-7s-user"></i>
                            <p>Create User</p>
                            </a>
                        </li>
                        <li>
                            <a href="Settings.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Edit User Settings</p>
                            </a>
                        </li>
                        <li>
                            <a href="UserManagement.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Manage Employees</p>
                            </a>
                        </li>
                        <li>
                            <a href="Menu.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Add item to Menu</p>
                            </a>
                        </li>
                        <li>
                            <a href="Analytics.jsp">
                                <i class="pe-7s-user"></i>
                                <p>View Analytics</p>
                            </a>
                        </li>
                        <li>
                            <a href="LogoutServlet">
                                <i class="pe-7s-user"></i>
                                <p>Logout</p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            
            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class='navbar-header'>
                            <button type='button' class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class='sr-only'>Toggle Navigation</span>
                                <span class='icon-bar'></span>
                                <span class='icon-bar'></span>
                                <span class='icon-bar'></span>
                            </button>
                            <a class="navbar-brand" href="#">Company <%=u.getCompanyName()%></a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                        <li>
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-dashboard"></i>
                                            </a>
                                        </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">
                                        <%=u.getUsername()%>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    

                                    
        <!--                            
        <div id="sidebar-wrapper">
            <div class='col-12 user-image'>
                    <img src='design/img/snapcoin-logo.png'>
            </div>
            <hr>
            <div class ="col-12 user-type">
                <i class="fas fa-user"></i>
            <%//u.getUsername()%>
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
                <li><a href="Menu.jsp">Add item to Menu</a></li>
        <%
            }
            %>
                <li><a href="Analytics.jsp">View Analytics</a></li>
                <li><a href="LogoutServlet">Logout</a></li>

            </ul>
        </div>
       -->     
            <br><br>
            
    </body>
</html>
