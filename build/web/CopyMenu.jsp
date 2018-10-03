<%-- 
    Document   : CopyMenu
    Created on : 1 Oct 2018, 6:10:49 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="sidebar.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Copy Menu</title>
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
                                        <h3 class="title">Edit Menu Item</h3>
                                    </div>                                
                                    <div class="content">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
        <%
                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            %>
                                                    <form action="CopyMenuWebServlet">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                            Sister Outlet: 
                                                                <select name="sourceOutletName">
                <%
                    for(String sister : u.getSisterOutlets()){
                %> 
                <option value="<%=sister%>"><%=sister%></option>
                <%
                    }
                %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                Append Menu: <input type="checkbox" name="append" value="true"> Append<br><br>
            
                                                            </div>
                                                        </div>
            
                                                        <input type="submit" name="menu" class="btn btn-info btn-fill pull-right" style="border-color: #FFE37C" value="Submit">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
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
