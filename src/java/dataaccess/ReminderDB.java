/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import models.Reminder;

/**
 *
 * @author Hussein
 */
public class ReminderDB {
    public List<Reminder> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Reminder> reminders = em.createNamedQuery("Reminder.findAll", Reminder.class).getResultList();
            return reminders;
        } finally {
           em.close();
        }

    }
}
