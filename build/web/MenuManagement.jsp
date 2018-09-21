<%-- 
    Document   : EditMenu
    Created on : Aug 13, 2018, 3:01:39 AM
    Author     : sharon
--%>


<%@page import="Dao.MenuDao"%>
<%@page import="Entity.Properties"%>
<%@page import="Entity.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="sidebar.jsp"%>
	<meta charset="utf-8" />
	
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
        
        <%
            Properties prop = new Properties();
            String url = prop.url;
            int port = prop.port;
            MenuDao.getMenu(u, url, port);
        %>
   </head>
    <body>
        <div class="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Menu Items</h4>
                                    </div>
            <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null){
                out.println("<font color='red'>"  + msg + "</font>");
            }
            %>
           
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                                <th>Food Name</th>
                                                <th>Price</th>
                                                <th>Cost</th>
                                                <th>Description</th>
                                                <th>Category</th>
                                                <th>Click to Edit</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                <%
                                                 ArrayList<Menu> menuList = u.getMenuList();
                                                 for(Menu m : menuList){
                                                    out.println("<tr><td align='center'>" + m.name + "</td><td align='center'>" + m.price + "</td><td align='center'>" + m.cost + "</td><td align='center'>" + m.desc + "</td><td align='center'>" + m.categoryList + "</td>");
                                                    out.println("<td align='center'><a href='MenuAccessWebServlet?foodName=" + m.name + "'>Edit</a></td></tr>");
                                                 }
                                                %>  
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
                                               
    </body>
</html>

