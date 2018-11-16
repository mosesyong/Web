<%-- 
    Document   : Menu
    Created on : 14 Jul, 2018, 2:03:20 PM
    Author     : moses
--%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <%@include file="PanelBars.jsp"%>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SnapDash</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <style>
            .category-table td{
               padding: 0px 10px ;
            }
        </style>
               
   </head>
      

    <body>
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Add Item To Menu</h4>
                                    </div>
                                    <div class="content">
                                        <form action="AddItemWebServlet" method='post' enctype=multipart/form-data>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control" placeholder="Name" name="name" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <input type="number" step="0.01" min = "0" class="form-control" placeholder="Price" name="price" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" step="0.01" min = "0" class="form-control" placeholder="Cost" name="cost" required>
                                                    </div>
                                                </div>
                                                    
                                            </div>
                                            
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <textarea class="form-control" rows="6" placeholder="Description" name="description" required></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    
                                                        <div class="form-group">
                                                            <label>Category</label><br>
                                                            <div class="card">
                                                                <div id="table-wrapper">
                                                                    <div id="table-scroll">
                                                                        <table class ="category-table table-striped">
                                                                            <tbody>

                                                                         <%
                                                                ArrayList<String> categoryList = u.getCategoryList();
                                                                for(String category : categoryList){
                                                                    if(category.length() > 0){
                                                                        out.println("<tr><td><input type ='checkbox' name = 'category' value = '" + category + "'>" + " " + category +"</td></tr>");
                                                                    }
                                                                }
                                                                    %>

                                                                            </tbody>             

                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                                
                                            
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Add Item Image</label>
                                                        <input type="file" class="form-control" name="image">
                                                    </div>
                                                </div>
                                            </div>
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
                                            <input type="submit" name="menu" class="btn btn-info btn-fill pull-right" style="border-color: #FFE37C" value="Add to Menu">
                                
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
