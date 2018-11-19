/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AnalyticsDao;
import Dao.TransactionDao;
import Entity.Transaction;
import Entity.User;
import java.util.Date;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class TransactionListWebServlet extends HttpServlet {

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
//            HttpSession session = request.getSession();
//            User u = (User) session.getAttribute("user");
//            String companyName = u.getCompanyName();
//            String outletName = request.getParameter("outletName");
//            String time = request.getParameter("time");
//            
////            To display refunded values?
////            String[] refunded = request.getParameterValues("refund");
////            boolean refund = false;
////            if(refunded.length > 0){
////                refund = true;
////            }
//            
//
////            cal.add(Calendar.HOUR, -3);
////            Date prevDateTime = cal.getTime();
////            
////            ArrayList<Transaction> transactionList = TransactionDao.getDisplayTransactionList(outletName, prevDateTime);
//
//            ArrayList<Transaction> transactionList = new ArrayList<>();
//            
//            DefaultHttpClient httpclient = new DefaultHttpClient();
//            HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");
//            HttpPost postRequest = new HttpPost("/API/TransactionListServlet");
//            
//            ArrayList<NameValuePair> postParams = new ArrayList<>();
//            postParams.add(new BasicNameValuePair("companyName", companyName));
//            postParams.add(new BasicNameValuePair("outletName", outletName));
//            postParams.add(new BasicNameValuePair("time", time));
//                
//            postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
//            HttpResponse httpResponse = httpclient.execute(target, postRequest);
//            HttpEntity entity = httpResponse.getEntity();
//
//            int statusCode = httpResponse.getStatusLine().getStatusCode();
//            JsonParser parser = new JsonParser();
//            JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
//            JsonArray resultArray = jo.get("result").getAsJsonArray();
//            
//            String pattern = "yyyy-MM-dd HH:mm:ss.S";
//            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
//            
//            for(JsonElement resultEle : resultArray){
//                JsonObject resultObj = (JsonObject) resultEle;
//                String cashierName = resultObj.get("name").getAsString();
//                String dateString = resultObj.get("date").getAsString(); //2018-09-27 13:07:47.0
//                Date dateTime = null;
//                try {
//                    dateTime = sdf.parse(dateString);
//                } catch (ParseException ex) {
//                    Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                double totalPrice = resultObj.get("totalPrice").getAsDouble(); //2018-09-27 13:07:47.0
//                String paymentType = resultObj.get("type").getAsString();
//                JsonElement discountElement = resultObj.get("discountName");
//                String discountName = "none";
//                if(discountElement != null && !discountElement.isJsonNull()){
//                    discountName = discountElement.getAsString();
//                }
//                boolean dineIn = resultObj.get("dineIn").getAsString().equals("true");
//                Transaction t = new Transaction(cashierName, dateTime, paymentType, totalPrice, discountName, dineIn);
//                
//                boolean refunded = resultObj.get("refunded").getAsBoolean();
//                if(refunded){
//                    t.refunded = true;
//                    t.refundedBy = resultObj.get("refundedBy").getAsString();
//                    String refundDateString = resultObj.get("refundedDate").getAsString(); //2018-09-27 13:07:47.0
//                    Date refundDate = null;
//                    try {
//                        refundDate = sdf.parse(refundDateString);
//                    } catch (ParseException ex) {
//                        Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                    t.refundDate = refundDate;
//                }
//                transactionList.add(t);
//            }

            TreeMap<String, Transaction> resultMap = new TreeMap<>();
            ArrayList<Transaction> result = new ArrayList<>();
            
            String outletName = request.getParameter("outletName");
            String startDateTimeStr = request.getParameter("startDateTime");
            String endDateTimeStr = request.getParameter("endDateTime");
//            "2018-11-19T01:01"

            Date startDateTime = null;
            Date endDateTime = null;
            
            String pattern = "yyyy-MM-dd'T'HH:mm";
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            
            try {
                startDateTime = sdf.parse(startDateTimeStr);
            } catch (ParseException ex) {
                Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                endDateTime = sdf.parse(endDateTimeStr);
            } catch (ParseException ex) {
                Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int i = 0;
            for(Transaction t : TransactionDao.transactionList){
                i++;
                System.out.println(i);
                System.out.println(t);
                if(outletName.length() == 0 || t.outletName.equals(outletName)){
                    if(startDateTime == null){  // gets from the start of all time
                        Calendar cal = Calendar.getInstance();
                        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
                            cal.add(Calendar.HOUR, 8);
                        }
                        
                        cal.add(Calendar.YEAR, -100);
                        
                        startDateTime = cal.getTime();
                    }
                    
                    if(endDateTime == null){ // gets till current datetime
                        Calendar cal = Calendar.getInstance();
                        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
                            cal.add(Calendar.HOUR, 8);
                        }
                        
                        endDateTime = cal.getTime();
                    }
                    System.out.println(i);
                    System.out.println(t);
                    if(t.dateTime.after(startDateTime) && t.dateTime.before(endDateTime)){
                        if(resultMap.containsKey(t.tid)){
                            Transaction tempTransaction = resultMap.get(t.tid);
                            tempTransaction.totalPrice += t.totalPrice;
                            resultMap.put(t.tid, tempTransaction);
                        }else{
                            try {
                                resultMap.put(t.tid,(Transaction)t.clone());
                            } catch (CloneNotSupportedException ex) {
                                Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                }
            }    
            
            result.addAll(resultMap.values());
            Collections.sort(result);
//            System.out.println("ResultMap: " + result);
            request.setAttribute("transactionResults", result);
            request.getRequestDispatcher("DisplayTransactions.jsp").forward(request, response);
        }
//            
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
