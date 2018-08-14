/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.TransactionDao;
import Entity.Transaction;
import Entity.TransactionData;
import Entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
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
 * @author moses
 */
public class AnalyticsWebServlet extends HttpServlet {

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
            User u = (User)session.getAttribute("user");
            String username = u.getUsername();
            String outletName = "1"; //hardcoded for now
            String count = "1"; //hardcoded for now
            ArrayList<String> periodList = new ArrayList<>();
            periodList.add("day");
            periodList.add("week");
            periodList.add("month");
            periodList.add("year");
            periodList.add("all");
            ArrayList<String> analyticsTypeList = new ArrayList<>();
            analyticsTypeList.add("sales");
            analyticsTypeList.add("items");
            for(String period : periodList){
                for(String analyticsType : analyticsTypeList){
                    DefaultHttpClient httpclient = new DefaultHttpClient();
                    try {
                      // specify the host, protocol, and port 
                      HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

                      HttpPost postRequest = new HttpPost("/API/TransactionOutputServlet");
                      ArrayList<NameValuePair> postParams = new ArrayList<>();
                      postParams.add(new BasicNameValuePair("username", username));
                      postParams.add(new BasicNameValuePair("outletName", outletName));
                      postParams.add(new BasicNameValuePair("period", period));
                      postParams.add(new BasicNameValuePair("analyticsType", analyticsType));
                      postParams.add(new BasicNameValuePair("count", count));
                      postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
                      HttpResponse httpResponse = httpclient.execute(target, postRequest);
                      HttpEntity entity = httpResponse.getEntity();


                      int statusCode = httpResponse.getStatusLine().getStatusCode();
                      if(statusCode == 200){
                          JsonParser parser = new JsonParser();
                          JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
                          JsonArray resultArray = jo.get("result").getAsJsonArray();
                          Transaction transaction = new Transaction(period, analyticsType);
                          for(Object obj : resultArray){
                              JsonObject transactionDataObj = (JsonObject)obj;
                              String name = transactionDataObj.get("name").getAsString();
                              int quantity = transactionDataObj.get("quantity").getAsInt();
                              double unitPrice = transactionDataObj.get("unitPrice").getAsDouble();
                              double totalPrice = transactionDataObj.get("totalPrice").getAsDouble();
                              TransactionData data = new TransactionData(name, quantity, unitPrice, totalPrice);
                              transaction.addTransaction(data);
                          }
                          TransactionDao.addTransaction(transaction);
                      }else{
                          System.out.println(httpResponse.getStatusLine() + "<br>");
                          request.setAttribute("msg", "Invalid Analyticcs");
                          request.getRequestDispatcher("Analytics.jsp").forward(request, response);
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
                }
            }
            
            System.out.println(TransactionDao.print());
            response.sendRedirect("Analytics.jsp");
            return;
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
