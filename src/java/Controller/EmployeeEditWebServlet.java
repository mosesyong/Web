/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
 * @author moses
 */
public class EmployeeEditWebServlet extends HttpServlet {

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
            String employeeUsername = request.getParameter("employeeUsername");
            ArrayList<String> accessList = new ArrayList<>();
            try{
                accessList = new ArrayList<>(Arrays.asList(request.getParameterValues("access")));
            }catch(NullPointerException e){
                
            }
            
            String accessString = "";
            for(String access : accessList){
                accessString += access + ",";
            }
            if(accessString.length() > 0){
                accessString = accessString.substring(0,accessString.length()-1);
            }
            System.out.println("Access in employee web servlet: " + accessString);
            DefaultHttpClient httpclient = new DefaultHttpClient();
            try{
                HttpSession session = request.getSession();
              HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

                HttpPost postRequest = new HttpPost("/API/EmployeeEditServlet");
                ArrayList<NameValuePair> postParams = new ArrayList<>();
                postParams.add(new BasicNameValuePair("EmployeeUsername", employeeUsername));
                postParams.add(new BasicNameValuePair("EmployeeAccess", accessString));
                                
                postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
                HttpResponse httpResponse = httpclient.execute(target, postRequest);
                HttpEntity entity = httpResponse.getEntity();

                int statusCode = httpResponse.getStatusLine().getStatusCode();
                if(statusCode == 202){
                    
                    request.setAttribute("successMsg", "Successfully changed data for " + employeeUsername);
                    request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
                    return;
                }else{
                    request.setAttribute("errorMsg", "Unable to change access for " + employeeUsername);
                    request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
                    return;
                }
            }catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errorMsg", "Unable to change access for " + employeeUsername);
                request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
                return;
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
