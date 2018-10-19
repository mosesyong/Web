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
       <link rel="stylesheet" type="text/css" href="design/css/tooltips.css">
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        
   </head>
      

    <body>
        <div class ="wrapper">         
            <div class="main-panel" style="margin-top: -550px"> 
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
                                                        <label>Merchant Name</label>
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
                
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" placeholder="Email" name="email">
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
                                                <div class="col-md-4">
                                                    <input type="hidden" name="companyName" value="<%=u.getCompanyName()%>">
                                                    <div class="form-group">
                                                        <label>Merchant Name</label>
                                                        <input type="text" class="form-control" disabled placeholder="Merchant" value="<%out.println(u.getCompanyName());%>">
                                                    </div> 
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Outlet Name</label>
                                                        <input type="text" class="form-control" placeholder="Outlet" name="outletName">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                                    </div>
                                                </div>
                                            </div>
                                                    
                                            <div class="row">
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" placeholder="Email" name="email">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                   <div class="form-group">
                                                       <label>GST (%)</label>
                                                       <input type="number" step="0.01" min = "0" class="form-control" placeholder="GST" name="gst">
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                   <div class="form-group">
                                                       <label>Service Charge (%)</label>
                                                       <input type="number" step="0.01" min = "0" class="form-control" placeholder="Service Charge" name="svc">
                                                   </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <label>Permissions</label>
                                                        <div class="help-tip">
                                                        <p>Edit would give the user the permission to edit the respective function.<br>
                                                            Edit Propagation would allow the user to give other users permission to edit the function.<br>
                                                            Refund would allow the employee to carry out refund transactions.</p>
                                                        
                                                        </div>
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
                                                                            <td style="text-align:left">Menu Edit Propagation</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="menuEdits" type="checkbox" name="menu" value="1">
                                                                                    <label for="menuEdits"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Menu Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEditRights" type="checkbox" name="finance_rights" value="1">
                                                                                    <label for="financeEditRights"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Finance Edit Propagation</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEdit" type="checkbox" name="finance" value="1">
                                                                                    <label for="financeEdit"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Finance Edit</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="refund" type="checkbox" name="refund" value="1">
                                                                                    <label for="refund"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Refund</td>
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
                                                <div class="col-md-4">
                                                    <input type="hidden" name="companyName" value="<%=u.getCompanyName()%>">
                                                    <div class="form-group">
                                                        <label>Merchant Name</label>
                                                        <input type="text" class="form-control" disabled placeholder="Merchant" value="<%out.println(u.getCompanyName());%>">
                                                    </div> 
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="hidden" name="outletName" value="<%=u.getOutletName()%>">
                                                    <div class="form-group">
                                                        <label>Outlet Name</label>
                                                        <input type="text" class="form-control" disabled placeholder="Outlet" value="<%out.println(u.getOutletName());%>">
                                                    </div>
                                                </div> 
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                                    </div>
                                                </div> 
                                            </div>
                                                    
                                                    
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" placeholder="Email" name="email">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <!--<input type="hidden" name="companyName" value="">--> 
                                                   <div class="form-group">
                                                       <label>GST (%)</label>
                                                       <input type="number" step="0.01" min = "0" class="form-control" disabled placeholder="GST" name="gst" value="<%=u.getGst()%>">
                                                   </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <!--<input type="hidden" name="companyName" value="10">--> 
                                                   <div class="form-group">
                                                       <label>Service Charge (%)</label>
                                                       <input type="number" step="0.01" min = "0" class="form-control" disabled placeholder="Service Charge" name="svc" value ="<%=u.getSvc()%>">
                                                   </div>
                                                </div>
                                                
                                            </div>
                                                    
                                                    
                                            <div class="row">
                                                <div class="col-md-5">
                                                    
                                                    <label>Permissions</label>
                                                    <div class="help-tip">
                                                        <p>Edit would give the user the permission to edit the respective function.<br>
                                                            Refund would allow the employee to carry out refund transactions.</p>
                                                    </div>
                                                                            
                                                        <div class="card">
                                                            <div class="card-body">
                                                              <table class="table">
                                                                   <tbody>
                                                                        <input type="hidden" class="form-control" name="menu_right" value="0">
                                                                        <input type="hidden" class="form-control" name="payment_right" value="0">
                                                                        <%
                                                                        ArrayList<String> accessList = u.getAccessList();
                                                                        
                                                                        if(accessList.contains("menu_right")){
                                                                        %>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="menuEdits" type="checkbox" name="menu" value="1">
                                                                                    <label for="menuEdits"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Menu Edit</td>
                                                                        </tr>
                                                                        <%}
                                                                        if(accessList.contains("payment_right")){%>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="financeEdit" type="checkbox" name="finance" value="1">
                                                                                    <label for="financeEdit"></label>
                                                                                </div>
                                                                                
                                                                            </td>
                                                                            <td style="text-align:left">Finance Edit</td>
                                                                        </tr>
                                                                        <%}
                                                                        if(accessList.contains("refund")){%>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="checkbox">
                                                                                    <input id="refund" type="checkbox" name="refund" value="1">
                                                                                    <label for="refund"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align:left">Refund</td>
                                                                        </tr>
                                                                        <%}%>
                                                                   </tbody>
                                                              </table>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                    <%  }}; 
                        String successMsg = (String)request.getAttribute("successMsg"); //password to append in successMsg
                        if(successMsg != null){
                            out.println("<font color='green'>"  + successMsg + "</font>");
                        }   
                        String errorMsg = (String)request.getAttribute("errorMsg");
                        if(errorMsg != null){
                            out.println("<font color='red'>"  + errorMsg + "</font>");
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
                                            
                  
                                        
                                        

   