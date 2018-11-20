/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
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
 * @author Moses
 */
public class User {
    private String username;
    private String type;
    private HashSet<String> access; // change to linked hash set, is there such a thing?
    private ArrayList<ArrayList<String>> employeeList;
    private static ArrayList<String> accessList;
    private String companyName;
    private ArrayList<String> outletNameList; 
    private ArrayList<String> typeList; // same as roleList
    private ArrayList<String> categoryList;
    private ArrayList<Menu> menuList;
    private ArrayList<String> sisterOutlets;
    private double gst;
    private double svc;
    
    public User(String username, String type, String companyName, HashSet<String> access, ArrayList<String> roleList, ArrayList<String> outletNameList, ArrayList<String> categoryList, ArrayList<String> sisterOutlets, Double gst, Double svc){
        this.username = username;
        this.type = type;
        this.companyName = companyName;
        this.access = access;
        this.outletNameList = outletNameList;
        employeeList = new ArrayList<>();
        accessList = new ArrayList<>();
        if(access.contains("menu_right")){
            accessList.add("menu_right");
            accessList.add("menu");
        }
        if(access.contains("payment_right")){
            accessList.add("payment_right");
            accessList.add("payment");
        }
        if(access.contains("refund")){
            accessList.add("refund");
        }
        
        typeList = roleList;
        this.categoryList  = categoryList;
        this.sisterOutlets = sisterOutlets;
        
        menuList = new ArrayList<>();
        
        // in decimal, % only for display
        this.gst = gst; 
        this.svc = svc;
    }
    
    public void addEmployee(ArrayList<String> employees){
        if(employeeList == null){
            employeeList = new ArrayList<>();
        }
        employeeList.add(employees);
    }
    
    public boolean hasMenuAccess(){
        return access.contains("menu");
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getType(){
        return type;
    }
    
    public Double getGst(){
        return (gst * 100);
    }
    
    public Double getSvc(){
        return (svc * 100);
    }
    
    public HashSet<String> getAccess(){
        return access;
    }
    
    public ArrayList<String> getAccessList(){
        return accessList;
    }
    
    
    public void clearEmployees(){
        employeeList = new ArrayList<ArrayList<String>>();
    }
    
    public ArrayList<ArrayList<String>> getEmployees(){
        return employeeList;
    }
    
    public ArrayList<String> getUniqueEmployees(){ //also ordered
        ArrayList<String> uniqueEmployeeList = new ArrayList<>();
        for(ArrayList<String> employees : employeeList){
            for(String employee : employees){
                if(!uniqueEmployeeList.contains(employee) && employee.length() > 0){
                    uniqueEmployeeList.add(employee);
                }
            }
        }
        return uniqueEmployeeList;
    }
    
    public String getCompanyName(){
        return companyName;
    }
    
    public ArrayList<String> getTypeList(){
        return typeList;
    }
    
    public boolean isLastChild(){
        int listSize = typeList.size();
        return listSize == Integer.parseInt(type);
    }
    
    public boolean isSecondLastChild(){
        int listSize = typeList.size();
        return listSize == (Integer.parseInt(type)-1);
    }
    
    public String getOutletName(){
        if(Integer.parseInt(type) <= 2){
            return "";
        }else{
            String outletName = outletNameList.get(0);
            if(outletName.equals("null")){
                return "";
            }
            return outletName;
        }
    }
    
    public ArrayList<String> getOutletNames(){
        ArrayList<String> temp = (ArrayList<String>)outletNameList.clone();
        temp.remove("null");
        temp.remove("");
        return temp;
    }
    
    public ArrayList<String> getCategoryList(){
        return categoryList;
    }
    
    public ArrayList<String> getSisterOutlets(){
        return sisterOutlets;
    }
    
    public void setCategoryList(ArrayList<String> categoryList){
        this.categoryList = categoryList;
    }
    
    public boolean addCategory(String category){
        if(category == null || category.isEmpty() || categoryList.contains(category)){
            return false;
        }
        categoryList.add(category);
        return true;
    }
    
    public void addMenuItem(Menu menuItem){
        menuList.add(menuItem);
    }
    
    public ArrayList<Menu> getMenuList(){
        return menuList;
    }
    
    public Menu getMenuItem(String foodName){
        for(Menu m : menuList){
            if(m.name.equals(foodName)){
                return m;
            }
        }
        return null;
    }
    
    public void clearMenu(){
        menuList = new ArrayList<>();
    }
    
    public void updateEmployees(String url, int port){
        DefaultHttpClient httpclient = new DefaultHttpClient();
        try {
            HttpHost target = new HttpHost(url, port, "http");

            HttpPost postRequest = new HttpPost("/API/UpdateEmployeeServlet");
            ArrayList<NameValuePair> postParams = new ArrayList<>();
            postParams.add(new BasicNameValuePair("username", username));
            postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
            HttpResponse httpResponse = httpclient.execute(target, postRequest);
            HttpEntity entity = httpResponse.getEntity();


            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if(statusCode == 200){
                clearEmployees();
                JsonParser parser = new JsonParser();
                JsonObject jo = (JsonObject) parser.parse(EntityUtils.toString(entity));
                String employeeData = jo.get("employees").toString().replace("\"","").replace(username + ",","");
                String[] employeeOverall = employeeData.split("  ");
                for(String employeeList : employeeOverall){
                    String[] employees = employeeList.split(" ");
                    for(String employee : employees){
                      addEmployee(new ArrayList<>(Arrays.asList(employee.split(","))));
                    }
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
    
    @Override
    public String toString(){
        return("Username: " + username + "\nCompany Name: " + companyName + "\nType: " + type + "\nAccess: " + access.toString() + "\nEmployee Ids: " + employeeList + "\nRoles: " + typeList + "\nsvc: " + svc + "\ngst: " + gst + "\nOutlets: " + outletNameList + "\nCategory: " + categoryList + "\nMenu Items: " + menuList + "\nSister Outlets: " + sisterOutlets);
    }
    
}
