/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
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

}
