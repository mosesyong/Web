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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"design/img/topbaricon.ico\"> \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("        <title>Snapcoin</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.0.8/css/solid.css\">\n");
      out.write("        <script src=\"https://use.fontawesome.com/releases/v5.0.7/js/all.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"design/css/loginpage.css\">\n");
      out.write("  \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class='modal-dialog text-center'>\n");
      out.write("                 \n");
      out.write("            <div class='col-sm-8 main-section'>\n");
      out.write("             \n");
      out.write("                <div class='modal-content'>\n");
      out.write("                  \n");
      out.write("                    <div class='col-12 user-image'>\n");
      out.write("                        <img src='design/img/snapcoin-logo.png'>\n");
      out.write("                    </div>\n");
      out.write("                    <form action=\"LoginWebServlet\" class='col-12' method='post'>\n");
      out.write("            \n");
      out.write("                        <div class='form-group'>\n");
      out.write("                            <input type='text' class='form-control' placeholder='Enter Username' name='username'>    \n");
      out.write("                        </div>\n");
      out.write("                        <div class='form-group'>\n");
      out.write("                            <input type='password' class='form-control' placeholder='Enter Password' name='password'>    \n");
      out.write("                        </div>\n");
      out.write("                        <button type='submit' class='btn'><i class='fas fa-sign-in-alt'></i>Login</button>\n");
      out.write("                        \n");
      out.write("                    </form>\n");
      out.write("                    <div class='status'>\n");
      out.write("                        ");

                String msg = (String)request.getAttribute("msg");
                if(msg != null){
                    out.println("<font color='red'>"  + msg + "</font>");
                }   
                //out.println();
                //out.println();
            
      out.write("\n");
      out.write("            <br><br>\n");
      out.write("                    </div>\n");
      out.write("                    <!--\n");
      out.write("                    <div class='col-12 forgot'>\n");
      out.write("                        <a href='#'>Forgot Password?</a>\n");
      out.write("                    </div>\n");
      out.write("                    -->\n");
      out.write("                </div><!--end of modal content-->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
