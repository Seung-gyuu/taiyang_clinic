
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import services.*;

/**
 *
 * @author third
 */
public class BookServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        AvailableTimeService as = new AvailableTimeService();
        DayService ds = new DayService();
        List<Day> days = ds.getCurrentWeek4Months();
        List<Day> unavailableDays;
        List<Day> availableDays;
        LocalDate currentDate = LocalDate.now();
        DayOfWeek currentDay = currentDate.getDayOfWeek();
        int currentDayNumber = currentDay.getValue();
        if (currentDayNumber == 7) {
            currentDayNumber = 0;
        }
        unavailableDays = days.subList(0, currentDayNumber);
        availableDays = days.subList(currentDayNumber, days.size());
        ServiceService ss = new ServiceService();
        try {
            List<Service> services = ss.getAll();
            request.setAttribute("services", services);
//            for (Day d : unavailableDays) {
//                List<Availabletime> newAvailableTimes = as.findByDate(d.getFulldate());
//                d.setAvailabletimeList(newAvailableTimes);
//            }
//            for (Day d : availableDays) {
//                List<Availabletime> newAvailableTimes = as.findByDate(d.getFulldate());
//                d.setAvailabletimeList(newAvailableTimes);
//            }
            request.setAttribute("unavailableDays", unavailableDays);
            request.setAttribute("availableDays", availableDays);

        } catch (Exception ex) {
            Logger.getLogger(BookServlets.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/WEB-INF/booktest.jsp").forward(request, response);
    }
//        getServletContext().getRequestDispatcher("/WEB-INF/book.jsp").forward(request, response);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
