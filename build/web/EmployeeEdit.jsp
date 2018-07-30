<%-- 
    Document   : EmployeeEdit
    Created on : 23 Jul 2018, 11:48:39 PM
    Author     : moses
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file ="Protect.jsp"%>
<!DOCTYPE html>
<html>
    <%
        String employeeUsername = (String)request.getAttribute("employeeName");
        if(!u.hasEmployee(employeeUsername)){
            response.sendRedirect("UserManagement.jsp");
        }
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        <title>Edit <%=employeeUsername%></title>
        
        <style>
            .editAccess{
                width: 50%;
            }
            
            .btn:hover{
                background:#D08D29;
                color:white;
            }
            
        </style>
        
        
    </head>
    <body>
        <div id="page-content-wrapper">
            <div class="containter-fluid">    
                <div class="row">
                    <div class="col-12">
                        <h1>Editing access for <%=employeeUsername%></h1>
                        <form action = "EmployeeEditWebServlet" method="post" class="editAccess">
                            <input type="hidden" name="employeeUsername" value ="<%=employeeUsername%>">
        <%
            ArrayList<String> employeeAccessList = (ArrayList<String>)request.getAttribute("access");
            for(String access : u.getAccessList()){
                boolean hasRight = false;
                for(String employeeAccess : employeeAccessList){
                    if(access.equals(employeeAccess)){
                        hasRight = true;
                    }
                }
                if(hasRight){
                    out.println("<input type='checkbox' name='access' value= '" + access + "' checked>" + access + "<br>");
                }else{
                    out.println("<input type='checkbox' name='access' value= '" + access + "'>" + access + "<br>");
                }
            }
            out.println("Change password: <input type='password' name='password'><br>");
        %>
                        <button type='submit' class='btn'>Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
