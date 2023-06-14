/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.AppointmentDB;
import java.util.List;
import models.Appointment;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
/**
 *
 * @author Hussein
 */
public class AppointmentService {
    private AppointmentDB adb;
    
    public AppointmentService(){
        this.adb=new AppointmentDB();
    }
    public List<Appointment> getAll() throws Exception {
        return adb.getAll();
    }
    public Appointment get(Integer appointmentId) {
        return adb.get(appointmentId);
    }
    public Appointment getByTimeId(Integer timeId) {
        return adb.getByTimeId(timeId);
    }
    public List<Appointment> getUpcoming() throws Exception{
        return adb.getUpcoming();
    }
    public List<Appointment> getUserUpcoming(int userId) throws Exception {
        return adb.getUserUpcoming(userId);
    }
    public List<Appointment> getPassed() throws Exception{
        return adb.getPassed();
    }
    public List<Appointment> getUserPassed(int userId) throws Exception {
        return adb.getUserPassed(userId);
    }
    public List<Appointment> getPassedRange(int weeks) throws Exception{
        return adb.getPassedRange(weeks);
    }
    public List<Appointment> getUpcomingRange(int weeks) throws Exception{
        return adb.getUpcomingRange(weeks);
    }
    public List<Appointment> findByRange(Date start, Date end) throws Exception{
        return adb.findByRange(start, end);
    }
    public String insert(Appointment appt) throws Exception{
        adb.insert(appt);
        return "Appointment Created!";
    }
    public String delete(Appointment appt) throws Exception{
        LocalDate tmrw = LocalDate.now().plusDays(1);
        Date appointmentDate = appt.getTimeid().getFulldate().getFulldate();
        LocalDate apptLocalDate = appointmentDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if (apptLocalDate.isBefore(tmrw) || apptLocalDate.isEqual(tmrw)) 
            return "Cannot delete an appointment that is tomorrow!";
        
        adb.delete(appt);
        return "Appointment Deleted!";
    }
    
}