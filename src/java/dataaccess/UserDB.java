/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

/**
 *
 * @author Hussein
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import models.Role;
import models.User;

/**
 *
 * @author Hussein
 */
public class UserDB {
    
    public List<User> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<User> users = em.createNamedQuery("User.findAll", User.class).getResultList();
            return users;
        } finally {
           em.close();
        }

    }
    
    public List<User> getAllByFirstName(String firstname) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        TypedQuery<User> query = em.createNamedQuery("User.findByFirstname", User.class);
        query.setParameter("firstname", firstname);
        List<User> users = query.getResultList();
        return users;
    } finally {
       em.close();
    }
}

    public List<User> getAllByLastName(String lastname) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<User> query = em.createNamedQuery("User.findByLastname", User.class);
        query.setParameter("lastname", lastname);
        List<User> users = query.getResultList();
        return users;
        } finally {
           em.close();
        }

    }
    public User get(int userId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            User user = em.find(User.class, userId);
            return user;
            
        } catch (Exception e) {
            return null;
        }finally {
            em.close();
        }
    }
        
//    public User getByEmail(String email) throws Exception {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        try {
//            User user = em.find(User.class, email);
//            return user;
//            
//        } catch (Exception e) {
//            return null;
//        }finally {
//            em.close();
//        }
//
//    }
    
    public User getByEmail(String email) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        TypedQuery<User> query = em.createNamedQuery("User.findByEmailAddress", User.class);
        query.setParameter("emailAddress", email);
        List<User> users = query.getResultList();
        if (!users.isEmpty()) {
            return users.get(0);
        } else {
            return null;
        }
    } finally {
        em.close();
    }
}
    
    public User getByPhone(String phone) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try{
            TypedQuery<User> query = em.createNamedQuery("User.findByPhoneNumber", User.class);
            query.setParameter("phoneNumber", phone);
            List<User> users = query.getResultList();
            if (!users.isEmpty()) {
                return users.get(0);
            } else {
                return null;
            }
        }finally {
            em.close();
        }

    }
    
    
   public void insert(User user) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    try {
        trans.begin();
        em.persist(user);
        trans.commit();
    } catch (Exception ex) {
        trans.rollback();
    } finally {
        em.close();
    }
}


    
    public void update(User user) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void delete(User user) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(user));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
        public void add(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } finally {
            em.close();
        }
    }
    
}
