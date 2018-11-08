/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controller.TransactionListWebServlet;
import Entity.Discount;
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
public class DiscountDao {
    public static ArrayList<Discount> discountList;
       
    public static void getDiscounts(User u){
        discountList = new ArrayList<>();
        String companyName = u.getCompanyName();
        String outletName = u.getOutletName();
        
        DefaultHttpClient httpclient = new DefaultHttpClient();
        try {
            // specify the host, protocol, and port 
            HttpHost target = new HttpHost(Properties.url, Properties.port, "http");

            HttpPost postRequest = new HttpPost("/API/DiscountListServlet");
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
                JsonArray resultArray = jo.get("discount").getAsJsonArray();
                System.out.println("discount");
                System.out.println(resultArray);
                for(Object obj : resultArray){
                    JsonObject discountDataObj = (JsonObject)obj;
                    String discountName = discountDataObj.get("discountName").getAsString();
                    Double discountPercentage = discountDataObj.get("discountPercentage").getAsDouble();
                    Discount d = new Discount(discountName, discountPercentage);
                    System.out.println(d);
                    discountList.add(d);
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
