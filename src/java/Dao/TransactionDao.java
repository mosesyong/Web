/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Entity.AnalyticsEntity;
import static Entity.AnalyticsEntity.AmountComparatorAsc;
import static Entity.AnalyticsEntity.AmountComparatorDesc;
import static Entity.AnalyticsEntity.QuantityComparatorAsc;
import static Entity.AnalyticsEntity.QuantityComparatorDesc;
import Entity.Transaction;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.stream.Collectors;

/**
 *
 * @author moses
 */
public class TransactionDao {
    public static ArrayList<Transaction> transactionList;
    public static HashMap<Integer,Date> dateMap;
    
    public TransactionDao(){
        TransactionDao.transactionList = new ArrayList<>();
        dateMap = new HashMap<>();
        
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
        cal.clear(Calendar.MINUTE); // minute to 0
        cal.clear(Calendar.SECOND); // second to 0
        cal.clear(Calendar.MILLISECOND); // millisecond to 0
        cal.set(Calendar.DATE, 1); // day to 1
        
        for(int i = 0; i <= 12; i++){ // to jan of the next year to compare for december
            cal.set(Calendar.MONTH, i);
            dateMap.put(i+1, cal.getTime());
        }
        System.out.println("DateMap:" + dateMap);
    }
    
    public static void addTransaction(Transaction t){
        transactionList.add(t);
    }
    
    public static ArrayList<Transaction> getTransactionList(){
        return transactionList;
    }
    
    public static ArrayList<Transaction> getNonRefundedTransactionList(){
        ArrayList<Transaction> result = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(!t.refunded){
                result.add(t);
            }
        }
        
