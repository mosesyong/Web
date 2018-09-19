/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 *
 * @author moses
 */
public class Properties {
    public static String url = "localhost";
    public static int port = 8080;     
    
    public Properties(){
        String osName = System.getProperty("os.name");
        if (osName.equals("Linux")) {
            url = "13.59.252.147";
            port = 80;
        }
    }
    
    public static String checkAlive(){
        try{
            DefaultHttpClient httpclient = new DefaultHttpClient();
            Properties prop = new Properties();
            String url = prop.url;
            int port = prop.port;
            HttpHost target = new HttpHost(url, port, "http");
            HttpPost postRequest = new HttpPost("/API/IsAlive");
            HttpResponse httpResponse = httpclient.execute(target, postRequest);
            HttpEntity entity = httpResponse.getEntity();

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if(statusCode == 202 || statusCode == 200){
                return "API Server on " + url + " is up" ;
            }else{ 
                return "API Server on " + url + " is down" ;
            }
        }catch(Exception e){ 
            return "API Server on " + url + " is down" ;
        }
    }
    
}
