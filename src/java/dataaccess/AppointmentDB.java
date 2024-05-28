/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import models.Appointment;
import models.Availabletime;

/**
 *
 * @author 00cap
 */
public class AppointmentDB {
    //retrieves all appointments
    public List<Appointment> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Appointment> appts = em.createNamedQuery("Appointment.findAll", Appointment.class).getResultList();
            return appts;
        } finally {
           em.close();
        }
    }   
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
    public Appointment getByTimeId(Integer timeId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findByTimeId", Appointment.class);
            query.setParameter("timeid", timeId);
            List<Appointment> appt = query.getResultList();
            return appt.get(0);
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
    
        public List<Appointment> getTodayAppt() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Appointment> appts = em.createNamedQuery("Appointment.findByTodayAppt", Appointment.class).getResultList();
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
    
    public List<Appointment> getOutdated() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Appointment> appts = em.createNamedQuery("Appointment.findOutdated", Appointment.class).getResultList();
            return appts;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    
    
    
    public List<Appointment> getByMonthYear(String month, int year) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findByMonthYearTotal", Appointment.class);
            query.setParameter("month", month);
            query.setParameter("year", year);
            List<Appointment> appts = query.getResultList();
            return appts;
        } finally {
           em.close();
        }
    }
    
    public List<Appointment> getByMonthYearConfirmed(String month, int year) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findByMonthYearConfirmed", Appointment.class);
            query.setParameter("month", month);
            query.setParameter("year", year);
            List<Appointment> appts = query.getResultList();
            return appts;
        } finally {
           em.close();
        }
    }
    
    
    public List<Appointment> getByMonthYearCanceled(String month, int year) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findByMonthYearCanceled", Appointment.class);
            query.setParameter("month", month);
            query.setParameter("year", year);
            List<Appointment> appts = query.getResultList();
            return appts;
        } finally {
           em.close();
        }
    }
    public List<Appointment> getByDate(Date d) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findAppointmentsByDate", Appointment.class);
            query.setParameter("date", d);
            List<Appointment> appts = query.getResultList();
            return appts;
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
    public List<Appointment> getPassedRange(int weeks) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
        LocalDate d = LocalDate.now();
        LocalDate startDate = d.minusWeeks(weeks);
        TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findPassedByRange", Appointment.class);
        query.setParameter("startDate", startDate);
        List<Appointment> appts = query.getResultList();
        return appts;
    } finally {
        em.close();
    }
    }
    public List<Appointment> findByRange(Date start, Date end) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findInRange", Appointment.class);
            query.setParameter("startdate", start);
            query.setParameter("enddate", end);
            List<Appointment> appts = query.getResultList();
            return appts;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    
    
    
     public List<Appointment> getUpcomingRange(int weeks) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
        LocalDate d = LocalDate.now();
        LocalDate endDate = d.plusWeeks(weeks);
        TypedQuery<Appointment> query = em.createNamedQuery("Appointment.findUpcomingByRange", Appointment.class);
        query.setParameter("endDate", endDate);
        List<Appointment> appts = query.getResultList();
        return appts;
    } finally {
        em.close();
    }
    }
    //insert
     public void insert(Appointment appt) throws Exception{
         EntityManager em = DBUtil.getEmFactory().createEntityManager();
         EntityTransaction trans = em.getTransaction();
          try {
              trans.begin();
              em.persist(appt);
              trans.commit();
          }catch(Exception ex){
            trans.rollback();
        } finally {
            em.close();
        }
     }
     //delete from admin side
     public void delete(Appointment appt) throws Exception{
         EntityManager em = DBUtil.getEmFactory().createEntityManager();
         EntityTransaction trans = em.getTransaction();
          try {
              trans.begin();
              em.remove(appt);
              trans.commit();
          }catch(Exception ex){
            trans.rollback();
        } finally {
            em.close();
        }
     }
     //update from user side( confirm -> cancel)    
        public void update(Appointment appt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            em.merge(appt);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
 
}

    
