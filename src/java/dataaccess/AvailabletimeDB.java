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
import models.Availabletime;

/**
 *
 * @author 00cap
 */
public class AvailabletimeDB {
    public List<Availabletime> findAllPassed() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassed", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    
    public List<Availabletime> findAllPassedToday() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassedToday", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    
    public List<Availabletime> findByDate(Date d) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Availabletime> query = em.createNamedQuery("Availabletime.findByDate", Availabletime.class);
            query.setParameter("date", d);
            List<Availabletime> times = query.getResultList();
            return times;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    public List<Availabletime> findByRange(Date start, Date end) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Availabletime> query = em.createNamedQuery("Availabletime.findInRange", Availabletime.class);
            query.setParameter("startdate", start);
            query.setParameter("enddate", end);
            List<Availabletime> times = query.getResultList();
            return times;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    
    
    
    public List<Availabletime> findAllPassedBooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassedBooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllPassedUnbooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassedUnbooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcoming() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcoming", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcomingBooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcomingBooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcomingUnbooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcomingUnbooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public Availabletime findByTimeId(int timeId) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        Availabletime time = em.find(Availabletime.class, timeId);
        return time;
    } finally {
        em.close();
        }
    }
    
    //insert 
    public void insert(Availabletime avt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(avt);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void unavailable(Availabletime avt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(avt));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void update(Availabletime t) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(t);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    //maybe need methods to find booked/unbooked upcoming and passed by passed in weeks parameter? Probably need focus on
    // other features first

}