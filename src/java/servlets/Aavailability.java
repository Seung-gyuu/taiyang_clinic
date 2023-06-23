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
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        DayService ds = new DayService();
        List<Day> days = ds.getCurrentWeek4Months();
        List<Day> unavailableDays;
        List<Day> availableDays;
        LocalDate currentDate = LocalDate.now();
        DayOfWeek currentDay = currentDate.getDayOfWeek();
        int currentDayNUmber = currentDay.getValue();
        if (currentDayNUmber == 7) {
            currentDayNUmber = 0;
            unavailableDays = days.subList(0, currentDayNUmber);
            availableDays = days.subList(currentDayNUmber, days.size());
            request.setAttribute("unavailableDays", unavailableDays);
            request.setAttribute("availableDays", availableDays);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/aavailability.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String timeid = request.getParameter("timeid");
            String message = "";
            AvailableTimeService ats = new AvailableTimeService();
            List<Availabletime> availableTimes = ats.findAllUpcoming();
            if (action.equals("unavailable")) {
                try {
                    Availabletime at = ats.findByTimeId(Integer.parseInt(timeid));
                    at.setIsAvailable(0);
                    ats.unavailable(at);
                    message = "Time slot is now unavailable";
                } catch (Exception e) {
                    message = "Unable to make time slot unavailable";
                }
            } else if (action.equals("available")) {
                try {
                    Availabletime at = ats.findByTimeId(Integer.parseInt(timeid));
                    at.setIsAvailable(1);
                    ats.insert(at);
                    message = "Time slot is now available";
                } catch (Exception e) {
                    message = "Unable to make time slot available";
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Aavailability.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
