/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AnalyticsDao;
import Dao.TransactionDao;
import Entity.AnalyticsEntity;
import Entity.Transaction;
import Entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
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
            
            DecimalFormat df = new DecimalFormat("#.00"); 
    
            String filter = request.getParameter("filter"); // All, cash, card, snapcash, refunds
            if(filter == null){
                filter = "All";
            }
            
            String outletName = request.getParameter("outletName");
            String startDateTimeStr = request.getParameter("startDateTime");
            String endDateTimeStr = request.getParameter("endDateTime");
            
            String timestep = request.getParameter("timestep");

            Date startDateTime = null;
            Date endDateTime = null;
            
            String pattern = "yyyy-MM-dd'T'HH:mm";
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            
            try {
                startDateTime = sdf.parse(startDateTimeStr);
            } catch (ParseException ex) {
                Calendar cal = Calendar.getInstance();
                if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
                    cal.add(Calendar.HOUR, 8);
                }
                cal.set(Calendar.HOUR_OF_DAY, 0); 
                cal.clear(Calendar.MINUTE);
                cal.clear(Calendar.SECOND);
                cal.clear(Calendar.MILLISECOND);
                cal.set(Calendar.DAY_OF_YEAR, 1);
                cal.add(Calendar.YEAR, -5);

                startDateTime = cal.getTime();
//                Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                endDateTime = sdf.parse(endDateTimeStr);
            } catch (ParseException ex) {
                Calendar cal = Calendar.getInstance();
                if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
                    cal.add(Calendar.HOUR, 8);
                }

                endDateTime = cal.getTime();
//                Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            double totalAmount = 0.0;
            
            ArrayList<Transaction> filteredTransactionList = new ArrayList<>();
            ArrayList<Transaction> filteredTransactionListForRefundDisplay = new ArrayList<>();
            
//            TransactionDao doNotUse = new TransactionDao();
            for(Transaction t: TransactionDao.transactionList){
//                if(t.tid.equals("286")){
//                    System.out.println("Refund check");
//                    System.out.println(t);
//                }
                if((outletName.equals("all") || outletName.equals(t.outletName)) && t.dateTime.after(startDateTime) && t.dateTime.before(endDateTime)){
                    if(filter.equals("cash")){
                        if(!t.refunded && t.paymentType.equals("cash")){
                            totalAmount += t.totalPrice;
                            filteredTransactionList.add(t);
                        }
                    }else if(filter.equals("card")){
                        if(!t.refunded && t.paymentType.equals("card")){
                            totalAmount += t.totalPrice;
                            filteredTransactionList.add(t);
                        }
                    }else if(filter.equals("snapcash")){
                        if(!t.refunded && t.paymentType.equals("snapcash")){
                            totalAmount += t.totalPrice;
                            filteredTransactionList.add(t);
                        }
                    }else if(filter.equals("refunds")){
                        if(t.refunded){
                            totalAmount += t.totalPrice;
                            filteredTransactionList.add(t);
                        }
                    }else if(filter.equals("discounts")){
                        try{
                            if(!t.refunded && !t.discountName.equals("null")){
                                totalAmount += t.totalPrice;
                                filteredTransactionList.add(t);
                            }
                        }catch(NullPointerException e){}
                    }else{ // all or select filter
                        if(!t.refunded){
                            totalAmount += t.totalPrice;
                            filteredTransactionList.add(t);
                        }
                    }
                    filteredTransactionListForRefundDisplay.add(t);
                }
            }
            
            ArrayList<String> labelList = AnalyticsDao.getLabelList(timestep, startDateTime, endDateTime);
            HashMap<String, ArrayList<Double>> resultMap = AnalyticsDao.getResultMap(filteredTransactionList);
            ArrayList<AnalyticsEntity> entry = AnalyticsDao.getTopSellingItems(filteredTransactionList);
            ArrayList<AnalyticsEntity> worstSellers = AnalyticsDao.getWorstSellersByQuantity(5, filteredTransactionList);
            
            ArrayList<Transaction> tList = AnalyticsDao.getAllTransactions(filteredTransactionListForRefundDisplay);
            ArrayList<Transaction> nonRList = AnalyticsDao.getNonRefundedTransactions(filteredTransactionListForRefundDisplay);
            ArrayList<Transaction> rList = AnalyticsDao.getRefundedTransactions(filteredTransactionListForRefundDisplay);
                        
            
            System.out.println("LabelList");
            System.out.println(labelList);
            
            System.out.println("resultMap");
            System.out.println(resultMap);
            
            request.setAttribute("totalAmount", "" + Double.parseDouble(df.format(totalAmount)));
            request.setAttribute("entry", entry);
            request.setAttribute("worstSellers", worstSellers);
            request.setAttribute("labelList", labelList);
            request.setAttribute("resultMap", resultMap);
            request.setAttribute("tList", tList);
            request.setAttribute("nonRList", nonRList);
            request.setAttribute("rList", rList);
            request.setAttribute("period", "" + startDateTime + " to " + endDateTime);
            
            request.getRequestDispatcher("Analytics.jsp").forward(request, response);
            
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
