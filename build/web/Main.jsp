<%-- 
    Document   : Main
    Created on : 20 Jun, 2018, 12:22:09 PM
    Author     : Moses
--%>

<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="Entity.User"%>
        <%

            Object o = session.getAttribute("user");
            if(o == null){
                response.sendRedirect("Login.jsp");
                return;
            }
            User u = (User)o;
        %>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%//@include file ="sidebar.jsp"%>
        <title>SnapDash</title>
        <link rel="icon" type="image/png" href="design/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>
        <link rel="stylesheet" href="CSS/sidebar.css">
        <link rel="stylesheet" href="CSS/mainbody.css">
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


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
            <div class="sidebar" data-color="yellow" data-image="design/img/sidebar-5.jpg">
                
                <div class="sidebar-wrapper">
                    <div class="logo">
                         <img src="design/img/sidebar-logo.png">
                    </div>

                    <ul class="nav">
                        <li class="active">
                            <a href="Main.jsp">
                            <i class="pe-7s-home"></i>
                            <p>Home</p>
                            </a>
                        </li>
                        <li>
                            <a href="CreateUser.jsp">
                            <i class="pe-7s-add-user"></i>
                            <p>Create User</p>
                            </a>
                        </li>
                        <li>
                            <a href="Settings.jsp">
                                <i class="pe-7s-tools"></i>
                                <p>Edit User Settings</p>
                            </a>
                        </li>
                        <li>
                            <a href="UserManagement.jsp">
                                <i class="pe-7s-users"></i>
                                <p>Manage Employees</p>
                            </a>
                        </li>
                        <li>
                            <a href="Menu.jsp">
                                <i class="pe-7s-cart"></i>
                                <p>Add item to Menu</p>
                            </a>
                        </li>
                        <li>
                            <a href="Analytics.jsp">
                                <i class="pe-7s-graph1"></i>
                                <p>View Analytics</p>
                            </a>
                        </li>
                        <!--<li>
                            <a href="LogoutServlet">
                                <i class="pe-7s-back"></i>
                                <p>Logout</p>
                            </a>
                        </li>
                        -->
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
                            <a class="navbar-brand" href="#">Welcome Back, Company <%=u.getCompanyName()%>!</a>
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
                                <li>
                                    <a href="LogoutServlet">
                                        <p>Log out</p>
                                    </a>
                                </li>
                                <li class="separator hidden-lg"></li>
                            </ul>
                        </div>
                    </div>
                </nav>         
                <!-- to remove-->
                
            <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">

                            <div class="header">
                                <h4 class="title">Sales Achievements</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-perfect-fourth">Chart should appear here</div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Cashier 1
                                        <i class="fa fa-circle text-danger"></i> Cashier 2
                                        <i class="fa fa-circle text-warning"></i> Cashier 3
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Consumer Behavior</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                            <div class="content">
                                <div id="chartHours" class="ct-chart"></div>
                                
                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> PPT
                                        <i class="fa fa-circle text-danger"></i> SPT
                                        <i class="fa fa-circle text-warning"></i> DPT
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i> Updated 3 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            Hello World
                        </div>
                    </div>
                </div>
                -->
                
                <!--
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="Main.jsp">
                                        Home
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </footer>
                
                -->
                
            </div>
        </div>
    </body>
    
    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
                    
              
</html>
