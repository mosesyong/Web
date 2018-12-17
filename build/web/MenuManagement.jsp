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
    
    <!-- Menu Management allows users to either edit menu item or delete the menu item -->
    
    <head>
        <%@include file="PanelBars.jsp"%>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        
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
            String successMsg = (String)request.getAttribute("successMsg");
                if(successMsg != null){
                    out.println("<font color='green'>"  + successMsg + "</font>");
                }   
                String errorMsg = (String)request.getAttribute("errorMsg");
                if(errorMsg != null){
                    out.println("<font color='red'>"  + errorMsg + "</font>");
                }
            %> 
           <!-- Table to list out current available Menu Items -->
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
                                                    out.println("<td align='center'><a href='MenuAccessWebServlet?foodName=" + m.name + "'><b>Edit</b></a></td></tr>");
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

