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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        
        <style>
            .createUser{
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
                        <h1>Create User</h1>
                        <%=u%> <!-- to remove if no need show--><br><br>
                        Current Access Level: 
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
            
            out.println(userType);
        %>
        <br>
        <%
            
            if(toCreate.length() == 0){
                out.println("Cashiers cannot create new Users");
            }else{
                out.println("Creating " + toCreate + " user");
        %>
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null){
                out.println("<br><br><font color='red'>"  + msg + "</font>");
            }
            String tempPassword = (String)request.getAttribute("tempPassword");
            if(msg != null){
                out.println("<br><br><font color='red'>Temporary password is "  + tempPassword + "</font>");
            }
            %>
        <br><br>
                        
        <form action="CreateUserWebServlet" method='post' class="createUser">  <!--add access control restrictions-->
            <div class='form-group'>
                <input type='text' class='form-control' placeholder='New Username' name='username' required>    
            </div>
            <%
                if(category.equals("0")){
                    %>
                <div class='form-group'>
                    <input type='text' class='form-control' placeholder='Company Name' name='companyName'>    
                </div>
                    <% }  %>
<!--            <div class='form-group'>
                <input type='password' class='form-control' placeholder='New Password' name='password' required>    
            </div>-->
            <%
                    HashSet<String> access = u.getAccess();
                    if(access.contains("menu_right")){
            %>
            <div>
                <input type="checkbox" name="menu_rights" value="1"/>
                <label for="editRights">Menu Edit Rights</label>
            </div>
            <div>
                <input type="checkbox" name="menu" value="1"/>
                <label for="menuEdits">Menu Edits</label>
            </div>
            <%  }
                    if(access.contains("payment_right")){
            %>
            <div>
                <input type="checkbox" name="finance_rights" value="1"/>
                <label for="financeEditRights">Finance Edit Rights</label>
            </div>
            <div>
                <input type="checkbox" name="finance" value="1"/>
                <label for="financeEdit">Finance Edit</label>
            </div>
            
            <%
                }
                if(toCreate.equals("Cashier")){
            %>        
                       
            <div>
                <input type="checkbox" name="refund" value="1"/>
                <label for="refund">Refund</label>
            </div>    
            <%
                }
            %>
            <br>
            <button type='submit' class='btn'>Submit</button>
            </form>
            <%
                }
            %>
    </body>
</html>
