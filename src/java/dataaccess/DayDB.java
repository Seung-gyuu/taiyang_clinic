/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.time.LocalDate;
import java.util.List;
import models.Day;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
/**
 *
 * @author Hussein
 */
public class DayDB {
    //DAYS ARE GENERATED AUTOMATICALLY VIA SCRIPT AND JUST NEED INSERT!!!
    
    public List<Day> get4Months() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate endDate = currentDate.plusMonths(4);

        TypedQuery<Day> query = em.createNamedQuery("Day.find4Months", Day.class);
        query.setParameter("currentDate", currentDate);
        query.setParameter("endDate", endDate);

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
    
   public List<Day> getCurrentWeek4Months() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate endDate = currentDate.plusMonths(4);

        TypedQuery<Day> query = em.createNamedQuery("Day.findCurrentWeek4Months", Day.class);
        query.setParameter("startDate", java.sql.Date.valueOf(currentDate));
        query.setParameter("endDate", java.sql.Date.valueOf(endDate));

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
}
