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
public class Transaction {
    String period;
    String analyticsType;
    ArrayList<TransactionData> transactionDataList;
    
    public Transaction(String period, String analyticsType){
        this.period = period;
        this.analyticsType = analyticsType;
        transactionDataList = new ArrayList<>();
    }
    
    public void addTransaction(TransactionData data){
        transactionDataList.add(data);
    }
    
    public ArrayList<TransactionData> getTransactionDataList(){
        return transactionDataList;
    }
    
    public String getPeriod(){
        return period;
    }
    
    public String getAnalyticsType(){
        return analyticsType;
    }
    
    @Override
    public String toString(){
        return "Period: " + period + ", Analytics Type: " + analyticsType + "\nTransactions: " + transactionDataList + "\n";
    }
}

