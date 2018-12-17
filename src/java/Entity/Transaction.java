/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Comparator;
import java.util.Date;

/**
 *
 * @author moses
 */
public class Transaction implements Cloneable, Comparable<Transaction> {
    public String companyName;
    public String outletName;
    public Date dateTime;
    public String paymentType;
    public String foodName;
    public int quantity;
    public double totalPrice;
    public double unitPrice;
    public String tid;
    public String cashierName;
    public String discountName;
    public boolean dineIn;
    public boolean refunded = false;
    public String refundedBy = null;
    public Date refundDate = null;
    
    public Transaction(String companyName, String outletName, Date dateTime, String paymentType, String foodName, int quantity, double totalPrice, String tid, String cashierName, boolean refunded, String discountName){
        this.companyName = companyName;
        this.outletName = outletName;
        this.dateTime = dateTime;
        this.paymentType = paymentType;
        this.foodName = foodName;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        unitPrice = totalPrice / quantity;
        this.tid = tid;
        this.cashierName = cashierName;
        this.refunded = refunded;
        this.discountName = discountName;
    }
    
    public Transaction(String cashierName, Date dateTime, String paymentType, double totalPrice, String discountName, boolean dineIn){
        this.dateTime = dateTime;
        this.paymentType = paymentType;
        this.totalPrice = totalPrice;
        this.cashierName = cashierName;
        this.discountName = discountName;
        this.dineIn = dineIn;
    }
    
    public String isRefunded(){
        if(refunded){
            return "yes";
        }else{
            return "no";
        }
    }
    
    public String isNull(String value){
        if(value == null || value.equals("null")){
            return "-";
        }else{
            return value;
        }
    }
    
    public String isNull(Date value){
        if(value == null){
            return "-";
        }else{
            return value.toString();
        }
    }
    
    public String isDineIn(){
        if(dineIn){
            return "Dine In";
        }else{
            return "Takeaway";
        }
    }
    
    @Override
    public String toString(){
        return("Company Name: " + companyName + ", Outlet Name: " + outletName + ", date: " + dateTime + ", Payment Type: " + paymentType + ", Food Name: " + foodName + ", Quantity: " + quantity + ", Unit Price: " + unitPrice + ", Total Price: " + totalPrice + ", tid: " + tid + ", Cashier Name: " + cashierName + ", Refunded: " + refunded);
    }
    
    @Override
    public Object clone()throws CloneNotSupportedException{  
        return super.clone();  
    }  

    @Override
    public int compareTo(Transaction o) {
        if(dateTime.before(o.dateTime)){
            return -1;
        }
        return 11;
    }
    
}

