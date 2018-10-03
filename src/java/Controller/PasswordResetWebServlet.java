/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Properties;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

/**
 *
 * @author moses
 */
public class PasswordResetWebServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            
            Properties prop = new Properties();
            String url = prop.url;
            int port = prop.port;
            
            DefaultHttpClient httpclient = new DefaultHttpClient();
            try {
              // specify the host, protocol, and port 
              HttpHost target = new HttpHost(url, port, "http"); // dont change first time run

              // specify the get request
              // HttpGet getRequest = new HttpGet("/API/LoginServlet");
              HttpPost postRequest = new HttpPost("/API/PasswordResetServlet");
              ArrayList<NameValuePair> postParams = new ArrayList<>();
              postParams.add(new BasicNameValuePair("username", username));
              postParams.add(new BasicNameValuePair("email", email));
              postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
              HttpResponse httpResponse = httpclient.execute(target, postRequest);
              HttpEntity entity = httpResponse.getEntity();

              int statusCode = httpResponse.getStatusLine().getStatusCode();
              
              if(statusCode == 202){
                  request.setAttribute("msg", "Successfully reset password for " + username);
                  request.getRequestDispatcher("Login.jsp").forward(request, response);
              }else{
                  request.setAttribute("msg", "Unable to reset password for " + username);
                  request.getRequestDispatcher("Login.jsp").forward(request, response);
              }
            }catch(Exception e){
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
