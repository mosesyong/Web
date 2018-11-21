<%-- 
    Document   : AccessManagement
    Created on : 14 Jul, 2018, 8:26:19 PM
    Author     : moses
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="PanelBars.jsp"%>
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
                                        <h4 class="title">User Management</h4>
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
           
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                                <th>Username</th>
                                                <th>Click to Edit Access</th>
                                                <th>Click to Delete</th>
                                            </thead>
                                            <tbody>
                                                <tr>
            <%
            for(String employeeName : u.getUniqueEmployees()){
                out.println("<tr><td align='center'>" + employeeName + "</td><td align='center'><a href='EmployeeAccessWebServlet?EmployeeName=" + employeeName + "'><b>Edit Access</b></a></td><td align='center'><a href='EmployeeDeleteWebServlet?EmployeeName=" + employeeName + "'><b>Delete Employee (irreversible)</b></a></td></tr>");

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
