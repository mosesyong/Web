<%-- 
    Document   : Login
    Created on : 16 Jun, 2018, 3:54:42 PM
    Author     : Moses
--%>

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
    <body>
        <div class='modal-dialog text-center'>
                 
            <div class='col-sm-8 main-section'>
             
                <div class='modal-content'>
                  
                    <div class='col-12 user-image'>
                        <img src='design/img/snapcoin-logo.png'>
                    </div>
                    <form action="LoginWebServlet" class='col-12' method='post'>
            
                        <div class='form-group'>
                            <input type='text' class='form-control' placeholder='Enter Username' name='username'>    
                        </div>
                        <div class='form-group'>
                            <input type='password' class='form-control' placeholder='Enter Password' name='password'>    
                        </div>
                        <button type='submit' class='btn'><i class='fas fa-sign-in-alt'></i>Login</button>
                        
                    </form>
                    <div class='status'>
                        <%
                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            %>
            <br><br>
                    </div>
                    <!--
                    <div class='col-12 forgot'>
                        <a href='#'>Forgot Password?</a>
                    </div>
                    -->
                </div><!--end of modal content-->
            </div>
        </div>
    </body>
</html>
