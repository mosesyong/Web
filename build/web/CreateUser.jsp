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
       <%@include file="sidebar.jsp"%>
	<meta charset="utf-8" />
	
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


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="design/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="design/css/pe-icon-7-stroke.css" rel="stylesheet" />
   </head>
      

    <body>
        <div class ="wrapper">         
            <div class="main-panel"> 
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    
            <%
            if(u.getTypeList().size() == (Integer.parseInt(u.getType()))){
            %>
            <!--Redundant-->                        
                                    <div class="header">
                                            <h4 class="title">Create Role</h4>
                                    </div>
                                    <div class="content">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <% out.println("We're sorry, Cashiers are not allowed to create new roles."); %>
                                            </div>
                                        </div>
                                    </div>
             <%   
            }else{
                %>
                                    <form action="CreateUserWebServlet" method='post'>                
                                        <div class="header">
                                            <h4 class="title">Create Role</h4>
                                        </div>
                                        <div class="content">
                <% if(u.getType().equals("0")){ %>
                <!--Creating Company Role by Super User-->                        
                                            <div class="row">
                                                <div class="col-md-5">
                                                   <div class="form-group">
                                                        <label>Merchant</label>
                                                        <input type="text" class="form-control" placeholder="Merchant" name="companyName">
                                                    </div> 
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                                    </div>
                                                </div>    
                                            </div>
                                            <input type="hidden" class="form-control" name="menu_right" value="1">
                                            <input type="hidden" class="form-control" name="menu" value="1">
                                            <input type="hidden" class="form-control" name="payment_right" value="1">
                                            <input type="hidden" class="form-control" name="payment" value="1">
                                            <input type="hidden" class="form-control" name="refund" value="1">
                                                  
                    <%  }else if(u.getType().equals("1")){ %>
                    <!--Creating Manager Role by Company-->                    
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <input type="hidden" name="companyName" value="<%=u.getCompanyName()%>">
                                                    <div class="form-group">
                                                        <label>Merchant</label>
                                                        <input type="text" class="form-control" disabled placeholder="Merchant" value=<%out.println(u.getCompanyName());%>>
                                                    </div> 
                                                </div>
                                            </div>
                                                    
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                                    </div>
                                                </div> 
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <label>Permissions</label>
                                                            <div class="card-body">
                                                              <table class="table">
                                                                   <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="menuRights" type="checkbox" name="menu_rights" value="1">
                                                                                    <label for="menuRights"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Menu Edit Rights</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="menuEdits" type="checkbox" name="menu" value="1">
                                                                                    <label for="menuEdits"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Menu Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEditRights" type="checkbox" name="finance_rights" value="1">
                                                                                    <label for="financeEditRights"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Finance Edit Rights</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEdit" type="checkbox" name="finance" value="1">
                                                                                    <label for="financeEdit"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Finance Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="refund" type="checkbox" name="refund" value="1">
                                                                                    <label for="refund"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Refund</td>
                                                                        </tr>
                                                                   </tbody>
                                                              </table>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                    <%  }else if(u.getType().equals("2")){ %>
                    <!--Creating Cashier Role by Manager-->
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <input type="hidden" name="companyName" value="<%=u.getCompanyName()%>">
                                                    <div class="form-group">
                                                        <label>Merchant</label>
                                                        <input type="text" class="form-control" disabled placeholder="Merchant" value=<%out.println(u.getCompanyName());%>>
                                                    </div> 
                                                </div>
                                            </div>
                                                    
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                                    </div>
                                                </div> 
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <label>Permissions</label>
                                                            <div class="card-body">
                                                              <table class="table">
                                                                   <tbody>
                                                                        <input type="hidden" class="form-control" name="menu_right" value="0">
                                                                        <input type="hidden" class="form-control" name="payment_right" value="0">
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="menuEdits" type="checkbox" name="menu" value="1">
                                                                                    <label for="menuEdits"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Menu Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEdit" type="checkbox" name="finance" value="1">
                                                                                    <label for="financeEdit"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Finance Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="refund" type="checkbox" name="refund" value="1">
                                                                                    <label for="refund"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>Refund</td>
                                                                        </tr>
                                                                   </tbody>
                                                              </table>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                    <%  }}; 
                        String tempPassword = (String)request.getAttribute("tempPassword");
                        if(tempPassword != null){
                        out.println("<font color='red'> Your Temporary Password is:"  + tempPassword + "</font>");
                        }   
                //out.println();
                //out.println();
            %>                            
                                    
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Create Profile</button>
                                            <div class="clearfix"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
     <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>


    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>

</html>

                    
                    
                    <!--
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="selectType">Creating User Type</label>
                                                <select class="form-control" id="selectType">
                                                    <option name="child">Manager</option>
                                                    <option name="child">Cashier</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="childType">Select Parent Group</label>
                                                <select class="form-control" id="childType">
                                                    <option name="parent">Outlet 1</option>
                                                    <option name="parent">Outlet 2</option>
                                                    <option name="parent">Outlet 3</option>
                                                </select>
                                            </div>
                                        </div>
                                            
                  
                                        
                        -->                

   