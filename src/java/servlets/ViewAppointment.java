package servlets;

import java.io.IOException;
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
 * @author rladm
 */
public class ViewAppointment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            request.getSession().invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }        
        AvailableTimeService ats = new AvailableTimeService();
        DayService ds = new DayService();
        List<Day> days = ds.getCurrentWeek4Months();
        List<Day> unbooked;
        List<Day> booked;
        LocalDate currentDate = LocalDate.now();
        DayOfWeek currentDay = currentDate.getDayOfWeek();
        int currentDayNUmber = currentDay.getValue();
        if (currentDayNUmber == 7) {
            currentDayNUmber = 0;
        }
        unbooked = days.subList(0, currentDayNUmber);
        booked = days.subList(currentDayNUmber, days.size());
        try {
            request.setAttribute("unbooked", unbooked);
            request.setAttribute("booked", booked);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to load days");
        }
        // retrieve upcoming appointments
        List<Appointment> upcomingAppointments;
        AppointmentService as = new AppointmentService();
        try {
            upcomingAppointments = as.getUpcoming();
            session.setAttribute("upcomingAppointments", upcomingAppointments);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to load upcoming appointments");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/viewappointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String timeid = request.getParameter("timeid");
        String message = "";
        AppointmentService as = new AppointmentService();
        try {
            List<Appointment> upcoming_appts = as.getUpcoming();
            request.setAttribute("upcoming_appts", upcoming_appts);

            if (upcoming_appts.isEmpty()) {
                request.setAttribute("message", "Unbooked");
            }
        } catch (Exception e) {
            Logger.getLogger(ViewAppointment.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("message", "Unable to load upcoming appointments");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/viewappointment.jsp").forward(request, response);
    }
}