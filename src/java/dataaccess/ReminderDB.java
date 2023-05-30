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
