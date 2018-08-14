/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Entity.Transaction;
import java.util.ArrayList;

/**
 *
 * @author moses
 */
public class TransactionDao {
    static ArrayList<Transaction> transactionList;
    
    public TransactionDao(){
        this.transactionList = new ArrayList<>();
    }
    
    public static void addTransaction(Transaction t){
        transactionList.add(t);
    }
    
    public static ArrayList<Transaction> getTransactionList(){
        return transactionList;
    }
    
    public static Transaction getTransaction(String period, String analyticsType){
        for(Transaction t : transactionList){
            if(t.getPeriod().equals(period) && t.getAnalyticsType().equals(analyticsType)){
                return t;
            }
        }
        return null;
    }
    
    public static ArrayList<Transaction> getTransaction(String filter){
        ArrayList<Transaction> result = new ArrayList<>();
        for(Transaction t : transactionList){
            if(t.getPeriod().equals(filter) || t.getAnalyticsType().equals(filter)){
                result.add(t);
            }
        }
        return result;
    }
    
    public static String print(){
        return transactionList.toString();
    }
}
