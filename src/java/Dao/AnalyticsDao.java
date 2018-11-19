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
import static Entity.AnalyticsEntity.QuantityComparatorDesc;
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
                        String discountName = transactionDataObj.get("discountName").getAsString();
                        

                        String pattern = "yyyy-MM-dd HH:mm:ss";
                        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

                        Date dateTime = null;
                        try {
                            dateTime = sdf.parse(dateString);
                        } catch (ParseException ex) {
                            Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        
                        Transaction t = new Transaction(companyName, outletName, dateTime, paymentType, foodName, quantity, totalPrice, tid, cashierName, refunded, discountName);
                        
                        if(refunded){
                            try{
                                t.refundedBy = transactionDataObj.get("refundedBy").getAsString();
                                String refundDateString = transactionDataObj.get("refundedDate").getAsString(); //2018-09-27 13:07:47.0
                                Date refundDate = null;

                                try {
                                    refundDate = sdf.parse(refundDateString);
                                } catch (ParseException ex) {
                                    Logger.getLogger(TransactionListWebServlet.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                t.refundDate = refundDate;
                            }catch(Exception e){
                                System.out.println("REFUND ERROR!");
                                System.out.println(e.getMessage());
                                e.printStackTrace();
                            }
                        }
                        
                        TransactionDao.addTransaction(t);
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
    
    public static ArrayList<AnalyticsEntity> getWorstSellersByQuantity(int count, ArrayList<Transaction> transactionList){
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
        
        analyticsEntityList.sort(QuantityComparatorDesc);
        
        
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
        
        System.out.println(duration);
        if(duration < 86_400_000){ // smaller than day = breakdown by hour
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            while(startCal.getTime().before(endDateTime)){
                labelList.add("" + startCal.getTime().getHours());
                dateList.add(startCal.getTime());
                startCal.add(Calendar.HOUR, 1);
            }
        }else if(duration < 604_800_000){  // smaller than week = breakdown by day
            HashMap<Integer, String> dayMap = new HashMap<>();
            dayMap.put(0, "Sunday");
            dayMap.put(1, "Monday");
            dayMap.put(2, "Tuesday");
            dayMap.put(3, "Wednesday");
            dayMap.put(4, "Thursday");
            dayMap.put(5, "Friday");
            dayMap.put(6, "Saturday");
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            int startDay = startCal.getTime().getDate();
            int endDay = endDateTime.getDate();
            while(startCal.getTime().before(endDateTime)){
//                System.out.println(startCal.getTime());
                labelList.add("" + dayMap.get(startCal.getTime().getDay()));
                dateList.add(startCal.getTime());
                startCal.add(Calendar.DATE, 1);
            }
        }else if(duration < 2_629_746_000L){ // smaller than month = breakdown by week
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            int startWeekDay = startCal.getTime().getDate();
            int endWeekDay = endDateTime.getDate();
            while(startCal.getTime().before(endDateTime)){
                labelList.add("" + startCal.getTime().getDate());
                dateList.add(startCal.getTime());
                startCal.add(Calendar.DATE, 7);
            }
        }else if(duration < 31_556_952_000L){ // smaller than year = breakdown by month
            HashMap<Integer, String> monthMap = new HashMap<>();
            monthMap.put(0, "January");
            monthMap.put(1, "February");
            monthMap.put(2, "March");
            monthMap.put(3, "April");
            monthMap.put(4, "May");
            monthMap.put(5, "June");
            monthMap.put(6, "July");
            monthMap.put(7, "August");
            monthMap.put(8, "September");
            monthMap.put(9, "October");
            monthMap.put(10, "November");
            monthMap.put(11, "December");
            
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            startCal.set(Calendar.DAY_OF_MONTH, 1);
            int startMonth = startCal.getTime().getMonth();
            while(startCal.getTime().before(endDateTime)){
                labelList.add(monthMap.get(startCal.getTime().getMonth()));
                dateList.add(startCal.getTime());
                startCal.add(Calendar.MONTH, 1);
            }
        }else{ // larger than year = breakdown by year
            startCal.clear(Calendar.MINUTE);
            startCal.clear(Calendar.SECOND);
            startCal.clear(Calendar.MILLISECOND);
            startCal.set(Calendar.DAY_OF_MONTH, 1);
            startCal.set(Calendar.DAY_OF_YEAR, 1);
            int startYear = startDateTime.getYear() + 1900;
            int endYear = endDateTime.getYear() + 1 + 1900;
            while(startCal.getTime().before(endDateTime)){
                labelList.add( "" + (startCal.getTime().getYear() + 1900));
                dateList.add(startCal.getTime());
                startCal.add(Calendar.YEAR, 1);
            }
        }
        
        dateList.add(endDateTime);
        
        return labelList;        
    }

    public static HashMap<String, ArrayList<Double>> getResultMap(ArrayList<Transaction> transactionList) {
        HashMap<String, ArrayList<Double>> result = new HashMap<>();
        result.put("cash", new ArrayList<Double>());
        result.put("card", new ArrayList<Double>());
        result.put("snapcash", new ArrayList<Double>());
        System.out.println("dateList: " + dateList);
        for(int i = 0; i < dateList.size() - 1; i ++){
            Date startDate = dateList.get(i);
            Date endDate = dateList.get(i+1);
            double cash = 0.0;
            double card = 0.0;
            double snapcash = 0.0;
            for(Transaction t : transactionList){
                if(t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                    System.out.println(t);
                    if(t.paymentType.equals("cash")){
                        cash += t.totalPrice;
                    }else if(t.paymentType.equals("card")){
                        card += t.totalPrice;
                    }else{
                        snapcash =+ t.totalPrice;
                    }
                }
            }
            ArrayList<Double> cashList = result.get("cash");
            cashList.add(cash);
            result.put("cash", cashList);
            
            ArrayList<Double> cardList = result.get("card");
            cardList.add(card);
            result.put("card", cardList);
            
            ArrayList<Double> snapcashList = result.get("snapcash");
            snapcashList.add(snapcash);
            result.put("snapcash", snapcashList);
        }
        System.out.println("dateListResult: " + result);
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
