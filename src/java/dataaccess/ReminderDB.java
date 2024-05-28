/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Reminder;
import dataaccess.SentRemindersDB;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.persistence.TypedQuery;
import models.Appointment;

/**
 *
 * @author Hussein
 */
public class ReminderDB {
    public List<Reminder> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Reminder> reminders = em.createNamedQuery("Reminder.findAll", Reminder.class).getResultList();
            return reminders;
        } finally {
           em.close();
        }

    }
    public List<Reminder> getPassed() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Reminder> query = em.createNamedQuery("Reminder.findByPassed", Reminder.class);
             LocalDateTime now = LocalDateTime.now();
             query.setParameter("currentTime", java.sql.Timestamp.valueOf(now));
//            query.setParameter("currentTime", java.sql.Date.valueOf(now));
            List<Reminder> reminders = query.getResultList();
            return reminders;
        } finally {
           em.close();
        }

    }
    
    
    //get using reminder ID .  
    public Reminder getById(int reminderId) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Reminder reminder = em.find(Reminder.class,reminderId);
            return reminder;
        } finally {
           em.close();
        }
    }
    
    //update.   Arent reminders auto updated using the cascade thing when appointments updated?
    public void update(Reminder r) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(r);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    //this delete reminder is only called in the timer class to delete the reminder after it is sent.  This automatically
    //adds into the sent reminders table.  IT WONT BE CALLED IN ANY OTHER CONTEXT!! 
    //Deleting from the appointment table has a database trigger to automatically remove a reminder!
    public void delete(Reminder r) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        SentRemindersDB srdb = new SentRemindersDB();
        srdb.insert(r);
        try{
            trans.begin();
            em.remove(em.merge(r));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally{
            em.close();
        }
        
    }
}
