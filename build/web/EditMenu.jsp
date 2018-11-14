<%-- 
    Document   : EditMenu
    Created on : 11 Sep 2018, 12:56:29 AM
    Author     : moses
--%>

<%@page import="Entity.Menu"%>
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
        <%Menu m = (Menu)session.getAttribute("menuItem");%>
        <%--<%=m%>--%>

        
        <div class ="wrapper">
            <div class="main-panel">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Menu Item</h4>
                                    </div>
                                    <div class="content">
                                        <form action="MenuEditWebServlet" method='post' enctype=multipart/form-data>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control" value="<%=m.name%>" name="displayName" disabled>
                                                        <input type="hidden" class="form-control" value="<%=m.name%>" name="name">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <input type="number" step="0.01" min = "0" class="form-control" value="<%=m.price%>" name="price" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" step="0.01" min = "0" class="form-control" value="<%=m.cost%>" name="cost" required>
                                                    </div>
                                                </div>
                                                    
                                            </div>
                                            
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <textarea class="form-control" rows="6"  name="description" required><%=m.desc%></textarea>
                                                    </div>
                                                </div>
                                            <!--</div>-->
                                            
                                            <!--<div class="row">-->
                                                <div class="col-md-6">
                                                    
                                                        <div class="form-group">
                                                            <label>Category</label><br>
                                                            <div class="card">
                                                                <div id="table-wrapper">
                                                                    <div id="table-scroll">
                                                                        <table class ="category-table">
                                                                            <tbody>

                                                                         <%
                                                                ArrayList<String> itemCategory = m.categoryList;
                                                                ArrayList<String> categoryList = u.getCategoryList();
                                                                System.out.println(itemCategory);
                                                                System.out.println(categoryList);

                                                                for(String category : categoryList){
                                                                    boolean isPresent = false;
                                                                    for(String iCategory : itemCategory){
                                                                        if (iCategory.equals(category)){
                                                                            isPresent = true;
                                                                            break;
                                                                        }
                                                                    }
                                                                    if(isPresent){
                                                                        out.println("<tr height='25px'><td><input type ='checkbox' name = 'category' value = '" + category + "' checked>" + " " + category +"</td></tr>");
                                                                    }else{
                                                                        out.println("<tr height='25px'><td><input type ='checkbox' name = 'category' value = '" + category + "'>" + " " + category +"</td></tr>");
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
                                                <div class="col-md-6">
                                                    <label>Image</label>
                                                    <div class="card">
                                                      <img src="<%=m.url%>" width="100%" height="100%">
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
                                    //out.println();
                                    //out.println();
                                %>
                                            
                                             <input type="submit" name="menu" class="btn btn-info btn-fill pull-right" style="border-color: #FFE37C" value="Keep Changes">
                                
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
