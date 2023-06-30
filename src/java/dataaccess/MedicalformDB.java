/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import models.Medicalform;
import models.User;

/**
 *
 * @author 00cap
 */
public class MedicalformDB {
    public List<Medicalform> getByUserid(int userId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Medicalform> query = em.createNamedQuery("Medicalform.findByUserid", Medicalform.class);
            query.setParameter("userid", userId);
            List<Medicalform> results = query.getResultList();
            return results;
        } finally {
           em.close();
        }
    }
    
    public Medicalform get(int formId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Medicalform medicalform = em.find(Medicalform.class, formId);
            return medicalform;
            
        } catch (Exception e) {
            return null;
        }finally {
            em.close();
        }
    }
    
    //insert
    public void insert(Medicalform md) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(md);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void delete(Medicalform md) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try{
            trans.begin();
            em.remove(em.merge(md));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally{
            em.close();
        }
        
    }
    
    
    
}