        return result;
    }
    
    public static ArrayList<Transaction> getRefundedTransactionList(){
        ArrayList<Transaction> result = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                result.add(t);
            }
        }
        
        return result;
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
        System.out.println("controller");
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
            
            
            if(time.equals("Day")){
                cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
                cal.clear(Calendar.MINUTE);
                cal.clear(Calendar.SECOND);
                cal.clear(Calendar.MILLISECOND);
            }
            if(time.equals("Week")){
                cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
            }
            if(time.equals("Month")){
                cal.set(Calendar.DAY_OF_MONTH, 1);
            }
            if(time.equals("Year")){
                cal.set(Calendar.YEAR, 1);
            }
            if(time.equals("All")){
                cal.add(Calendar.YEAR, -100);
            }
            Date prevDateTime = cal.getTime();
            
            
            if(analyticsType.equals("Sales")){
                for(Transaction t : transactionList){
                    if(t.refunded){
                        continue;
                    }
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
            }else if(analyticsType.equals("ItemsQuantity") || analyticsType.equals("ItemsAmount")){
                for(Transaction t : transactionList){
                    if(t.refunded){
                        continue;
                    }
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

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        HashMap<String,Double> analyticsEntityMap = new HashMap<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
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

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        HashMap<String,Integer> analyticsEntityMap = new HashMap<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
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
    
    public static ArrayList<AnalyticsEntity> getTopSellersByAmount(String time, int count){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                boolean added = false;
                for(AnalyticsEntity entity : analyticsEntityList){
                    if(entity.label.equals(name)){
                        added = true;
                        entity.amount = entity.amount + t.totalPrice;
                        entity.quantity = entity.quantity + t.quantity;
                    }
                    if(added){
                        break;
                    }
                }
                if(!added){
                    analyticsEntityList.add(new AnalyticsEntity(name, t.totalPrice, t.quantity));
                }
            }
        }
        
        analyticsEntityList.sort(AmountComparatorAsc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static ArrayList<AnalyticsEntity> getBottomSellersByAmount(String time, int count){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                boolean added = false;
                for(AnalyticsEntity entity : analyticsEntityList){
                    if(entity.label.equals(name)){
                        added = true;
                        entity.amount = entity.amount + t.totalPrice;
                    }
                    if(added){
                        break;
                    }
                }
                if(!added){
                    analyticsEntityList.add(new AnalyticsEntity(name, t.totalPrice));
                }
            }
        }
        
        analyticsEntityList.sort(AmountComparatorDesc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static ArrayList<AnalyticsEntity> getTopSellersByQuantity(String time, int count){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                boolean added = false;
                for(AnalyticsEntity entity : analyticsEntityList){
                    if(entity.label.equals(name)){
                        added = true;
                        entity.amount = entity.amount + t.totalPrice;
                        entity.quantity = entity.quantity + t.quantity;
                    }
                    if(added){
                        break;
                    }
                }
                if(!added){
                    analyticsEntityList.add(new AnalyticsEntity(name, t.quantity));
                }
            }
        }
        
        analyticsEntityList.sort(QuantityComparatorAsc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static ArrayList<AnalyticsEntity> getBottomSellersByQuantity(String time, int count){
        Calendar cal = Calendar.getInstance();
        if(!cal.getTimeZone().getID().equals("Asia/Singapore")){
            cal.add(Calendar.HOUR, 8);
        }

        if(time.equals("Day")){
            cal.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            cal.clear(Calendar.MINUTE);
            cal.clear(Calendar.SECOND);
            cal.clear(Calendar.MILLISECOND);
        }
        if(time.equals("Week")){
            cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        }
        if(time.equals("Month")){
            cal.set(Calendar.DAY_OF_MONTH, 1);
        }
        if(time.equals("Year")){
            cal.set(Calendar.YEAR, 1);
        }
        if(time.equals("All")){
            cal.add(Calendar.YEAR, -100);
        }
        Date prevDateTime = cal.getTime();
        
        ArrayList<AnalyticsEntity> analyticsEntityList = new ArrayList<>();
        
        for(Transaction t : transactionList){
            if(t.refunded){
                continue;
            }
            if(t.dateTime.after(prevDateTime)){
                String name = t.foodName;
                boolean added = false;
                for(AnalyticsEntity entity : analyticsEntityList){
                    if(entity.label.equals(name)){
                        added = true;
                        entity.quantity = entity.quantity + t.quantity;
                    }
                    if(added){
                        break;
                    }
                }
                if(!added){
                    analyticsEntityList.add(new AnalyticsEntity(name, t.quantity));
                }
            }
        }
        
        analyticsEntityList.sort(QuantityComparatorDesc);
        
        
        ArrayList<AnalyticsEntity> result = new ArrayList<>();
        if(count > analyticsEntityList.size()){
            count = analyticsEntityList.size();
        }
        
        for(int i = 0; i < count; i++){
            result.add(analyticsEntityList.get(i));
        }
        
        return result;
    }
    
    public static TreeSet<AnalyticsEntity> getMainPageTransactions(){
        TreeSet<AnalyticsEntity> result = new TreeSet<>();
        result.addAll(getTopSellersByAmount("Year", 3));
        for(AnalyticsEntity ae1 : getTopSellersByQuantity("Year", 3)){
            boolean exists = false;
            for(AnalyticsEntity ae2 : result){
                if(ae1.label.equals(ae2.label)){
                    exists = true;
                    break;
                }
            }
            if(!exists){
                result.add(ae1);
            }
        }
        
        return result;
    }
    
    public static double getMonthsTransactionAmount(int month){
        double amount = 0.0;
        for(Transaction t : transactionList){
            Date transactionDateTime = t.dateTime;
            if(transactionDateTime.after(dateMap.get(month)) && transactionDateTime.before(dateMap.get(month+1))){
                amount += t.totalPrice;
            }
        }
        return amount;
    }
    
    
    public static ArrayList<Double> getMonthlyTransactions(){
        ArrayList<Double> result = new ArrayList<>();
        for(int i = 1; i <= 12; i++){ //Jan to december of the current year
            result.add(getMonthsTransactionAmount(i));
        }
        return result;
    }
    
    public static HashMap<String, Double> getMonthsTransactionAmountByPaymentType(int month){
        HashMap<String, Double> result = new HashMap<>();
        result.put("cash", 0.0);
        result.put("card", 0.0);
        result.put("snapcash", 0.0);
        for(Transaction t : transactionList){
            Date transactionDateTime = t.dateTime;
            if(transactionDateTime.after(dateMap.get(month)) && transactionDateTime.before(dateMap.get(month+1))){
                if(t.paymentType.equals("cash")){
                    double amount = result.get("cash");
                    result.put("cash", amount + t.totalPrice);
                }else if(t.paymentType.equals("card")){
                    double amount = result.get("card");
                    result.put("card", amount + t.totalPrice);
                }else if(t.paymentType.equals("snapcash")){
                    double amount = result.get("snapcash");
                    result.put("snapcash", amount + t.totalPrice);
                }
            }
        }
        return result;
    }
    
    public static HashMap<String, ArrayList<Double>> getMainPageTransactionsByPaymentType(){
        ArrayList<HashMap<String, Double>> tempResult = new ArrayList<>();
        for(int i = 1; i <= 12; i++){ //Jan to december of the current year
            tempResult.add(getMonthsTransactionAmountByPaymentType(i));
        }
        
        HashMap<String, ArrayList<Double>> result = new HashMap<>();
        result.put("cash", new ArrayList<Double>());
        result.put("card", new ArrayList<Double>());
        result.put("snapcash", new ArrayList<Double>());
        
        for(HashMap<String, Double> map : tempResult){
            for(String name : map.keySet()){
                double amount = map.get(name);
                ArrayList<Double> list = result.get(name);
                list.add(amount);
                result.put(name, list);
            }
        }
        
        return result;
    }
    
    public static AnalyticsEntity getTransactionAnalytics(Date startDate, Date endDate, String type, String filter){
        AnalyticsEntity ae = null;
        if(endDate == null){ // if no endDate, set to current time/ future time to get all transactions
            endDate = (Date)startDate.clone();
            endDate.setYear(3000);
        }
        if(filter.equals("refunded")){
            if(type.equals("quantity")){ // quantity #
                ae = new AnalyticsEntity("Refunded by quantity (#) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.refunded && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.quantity += t.quantity;
                    }
                }
            }else{ // amount $
                ae = new AnalyticsEntity("Refunded by amount ($) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.refunded && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.amount += t.totalPrice;
                    }
                }
            }
        }else if(filter.equals("cash")){
            if(type.equals("quantity")){ // quantity #
                ae = new AnalyticsEntity("Cash payments by quantity (#) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("cash") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.quantity += t.quantity;
                    }
                }
            }else{ // amount $
                ae = new AnalyticsEntity("Cash payments by amount ($) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("cash") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.amount += t.totalPrice;
                    }
                }
            }
        }else if(filter.equals("card")){
            if(type.equals("quantity")){ // quantity #
                ae = new AnalyticsEntity("Card payments by quantity (#) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("card") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.quantity += t.quantity;
                    }
                }
            }else{ // amount $
                ae = new AnalyticsEntity("Cash payments by amount ($) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("card") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.amount += t.totalPrice;
                    }
                }
            }
        }else if(filter.equals("snapcash")){
            if(type.equals("quantity")){ // quantity #
                ae = new AnalyticsEntity("Snapcash payments by quantity (#) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("snapcash") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.quantity += t.quantity;
                    }
                }
            }else{ // amount $
                ae = new AnalyticsEntity("Snapcash payments by amount ($) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.paymentType.equals("snapcash") && t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.amount += t.totalPrice;
                    }
                }
            }
        }else if(filter.equals("all")){
            if(type.equals("quantity")){ // quantity #
                ae = new AnalyticsEntity("All payments by quantity (#) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.quantity += t.quantity;
                    }
                }
            }else{ // amount $
                ae = new AnalyticsEntity("All payments by amount ($) from " + startDate + " to " + endDate);
                for(Transaction t: transactionList){
                    if(t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                        ae.amount += t.totalPrice;
                    }
                }
            }
        }
        
        return ae;
    }
    
    public static ArrayList<Transaction> getTransactions(Date startDate, Date endDate){
        ArrayList<Transaction> result = new ArrayList<>();
        for(Transaction t : transactionList){
            if(t.dateTime.after(startDate) && t.dateTime.before(endDate)){
                result.add(t);
            }
        }
        return result;
    }
    
    public static String print(){
        return transactionList.toString();
    }
}
