/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;

/**
 *
 * @author moses
 */
public class Menu {
            
    public String name;
    public String desc;
    public double price;
    public double cost;
    public String url;
    public ArrayList<String> categoryList;
    
    public Menu(String name, String desc, double price, double cost, String url, ArrayList<String> categoryList){
        this.name = name;
        this.desc = desc;
        this.price = price;
        this.cost = cost;
        this.url = url;
        this.categoryList = categoryList;
    }
    
    @Override
    public String toString(){
        return("Name: " + name + ", desc: " + desc + ", price: " + price + ", cost: " + cost + ", url: " + url + ", categories: " + categoryList);
    }
}
