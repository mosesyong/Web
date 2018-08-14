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
                                    <div class="header">
                                        <h4 class="title">Add Item To Menu</h4>
                                    </div>
                                    <div class="content">
                                        <form action="AddItemWebServlet" method='post'>
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
                                                        <input type="number" class="form-control" placeholder="Price" name="price" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" class="form-control" placeholder="Cost" name="cost" required>
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

                                            <button type="submit" class="btn btn-info btn-fill pull-right">Add to Menu</button>
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

    <!--   Core JS Files   -->
    <script src="design/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="design/js/bootstrap.min.js" type="text/javascript"></script>
    <!--  Charts Plugin -->
    <script src="design/js/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="design/js/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="design/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

</html>
