<%-- 
    Document   : EmployeeEdit
    Created on : 23 Jul 2018, 11:48:39 PM
    Author     : moses
--%>

<%@page import="Entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ include file ="Protect.jsp"%>--%>
<!DOCTYPE html>
<html>
    <%
        User u = (User)session.getAttribute("user");
        String employeeUsername = (String)request.getAttribute("employeeName");

//        if(!u.hasEmployee(employeeUsername)){ // for now dont care if have employee
//            response.sendRedirect("UserManagement.jsp");
//        }
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit <%=employeeUsername%></title>
    </head>
    <body>  
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
    </body>
</html>
