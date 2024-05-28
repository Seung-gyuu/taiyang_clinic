/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.SentRemindersDB;
import java.util.List;
import models.Reminder;
import models.Sentreminders;

/**
 *
 * @author Hussein
 */
public class SentRemindersService {
    private SentRemindersDB srdb;
    
    public SentRemindersService(){
        this.srdb=new SentRemindersDB();
    }
    public List<Sentreminders> getAll() throws Exception {
        return srdb.getAll();
    }
    public String insert(Reminder r) throws Exception {
        try{
            srdb.insert(r);
            return "Reminder inserted";
        }
        catch(Exception ex){
            return "Error Occured";
        }
    }
}
