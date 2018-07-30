package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        \r\n");
      out.write("        <title>Snapcoin Login</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\"></script>\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.0.8/css/solid.css\">\r\n");
      out.write("        <script src=\"https://use.fontawesome.com/releases/v5.0.7/js/all.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/loginpage.css\">\r\n");
      out.write("  \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class='modal-dialog text-center'>\r\n");
      out.write("                 \r\n");
      out.write("            <div class='col-sm-8 main-section'>\r\n");
      out.write("             \r\n");
      out.write("                <div class='modal-content'>\r\n");
      out.write("                  \r\n");
      out.write("                    <div class='col-12 user-image'>\r\n");
      out.write("                        <img src='img/snapcoin-logo.png'>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <form action=\"LoginWebServlet\" class='col-12' method='post'>\r\n");
      out.write("            \r\n");
      out.write("                        <div class='form-group'>\r\n");
      out.write("                            <input type='text' class='form-control' placeholder='Enter Username' name='username'>    \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class='form-group'>\r\n");
      out.write("                            <input type='password' class='form-control' placeholder='Enter Password' name='password'>    \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button type='submit' class='btn'><i class='fas fa-sign-in-alt'></i>Login</button>\r\n");
      out.write("                        \r\n");
      out.write("                    </form>\r\n");
      out.write("                    <div class='status'>\r\n");
      out.write("                        ");

                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            
      out.write("\r\n");
      out.write("            <br><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!--\r\n");
      out.write("                    <div class='col-12 forgot'>\r\n");
      out.write("                        <a href='#'>Forgot Password?</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    -->\r\n");
      out.write("                </div><!--end of modal content-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
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
