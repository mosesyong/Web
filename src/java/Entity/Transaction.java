/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Date;

/**
 *
 * @author moses
 */
public class Transaction {
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
    
    public Transaction(String companyName, String outletName, Date dateTime, String paymentType, String foodName, int quantity, double totalPrice, String tid, String cashierName){
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
    }
    
    public Transaction(String cashierName, Date dateTime, String paymentType, double totalPrice){
        this.dateTime = dateTime;
        this.paymentType = paymentType;
        this.totalPrice = totalPrice;
        this.cashierName = cashierName;
    }
    
    
    @Override
    public String toString(){
        return("Company Name: " + companyName + ", Outlet Name: " + outletName + ", date: " + dateTime + ", Payment Type: " + paymentType + ", Food Name: " + foodName + ", Quantity: " + quantity + ", Unit Price: " + unitPrice + ", Total Price: " + totalPrice + ", tid: " + tid + ", Cashier Name: " + cashierName);
    }
    
}

