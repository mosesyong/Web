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
public class Discount {
    public String discountName;
    public Double discountPercentage;
    
    public Discount(String discountName, double discountPercentage){
        this.discountName = discountName;
        this.discountPercentage = discountPercentage;
    }
    
    @Override
    public String toString(){
        return discountName + ": " + discountPercentage;
    }
}
