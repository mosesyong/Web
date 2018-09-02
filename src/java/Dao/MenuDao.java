/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Entity.Menu;
import Entity.Transaction;
import Entity.TransactionData;
import Entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.util.ArrayList;
import java.util.Arrays;
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
public class MenuDao {
    public static void getMenu(User u, String url, int port){
        DefaultHttpClient httpclient = new DefaultHttpClient();
        try {
          // specify the host, protocol, and port 
          HttpHost target = new HttpHost(url, port, "http");

          HttpPost postRequest = new HttpPost("/API/MenuRequestServlet");
          ArrayList<NameValuePair> postParams = new ArrayList<>();
          postParams.add(new BasicNameValuePair("companyName", u.getCompanyName()));
          postParams.add(new BasicNameValuePair("outletName", u.getOutletName()));
          postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
          HttpResponse httpResponse = httpclient.execute(target, postRequest);
          HttpEntity entity = httpResponse.getEntity();


          int statusCode = httpResponse.getStatusLine().getStatusCode();
          if(statusCode == 200){
              JsonParser parser = new JsonParser();
              JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
              JsonArray resultArray = jo.get("menu").getAsJsonArray();
              for(Object obj : resultArray){
                  JsonObject menuObj = (JsonObject)obj;
                  System.out.println(menuObj);
                  String name = menuObj.get("name").getAsString();
                  String desc = menuObj.get("desc").getAsString();
                  double price = menuObj.get("price").getAsDouble();
                  double cost = menuObj.get("cost").getAsDouble();
                  String urlImage = menuObj.get("url").getAsString();
                  
                  ArrayList<String> categoryList  = new ArrayList<>();
                  try{
                    String categoryStr = menuObj.get("categories").getAsString();

                    categoryStr = categoryStr.replace("[","");
                    categoryStr = categoryStr.replace("]","");
                    categoryStr = categoryStr.replace("\"","");
                    categoryList = new ArrayList<>(Arrays.asList(categoryStr.split(",")));
                  }catch(Exception e){
                      System.out.println(name + " has no category");
                  }
                  u.addMenuItem(new Menu(name, desc, price, cost, urlImage, categoryList));
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
