<%-- 
    Document   : Menu
    Created on : 14 Jul, 2018, 2:03:20 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Menu</title>
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        
        <style>
            .addItem{
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
                        <h1>Add New Item to Menu</h1>
                        <br><br>
                        <form action="" method='post' class="addItem">
                            <div class='form-group'>
                                <input type='text' class='form-control' placeholder='Name' name='name'>    
                            </div>
                            <div class='form-group'>
                                <input type='text' class='form-control' placeholder='Price' name='price'>    
                            </div>
                            
                            <div class='form-group'>
                                <label for="menuImage">Image:</label> 
                                <input type="file" name="image"">
                            </div>
                          
                                
                            </div>
                            
                            <button type='submit' class='btn'>Add to Menu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
    </body>
</html>
