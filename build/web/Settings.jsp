<%-- 
    Document   : Settings
    Created on : 14 Jul, 2018, 10:58:41 AM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Settings</title>
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        
        <style>
            .changePassword{
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
                        <h1> Edit Password </h1>
       
                        Please enter your new password:
                        <br><br>
                        <form action="PasswordChangeWebServlet" method='post' class="changePassword">
                            <div class='form-group'>
                                <input type='hidden' name='username' value='<%=u.getUsername()%>'>
                                <input type='password' class='form-control' placeholder='New Password' name='newPassword'>    
                            </div>
                             
                            <button type='submit' class='btn'>Change Password</button>
                        <%
                            String msg = (String)request.getAttribute("msg");
                            if(msg != null){
                            out.println("<font color='red'>"  + msg + "</font><br>");
                            }
                        %>

        
       
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
    
</html>
