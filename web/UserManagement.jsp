<%-- 
    Document   : AccessManagement
    Created on : 14 Jul, 2018, 8:26:19 PM
    Author     : moses
--%>

<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <%@ include file ="Protect.jsp"%>
        <%//@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        <style>
            .table{
                width: 80%;
                border-collapse:collapse;
            }
            
            table, td{
                border: 1px solid black;
            }
            
            .header{
                background-color: #FDCF18;
                
            }
            
        </style>

    </head>
    <body>
        <div id="page-content-wrapper">
            <div class="containter-fluid">    
                <div class="row">
                    <div class="col-12">
                        <h1>User Management</h1>
                        User Level: <%= u.getType()%><br>
                        Access Rights: <%= u.getAccess()%><br>
                        <br>
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null){
                out.println("<font color='red'>"  + msg + "</font>");
            }
            %>
            <%=u%>
        <table class ="table table-bordered">
            <tr class="header">
                <td align="center"><b>Username</b></td>
                <td align="center"><b>Click to edit access</b></td>
                <td align="center"><b>Click to edit password</b></td>
                <td align="center"><b>Click to delete</b></td>
            </tr>
        <%
//            for(String employeeName : u.getEmployees()){
//                out.println("<tr><td align='center'>" + employeeName + "</td><td align='center'><a href='EmployeeAccessWebServlet?EmployeeName=" + employeeName + "'>Edit Access</a></td><td align='center'><a href='EmployeePasswordChangeWebServlet?username=" + employeeName + "'>Edit Password</a></td><td align='center'>Delete (not done yet)</td></tr>");
//                
//            }
            %>
        </table>
                    </div>
                </div>
            </div>
        </div>
        
        
    </body>
</html>
