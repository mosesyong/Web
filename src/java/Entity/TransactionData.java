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
public class TransactionData {
    public String name;
    public int quantity;
    public double unitPrice;
    public double totalPrice;
    
    public TransactionData(String name, int quantity, double unitPrice, double totalPrice){
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }
    
    public String getName(){
        return name;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public double getUnitPrice(){
        return unitPrice;
    }
    
    public double getTotalPrice(){
        return totalPrice;
    }
    
    @Override
    public String toString(){
        return "Transaction name: " + name + ", quantity: " + quantity + ", unit price: " + unitPrice + ", total price: " + totalPrice + "\n";
    }
}
