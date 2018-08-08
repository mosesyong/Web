/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;
import java.util.HashSet;

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
    
    public User(String username, String type, String companyName, HashSet<String> access){
        this.username = username;
        this.type = type;
        this.companyName = companyName;
        this.access = access;
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
    }
    
    public void addEmployee(ArrayList<String> employees){
        if(employeeList == null){
            employeeList = new ArrayList<>();
        }
        employeeList.add(employees);
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getType(){
        return type;
    }
    
    public HashSet<String> getAccess(){
        return access;
    }
    
    public ArrayList<String> getAccessList(){
        return accessList;
    }
    
    public ArrayList<ArrayList<String>> getEmployees(){
        return employeeList;
    }
    
    public String getCompanyName(){
        return companyName;
    }
    
    @Override
    public String toString(){
        return("Username: " + username + "\nCompany Name: " + companyName + "\nType: " + type + "\nAccess: " + access.toString() + "\nEmployee Ids: " + employeeList);
    }
}
