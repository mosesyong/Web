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
import java.util.HashSet;
import java.util.Set;
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
public class EmployeeAccessWebServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String employeeName = request.getParameter("EmployeeName");
            DefaultHttpClient httpclient = new DefaultHttpClient();
            try{
                
                HttpSession session = request.getSession();
              HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

                HttpPost postRequest = new HttpPost("/API/EmployeeAccessServlet");
                ArrayList<NameValuePair> postParams = new ArrayList<>();
                postParams.add(new BasicNameValuePair("EmployeeUsername", employeeName));
                postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
                HttpResponse httpResponse = httpclient.execute(target, postRequest);
                HttpEntity entity = httpResponse.getEntity();

                int statusCode = httpResponse.getStatusLine().getStatusCode();
                JsonParser parser = new JsonParser();
                JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
                String accessString = jo.get("access").toString();
                accessString = accessString.replace("[","");
                accessString = accessString.replace("]","");
                accessString = accessString.replace("\"","");
                ArrayList<String> accessArray = new ArrayList<>(Arrays.asList(accessString.split(","))); 
//                    accessArray.add("password");
                request.setAttribute("access", accessArray);
                request.setAttribute("employeeName", employeeName);

                request.getRequestDispatcher("EmployeeEdit.jsp").forward(request, response);
                return;
            }catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errorMsg", "Unable to Access User: " + employeeName);
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
