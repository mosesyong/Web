<%-- 
    Document   : Analytics
    Created on : Jul 28, 2018, 2:30:23 PM
    Author     : sharon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Analytics</title>
        <%@ include file ="Protect.jsp"%>
        <%@ include file ="sidebar.jsp"%>
        <link rel="stylesheet" href="CSS/mainbody.css">
        
        <style>           
            .btn:hover{
                position: relative;
                background:#D08D29;
                color:white;
            }
            
            .dropdown-menu{
                position: absolute;
                left: 120px;
            }
          
        </style>

    </head>
    <body>
         <div id="page-content-wrapper">
            <div class="containter-fluid">    
                <div class="row">
                    <div class="col-12">
                        <h1>View Analytics</h1>
                        <div class="dropdown">
                            Select Report Type: 
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                            Select Report 
                            <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><a role="reportType" href="daily.jsp">Daily Sales</a></li>
                                <li role="presentation"><a role="reportType" href="weekly.jsp">Weekly Sales</a></li>
                                <li role="presentation"><a role="reportType" href="monthly.jsp">Monthly Performance</a></li>
                                <li role="presentation"><a role="reportType" href="annual.jsp">Annual Performance</a></li>
                                <li role="presentation"><a role="reportType" href="itemSales.jsp">Total Items Sold</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
         </div>
       
    </body>
</html>
