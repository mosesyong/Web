<%-- 
    Document   : CreateUser
    Created on : 20 Jun, 2018, 12:44:29 PM
    Author     : Moses
--%>
<%@page import="java.util.HashSet"%>
<%@page import="Entity.User"%>
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
                        <li class="active">
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
                
             <%
    
            String category = u.getType();
            String userType = "";
            String toCreate = "";
            if(category.equals("0")){
                userType = "Super User";
                toCreate = "Admin";
            }else if(category.equals("1")){
                userType = "Admin";
                toCreate = "Manager";
            }else if(category.equals("2")){
                userType = "Manager";
                toCreate = "Cashier";
            }
            
            %>
         
            
                
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Create User</h4>
                            </div>
            <%
            if(toCreate.length() == 0){
                out.println("Cashiers cannot create new Users");
            }else{
                %>
                            <div class="content">
                                <form action="CreateUserWebServlet" method='post'>
                                    <div class="row">
                                        
                    <%
                        if(category.equals("0")){
                    %>
                                        <div class='col-md-5'>
                                            <div class="form-group">
                                                <input type='text' class="form-control" placeholder='Company' name='companyName'>    
                                            </div>
                                        </div>
                    <%  }else{ %>
                                        <input type="hidden" name="companyName" value="<%=u.getCompanyName()%>">
                    <%  }%>
                                            
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Company</label>
                                                <input type="text" class="form-control" disabled placeholder="Company" value=<%out.println(u.getCompanyName());%>>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="selectType">Creating User Type</label>
                                                <select class="form-control" id="selectType">
                                                    <option name="child">Manager</option>
                                                    <option name="child">Cashier</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="childType">Select Manager</label>
                                                <select class="form-control" id="childType">
                                                    <option name="parent">Outlet 1</option>
                                                    <option name="parent">Outlet 2</option>
                                                    <option name="parent">Outlet 3</option>
                                                </select>
                                            </div>
                                        </div>
                                            
                  
                                        
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input type="text" class="form-control" placeholder="First Name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input type="text" class="form-control" placeholder="Last Name">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control" placeholder="Username" name="username">
                                            </div>
                                        </div>
                                    </div>
                                            
                                            
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card">                                         
                                                <div class="content">
                                                    <div class="form-group">
                                                        <label>Permissions</label>
                                                        <div class="table-full-width">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
            <%
                HashSet<String> access = u.getAccess();
                if(access.contains("menu_right")){
            %>
                                                                            <div class="checkbox">
                                                                                <input id="menuRights" type="checkbox" name="menu_rights" value="1">
                                                                                <label for="editRights"></label>
                                                                            </div>
                                                                        </td>
                                                                        <td>Menu Edit Right</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="checkbox">
                                                                                <input id="menuEdits" type="checkbox" name="menu" value="1">
                                                                                <label for="menuEdits"></label>
                                                                            </div>
                                                                        </td>
                                                                        <td>Menu Edit</td>
                                                                    </tr>
            <% }
               if(access.contains("payment_right")){
            %>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="checkbox">
                                                                                <input id="financeEditRights" type="checkbox" name="finance_rights" value="1">
                                                                                <label for="financeEditRights"></label>
                                                                            </div>
                                                                        </td>
                                                                        <td>Finance Edit Rights</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="checkbox">
                                                                                <input id="financeEdit" type="checkbox" name="finance" value="1">
                                                                                <label for="financeEdits"></label>
                                                                            </div>
                                                                        </td>
                                                                        <td>Finance Edit</td>
                                                                    </tr>
        <%
            }
            if(toCreate.equals("Cashier")){
            %> 
                                                                    <tr>
                                                                        <td>
                                                                            <div class="checkbox">
                                                                                <input id="refund" type="checkbox" name="refund" value="1">
                                                                                <label for="refund"></label>
                                                                            </div>
                                                                        </td>
                                                                        <td>Refund</td>
                                                                    </tr>
                        <%
                            }
                        %>
                                                                </tbody>
                                                            </table>
                                                        </div>  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
            <%
                String tempPassword = (String)request.getAttribute("tempPassword");
                if(tempPassword != null){
                    out.println("<font color='red'> Your Temporary Password is:"  + tempPassword + "</font>");
                }   
                //out.println();
                //out.println();
            %>                            
                                                                
                                        
                                    </div>
                                                                
                                       
                                                       
                                            
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Create Profile</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                                                                
                        <% } %>
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
