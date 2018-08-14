<%-- 
    Document   : Sidebar
    Created on : 20 Jun, 2018, 12:44:29 PM
    Author     : Moses
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <link rel="icon" type="image/png" href="design/img/topbaricon.ico"> 
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
        <div class="sidebar" data-color="yellow" data-image="design/img/sidebar-5.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <img src="design/img/sidebar-logo.png">
                </div>  
                    <!-- Nav tabs -->       
            <%
                if(!u.isLastChild()){
                    if(u.getType().equals("1")){
              %>
                    <ul class="nav nav-pills" id="sidebarTabs" role="tablist">
                       <li class="nav-item">
                          <a class="nav-link active" id="main-tab" data-toggle="tab" href="Main.jsp" role="tab" aria-controls="home" aria-selected="true">
                           <i class="pe-7s-home"></i>
                           <p>Home</p>   
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="create-tab" data-toggle="tab" href="CreateUser.jsp" role="tab" aria-controls="create" aria-selected="false">
                           <i class="pe-7s-add-user"></i>
                           <p>Create Role</p>   
                          </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="settings-tab" data-toggle="tab" href="Settings.jsp" role="tab" aria-controls="settings" aria-selected="false">
                        <i class="pe-7s-tools"></i>
                        <p>Edit User Settings</p>
                        </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="management-tab" data-toggle="tab" href="UserManagement.jsp" role="tab" aria-controls="management" aria-selected="false">
                          <i class="pe-7s-users"></i>
                          <p>Manage Employees</p>    
                          </a>
                      </li>
                      <li class="nav-item">
<<<<<<< HEAD
                          <a class="nav-link" id="menu-tab" data-toggle="tab" href="AddMenu.jsp" role="tab" aria-controls="menu" aria-selected="false">
=======
                          <a class="nav-link" id="analytics-tab" data-toggle="tab" href="Analytics.jsp" role="tab" aria-controls="analytics" aria-selected="false">
                          <i class="pe-7s-graph1"></i>
                          <p>View Analytics</p>   
                          </a>
                      </li>
                    </ul>
                    <% }else{ %>
                    <ul class="nav nav-pills" id="sidebarTabs" role="tablist">
                      <li class="nav-item">
                          <a class="nav-link active" id="main-tab" data-toggle="tab" href="Main.jsp" role="tab" aria-controls="home" aria-selected="true">
                           <i class="pe-7s-home"></i>
                           <p>Home</p>   
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="create-tab" data-toggle="tab" href="CreateUser.jsp" role="tab" aria-controls="create" aria-selected="false">
                           <i class="pe-7s-add-user"></i>
                           <p>Create Role</p>   
                          </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="settings-tab" data-toggle="tab" href="Settings.jsp" role="tab" aria-controls="settings" aria-selected="false">
                        <i class="pe-7s-tools"></i>
                        <p>Edit User Settings</p>
                        </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="management-tab" data-toggle="tab" href="UserManagement.jsp" role="tab" aria-controls="management" aria-selected="false">
                          <i class="pe-7s-users"></i>
                          <p>Manage Employees</p>    
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="menu-tab" data-toggle="tab" href="Menu.jsp" role="tab" aria-controls="menu" aria-selected="false">
>>>>>>> a4c39b796d5dffb016b5876197b602aa955230a1
                          <i class="pe-7s-cart"></i>
                          <p>Add item to Menu</p>    
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="analytics-tab" data-toggle="tab" href="Analytics.jsp" role="tab" aria-controls="analytics" aria-selected="false">
                          <i class="pe-7s-graph1"></i>
                          <p>View Analytics</p>   
                          </a>
                      </li>
                    </ul>
                    
                    
                    <%      }
                       }else{ %>
                    <ul class="nav nav-pills" id="sidebarTabs" role="tablist">
                      <li class="nav-item">
                          <a class="nav-link active" id="main-tab" data-toggle="tab" href="Main.jsp" role="tab" aria-controls="home" aria-selected="true">
                           <i class="pe-7s-home"></i>
                           <p>Home</p>   
                          </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="settings-tab" data-toggle="tab" href="Settings.jsp" role="tab" aria-controls="settings" aria-selected="false">
                        <i class="pe-7s-tools"></i>
                        <p>Edit User Settings</p>
                        </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="menu-tab" data-toggle="tab" href="AddMenu.jsp" role="tab" aria-controls="menu" aria-selected="false">
                          <i class="pe-7s-cart"></i>
                          <p>Add item to Menu</p>    
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="analytics-tab" data-toggle="tab" href="Analytics.jsp" role="tab" aria-controls="analytics" aria-selected="false">
                          <i class="pe-7s-graph1"></i>
                          <p>View Analytics</p>   
                          </a>
                      </li>
                    </ul>
                    <% } %>

                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div class="tab-pane active" id="main" role="tabpanel" aria-labelledby="main-tab"></div>
                      <div class="tab-pane" id="create" role="tabpanel" aria-labelledby="create-tab"></div>
                      <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab"></div>
                      <div class="tab-pane" id="management" role="tabpanel" aria-labelledby="management-tab"></div>
                      <div class="tab-pane" id="menu" role="tabpanel" aria-labelledby="menu-tab"></div>
                      <div class="tab-pane" id="analytics" role="tabpanel" aria-labelledby="analytics-tab"></div>
                    </div>
                    
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
            <%
                            String userType = u.getType();
                            String printType = "";
                            if(userType.equals("1")){
                                printType = "Admin";
                            }else if(userType.equals("2")){
                                printType = "Manager";
                            }else if(userType.equals("3")){
                                printType = "Cashier";
                            }else if(userType.equals("0")){
                                printType = "Super Admin";
                            }
                            
                            String userName = u.getUsername();
                                
            %>
                            
                            
                            <a class="navbar-brand" href="#">Welcome Back <% out.println(printType + ", " + userName + "!"); %></a>
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
                                        <%=u.getCompanyName()%>
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
            </div>



</body>

</html>
