/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Comparator;

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
    
    public static Comparator<AnalyticsEntity> QuantityComparatorAsc 
                          = new Comparator<AnalyticsEntity>() {

	    public int compare(AnalyticsEntity ae1, AnalyticsEntity ae2) {
	    	
	      int quantity1 = ae1.quantity;
	      int quantity2 = ae2.quantity;
	      
	      //asc order
	      return quantity2 - quantity1;
	    }

	};
    
    public static Comparator<AnalyticsEntity> QuantityComparatorDesc 
                          = new Comparator<AnalyticsEntity>() {

	    public int compare(AnalyticsEntity ae1, AnalyticsEntity ae2) {
	    	
	      int quantity1 = ae1.quantity;
	      int quantity2 = ae2.quantity;
	      
	      //desc order
	      return quantity1 - quantity2;
	    }

	};
    
    public static Comparator<AnalyticsEntity> AmountComparatorAsc 
                          = new Comparator<AnalyticsEntity>() {

	    public int compare(AnalyticsEntity ae1, AnalyticsEntity ae2) {
	    	
	      double amount1 = ae1.amount;
	      double amount2 = ae2.amount;
	      
	      //asc order
	      return (int)((amount2 - amount1)*100);
	    }

	};
    
    public static Comparator<AnalyticsEntity> AmountComparatorDesc 
                          = new Comparator<AnalyticsEntity>() {

	    public int compare(AnalyticsEntity ae1, AnalyticsEntity ae2) {
	    	
	      double amount1 = ae1.amount;
	      double amount2 = ae2.amount;
	      
	      //desc order
	      return(int)((amount1 - amount2)*100);
	    }

	};
}
