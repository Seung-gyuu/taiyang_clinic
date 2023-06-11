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
import models.Validatetokens;

/**
 *
 * @author 00cap
 */
public class ValidateTokensDB {
    public Validatetokens getByToken(String token) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Validatetokens> query = em.createNamedQuery("Validatetokens.findByToken", Validatetokens.class);
            query.setParameter("validatetoken", token);
            List<Validatetokens> results = query.getResultList();
            if (!results.isEmpty()) {
                return results.get(0);  // Assuming token is unique, return the first match
            } else {
                return null;  // Token not found
            }
        } finally {
           em.close();
        }
    }
    public Validatetokens get(int tokenId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Validatetokens passwordtoken = em.find(Validatetokens.class, tokenId);
            return passwordtoken;
            
        } catch (Exception e) {
            return null;
        }finally {
            em.close();
        }
    }
    
    public List<Validatetokens> getExpired() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Validatetokens> tokens = em.createNamedQuery("Validatetokens.findExpired", Validatetokens.class).getResultList();
            return tokens;
        } finally {
           em.close();
        }
    }
    
    public void delete(Validatetokens validatetoken) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(validatetoken));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    //delete list
    public void deleteExpired() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            List<Validatetokens> expiredTokens = getExpired();
            // Delete expired token
            for (Validatetokens token : expiredTokens) {
                em.remove(em.merge(token));
            }
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
            throw ex;
        } finally {
            em.close();
        }
    }
    
    //insert 
    public void insert(Validatetokens vdt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(vdt);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    
}
