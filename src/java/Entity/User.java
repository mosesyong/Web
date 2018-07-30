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
    private HashSet<String> employeeList;
    private static ArrayList<String> accessList;
    
    public User(String username, String type, HashSet<String> access){
        this.username = username;
        this.type = type;
        this.access = access;
        employeeList = new HashSet<>();
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
    
    public void addEmployee(String employeeName){
        if(employeeList == null){
            employeeList = new HashSet<>();
        }
        if(!employeeName.equals("-1")){
            employeeList.add(employeeName);
        }
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
    
    public HashSet<String> getEmployees(){
        return employeeList;
    }
    
    public boolean hasEmployee(String employeeName){
        return employeeList.contains(employeeName);
    }
    
    @Override
    public String toString(){
        return("Username: " + username + "\nType: " + type + "\nAccess: " + access.toString() + "\nEmployee Ids: " + employeeList);
    }
}
