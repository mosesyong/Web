<%-- 
    Document   : EmployeeEdit
    Created on : 23 Jul 2018, 11:48:39 PM
    Author     : moses
--%>

<%@page import="Entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
      <%@include file="sidebar.jsp"%>
      <%
        String employeeUsername = (String)request.getAttribute("employeeName");

//        if(!u.hasEmployee(employeeUsername)){ // for now dont care if have employee
//            response.sendRedirect("UserManagement.jsp");
//        }
        %>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="design/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="design/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="design/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>



        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="design/css/pe-icon-7-stroke.css" rel="stylesheet" />
   </head>
    <body>  
        <div class="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Editing access for <%=employeeUsername%></h4>
                                    </div>
                                    
                                     <div class="content">
                                        <form action="EmployeeEditWebServlet" method='post' class="editAccess">
                                            <div class="row">
                                                 <input type="hidden" name="employeeUsername" value ="<%=employeeUsername%>">
                                                <div class="col-md-5">
                                                    <div class="card">                                         
                                                        <div class="content">
                                                            <div class="form-group">
                                                                <label>Permissions</label>
                                                                <div class="content table-responsive table-full-width">
                                                                    <table class="table table-hover table-striped">
                                                                        <tbody>
                                                                            <tr>
                                                                                
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
            %>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Submit Changes</button>
                                            <div class="clearfix"></div>
                                        </form>
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


          
        
                        <button type='submit' class='btn'>Submit</button>
                        </form>
    </body>
</html>