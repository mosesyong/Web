<%@page import="Entity.User"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
    
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
    
    <link rel="icon" type="image/png" href="design/img/topbaricon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


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

<div class="main-wrapper">
    <div class="sidebar" data-color="black" data-image="design/img/sidebar-5.jpg">

    	<div class="sidebar-wrapper">
            <div class="logo">
                    <img src="design/img/portalsidebar.png">
                </div>

            <ul class="nav">
                <li>
                    <a href="Main.jsp">
                        <i class="pe-7s-home"></i>
                        <p>Home</p>
                    </a>
                </li>
                <% if(!u.isLastChild()){ %>
                <li>
                    <a href="CreateUser.jsp">
                        <i class="pe-7s-add-user"></i>
                        <p>Create User</p>
                    </a>
                </li>
                <%}%>
                <li>
                    <a href="Settings.jsp">
                        <i class="pe-7s-tools"></i>
                        <p>Edit User Settings</p>
                    </a>
                </li>
                <% if(!u.isLastChild() && !u.getType().equals("0")){%>
                <li>
                    <a href="UserManagement.jsp">
                        <i class="pe-7s-users"></i>
                        <p>Manage Employees</p>
                    </a>
                </li>
                <%}if(!u.getType().equals("0") && u.hasMenuAccess()){%>
                <li class="nav-item">
                    <a class="nav-link" id="menu-tab" data-toggle="tab" href="CreateCategory.jsp" role="tab" aria-controls="menu" aria-selected="false">
                    <i class="pe-7s-network"></i>
                    <p>Create Category</p>    
                    </a>
                </li>
                <li>
                    <a href="AddMenu.jsp">
                        <i class="pe-7s-cart"></i>
                        <p>Add Item to Menu</p>
                    </a>
                </li>
                <li>
                    <a href="MenuManagement.jsp">
                        <i class="pe-7s-note2"></i>
                        <p>Edit Menu Item</p>
                    </a>
                </li>
                <li>
                    <a href="CopyMenu.jsp">
                        <i class="pe-7s-copy-file"></i>
                        <p>Copy Menu</p>
                    </a>
                </li>
                <li>
                    <a href="CreateDiscount.jsp">
                        <i class="pe-7s-ticket"></i>
                        <p>Create Discount</p>
                    </a>
                </li>
                
                <%}if(!u.isLastChild()){%>
                <li>
                    <a href="Analytics.jsp">
                        <i class="pe-7s-graph1"></i>
                        <p>View Analytics</p>
                    </a>
                </li>
                <%}if(!u.isLastChild()){%>
                <li>
                    <a href="DisplayTransactions.jsp">
                        <i class="pe-7s-news-paper"></i>
                        <p>View Transactions</p>
                    </a>
                </li>
                <li>
                    <a href="DisplayDiscount.jsp">
                        <i class="pe-7s-note2"></i>
                        <p>View Discounts</p>
                    </a>
                </li>
                <%}%>
            </ul>
    	</div>
    </div>
        
    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%
                            String userType = u.getType();
                            int index = Integer.parseInt(userType) - 1;
                            String printType = "Snapcoin Administrator";
                            if(index > -1){
                                printType = u.getTypeList().get(index);
                            }
                            String userName = u.getUsername();
                                
            %>
                            
                <p style="margin: 20px 20px">Welcome Back <% out.println(printType + ", " + userName + "!"); %></p>
                </div>
                
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                                <p style="margin: 20px 20px">
                                    Company: <b><%=u.getCompanyName()%></b>
                                </p>
                        </li>
                        <li>
                                <p style="margin: 20px 20px">
                                <%
                                    String outletName = u.getOutletName();
                                    if(outletName.length() > 0 && !outletName.equals("0")){
                                        out.println("Outlet: <b>" + outletName +"</b>");
                                    }
                                %>
                                </p>
                        </li>
                        
                        <li>
                            <a href="LogoutServlet">
                                <p>Log Out</p>
                            </a>
                        </li>
                        <li class="separator hidden-lg"></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>



</body>

    <!--   Core JS Files   -->
    <script src="design/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="design/js/core/bootstrap.min.js" type="text/javascript"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="design/js/light-bootstrap-dashboard.js?v=1.4.0"></script>




</html>
