<%-- 
    Document   : PasswordReset
    Created on : 4 Oct 2018, 12:36:56 AM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="design/img/topbaricon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Password Reset for Snapcoin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" type="text/css" href="design/css/loginpage.css">
  
    </head>
    <body>
        <div class='modal-dialog text-center'>
                 
            <div class='col-sm-8 col-md-8 col-lg-8 col-xs-8 main-section'>
             
                <div class='modal-content'>
                  
                    <div class='col-12 user-image'>
                        <img src='design/img/webportal.png'>
                    </div>
                    
                    <div class='header'>
                        <h4 style='color: white'>Password Reset</h4>
                    </div>
                    
                    <div class='form'>
                        <form action="PasswordResetWebServlet" class='col-12' method='post'>

                            <div class='form-group'>
                                <input type='text' class='form-control' placeholder='Enter Username' name='username'>    
                            </div>
                            <div class='form-group'>
                                <input type='text' class='form-control' placeholder='Enter Email' name='email'>    
                            </div>
                            <button type='submit' class='btn' style='width: fit-content'><i class='fas fa-sign-in-alt'></i>Reset Password</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
                        
        
    </body>
</html>
