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
    //DAYS ARE GENERATED AUTOMATICALLY VIA SCRIPT AND JUST NEED INSERT (via mysql bench)!!!
    
    //GETS THE DAYS FROM THE CURRENT DAY AND UP TO 4 MONTHS FROM NOW
    public List<Day> get4Months() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate endDate = currentDate.plusMonths(4);

        TypedQuery<Day> query = em.createNamedQuery("Day.find4Months", Day.class);
        query.setParameter("currentDate",  java.sql.Date.valueOf(currentDate));
        query.setParameter("endDate",  java.sql.Date.valueOf(endDate));

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
   //GETS FROM THE CURRENT WEEK's SUNDAY TO THE NEXT 4 MONTHS.  USED FOR THE CALENDAR.
   // example.  if today is wednesday may 24, it will get from sunday may 21, and 4 months in the future
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
   //gets the last 4 months and up to (including) today
   public List<Day> getLast4Months() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate startDate = currentDate.minusMonths(4);

        TypedQuery<Day> query = em.createNamedQuery("Day.findLast4Months", Day.class);
        query.setParameter("currentDate",  java.sql.Date.valueOf(currentDate));
        query.setParameter("startDate",  java.sql.Date.valueOf(startDate));

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
   //gets the previous availability by the weeks
   public List<Day> getPreviousByWeeks(int weeks) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate startDate = currentDate.minusWeeks(weeks);

        TypedQuery<Day> query = em.createNamedQuery("Day.findPreviousByWeeks", Day.class);
        query.setParameter("currentDate",  java.sql.Date.valueOf(currentDate));
        query.setParameter("startDate",  java.sql.Date.valueOf(startDate));

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
   //gets upcoming availability by the weeks
   public List<Day> getUpcomingByWeeks(int weeks) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        LocalDate currentDate = LocalDate.now();
        LocalDate endDate = currentDate.plusWeeks(weeks);

        TypedQuery<Day> query = em.createNamedQuery("Day.findUpcomingByWeeks", Day.class);
        query.setParameter("currentDate",  java.sql.Date.valueOf(currentDate));
        query.setParameter("endDate",  java.sql.Date.valueOf(endDate));

        List<Day> days = query.getResultList();
        return days;
    } finally {
        em.close();
    }
}
}
