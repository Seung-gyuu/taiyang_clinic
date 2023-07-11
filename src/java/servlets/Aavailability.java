package servlets;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import services.AppointmentService;
import services.AvailableTimeService;
import services.DayService;

/**
 *
 * @author rladm
 */
public class Aavailability extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            request.getSession().invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        }
        AvailableTimeService ats = new AvailableTimeService();
        DayService ds = new DayService();
//        List<Availabletime> available = ats.findByTimeId(0);
        List<Day> days = ds.getCurrentWeek4Months();
        try {
            List<Day> updatedDays = new ArrayList<>();
            for (Day day : days) {
                List<Availabletime> availableTimes = ats.findByDate(day.getFulldate());
                day.setAvailabletimeList(availableTimes);
                updatedDays.add(day);
            }
            request.setAttribute("days", updatedDays);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to load availability");
        }
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
        List<Appointment> upcomingAppointments;
        List<Appointment> passed;
        AppointmentService as = new AppointmentService();
        try {
            upcomingAppointments = as.getUpcoming();
            passed = as.getPassed();
            session.setAttribute("upcomingAppointments", upcomingAppointments);
            session.setAttribute("passed", passed);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to load appointments");
        }
//        List<Availabletime> passed = ats.findAllPassed();
//        request.setAttribute("passed", passed);
// To display passed unbook 'Unbooked'
//        List<Availabletime> passed;
//        try {
//            passed = ats.findAllPassedUnbooked();
//            request.setAttribute("passed", passed);
//        } catch (Exception e) {
//            request.setAttribute("message", "Unable to load passed appointments");
//        }

        getServletContext().getRequestDispatcher("/WEB-INF/en/aavailability.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            int timeId = Integer.parseInt(request.getParameter("timeid"));
            String message = "";
            String status = request.getParameter("status");
            AvailableTimeService ats = new AvailableTimeService();

            if (action.equals("unavailable")) {
                try {
                    Availabletime at = ats.findByTimeId(timeId);
                    at.setIsAvailable(2);
                    ats.update(at);
                    message = "Time slot is now unavailable";
                    HttpSession session = request.getSession();
                    session.setAttribute("status_" + timeId, "unavailable"); // Set the session attribute for the time slot
                } catch (Exception e) {
                    message = "Unable to make time slot unavailable";
                }
            } else if (action.equals("available")) {
                try {
                    Availabletime at = ats.findByTimeId(timeId);
                    at.setIsAvailable(1);
                    ats.update(at);
                    message = "Time slot is now available";
                    HttpSession session = request.getSession();
                    session.setAttribute("status_" + timeId, "available"); // Set the session attribute for the time slot
                } catch (Exception e) {
                    message = "Unable to make time slot available";
                }
            }
            response.setContentType("text/plain");
            response.getWriter().write(message);
        } catch (Exception ex) {
            Logger.getLogger(Aavailability.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
