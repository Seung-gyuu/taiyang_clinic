/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.ReminderDB;
import java.util.List;
import models.Reminder;

/**
 *
 * @author Hussein
 */
public class ReminderService {
    private ReminderDB rdb;
    
    public ReminderService(){
        this.rdb=new ReminderDB();
    }
    public List<Reminder> getAll() throws Exception {
        return rdb.getAll();
    }
    public Reminder getById(int reminderId) throws Exception{
        return rdb.getById(reminderId);
    }
    public String update(Reminder r) throws Exception {
        rdb.update(r);
        return "Reminder Updated";
    }
    public List<Reminder> getPassed() throws Exception {
        return rdb.getPassed();
    }
    //this delete reminder is only called in the timer class to delete the reminder after it is sent.  This automatically
    //adds into the sent reminders table.  IT WONT BE CALLED IN ANY OTHER CONTEXT!! 
    //Deleting from the appointment table has a database trigger to automatically remove a reminder!
    public String delete(Reminder r) throws Exception{
        rdb.delete(r);
        return "Reminder deleted and added into Sent Reminders Table!!";
    }
}
