/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.DayDB;
import java.util.Date;
import java.util.List;
import models.Day;

/**
 *
 * @author Hussein
 */
public class DayService {
    private DayDB ddb;
    
    public DayService(){
        this.ddb=new DayDB();
    }
    public List<Day> get4Months() {
        return ddb.get4Months();
    }
    public List<Day> getCurrentWeek4Months() {
        return ddb.getCurrentWeek4Months();
    }
    public List<Day> getLast4Months() {
        return ddb.getLast4Months();
    }
    public List<Day> getPreviousByWeeks(int weeks) {
        return ddb.getPreviousByWeeks(weeks);
    }
    public List<Day> getUpcomingByWeeks(int weeks) {
        return ddb.getUpcomingByWeeks(weeks);
    }
    public Day getByDate(Date d){
        return ddb.getByDate(d);
    }
    
     public List<Day> getByRange(Date start, Date end) {
         return ddb.getByRange(start, end);
     }
    
}