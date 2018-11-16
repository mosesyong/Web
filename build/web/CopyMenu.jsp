<%-- 
    Document   : CopyMenu
    Created on : 1 Oct 2018, 6:10:49 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="PanelBars.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SnapDash</title>
        
      <script>
        function myFunc() {
            var checkBox = document.getElementById("overwrite");

            if (checkBox.checked == true){
                alert("Warning, you are overwriting your current menu. \nYou can untick the append box to preserve your menu.\nAlternatively, press OK to confirm overwriting.");
            }
          }
      </script>
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
                                                                Overwrite Menu: <input type="checkbox" id="overwrite" name="overwrite" value="false" onclick="myFunc()"> Yes<br><br>
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
