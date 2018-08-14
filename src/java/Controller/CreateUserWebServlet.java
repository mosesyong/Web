/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.User;
import java.io.IOException;
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
 * @author Moses
 */
public class CreateUserWebServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String tempPassword = "" + (int)(Math.random()*1000);
        String companyName = request.getParameter("companyName");
        System.out.println("password: " + tempPassword);
        DefaultHttpClient httpclient = new DefaultHttpClient();
        String menuRights = request.getParameter("menu_rights");
        String menu = request.getParameter("menu");
        String financeRights = request.getParameter("finance_rights");
        String finance = request.getParameter("finance");
        String refund = request.getParameter("refund");
        
        try {
          // specify the host, protocol, and port 
          HttpHost target = new HttpHost((String)session.getAttribute("url"), Integer.parseInt((String)session.getAttribute("port")), "http");


          // specify the get request
          // HttpGet getRequest = new HttpGet("/API/LoginServlet");
          HttpPost postRequest = new HttpPost("/API/CreateUserServlet");
          ArrayList<NameValuePair> postParams = new ArrayList<>();
          postParams.add(new BasicNameValuePair("username", username));
          postParams.add(new BasicNameValuePair("password", tempPassword));
          postParams.add(new BasicNameValuePair("companyName", companyName));
          postParams.add(new BasicNameValuePair("creator", ((User)session.getAttribute("user")).getUsername()));
          postParams.add(new BasicNameValuePair("type", "" + (Integer.parseInt(((User)session.getAttribute("user")).getType())+ 1)));
          System.out.println("Type (web)" + session.getAttribute("type"));
          postParams.add(new BasicNameValuePair("menuRights",menuRights));
          postParams.add(new BasicNameValuePair("menu",menu));
          postParams.add(new BasicNameValuePair("financeRights",financeRights));
          postParams.add(new BasicNameValuePair("finance",finance));
          postParams.add(new BasicNameValuePair("refund",refund));
          postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
          HttpResponse httpResponse = httpclient.execute(target, postRequest);
          HttpEntity entity = httpResponse.getEntity();


          int statusCode = httpResponse.getStatusLine().getStatusCode();
          if(statusCode == 202){
              System.out.println("Successfully created user");
              request.setAttribute("msg", username + " successfully created");
              request.setAttribute("tempPassword", tempPassword);
              request.getRequestDispatcher("CreateUser.jsp").forward(request, response);
          }else{
              System.out.println("Error, redirect to create user page");
              request.setAttribute("msg", "Unable to create " + username);
              request.getRequestDispatcher("CreateUser.jsp").forward(request, response);
          }


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error, redirect to create user page");
            request.setAttribute("msg", "Unable to create " + username);
            request.getRequestDispatcher("CreateUser.jsp").forward(request, response);
        } finally {
          // When HttpClient instance is no longer needed,
          // shut down the connection manager to ensure
          // immediate deallocation of all system resources
          httpclient.getConnectionManager().shutdown();
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
