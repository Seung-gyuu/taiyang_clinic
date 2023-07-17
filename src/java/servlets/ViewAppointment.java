package servlets;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
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
        request.removeAttribute("range");
        getServletContext().getRequestDispatcher("/WEB-INF/en/viewappointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("range")){
            String startDateStr = request.getParameter("start");
        String endDateStr = request.getParameter("end");

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDateLD = LocalDate.parse(startDateStr, dateFormatter);
        LocalDate endDateLD = LocalDate.parse(endDateStr, dateFormatter);

        ZonedDateTime zonedDateTime = startDateLD.atStartOfDay(ZoneId.systemDefault());
        Instant instant = zonedDateTime.toInstant();
        Date startDate = Date.from(instant);

        
        ZonedDateTime zonedDateTime2 = endDateLD.atStartOfDay(ZoneId.systemDefault());
        Instant instant2 = zonedDateTime2.toInstant();
        Date endDate = Date.from(instant2);
        
        DayService ds= new DayService();
        List<Day> days = ds.getByRange(startDate, endDate);
        request.setAttribute("booked", days);
        request.setAttribute("range", true);
        List<Day> unbooked = new ArrayList<>();
        request.setAttribute("unbooked", unbooked);
        getServletContext().getRequestDispatcher("/WEB-INF/en/viewappointment.jsp").forward(request, response);
        }

    }
}
