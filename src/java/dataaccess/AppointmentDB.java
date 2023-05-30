/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import models.Appointment;

/**
 *
 * @author 00cap
 */
public class AppointmentDB {
    public Appointment get(Integer appointmentId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Appointment appt = em.find(Appointment.class, appointmentId);
            return appt;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    public List<Appointment> getUpcoming() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Appointment> appts = em.createNamedQuery("Appointment.findByUpcoming", Appointment.class).getResultList();
            return appts;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    public List<Appointment> getUserUpcoming(int userId) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findUserUpcoming", Appointment.class);
        query.setParameter("userid", userId);
        List<Appointment> appts = query.getResultList();
        return appts;
    } finally {
        em.close();
    }
    }
    

    public List<Appointment> getPassed() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Appointment> appts = em.createNamedQuery("Appointment.findByPassed", Appointment.class).getResultList();
            return appts;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    public List<Appointment> getUserPassed(int userId) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findUserPassed", Appointment.class);
        query.setParameter("userid", userId);
        List<Appointment> appts = query.getResultList();
        return appts;
    } finally {
        em.close();
    }
}
}
