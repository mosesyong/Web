<%-- 
    Document   : Menu
    Created on : 14 Jul, 2018, 2:03:20 PM
    Author     : moses
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
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="design/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="design/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="design/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="design/css/demo.css" rel="stylesheet" />


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
                        <li>
                            <a href="main.jsp">
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
                        <li class="active">
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
         
            
                
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Add Item To Menu</h4>
                            </div>
                            <div class="content">
                                <form action="AddItemWebServlet" method='post'>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" placeholder="Name" name="name" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input type="number" class="form-control" placeholder="Price" name="price" required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Item Description</label>
                                                <input type='text' class='form-control' placeholder='Description' name='description' required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Add Item Image</label>
                                                <input type="file" class="form-control" name="image">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Add to Menu</button>
                                    <div class="clearfix"></div>
                                </form>
                                    
                                
                            </div>

                        </div>
                    </div>
                    

                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </footer>

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
