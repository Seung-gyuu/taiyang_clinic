/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.AppointmentDB;
import dataaccess.AvailabletimeDB;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import models.Appointment;
import models.Availabletime;

/**
 *
 * @author Hussein
 */
public class AvailableTimeService {
    private AvailabletimeDB avdb;
    
    public AvailableTimeService(){
        this.avdb=new AvailabletimeDB();
    }
    public List<Availabletime> findAllPassed() throws Exception{
        return avdb.findAllPassed();
    }
    public List<Availabletime> findAllPassedToday() throws Exception{
        return avdb.findAllPassedToday();
    }
    public List<Availabletime> findAllPassedBooked() throws Exception{
        return avdb.findAllPassedBooked();
    }
    public List<Availabletime> findAllPassedUnbooked() throws Exception{
        return avdb.findAllPassedUnbooked();
    }
    public List<Availabletime> findAllUpcoming() throws Exception{
        return avdb.findAllUpcoming();
    }
    public List<Availabletime> findAllUpcomingBooked() throws Exception{
        return avdb.findAllUpcomingBooked();
    }
    public List<Availabletime> findAllUpcomingUnbooked() throws Exception{
        return avdb.findAllUpcomingUnbooked();
    }
    public Availabletime findByTimeId(int timeId) throws Exception {
        return avdb.findByTimeId(timeId);
    }
    public List<Availabletime> findByDate(Date d) throws Exception{
        return avdb.findByDate(d);
    }
    public List<Availabletime> findByRange(Date start, Date end) throws Exception{
        return avdb.findByRange(start, end);
    }
    
    public String update(Availabletime t) throws Exception{
        avdb.update(t);
        return "Time Updated";
    }

    
    
    //definitely needs a test!!!!
    public String insert(Availabletime avt) throws Exception {
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        try {
            String startTimeStr = timeFormat.format(avt.getStartTime());
            timeFormat.parse(startTimeStr);
        } catch (ParseException e) {
            return "Invalid start time format. Please use HH:mm:ss format.";
        }
        try {
            String endTimeStr = timeFormat.format(avt.getEndTime());
            timeFormat.parse(endTimeStr);
        } catch (ParseException e) {
            return "Invalid end time format. Please use HH:mm:ss format.";
        }
        avdb.insert(avt);
        return "Insertion successful";
    }
    
    public String unavailable(Availabletime avt) throws Exception{
        if(avt.getIsBooked()==2)
            return "Time is booked! Cannot delete time!";
        AppointmentDB adb = new AppointmentDB();
        Appointment a = adb.getByTimeId(avt.getTimeid());
        if(a!= null){
            return "Appointment made on that time! Cannot delete!";
        }
        avdb.unavailable(avt);
        return "Time deleted!";
    }
}