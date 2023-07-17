/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Month;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import services.*;

/**
 *
 * @author Hussein
 */
public class AdminGraphsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String month;
        int year;
        if (request.getParameter("month") != null && request.getParameter("year") != null) {
            int monthNumber = Integer.parseInt(request.getParameter("month"));
            month = Month.of(monthNumber).name();
            month = month.substring(0, 1) + month.substring(1).toLowerCase();
            year = Integer.parseInt(request.getParameter("year"));
        } else {
            LocalDate currentDate = LocalDate.now();
            month = currentDate.getMonth().minus(1).toString();
            month = month.substring(0, 1) + month.substring(1).toLowerCase();

            year = currentDate.getYear();
        }
        AppointmentService aps = new AppointmentService();
        try {
            List<Appointment> appts = aps.getByMonthYear(month, year);
            List<Appointment> canceledAppts = aps.getByMonthYearCanceled(month, year);
            List<Appointment> completedAppts = aps.getByMonthYearConfirmed(month, year);

            int monthNumber = models.Day.getMonthNumber(month);
            request.setAttribute("monthNumber", monthNumber);
            YearMonth yearMonth = YearMonth.of(year, monthNumber);
            int daysInMonth = yearMonth.lengthOfMonth();

            HashMap<String, Integer> serviceCounts = new HashMap<>(); // Assuming there are 5 service IDs (1-4)

// Iterate through the appointments
            ServiceService ss = new ServiceService();
            for (Appointment appointment : appts) {
                int serviceId = appointment.getServiceid().getServiceid();
                String serviceName = ss.get(serviceId).getServiceName();
                // Increment the count for the corresponding service ID
                serviceCounts.put(serviceName, serviceCounts.getOrDefault(serviceName, 0) + 1);
            }
            request.setAttribute("serviceCounts", serviceCounts);
            
            
           // Create a TreeMap with a custom comparator to order by start time
TreeMap<LocalTime, Integer> sortedTimeCounts = new TreeMap<>(new Comparator<LocalTime>() {
    @Override
    public int compare(LocalTime time1, LocalTime time2) {
        return time1.compareTo(time2);
    }
});

// Iterate through the appointments
for (Appointment appointment : appts) {
    String time = appointment.getTimeid().getTruncatedStartTime();
    LocalTime startTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("h:mm a"));

    // Increment the count for the corresponding start time
    sortedTimeCounts.put(startTime, sortedTimeCounts.getOrDefault(startTime, 0) + 1);
}

// Now you have the start times ordered chronologically

// Set the sortedTimeCounts as a request attribute
request.setAttribute("sortedTimeCounts", sortedTimeCounts);
            // Create arrays for x and y values
            String[] xValuesTotalAppts = new String[daysInMonth]; //really just the x values at the bottom
            int[] yValuesTotalAppts = new int[daysInMonth];
            //int[] xValuesCompleteAppts = new int[daysInMonth];
            int[] yValuesCompleteAppts = new int[daysInMonth];
            //int[] xValuesCanceledAppts = new int[daysInMonth];
            int[] yValuesCanceledAppts = new int[daysInMonth];

            int[] yValuesApptMadeDaily = new int[daysInMonth];
// Initialize x-axis values
            for (int i = 0; i < daysInMonth; i++) {
                xValuesTotalAppts[i] = month + " " + (i + 1); // Start from day 1
            }
            //xValuesCompleteAppts=xValuesCanceledAppts=xValuesTotalAppts;

