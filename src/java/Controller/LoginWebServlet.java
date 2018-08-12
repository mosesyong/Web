/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Properties;
import Entity.User;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
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
import org.apache.http.util.EntityUtils;

/**
 *
 * @author Moses
 */
public class LoginWebServlet extends HttpServlet {

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
            Properties prop = new Properties();
            String url = prop.url;
            int port = prop.port;
            HttpSession session = request.getSession();
            String enteredUsername = request.getParameter("username");
            String enteredPassword = request.getParameter("password");
            DefaultHttpClient httpclient = new DefaultHttpClient();
            try {
              // specify the host, protocol, and port 
              HttpHost target = new HttpHost(url, port, "http"); // dont change first time run

              // specify the get request
              // HttpGet getRequest = new HttpGet("/API/LoginServlet");
              HttpPost postRequest = new HttpPost("/API/LoginServlet");
              ArrayList<NameValuePair> postParams = new ArrayList<>();
              postParams.add(new BasicNameValuePair("username", enteredUsername));
              postParams.add(new BasicNameValuePair("password", enteredPassword));
              postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
              HttpResponse httpResponse = httpclient.execute(target, postRequest);
              HttpEntity entity = httpResponse.getEntity();
              

              int statusCode = httpResponse.getStatusLine().getStatusCode();
              if(statusCode == 200){
                  JsonParser parser = new JsonParser();
                  JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
                  String type = jo.get("type").getAsString();
                  String username = jo.get("username").getAsString();
                  String accessString = jo.get("access").toString();
                  String companyName = jo.get("companyName").getAsString();
                  accessString = accessString.replace("[","");
                  accessString = accessString.replace("]","");
                  accessString = accessString.replace("\"","");
                  String[] accessArray = accessString.split(",");
                  HashSet<String> access = new HashSet<>();
                  for(String a : accessArray){
                      access.add(a);
                  }
                 
                  String roleString = jo.get("roles").toString();
                  roleString = roleString.replace("[","");
                  roleString = roleString.replace("]","");
                  roleString = roleString.replace("\"","");
                  String[] roleArray = roleString.split(",");
                  ArrayList<String> roleList = new ArrayList<>(Arrays.asList(roleArray));
                  
                  
                  User u = new User(username, type, companyName, access, roleList);
                  
                  String employeeData = jo.get("employees").toString().replace("\"","").replace(username + ",","");
                  String[] employeeOverall = employeeData.split("  ");
                  for(String employeeList : employeeOverall){
                      String[] employees = employeeList.split(" ");
                      for(String employee : employees){
                        u.addEmployee(new ArrayList<>(Arrays.asList(employee.split(","))));
                      }
                  }
                  System.out.println(u);
                  
                  
                  session.setAttribute("user",u);
                  session.setAttribute("url", url);
                  session.setAttribute("port", port);
                  response.sendRedirect("Main.jsp");
              }else{
                  System.out.println(httpResponse.getStatusLine() + "<br>");
                  System.out.println("Error, redirect to login page with error");
                  request.setAttribute("msg", "Invalid Username/Password");
                  request.getRequestDispatcher("Login.jsp").forward(request, response);
              }
              

            } catch (Exception e) {
              e.printStackTrace();
            } finally {
              // When HttpClient instance is no longer needed,
              // shut down the connection manager to ensure
              // immediate deallocation of all system resources
              httpclient.getConnectionManager().shutdown();
            }
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
