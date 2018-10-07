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
       <link rel="stylesheet" type="text/css" href="design/css/tooltips.css">
        <style>
            td{
                align: left;
            }
          
        </style>
    
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
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                    <label>Permissions</label>
                                                    <div class="help-tip">
                                                        <p>Edit would give the user the permission to edit the respective function.<br>
                                                            Propagation would allow the user to give other users permission to edit the function.<br>
                                                            Refund would allow the employee to carry out refund transactions.</p>

                                                    </div>
                                                    <div class="card">                                         
                                                        <div class="table-wrapper">
                                                                <div class="content table-responsive table-full-width">
                                                                    <table class="table table-hover table-striped" align="left">
                                                                        <tbody>
                                                                                
                                                                                <%
            ArrayList<String> employeeAccessList = (ArrayList<String>)request.getAttribute("access");
            for(String access : u.getAccessList()){
                String displayAccess = "";
                if(access.equals("menu_right")){
                    displayAccess = "Menu Propagation";
                }else if(access.equals("payment_right")){
                    displayAccess="Payment Propagation";
                }else if(access.equals("menu")){
                    displayAccess = "Menu Edit";
                }else if(access.equals("payment")){
                    displayAccess="Payment Edit";
                }else if(access.equals("refund")){
                    displayAccess="Refund Edit";
                }
                
                boolean hasRight = false;
                for(String employeeAccess : employeeAccessList){
                    if(access.equals(employeeAccess)){
                        hasRight = true;
                    }
                }
                if(hasRight){
                    out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + displayAccess + "</td></tr>");
                }else{
                    out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + displayAccess + "</td></tr>");
                }
            }
            System.out.println(employeeAccessList);
            if(u.getType().equals("1")){
                
                    String access = "menu_right";
                    String displayAccess = "Menu Propagation";
                    

                    boolean hasRight = false;
                    for(String employeeAccess : employeeAccessList){
                        if(access.equals(employeeAccess)){
                            hasRight = true;
                        }
                    }
                    if(hasRight){
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + access + "</td></tr>");
                    }else{
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + access + "</td></tr>");
                    }
                    
                    access = "payment_right";
                    displayAccess="Payment Propagation";
                    
                    hasRight = false;
                    for(String employeeAccess : employeeAccessList){
                        if(access.equals(employeeAccess)){
                            hasRight = true;
                        }
                    }
                    if(hasRight){
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + access + "</td></tr>");
                    }else{
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + access + "</td></tr>");
                    }
                    
                    access = "menu";
                    displayAccess = "Menu";
                    hasRight = false;
                    for(String employeeAccess : employeeAccessList){
                        if(access.equals(employeeAccess)){
                            hasRight = true;
                        }
                    }
                    if(hasRight){
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + access + "</td></tr>");
                    }else{
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + access + "</td></tr>");
                    }
                    
                    access = "payment";
                    displayAccess="Payment";
                    hasRight = false;
                    for(String employeeAccess : employeeAccessList){
                        if(access.equals(employeeAccess)){
                            hasRight = true;
                        }
                    }
                    if(hasRight){
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + access + "</td></tr>");
                    }else{
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + access + "</td></tr>");
                    }
                    
                    access = "refund";
                    displayAccess="Refund";
                    hasRight = false;
                    for(String employeeAccess : employeeAccessList){
                        if(access.equals(employeeAccess)){
                            hasRight = true;
                        }
                    }
                    if(hasRight){
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "' checked>" + access + "</td></tr>");
                    }else{
                        out.println("<tr><td><input type='checkbox' name='access' value= '" + access + "'>" + access + "</td></tr>");
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