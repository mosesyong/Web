<%-- 
    Document   : Login
    Created on : 16 Jun, 2018, 3:54:42 PM
    Author     : Moses
--%>

<%@page import="Entity.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="design/img/topbaricon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Snapcoin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" type="text/css" href="design/css/loginpage.css">
  
    </head>
    <style>
        body{
            margin: 0;
            height: 100%;
            overflow: hidden;
        }
        
    </style>
    <body>
        <div class='modal-dialog text-center'>      
            <div class='col-sm-8 col-md-8 col-lg-8 col-xs-8 main-section'>
                <div class='modal-content'>
                    <div class='col-12 user-image'>
                        <img src='design/img/webportal.png'>
                    </div>
                    <div class='form'>
                        <form action="LoginWebServlet" class='col-12' method='post'>

                            <div class='form-group'>
                                <input type='text' class='form-control' placeholder='Enter Username' name='username'>    
                            </div>
                            <div class='form-group'>
                                <input type='password' class='form-control' placeholder='Enter Password' name='password'>    
                            </div>
                            <button type='submit' class='btn'><i class='fas fa-sign-in-alt'></i>Login</button>

                        </form>
                        <div class='col-12 forgot' style='margin:0'>
                                <a href="PasswordReset.jsp">Forgot Password?</a><br>
                                <%
                String successMsg = (String)request.getAttribute("successMsg");
                if(successMsg != null){
                    out.println("<font color='#73ffa7'>"  + successMsg + "</font>");
                }   
                String errorMsg = (String)request.getAttribute("errorMsg");
                if(errorMsg != null){
                    out.println("<font color='red'>"  + errorMsg + "</font>");
                }
                out.println("<br><font color='white'>"  + Properties.checkAlive() + "</font><br>");
                    
            %>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
