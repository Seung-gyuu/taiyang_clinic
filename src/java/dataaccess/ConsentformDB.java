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
import models.Consentform;

/**
 *
 * @author 00cap
 */
public class ConsentformDB {
    public List<Consentform> getByUserid(int userId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Consentform> query = em.createNamedQuery("Consentform.findByUserid", Consentform.class);
            query.setParameter("userid", userId);
            List<Consentform> results = query.getResultList();
            return results;
        } finally {
           em.close();
        }
    }
    
    public Consentform get(int formId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Consentform consentform = em.find(Consentform.class, formId);
            return consentform;
            
        } catch (Exception e) {
            return null;
        }finally {
            em.close();
        }
    }
    
    public void insert(Consentform cf) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(cf);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void delete(Consentform cf) throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try{
            trans.begin();
            em.remove(em.merge(cf));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally{
            em.close();
        }
        
    }
    
    
}
