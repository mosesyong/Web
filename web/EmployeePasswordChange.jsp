<%-- 
    Document   : EmployeePasswordChange
    Created on : 29 Jul 2018, 5:44:48 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Password Change</title>
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        <%String username = (String)request.getAttribute("username");%>
        
        <style>
            .passwordChangeForm{
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
                    <h1>Change <%=username%>'s Password</h1>
                    <form type='post' action='PasswordChangeWebServlet' class="passwordChangeForm">
                        Enter new password:
                        <input type='hidden' name='username' value='<%=username%>'>
                        <div class='form-group'>
                            <input type='password' class='form-control' placeholder='New Password' name='newPassword' required>    
                        </div>
                        <button type='submit' class='btn'>Submit</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
