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
import models.Passwordtokens;
import models.User;

/**
 *
 * @author 00cap
 */
public class PasswordTokensDB {

    public Passwordtokens getByToken(String token) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Passwordtokens> query = em.createNamedQuery("Passwordtokens.findByToken", Passwordtokens.class);
            query.setParameter("token", token);
            List<Passwordtokens> results = query.getResultList();
            if (!results.isEmpty()) {
                return results.get(0);  // Assuming token is unique, return the first match
            } else {
                return null;  // Token not found
            }
        } finally {
            em.close();
        }
    }

    public Passwordtokens get(int tokenId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Passwordtokens passwordtoken = em.find(Passwordtokens.class, tokenId);
            return passwordtoken;

        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

    public List<Passwordtokens> getExpired() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Passwordtokens> query = em.createNamedQuery("Passwordtokens.findExpired", Passwordtokens.class);           
            List<Passwordtokens> tokens = query.getResultList();
            return tokens;
        } finally {
            em.close();
        }
    }
//delete one?
    public void delete(Passwordtokens passwordtoken) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(passwordtoken));
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
//delete list
    public void deleteExpired() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            List<Passwordtokens> expiredTokens = getExpired();
            // Delete expired token
            for (Passwordtokens token : expiredTokens) {
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
    public void insert(Passwordtokens passwordtoken) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            User user = passwordtoken.getUserid();
            user.getPasswordtokensList().add(passwordtoken);
            trans.begin();
            em.persist(passwordtoken);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

}
