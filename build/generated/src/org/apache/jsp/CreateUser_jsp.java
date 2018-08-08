package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashSet;
import Entity.User;
import Entity.User;

public final class CreateUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("   <head>\r\n");
      out.write("        \r\n");


    Object o = session.getAttribute("user");
    if(o == null){
        response.sendRedirect("Login.jsp");
        return;
    }
    User u = (User)o;

      out.write(" \r\n");
      out.write("\t<meta charset=\"utf-8\" />\r\n");
      out.write("\t<link rel=\"icon\" type=\"image/png\" href=\"assets/img/favicon.ico\">\r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("\r\n");
      out.write("\t<title>SnapDash</title>\r\n");
      out.write("\r\n");
      out.write("\t<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap core CSS     -->\r\n");
      out.write("        <link href=\"design/css/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("\r\n");
      out.write("        <!-- Animation library for notifications   -->\r\n");
      out.write("        <link href=\"design/css/animate.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("\r\n");
      out.write("        <!--  Light Bootstrap Table core CSS    -->\r\n");
      out.write("        <link href=\"design/css/light-bootstrap-dashboard.css?v=1.4.0\" rel=\"stylesheet\"/>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!--  CSS for Demo Purpose, don't include it in your project     -->\r\n");
      out.write("        <link href=\"design/css/demo.css\" rel=\"stylesheet\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!--     Fonts and icons     -->\r\n");
      out.write("        <link href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>\r\n");
      out.write("        <link href=\"design/css/pe-icon-7-stroke.css\" rel=\"stylesheet\" />\r\n");
      out.write("   </head>\r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class =\"wrapper\">\r\n");
      out.write("            <div class=\"sidebar\" data-color=\"yellow\" data-image=\"design/img/sidebar-5.jpg\">\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"sidebar-wrapper\">\r\n");
      out.write("                    <div class=\"logo\">\r\n");
      out.write("                         <img src=\"design/img/sidebar-logo.png\">\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <ul class=\"nav\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"main.jsp\">\r\n");
      out.write("                            <i class=\"pe-7s-home\"></i>\r\n");
      out.write("                            <p>Home</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"active\">\r\n");
      out.write("                            <a href=\"CreateUser.jsp\">\r\n");
      out.write("                            <i class=\"pe-7s-add-user\"></i>\r\n");
      out.write("                            <p>Create User</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"Settings.jsp\">\r\n");
      out.write("                                <i class=\"pe-7s-tools\"></i>\r\n");
      out.write("                                <p>Edit User Settings</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"UserManagement.jsp\">\r\n");
      out.write("                                <i class=\"pe-7s-users\"></i>\r\n");
      out.write("                                <p>Manage Employees</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"Menu.jsp\">\r\n");
      out.write("                                <i class=\"pe-7s-cart\"></i>\r\n");
      out.write("                                <p>Add item to Menu</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"Analytics.jsp\">\r\n");
      out.write("                                <i class=\"pe-7s-graph1\"></i>\r\n");
      out.write("                                <p>View Analytics</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        \r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"main-panel\">\r\n");
      out.write("                <nav class=\"navbar navbar-default navbar-fixed\">\r\n");
      out.write("                    <div class=\"container-fluid\">\r\n");
      out.write("                        <div class='navbar-header'>\r\n");
      out.write("                            <button type='button' class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navigation-example-2\">\r\n");
      out.write("                                <span class='sr-only'>Toggle Navigation</span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                            </button>\r\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">Welcome Back, Company ");
      out.print(u.getCompanyName());
      out.write("!</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"collapse navbar-collapse\">\r\n");
      out.write("                            <ul class=\"nav navbar-nav navbar-left\">\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\r\n");
      out.write("                                                <i class=\"fa fa-dashboard\"></i>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                            \r\n");
      out.write("                            <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\">\r\n");
      out.write("                                        ");
      out.print(u.getUsername());
      out.write("\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"LogoutServlet\">\r\n");
      out.write("                                        <p>Log out</p>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li class=\"separator hidden-lg\"></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </nav>        \r\n");
      out.write("                \r\n");
      out.write("             ");

    
            String category = u.getType();
            String userType = "";
            String toCreate = "";
            if(category.equals("0")){
                userType = "Super User";
                toCreate = "Admin";
            }else if(category.equals("1")){
                userType = "Admin";
                toCreate = "Manager";
            }else if(category.equals("2")){
                userType = "Manager";
                toCreate = "Cashier";
            }
            
            
      out.write("\r\n");
      out.write("         \r\n");
      out.write("            \r\n");
      out.write("                \r\n");
      out.write("        <div class=\"content\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12\">\r\n");
      out.write("                        <div class=\"card\">\r\n");
      out.write("                            <div class=\"header\">\r\n");
      out.write("                                <h4 class=\"title\">Create User</h4>\r\n");
      out.write("                            </div>\r\n");
      out.write("            ");

            if(toCreate.length() == 0){
                out.println("Cashiers cannot create new Users");
            }else{
                
      out.write("\r\n");
      out.write("                            <div class=\"content\">\r\n");
      out.write("                                <form action=\"CreateUserWebServlet\" method='post'>\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        \r\n");
      out.write("                                        <div class=\"col-md-4\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label for=\"AccountType\">Account Type</label>\r\n");
      out.write("                                                <input type=\"email\" class=\"form-control\" disabled placeholder=\"Account\" value=");
      out.print(u.getUsername());
      out.write(">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"col-md-3\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>Creating User Type (Disabled)</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" disabled placeholder=\"Account Type\" value=");
out.println(toCreate);
      out.write(">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                            \r\n");
      out.write("                    ");

                        if(category.equals("0")){
                    
      out.write("\r\n");
      out.write("                                        <div class='col-md-5'>\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <input type='text' class=\"form-control\" placeholder='Company' name='companyName'>    \r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                    ");
  }else{ 
      out.write("\r\n");
      out.write("                                        <input type=\"hidden\" name=\"companyName\" value=\"");
      out.print(u.getCompanyName());
      out.write("\">\r\n");
      out.write("                    ");
  }
      out.write("\r\n");
      out.write("                                            \r\n");
      out.write("                                        <div class=\"col-md-5\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>Company (disabled)</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" disabled placeholder=\"Company\" value=");
out.println(u.getCompanyName());
      out.write(">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        \r\n");
      out.write("                                        \r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-6\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>First Name</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" placeholder=\"First Name\">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"col-md-6\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>Last Name</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" placeholder=\"Last Name\">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-12\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>Username</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" placeholder=\"Username\" name=\"username\">\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                            \r\n");
      out.write("                                            \r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-6\">\r\n");
      out.write("                                            <div class=\"card\">                                         \r\n");
      out.write("                                                <div class=\"content\">\r\n");
      out.write("                                                    <div class=\"form-group\">\r\n");
      out.write("                                                        <label>Permissions</label>\r\n");
      out.write("                                                        <div class=\"table-full-width\">\r\n");
      out.write("                                                            <table class=\"table\">\r\n");
      out.write("                                                                <tbody>\r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                        <td>\r\n");
      out.write("            ");

                HashSet<String> access = u.getAccess();
                if(access.contains("menu_right")){
            
      out.write("\r\n");
      out.write("                                                                            <div class=\"checkbox\">\r\n");
      out.write("                                                                                <input id=\"menuRights\" type=\"checkbox\" name=\"menu_rights\" value=\"1\">\r\n");
      out.write("                                                                                <label for=\"editRights\"></label>\r\n");
      out.write("                                                                            </div>\r\n");
      out.write("                                                                        </td>\r\n");
      out.write("                                                                        <td>Menu Edit Right</td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                        <td>\r\n");
      out.write("                                                                            <div class=\"checkbox\">\r\n");
      out.write("                                                                                <input id=\"menuEdits\" type=\"checkbox\" name=\"menu\" value=\"1\">\r\n");
      out.write("                                                                                <label for=\"menuEdits\"></label>\r\n");
      out.write("                                                                            </div>\r\n");
      out.write("                                                                        </td>\r\n");
      out.write("                                                                        <td>Menu Edit</td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("            ");
 }
               if(access.contains("payment_right")){
            
      out.write("\r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                        <td>\r\n");
      out.write("                                                                            <div class=\"checkbox\">\r\n");
      out.write("                                                                                <input id=\"financeEditRights\" type=\"checkbox\" name=\"finance_rights\" value=\"1\">\r\n");
      out.write("                                                                                <label for=\"financeEditRights\"></label>\r\n");
      out.write("                                                                            </div>\r\n");
      out.write("                                                                        </td>\r\n");
      out.write("                                                                        <td>Finance Edit Rights</td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                        <td>\r\n");
      out.write("                                                                            <div class=\"checkbox\">\r\n");
      out.write("                                                                                <input id=\"financeEdit\" type=\"checkbox\" name=\"finance\" value=\"1\">\r\n");
      out.write("                                                                                <label for=\"financeEdits\"></label>\r\n");
      out.write("                                                                            </div>\r\n");
      out.write("                                                                        </td>\r\n");
      out.write("                                                                        <td>Finance Edit</td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("        ");

            }
            if(toCreate.equals("Cashier")){
            
      out.write(" \r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                        <td>\r\n");
      out.write("                                                                            <div class=\"checkbox\">\r\n");
      out.write("                                                                                <input id=\"refund\" type=\"checkbox\" name=\"refund\" value=\"1\">\r\n");
      out.write("                                                                                <label for=\"refund\"></label>\r\n");
      out.write("                                                                            </div>\r\n");
      out.write("                                                                        </td>\r\n");
      out.write("                                                                        <td>Refund</td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("                        ");

                            }
                        
      out.write("\r\n");
      out.write("                                                                </tbody>\r\n");
      out.write("                                                            </table>\r\n");
      out.write("                                                        </div>  \r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                                                \r\n");
      out.write("                                        <div class=\"col-md-6\">\r\n");
      out.write("                                            <div class=\"form-group\">\r\n");
      out.write("                                                <label>About Me</label>\r\n");
      out.write("                                                <textarea rows=\"5\" class=\"form-control\" placeholder=\"Optional Notes\"></textarea>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                                       \r\n");
      out.write("                                            \r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-info btn-fill pull-right\">Create Profile</button>\r\n");
      out.write("                                    <div class=\"clearfix\"></div>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </div>\r\n");
      out.write("                                                                \r\n");
      out.write("                        ");
 } 
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <footer class=\"footer\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <nav class=\"pull-left\">\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#\">\r\n");
      out.write("                                Home\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </nav>\r\n");
      out.write("            </div>\r\n");
      out.write("        </footer>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("    <!--   Core JS Files   -->\r\n");
      out.write("    <script src=\"assets/js/jquery.3.2.1.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("    <script src=\"assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!--  Charts Plugin -->\r\n");
      out.write("    <script src=\"assets/js/chartist.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!--  Notifications Plugin    -->\r\n");
      out.write("    <script src=\"assets/js/bootstrap-notify.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!--  Google Maps Plugin    -->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->\r\n");
      out.write("    <script src=\"assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\r\n");
      out.write("    <script src=\"assets/js/demo.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
