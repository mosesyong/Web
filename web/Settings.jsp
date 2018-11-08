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
        <%@include file="testSidebar.jsp"%>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
   </head>
      

    <body>
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Edit Password</h4>
                            </div>
                            <div class="content">
                                <form action="PasswordChangeWebServlet" method='post'>
                                <input type='hidden' name='username' value='<%=u.getUsername()%>'>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Old Password</label>
                                                <input type="password" class="form-control" placeholder="Old Password" name="oldPassword">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>New Password</label>
                                                <input type="password" class="form-control" placeholder="New Password" name="newPassword">
                                            </div>
                                        </div>
                                    </div>
                                                       
                                            
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Change Password</button>
                                    <div class="clearfix"></div>
                                    
                                </form>
                                 
                        <%
                            String successMsg = (String)request.getAttribute("successMsg");
                            if(successMsg != null){
                                out.println("<font color='green'>"  + successMsg + "</font>");
                            }   
                            String errorMsg = (String)request.getAttribute("errorMsg");
                            if(errorMsg != null){
                                out.println("<font color='red'>"  + errorMsg + "</font>");
                            }
                        %>
                            </div>

                        </div>
                    </div>
                    

                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>

                      
