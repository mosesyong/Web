/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class PasswordChangeWebServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String username = request.getParameter("username");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            if(newPassword.length() == 0 || newPassword.contains(" ")){
                request.setAttribute("msg", "Invalid password entered");
                request.getRequestDispatcher("Settings.jsp").forward(request, response);
                return;
            }
            DefaultHttpClient httpclient = new DefaultHttpClient();
            
            try {
              // specify the host, protocol, and port 
              HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

              HttpPost postRequest = new HttpPost("/API/PasswordChangeServlet");
              ArrayList<NameValuePair> postParams = new ArrayList<>();
              postParams.add(new BasicNameValuePair("username", username));
              postParams.add(new BasicNameValuePair("oldPassword", oldPassword));
              postParams.add(new BasicNameValuePair("newPassword", newPassword));
              postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
              HttpResponse httpResponse = httpclient.execute(target, postRequest);
              HttpEntity entity = httpResponse.getEntity();
              
              int statusCode = httpResponse.getStatusLine().getStatusCode();
              User u = (User) session.getAttribute("user");
              String loggedInUsername = u.getUsername();
              boolean isSelf = loggedInUsername.equals(username);              
              if(statusCode == 202){
                  System.out.println("Successfully changed password");
                  request.setAttribute("msg", "Password successfully changed");
                  request.getRequestDispatcher("Settings.jsp").forward(request, response);
                  return;
              }else{
                  request.setAttribute("msg", "Error with password change");
                  request.getRequestDispatcher("Settings.jsp").forward(request, response);
                  return;
              }
              

            } catch (Exception e) {
              e.printStackTrace();
            } finally {
              // When HttpClient instance is no longer needed,
              // shut down the connection manager to ensure
              // immediate deallocation of all system resources
              httpclient.getConnectionManager().shutdown();
            }
            
            request.setAttribute("msg", "Error with password change");
            request.getRequestDispatcher("Settings.jsp").forward(request, response);
            return;
        }
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
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
