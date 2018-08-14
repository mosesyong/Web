/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Entity.Transaction;
import Entity.TransactionData;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.util.ArrayList;
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
    public static void getAnalytics(String username, String outletName, String count, String url, int port){
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
                  HttpHost target = new HttpHost(url, port, "http");

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
}
