/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Entity.AnalyticsEntity;
import Entity.Transaction;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author moses
 */
public class TransactionDao {
    public static ArrayList<Transaction> transactionList;
    
    public TransactionDao(){
        TransactionDao.transactionList = new ArrayList<>();
    }
    
    public static void addTransaction(Transaction t){
        transactionList.add(t);
    }
    
    public static ArrayList<Transaction> getTransactionList(){
        return transactionList;
    }
    
    public static ArrayList<Transaction> getDisplayTransactionList(String outletName, Date previousDate){
        ArrayList<Transaction> tempResult = new ArrayList<>();
        
        for (Transaction t : transactionList){
            if(t.dateTime.after(previousDate) && t.outletName.equals(outletName)){
                tempResult.add(t);
            }
        }
        
        ArrayList<Transaction> result = new ArrayList<>();
        
        for(Transaction newT : tempResult){
            boolean added = false;
            for(Transaction oldT : result){
                if(oldT.tid.equals(newT.tid)){
                    oldT.totalPrice += newT.totalPrice;
                    added = true;
                    break;
                }
            }
            if(!added){
                result.add(newT);
            }
        }
        
        
        return result;
    }
   
    
    public static HashMap<String,ArrayList<AnalyticsEntity>> getAnalyticsMap(String analyticsType, String paymentType, String outletName){
        HashMap<String, ArrayList<AnalyticsEntity>> result = new HashMap<>();
        
        ArrayList<String> timeList = new ArrayList<>();
        timeList.add("All");
        timeList.add("Year");
        timeList.add("Month");
        timeList.add("Week");
        timeList.add("Day");
        
        for(String time : timeList){
            ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
            
            Calendar cal = Calendar.getInstance();
            if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
                cal.add(Calendar.HOUR, 8);
            }
            
            if(time.equals("All")){
                cal.add(Calendar.YEAR, -100);
            }else if(time.equals("Year")){
                cal.add(Calendar.YEAR, -1);
            }else if(time.equals("Month")){
                cal.add(Calendar.MONTH, -1);
            }else if(time.equals("Week")){
                cal.add(Calendar.WEEK_OF_YEAR, -1);
            }else if(time.equals("Day")){
                cal.add(Calendar.DAY_OF_YEAR, -1);
            }
            Date prevDateTime = cal.getTime();
            
            
            if(analyticsType.equals("Sales")){
                for(Transaction t : transactionList){
//                    System.out.println(t);
                    if((t.paymentType.equals(paymentType) || paymentType.equals("All")) && (t.outletName.equals(outletName) || outletName.equals("All")) && t.dateTime.after(prevDateTime)){
                        System.out.println(analyticsEntityList);
                        if(analyticsEntityList.size() == 1){
                            AnalyticsEntity e = analyticsEntityList.get(0);
                            e.amount += t.totalPrice;
                        }else{
                            analyticsEntityList.add(new AnalyticsEntity(time + " sales", t.totalPrice));
                        }
                    }
                }
            }else if(analyticsType.equals("Items")){
                for(Transaction t : transactionList){
                    if((t.paymentType.equals(paymentType) || paymentType.equals("All")) && (t.outletName.equals(outletName) || outletName.equals("All")) && t.dateTime.after(prevDateTime)){
                        boolean added = false;
                        for(AnalyticsEntity e : analyticsEntityList){
                            if(e.label.equals(t.foodName)){
                                e.amount += t.totalPrice;
                                e.quantity += t.quantity;
                                added = true;
                                break;
                            }
                        }
                        if(!added){
                            analyticsEntityList.add(new AnalyticsEntity(t.foodName, t.totalPrice, t.quantity));
                        }
                    }
                }
            }
            result.put(time, analyticsEntityList);
        }
        
        return result;
    }
    
    public static AnalyticsEntity getTopSellerByAmount(String time){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }else if(time.equals("Year")){
            cal.add(Calendar.YEAR, -1);
        }else if(time.equals("Month")){
            cal.add(Calendar.MONTH, -1);
        }else if(time.equals("Week")){
            cal.add(Calendar.WEEK_OF_YEAR, -1);
        }else if(time.equals("Day")){
            cal.add(Calendar.DAY_OF_YEAR, -1);
        }
        Date prevDateTime = cal.getTime();
        
        HashMap<String,Double> analyticsEntityMap = new HashMap<>();
        
        for(Transaction t : transactionList){
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                Double amount = analyticsEntityMap.get(name);
                if(amount == null){
                    analyticsEntityMap.put(name,t.totalPrice);
                }else{
                    analyticsEntityMap.put(name,t.totalPrice + amount);
                }
            }
        }
        
        String topSellerName = "";
        double topSellerAmount = -1;
        for(String name : analyticsEntityMap.keySet()){
            double amount = analyticsEntityMap.get(name);
            if(amount > topSellerAmount){
                topSellerAmount = amount;
                topSellerName = name;
            }
        }
        return new AnalyticsEntity(topSellerName, topSellerAmount);
    }
    
    public static AnalyticsEntity getTopSellerByQuantity(String time){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }else if(time.equals("Year")){
            cal.add(Calendar.YEAR, -1);
        }else if(time.equals("Month")){
            cal.add(Calendar.MONTH, -1);
        }else if(time.equals("Week")){
            cal.add(Calendar.WEEK_OF_YEAR, -1);
        }else if(time.equals("Day")){
            cal.add(Calendar.DAY_OF_YEAR, -1);
        }
        Date prevDateTime = cal.getTime();
        
        HashMap<String,Integer> analyticsEntityMap = new HashMap<>();
        
        for(Transaction t : transactionList){
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                Integer quantity = analyticsEntityMap.get(name);
                if(quantity == null){
                    analyticsEntityMap.put(name,t.quantity);
                }else{
                    analyticsEntityMap.put(name,t.quantity + quantity);
                }
            }
        }
        
        String topSellerName = "";
        int topSellerQuantity = -1;
        for(String name : analyticsEntityMap.keySet()){
            int quantity = analyticsEntityMap.get(name);
            if(quantity > topSellerQuantity){
                topSellerQuantity = quantity;
                topSellerName = name;
            }
        }
        return new AnalyticsEntity(topSellerName, topSellerQuantity);
    }
    
    public static String print(){
        return transactionList.toString();
    }
}
