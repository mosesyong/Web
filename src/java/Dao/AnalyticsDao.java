/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controller.TransactionListWebServlet;
import Entity.AnalyticsEntity;
import static Entity.AnalyticsEntity.AmountComparatorAsc;
import static Entity.AnalyticsEntity.QuantityComparatorAsc;
import Entity.Properties;
import Entity.Transaction;
import Entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AnalyticsDao {
    
    public static ArrayList<Date> dateList; 
            
    public static void getAnalytics(User u){
        TransactionDao transactionDao = new TransactionDao();
        String username = u.getUsername();
        String companyName = u.getCompanyName();
        ArrayList<String> outletNameList = u.getOutletNames();
        
        for(String outletName : outletNameList){
            
            DefaultHttpClient httpclient = new DefaultHttpClient();
            try {
                // specify the host, protocol, and port 
                HttpHost target = new HttpHost(Properties.url, Properties.port, "http");

                HttpPost postRequest = new HttpPost("/API/TransactionOutputServlet");
                ArrayList<NameValuePair> postParams = new ArrayList<>();
                
                postParams.add(new BasicNameValuePair("companyName", companyName));
                postParams.add(new BasicNameValuePair("outletName", outletName));
                postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
                HttpResponse httpResponse = httpclient.execute(target, postRequest);
                HttpEntity entity = httpResponse.getEntity();


                int statusCode = httpResponse.getStatusLine().getStatusCode();

                if(statusCode == 200){
                    JsonParser parser = new JsonParser();
                    JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
                    JsonArray resultArray = jo.get("result").getAsJsonArray();
                    for(Object obj : resultArray){
                        JsonObject transactionDataObj = (JsonObject)obj;
                        String foodName = transactionDataObj.get("foodName").getAsString();
                        int quantity = transactionDataObj.get("quantity").getAsInt();
                        double totalPrice = transactionDataObj.get("totalPrice").getAsDouble();
                        String paymentType = transactionDataObj.get("paymentType").getAsString();
                        String dateString = transactionDataObj.get("dateTime").getAsString();
                        String tid = transactionDataObj.get("TID").getAsString();
                        String cashierName = transactionDataObj.get("cashierName").getAsString();
                        boolean refunded = transactionDataObj.get("refunded").getAsBoolean();
                        
                        

                        String pattern = "yyyy-MM-dd HH:mm:ss";
                        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

                        Date dateTime = null;
                        try {
                            dateTime = sdf.parse(dateString);
                        } catch (ParseException ex) {
                            Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        TransactionDao.addTransaction(new Transaction(companyName, outletName, dateTime, paymentType, foodName, quantity, totalPrice, tid, cashierName, refunded));
                      
                    }
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
    
    public static ArrayList<AnalyticsEntity> getTopSellersByAmount(String time, int count, ArrayList<Transaction> transactionList){
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        for(Transaction t : transactionList){
            String name = t.foodName;
            boolean added = false;
            for(AnalyticsEntity entity : analyticsEntityList){
                if(entity.label.equals(name)){
                    added = true;
                    entity.amount = entity.amount + t.totalPrice;
                    entity.quantity = entity.quantity + t.quantity;
                }
                if(added){
                    break;
                }
            }
            if(!added){
                analyticsEntityList.add(new AnalyticsEntity(name, t.totalPrice, t.quantity));
            }
        }
        
        analyticsEntityList.sort(AmountComparatorAsc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static ArrayList<AnalyticsEntity> getTopSellersByQuantity(String time, int count, ArrayList<Transaction> transactionList){
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        for(Transaction t : transactionList){
            String name = t.foodName;
            boolean added = false;
            for(AnalyticsEntity entity : analyticsEntityList){
                if(entity.label.equals(name)){
                    added = true;
                    entity.amount = entity.amount + t.totalPrice;
                    entity.quantity = entity.quantity + t.quantity;
                }
                if(added){
                    break;
                }
            }
            if(!added){
                analyticsEntityList.add(new AnalyticsEntity(name, t.totalPrice, t.quantity));
            }
        }
        
        analyticsEntityList.sort(QuantityComparatorAsc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static ArrayList<AnalyticsEntity> getTopSellingItems(ArrayList<Transaction> transactionList){
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        result.addAll(getTopSellersByAmount("Year", 3, transactionList));
        for(AnalyticsEntity ae1 : getTopSellersByQuantity("Year", 3, transactionList)){
            boolean exists = false;
            for(AnalyticsEntity ae2 : result){
                if(ae1.label.equals(ae2.label)){
                    exists = true;
                    break;
                }
            }
            if(!exists){
                result.add(ae1);
            }
        }
        
        return result;
    }

    public static ArrayList<String> getLabelList(Date startDateTime, Date endDateTime) {
        dateList = new ArrayList<>();
        ArrayList<String> labelList = new ArrayList<>();
        
        long duration = endDateTime.getTime() - startDateTime.getTime();
        
        Calendar startCal = Calendar.getInstance();
        startCal.setTime(startDateTime);
        startCal.getTime();
        
//        if(time.equals("Day")){
//            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
//            cal.clear(Calendar.MINUTE);
//            cal.clear(Calendar.SECOND);
//            cal.clear(Calendar.MILLISECOND);
//        }
//        if(time.equals("Week")){
//            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
//        }
//        if(time.equals("Month")){
//            cal.set(Calendar.DAY_OF_MONTH, 1);
//        }
//        if(time.equals("Year")){
//            cal.set(Calendar.YEAR, 1);
//        }
//        if(time.equals("All")){
//            cal.add(Calendar.YEAR, -100);
//        }
        
        if(duration < 86_400_000){ // smaller than day = breakdown by hour
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            int startHour = startCal.getTime().getHours();
            labelList.add("" + startHour);
            dateList.add(startCal.getTime());
            for(int i = startHour + 1; i <= 24; i++){
                labelList.add("" + i);
                startCal.add(Calendar.HOUR, i);
                dateList.add(startCal.getTime());
            }
            labelList.remove(labelList.size()-1);
        }else if(duration < 604_800_000){  // smaller than week = breakdown by day
            
        }else if(duration < 2_629_746_000L){ // smaller than month = breakdown by week
            
        }else if(duration < 31_556_952_000L){ // smaller than year = breakdown by month
            
        }else{ // larger than year = breakdown by year
            
        }
        
        ArrayList<String> result = new ArrayList<>();
        
        return result;        
    }

    public static HashMap<String, ArrayList<Double>> getResultMap(ArrayList<Transaction> transactionList) {
        HashMap<String, ArrayList<Double>> result = new HashMap<>();
        
        return result;
    }

    public static ArrayList<Transaction> getNonRefundedTransactions(ArrayList<Transaction> transactionList) {
        ArrayList<Transaction> result = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(!t.refunded){
                result.add(t);
            }
        }
        return result;
    }
    
    public static ArrayList<Transaction> getRefundedTransactions(ArrayList<Transaction> transactionList) {
        ArrayList<Transaction> result = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                result.add(t);
            }
        }
        return result;
    }
}
