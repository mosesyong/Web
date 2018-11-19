/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controller.TransactionListWebServlet;
import Entity.Properties;
import Entity.Transaction;
import Entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
}
