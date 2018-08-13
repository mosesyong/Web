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
    private String outletName; // hardcoded for now
    private ArrayList<String> typeList; // same as roleList
    
    public User(String username, String type, String companyName, HashSet<String> access, ArrayList<String> roleList, String outletName){
        this.username = username;
        this.type = type;
        this.companyName = companyName;
        this.access = access;
        this.outletName = outletName;
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
    
    public String getOutletName(){
        return outletName;
    }
    
    @Override
    public String toString(){
        return("Username: " + username + "\nCompany Name: " + companyName + "\nType: " + type + "\nAccess: " + access.toString() + "\nEmployee Ids: " + employeeList + "\nRoles: " + typeList + "\nOutlet Name: " + outletName);
    }
}