// Calculate y-axis values
            int appointmentIndex = 0;
            int currentDay = 1;
            int appointmentCount = 0;
            //total appts y values
            for (int i = 0; i < daysInMonth; i++) {
                while (appointmentIndex < appts.size()) {
                    Appointment appointment = appts.get(appointmentIndex);
                    int appointmentDay = appointment.getTimeid().getFulldate().getDaynumber();

                    if (appointmentDay == currentDay) {
                        appointmentCount++;
                        appointmentIndex++;
                    } else {
                        break;
                    }
                }

                yValuesTotalAppts[i] = appointmentCount;
                currentDay++;
            }
            //canceled appts y values
            appointmentIndex = 0;
            currentDay = 1;
            appointmentCount = 0;
            for (int i = 0; i < daysInMonth; i++) {
                while (appointmentIndex < canceledAppts.size()) {
                    Appointment appointment = canceledAppts.get(appointmentIndex);
                    int appointmentDay = appointment.getTimeid().getFulldate().getDaynumber();

                    if (appointmentDay == currentDay) {
                        appointmentCount++;
                        appointmentIndex++;
                    } else {
                        break;
                    }
                }

                yValuesCanceledAppts[i] = appointmentCount;
                currentDay++;
            }
            //complete appts y values
            appointmentIndex = 0;
            currentDay = 1;
            appointmentCount = 0;
            for (int i = 0; i < daysInMonth; i++) {
                while (appointmentIndex < completedAppts.size()) {
                    Appointment appointment = completedAppts.get(appointmentIndex);
                    int appointmentDay = appointment.getTimeid().getFulldate().getDaynumber();

                    if (appointmentDay == currentDay) {
                        appointmentCount++;
                        appointmentIndex++;
                    } else {
                        break;
                    }
                }

                yValuesCompleteAppts[i] = appointmentCount;
                currentDay++;
            }

            //appts made daily y values
            List<Appointment> apptDaily;
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.YEAR, year);
            calendar.set(Calendar.MONTH, models.Day.getMonthNumber(month));
            int totalApptsMade = 0;
// Iterate over the days in the month
            for (int i = 1; i <= daysInMonth; i++) {
                // Set the day of the month
                calendar.set(Calendar.DAY_OF_MONTH, i);
                // Get the date object for the current day
                Date date = calendar.getTime();
                // Get the appointments made on the current date
                apptDaily = aps.getByDate(date);

                // Set the y-axis value for the current day to the number of appointments made
                yValuesApptMadeDaily[i - 1] = apptDaily.size();
                totalApptsMade += apptDaily.size();
            }
            double avgDaily = totalApptsMade / daysInMonth;
// Set the x and y values as request attributes        
            String xValuesTotalJson = new Gson().toJson(xValuesTotalAppts);
            String yValuesTotalJson = new Gson().toJson(yValuesTotalAppts);
            String yValuesCanceledJson = new Gson().toJson(yValuesCanceledAppts);
            String yValuesCompleteJson = new Gson().toJson(yValuesCompleteAppts);
            String yValuesApptMadeDailyJson = new Gson().toJson(yValuesApptMadeDaily);
// Set xValuesJson and yValuesJson as request attributes

            request.setAttribute("xValuesTotalJson", xValuesTotalJson);
            request.setAttribute("yValuesTotalJson", yValuesTotalJson);
            request.setAttribute("yValuesCanceledJson", yValuesCanceledJson);
            request.setAttribute("yValuesCompleteJson", yValuesCompleteJson);
            request.setAttribute("yValuesApptMadeDailyJson", yValuesApptMadeDailyJson);

            request.setAttribute("appts", appts);
            request.setAttribute("canceledAppts", canceledAppts);
            request.setAttribute("completedAppts", completedAppts);

            request.setAttribute("TotalMade", yValuesTotalAppts[yValuesTotalAppts.length - 1]);
            request.setAttribute("TotalCanceled", yValuesCanceledAppts[yValuesCanceledAppts.length - 1]);
            request.setAttribute("TotalGoneThrough", yValuesCompleteAppts[yValuesCompleteAppts.length - 1]);
            request.setAttribute("AvgDaily", avgDaily);

            request.setAttribute("month", month);
            request.setAttribute("year", year);
            getServletContext().getRequestDispatcher("/WEB-INF/en/admingraph.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminGraphsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
