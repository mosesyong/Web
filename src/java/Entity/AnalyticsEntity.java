/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author moses
 */
public class AnalyticsEntity {
    public String label;
    public double amount = 0.0;
    public int quantity = 1;
    
    public AnalyticsEntity(String label, double amount){
        this.label = label;
        this.amount = amount;
    }
    
    public AnalyticsEntity(String label, double amount, int quantity){
        this.label = label;
        this.amount = amount;
        this.quantity = quantity;
    }
    
    public AnalyticsEntity(String label, int quantity){
        this.label = label;
        this.quantity = quantity;
    }
    
    @Override
    public String toString(){
        return "Label: " + label + ", Amount: " + amount + ", Quantity: " + quantity;
    }
}
