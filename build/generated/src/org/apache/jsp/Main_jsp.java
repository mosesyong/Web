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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("   <head>\n");
      out.write("      <link rel=\"icon\" type=\"image/png\" href=\"design/img/topbaricon.ico\"> \n");


    Object o = session.getAttribute("user");
    if(o == null){
        response.sendRedirect("Login.jsp");
        return;
    }
    User u = (User)o;

      out.write(" \n");
      out.write("\t<meta charset=\"utf-8\" />\n");
      out.write("\t<link rel=\"icon\" type=\"image/png\" href=\"assets/img/favicon.ico\">\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\n");
      out.write("\n");
      out.write("\t<title>SnapDash</title>\n");
      out.write("\n");
      out.write("\t<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS     -->\n");
      out.write("        <link href=\"design/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("        <!-- Animation library for notifications   -->\n");
      out.write("        <link href=\"design/css/animate.min.css\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("        <!--  Light Bootstrap Table core CSS    -->\n");
      out.write("        <link href=\"design/css/light-bootstrap-dashboard.css?v=1.4.0\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--  CSS for Demo Purpose, don't include it in your project     -->\n");
      out.write("        <link href=\"design/css/demo.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--     Fonts and icons     -->\n");
      out.write("        <link href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>\n");
      out.write("        <link href=\"design/css/pe-icon-7-stroke.css\" rel=\"stylesheet\" />\n");
      out.write("      \n");
      out.write("   </head>\n");
      out.write("      \n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("            <div class=\"sidebar\" data-color=\"yellow\" data-image=\"design/img/sidebar-5.jpg\">\n");
      out.write("                \n");
      out.write("                <div class=\"sidebar-wrapper\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                         <img src=\"design/img/sidebar-logo.png\">\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Nav tabs -->\n");
      out.write("                \n");
      out.write("                      \n");
      out.write("                      ");

                          if(!u.isLastChild()){
                        
      out.write("\n");
      out.write("                    <ul class=\"nav nav-pills\" id=\"sidebarTabs\" role=\"tablist\">\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link active\" id=\"main-tab\" data-toggle=\"tab\" href=\"Main.jsp\" role=\"tab\" aria-controls=\"home\" aria-selected=\"true\">\n");
      out.write("                           <i class=\"pe-7s-home\"></i>\n");
      out.write("                           <p>Home</p>   \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"create-tab\" data-toggle=\"tab\" href=\"CreateUser.jsp\" role=\"tab\" aria-controls=\"create\" aria-selected=\"false\">\n");
      out.write("                           <i class=\"pe-7s-add-user\"></i>\n");
      out.write("                           <p>Create Role</p>   \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" id=\"settings-tab\" data-toggle=\"tab\" href=\"Settings.jsp\" role=\"tab\" aria-controls=\"settings\" aria-selected=\"false\">\n");
      out.write("                        <i class=\"pe-7s-tools\"></i>\n");
      out.write("                        <p>Edit User Settings</p>\n");
      out.write("                        </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"management-tab\" data-toggle=\"tab\" href=\"UserManagement.jsp\" role=\"tab\" aria-controls=\"management\" aria-selected=\"false\">\n");
      out.write("                          <i class=\"pe-7s-users\"></i>\n");
      out.write("                          <p>Manage Employees</p>    \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"menu-tab\" data-toggle=\"tab\" href=\"Menu.jsp\" role=\"tab\" aria-controls=\"menu\" aria-selected=\"false\">\n");
      out.write("                          <i class=\"pe-7s-cart\"></i>\n");
      out.write("                          <p>Add item to Menu</p>    \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"analytics-tab\" data-toggle=\"tab\" href=\"Analytics.jsp\" role=\"tab\" aria-controls=\"analytics\" aria-selected=\"false\">\n");
      out.write("                          <i class=\"pe-7s-graph1\"></i>\n");
      out.write("                          <p>View Analytics</p>   \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                    </ul>\n");
      out.write("                    ");
 }else{ 
      out.write("\n");
      out.write("                    <ul class=\"nav nav-pills\" id=\"sidebarTabs\" role=\"tablist\">\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link active\" id=\"main-tab\" data-toggle=\"tab\" href=\"Main.jsp\" role=\"tab\" aria-controls=\"home\" aria-selected=\"true\">\n");
      out.write("                           <i class=\"pe-7s-home\"></i>\n");
      out.write("                           <p>Home</p>   \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" id=\"settings-tab\" data-toggle=\"tab\" href=\"Settings.jsp\" role=\"tab\" aria-controls=\"settings\" aria-selected=\"false\">\n");
      out.write("                        <i class=\"pe-7s-tools\"></i>\n");
      out.write("                        <p>Edit User Settings</p>\n");
      out.write("                        </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"menu-tab\" data-toggle=\"tab\" href=\"Menu.jsp\" role=\"tab\" aria-controls=\"menu\" aria-selected=\"false\">\n");
      out.write("                          <i class=\"pe-7s-cart\"></i>\n");
      out.write("                          <p>Add item to Menu</p>    \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                      <li class=\"nav-item\">\n");
      out.write("                          <a class=\"nav-link\" id=\"analytics-tab\" data-toggle=\"tab\" href=\"Analytics.jsp\" role=\"tab\" aria-controls=\"analytics\" aria-selected=\"false\">\n");
      out.write("                          <i class=\"pe-7s-graph1\"></i>\n");
      out.write("                          <p>View Analytics</p>   \n");
      out.write("                          </a>\n");
      out.write("                      </li>\n");
      out.write("                    </ul>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Tab panes -->\n");
      out.write("                    <div class=\"tab-content\">\n");
      out.write("                      <div class=\"tab-pane active\" id=\"main\" role=\"tabpanel\" aria-labelledby=\"main-tab\"></div>\n");
      out.write("                      <div class=\"tab-pane\" id=\"create\" role=\"tabpanel\" aria-labelledby=\"create-tab\"></div>\n");
      out.write("                      <div class=\"tab-pane\" id=\"settings\" role=\"tabpanel\" aria-labelledby=\"settings-tab\"></div>\n");
      out.write("                      <div class=\"tab-pane\" id=\"management\" role=\"tabpanel\" aria-labelledby=\"management-tab\"></div>\n");
      out.write("                      <div class=\"tab-pane\" id=\"menu\" role=\"tabpanel\" aria-labelledby=\"menu-tab\"></div>\n");
      out.write("                      <div class=\"tab-pane\" id=\"analytics\" role=\"tabpanel\" aria-labelledby=\"analytics-tab\"></div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("            <div class=\"main-panel\">\n");
      out.write("                <nav class=\"navbar navbar-default navbar-fixed\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <div class='navbar-header'>\n");
      out.write("                            <button type='button' class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navigation-example-2\">\n");
      out.write("                                <span class='sr-only'>Toggle Navigation</span>\n");
      out.write("                                <span class='icon-bar'></span>\n");
      out.write("                                <span class='icon-bar'></span>\n");
      out.write("                                <span class='icon-bar'></span>\n");
      out.write("                            </button>                          \n");
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
                                
            
      out.write("\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">Welcome Back ");
 out.println(printType + ", " + userName + "!"); 
      out.write("</a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"collapse navbar-collapse\">\n");
      out.write("                            <ul class=\"nav navbar-nav navbar-left\">\n");
      out.write("                                        <li>\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("                                                <i class=\"fa fa-dashboard\"></i>\n");
      out.write("                                            </a>\n");
      out.write("                                        </li>\n");
      out.write("                            </ul>\n");
      out.write("                            \n");
      out.write("                            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"#\">\n");
      out.write("                                        ");
      out.print(u.getCompanyName());
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"LogoutServlet\">\n");
      out.write("                                        <p>Log out</p>\n");
      out.write("                                    </a>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"separator hidden-lg\"></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </nav>   \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("    <!--   Core JS Files   -->\n");
      out.write("    <script src=\"assets/js/jquery.3.2.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    <!--  Charts Plugin -->\n");
      out.write("    <script src=\"assets/js/chartist.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!--  Notifications Plugin    -->\n");
      out.write("    <script src=\"assets/js/bootstrap-notify.js\"></script>\n");
      out.write("\n");
      out.write("    <!--  Google Maps Plugin    -->\n");
      out.write("    <script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE\"></script>\n");
      out.write("\n");
      out.write("    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->\n");
      out.write("    <script src=\"assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\n");
      out.write("\n");
      out.write("    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\n");
      out.write("    <script src=\"assets/js/demo.js\"></script>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\t<meta charset=\"utf-8\" />\n");
      out.write("\t\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\n");
      out.write("\n");
      out.write("\t<title>SnapDash</title>\n");
      out.write("\n");
      out.write("\t<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\" />\n");
      out.write("        <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS     -->\n");
      out.write("        <link href=\"design/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("        <!-- Animation library for notifications   -->\n");
      out.write("        <link href=\"design/css/animate.min.css\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("        <!--  Light Bootstrap Table core CSS    -->\n");
      out.write("        <link href=\"design/css/light-bootstrap-dashboard.css?v=1.4.0\" rel=\"stylesheet\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--  CSS for Demo Purpose, don't include it in your project     -->\n");
      out.write("        <link href=\"design/css/demo.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--     Fonts and icons     -->\n");
      out.write("        <link href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>\n");
      out.write("        <link href=\"design/css/pe-icon-7-stroke.css\" rel=\"stylesheet\" />\n");
      out.write("   </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <div class =\"wrapper\">\n");
      out.write("            <div class=\"main-panel\">\n");
      out.write("                <div class=\"content\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                                <div class=\"card card-stats\">\n");
      out.write("                                  <div class=\"card-body \">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                      <div class=\"col-5 col-md-4\">\n");
      out.write("                                        <div class=\"icon-big text-center icon-warning\">\n");
      out.write("                                          <i class=\"pe-7s-cash text-warning\"></i>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                      <div class=\"col-7 col-md-8\">\n");
      out.write("                                        <div class=\"numbers\">\n");
      out.write("                                          <p class=\"card-category\">Today's Sales</p>\n");
      out.write("                                          <p class=\"card-title\">$1469.50<p>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                  </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                                <div class=\"card card-stats\">\n");
      out.write("                                  <div class=\"card-body \">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                      <div class=\"col-5 col-md-4\">\n");
      out.write("                                        <div class=\"icon-big text-center icon-warning\">\n");
      out.write("                                          <i class=\"pe-7s-cup text-success\"></i>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                      <div class=\"col-7 col-md-8\">\n");
      out.write("                                        <div class=\"numbers\">\n");
      out.write("                                          <p class=\"card-category\">Sales' Target</p>\n");
      out.write("                                          <p class=\"card-title\">$12000<p>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                  </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                                <div class=\"card card-stats\">\n");
      out.write("                                  <div class=\"card-body \">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                      <div class=\"col-5 col-md-4\">\n");
      out.write("                                        <div class=\"icon-big text-center icon-warning\">\n");
      out.write("                                          <i class=\"pe-7s-like text-danger\"></i>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                      <div class=\"col-7 col-md-8\">\n");
      out.write("                                        <div class=\"numbers\">\n");
      out.write("                                          <p class=\"card-category\">Today's Best Seller</p>\n");
      out.write("                                          <p class=\"card-title\">Chocolate Cake<p>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                  </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                                <div class=\"card card-stats\">\n");
      out.write("                                  <div class=\"card-body \">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                      <div class=\"col-5 col-md-4\">\n");
      out.write("                                        <div class=\"icon-big text-center icon-warning\">\n");
      out.write("                                          <i class=\"pe-7s-attention text-primary\"></i>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                      <div class=\"col-7 col-md-8\">\n");
      out.write("                                        <div class=\"numbers\">\n");
      out.write("                                          <p class=\"card-category\">Refunds Made</p>\n");
      out.write("                                          <p class=\"card-title\">0</p>\n");
      out.write("                                        </div>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                  </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-5\">\n");
      out.write("                        <div class=\"card\">\n");
      out.write("\n");
      out.write("                            <div class=\"header\">\n");
      out.write("                                <h4 class=\"title\">Today's Revenue</h4>\n");
      out.write("                                <p class=\"category\">Total Sales for the Day</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"content\">\n");
      out.write("                                <div id=\"chartPreferences\" class=\"ct-chart ct-square\" >\n");
      out.write("                                    <canvas id=\"salesChart\"></canvas>\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                                <script>\n");
      out.write("                                    var salesChart = document.getElementById('salesChart').getContext('2d');\n");
      out.write("                                    \n");
      out.write("                                   \n");
      out.write("                                \n");
      out.write("                                    var salesPerformanceChart = new Chart(salesChart,{\n");
      out.write("                                        type:'doughnut',\n");
      out.write("                                        data: {\n");
      out.write("                                            labels:['achieved', 'targeted'],\n");
      out.write("                                            datasets:[{\n");
      out.write("                                                    label:'$',\n");
      out.write("                                                    data:[5204, 7500],\n");
      out.write("                                                    backgroundColor:['#FFC925',\n");
      out.write("                                                    '#42B3C5']   \n");
      out.write("                                                }]\n");
      out.write("                                            },\n");
      out.write("                                            options:{\n");
      out.write("                                                legend:{\n");
      out.write("                                                    display: false\n");
      out.write("                                                }\n");
      out.write("                                            }\n");
      out.write("                                        }     \n");
      out.write("                                    )\n");
      out.write("                                </script>\n");
      out.write("                                    \n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                                <div class=\"footer\">\n");
      out.write("                                    <div class=\"legend\">\n");
      out.write("                                        <i class=\"fa fa-circle text-warning\"></i> Achieved\n");
      out.write("                                        <i class=\"fa fa-circle text-info\"></i> Targeted\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-7\">\n");
      out.write("                        <div class=\"card\">\n");
      out.write("                            <div class=\"header\">\n");
      out.write("                                <h4 class=\"title\">Consumer Behavior</h4>\n");
      out.write("                                <p class=\"category\">24 Hours performance</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"content\">\n");
      out.write("                                <div id=\"chartPreferences\" class=\"ct-chart ct-square\" >\n");
      out.write("                                    <canvas id=\"behaviourChart\"></canvas>\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                                <script>\n");
      out.write("                                    var salesChart = document.getElementById('behaviourChart').getContext('2d');\n");
      out.write("                                    \n");
      out.write("                                   \n");
      out.write("                                \n");
      out.write("                                    var salesPerformanceChart = new Chart(behaviourChart,{\n");
      out.write("                                        type:'bar',\n");
      out.write("                                        data: {\n");
      out.write("                                            labels:['Breakfast', 'Lunch', 'Dinnner'],\n");
      out.write("                                            datasets:[{\n");
      out.write("                                                    label:'tables',\n");
      out.write("                                                    data:[24,69,97],\n");
      out.write("                                                    backgroundColor:['#1DC7EA','#FF4A55','#87CB16']   \n");
      out.write("                                                }]\n");
      out.write("                                            },\n");
      out.write("                                            options:{\n");
      out.write("                                                legend:{\n");
      out.write("                                                    display: false\n");
      out.write("                                                }\n");
      out.write("                                            }\n");
      out.write("                                        }     \n");
      out.write("                                    )\n");
      out.write("                                </script>\n");
      out.write("                                \n");
      out.write("                                <div class=\"footer\">\n");
      out.write("                                    <div class=\"legend\">\n");
      out.write("                                        <i class=\"fa fa-circle text-info\"></i> Breakfast\n");
      out.write("                                        <i class=\"fa fa-circle text-danger\"></i> Lunch\n");
      out.write("                                        <i class=\"fa fa-circle text-success\"></i> Dinner\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>    \n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    <!--   Core JS Files   -->\n");
      out.write("    <script src=\"assets/js/jquery.3.2.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    <!--  Charts Plugin -->\n");
      out.write("    <script src=\"assets/js/chartist.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!--  Notifications Plugin    -->\n");
      out.write("    <script src=\"assets/js/bootstrap-notify.js\"></script>\n");
      out.write("\n");
      out.write("    <!--  Google Maps Plugin    -->\n");
      out.write("    <script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE\"></script>\n");
      out.write("\n");
      out.write("    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->\n");
      out.write("\t<script src=\"assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\n");
      out.write("\n");
      out.write("    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\n");
      out.write("    <script src=\"assets/js/demo.js\"></script>\n");
      out.write("                    \n");
      out.write("              \n");
      out.write("</html>\n");
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
