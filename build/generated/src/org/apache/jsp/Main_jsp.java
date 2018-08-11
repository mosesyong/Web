package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.HashSet;
import Entity.User;

public final class Main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/sidebar.jsp");
  }

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
      out.write("    <head>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("   <head>\r\n");


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
      out.write("      \r\n");
      out.write("   </head>\r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("            <div class=\"sidebar\" data-color=\"yellow\" data-image=\"design/img/sidebar-5.jpg\">\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"sidebar-wrapper\">\r\n");
      out.write("                    <div class=\"logo\">\r\n");
      out.write("                         <img src=\"design/img/sidebar-logo.png\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- Nav tabs -->\r\n");
      out.write("                    <ul class=\"nav nav-pills\" id=\"sidebarTabs\" role=\"tablist\">\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                          <a class=\"nav-link active\" id=\"main-tab\" data-toggle=\"tab\" href=\"Main.jsp\" role=\"tab\" aria-controls=\"home\" aria-selected=\"true\">\r\n");
      out.write("                           <i class=\"pe-7s-home\"></i>\r\n");
      out.write("                           <p>Home</p>   \r\n");
      out.write("                          </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                          <a class=\"nav-link\" id=\"create-tab\" data-toggle=\"tab\" href=\"CreateUser.jsp\" role=\"tab\" aria-controls=\"create\" aria-selected=\"false\">\r\n");
      out.write("                           <i class=\"pe-7s-add-user\"></i>\r\n");
      out.write("                           <p>Create Role</p>   \r\n");
      out.write("                          </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\" id=\"settings-tab\" data-toggle=\"tab\" href=\"Settings.jsp\" role=\"tab\" aria-controls=\"settings\" aria-selected=\"false\">\r\n");
      out.write("                        <i class=\"pe-7s-tools\"></i>\r\n");
      out.write("                        <p>Edit User Settings</p>\r\n");
      out.write("                        </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                          <a class=\"nav-link\" id=\"management-tab\" data-toggle=\"tab\" href=\"UserManagement.jsp\" role=\"tab\" aria-controls=\"management\" aria-selected=\"false\">\r\n");
      out.write("                          <i class=\"pe-7s-users\"></i>\r\n");
      out.write("                          <p>Manage Employees</p>    \r\n");
      out.write("                          </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                          <a class=\"nav-link\" id=\"menu-tab\" data-toggle=\"tab\" href=\"Menu.jsp\" role=\"tab\" aria-controls=\"menu\" aria-selected=\"false\">\r\n");
      out.write("                          <i class=\"pe-7s-cart\"></i>\r\n");
      out.write("                          <p>Add item to Menu</p>    \r\n");
      out.write("                          </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                      <li class=\"nav-item\">\r\n");
      out.write("                          <a class=\"nav-link\" id=\"analytics-tab\" data-toggle=\"tab\" href=\"Analytics.jsp\" role=\"tab\" aria-controls=\"analytics\" aria-selected=\"false\">\r\n");
      out.write("                          <i class=\"pe-7s-graph1\"></i>\r\n");
      out.write("                          <p>View Analytics</p>   \r\n");
      out.write("                          </a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("\r\n");
      out.write("                    <!-- Tab panes -->\r\n");
      out.write("                    <div class=\"tab-content\">\r\n");
      out.write("                      <div class=\"tab-pane active\" id=\"main\" role=\"tabpanel\" aria-labelledby=\"main-tab\"></div>\r\n");
      out.write("                      <div class=\"tab-pane\" id=\"create\" role=\"tabpanel\" aria-labelledby=\"create-tab\"></div>\r\n");
      out.write("                      <div class=\"tab-pane\" id=\"settings\" role=\"tabpanel\" aria-labelledby=\"settings-tab\"></div>\r\n");
      out.write("                      <div class=\"tab-pane\" id=\"management\" role=\"tabpanel\" aria-labelledby=\"management-tab\"></div>\r\n");
      out.write("                      <div class=\"tab-pane\" id=\"menu\" role=\"tabpanel\" aria-labelledby=\"menu-tab\"></div>\r\n");
      out.write("                      <div class=\"tab-pane\" id=\"analytics\" role=\"tabpanel\" aria-labelledby=\"analytics-tab\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        \r\n");
      out.write("            <div class=\"main-panel\">\r\n");
      out.write("                <nav class=\"navbar navbar-default navbar-fixed\">\r\n");
      out.write("                    <div class=\"container-fluid\">\r\n");
      out.write("                        <div class='navbar-header'>\r\n");
      out.write("                            <button type='button' class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navigation-example-2\">\r\n");
      out.write("                                <span class='sr-only'>Toggle Navigation</span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                                <span class='icon-bar'></span>\r\n");
      out.write("                            </button>                          \r\n");
      out.write("            ");

                            String userType = u.getType();
                            String printType = "";
                            if(userType.equals("1")){
                                printType = "Admin";
                            }else if(userType.equals("2")){
                                printType = "Manager";
                            }else if(userType.equals("3")){
                                printType = "Cashier";
                            }else if(userType.equals("0")){
                                printType = "Super Admin";
                            }
                            
                            String userName = u.getUsername();
                                
            
      out.write("\r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">Welcome Back ");
 out.println(printType + ", " + userName + "!"); 
      out.write("</a>\r\n");
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
      out.write("                                        Company ");
      out.print(u.getCompanyName());
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
      out.write("                </nav>   \r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("\t<meta charset=\"utf-8\" />\r\n");
      out.write("\t<link rel=\"icon\" type=\"image/png\" href=\"assets/img/favicon.ico\">\r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("\r\n");
      out.write("\t<title>SnapDash</title>\r\n");
      out.write("\r\n");
      out.write("\t<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\" />\r\n");
      out.write("        <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>\r\n");
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
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        <div class =\"wrapper\">\r\n");
      out.write("            <div class=\"main-panel\">\r\n");
      out.write("                \r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("           \r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-5\">\r\n");
      out.write("                        <div class=\"card\">\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"header\">\r\n");
      out.write("                                <h4 class=\"title\">Today's Revenue</h4>\r\n");
      out.write("                                <p class=\"category\">Total Sales for the Day</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"content\">\r\n");
      out.write("                                <div id=\"chartPreferences\" class=\"ct-chart ct-perfect-fourth\" >\r\n");
      out.write("                                    <canvas id=\"salesChart\"></canvas>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                \r\n");
      out.write("                                <script>\r\n");
      out.write("                                    var salesChart = document.getElementById('salesChart').getContext('2d');\r\n");
      out.write("                                    \r\n");
      out.write("                                   \r\n");
      out.write("                                \r\n");
      out.write("                                    var salesPerformanceChart = new Chart(salesChart,{\r\n");
      out.write("                                        type:'doughnut',\r\n");
      out.write("                                        data: {\r\n");
      out.write("                                            labels:['achieved', 'targeted'],\r\n");
      out.write("                                            datasets:[{\r\n");
      out.write("                                                    label:'$',\r\n");
      out.write("                                                    data:[5204, 7500],\r\n");
      out.write("                                                    backgroundColor:['#87CB16',\r\n");
      out.write("                                                    '#FF9500']   \r\n");
      out.write("                                                }]\r\n");
      out.write("                                            },\r\n");
      out.write("                                            options:{\r\n");
      out.write("                                                legend:{\r\n");
      out.write("                                                    display: false\r\n");
      out.write("                                                }\r\n");
      out.write("                                            }\r\n");
      out.write("                                        }     \r\n");
      out.write("                                    )\r\n");
      out.write("                                </script>\r\n");
      out.write("                                    \r\n");
      out.write("                                   \r\n");
      out.write("\r\n");
      out.write("                                <div class=\"footer\">\r\n");
      out.write("                                    <div class=\"legend\">\r\n");
      out.write("                                        <i class=\"fa fa-circle text-success\"></i> Achieved\r\n");
      out.write("                                        <i class=\"fa fa-circle text-warning\"></i> Targeted\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <hr>\r\n");
      out.write("                                    <div class=\"stats\">\r\n");
      out.write("                                        <i class=\"fa fa-clock-o\"></i> Campaign sent 2 days ago\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"col-md-7\">\r\n");
      out.write("                        <div class=\"card\">\r\n");
      out.write("                            <div class=\"header\">\r\n");
      out.write("                                <h4 class=\"title\">Consumer Behavior</h4>\r\n");
      out.write("                                <p class=\"category\">24 Hours performance</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"content\">\r\n");
      out.write("                                <div id=\"chartHours\" class=\"ct-chart\"></div>\r\n");
      out.write("                                \r\n");
      out.write("                                <div class=\"footer\">\r\n");
      out.write("                                    <div class=\"legend\">\r\n");
      out.write("                                        <i class=\"fa fa-circle text-info\"></i> PPT\r\n");
      out.write("                                        <i class=\"fa fa-circle text-danger\"></i> SPT\r\n");
      out.write("                                        <i class=\"fa fa-circle text-warning\"></i> DPT\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <hr>\r\n");
      out.write("                                    <div class=\"stats\">\r\n");
      out.write("                                        <i class=\"fa fa-history\"></i> Updated 3 minutes ago\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>    \r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
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
      out.write("\t<script src=\"assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\r\n");
      out.write("    <script src=\"assets/js/demo.js\"></script>\r\n");
      out.write("                    \r\n");
      out.write("              \r\n");
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
