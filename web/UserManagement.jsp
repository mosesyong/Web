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
    
    <!-- User Management Page allows users to edit the access of the user or delete the users available in the database -->
    
    <head>
        <%@include file="PanelBars.jsp"%>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
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
           <!-- Table with User Management Links -->
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
                out.println("<tr><td align='center'>" + employeeName + "</td><td align='center'><a href='EmployeeAccessWebServlet?EmployeeName=" + employeeName + "'>Edit Access</a></td><td align='center'><a href='EmployeeDeleteWebServlet?EmployeeName=" + employeeName + "'>Delete Employee (irreversible)</a></td></tr>");

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
