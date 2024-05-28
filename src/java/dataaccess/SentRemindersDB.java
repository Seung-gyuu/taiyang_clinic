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
import models.Sentreminders;

/**
 *
 * @author Hussein
 */
public class SentRemindersDB {
    
    public List<Sentreminders> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Sentreminders> sentReminders = em.createNamedQuery("Sentreminders.findAll", Sentreminders.class).getResultList();
            return sentReminders;
        } finally {
           em.close();
        }

    }
    public void insert(Reminder r) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Sentreminders s = new Sentreminders();
        s.setAppointmentid(r.getAppointmentid());
        s.setSentTime(r.getSendTime());
        s.setSentreminderid(r.getReminderid());
        s.setUserid(r.getUserid());
        try {
            trans.begin();
            em.persist(s);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
}
