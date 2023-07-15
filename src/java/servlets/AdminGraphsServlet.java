/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
        String month = "July";
        int year = 2023;
        AppointmentService aps = new AppointmentService();
        try {
            List<Appointment> appts = aps.getByMonthYear(month, year);
            List<Appointment> canceledAppts = aps.getByMonthYearCanceled(month, year);
            List<Appointment> completedAppts = aps.getByMonthYearConfirmed(month, year);

            int daysInMonth = 31; // Calculate the number of days in the month
                    // Create arrays for x and y values
            int[] xValuesTotalAppts = new int[daysInMonth]; //really just the x values at the bottom
            int[] yValuesTotalAppts = new int[daysInMonth];
            //int[] xValuesCompleteAppts = new int[daysInMonth];
            int[] yValuesCompleteAppts = new int[daysInMonth];
            //int[] xValuesCanceledAppts = new int[daysInMonth];
            int[] yValuesCanceledAppts = new int[daysInMonth];
// Initialize x-axis values
            for (int i = 0; i < daysInMonth; i++) {
                xValuesTotalAppts[i] = i + 1; // Start from day 1
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

// Set the x and y values as request attributes        
            String xValuesTotalJson = new Gson().toJson(xValuesTotalAppts);
            String yValuesTotalJson = new Gson().toJson(yValuesTotalAppts);
            
            //String xValuesCanceledJson = new Gson().toJson(xValuesCanceledAppts);
            String yValuesCanceledJson = new Gson().toJson(yValuesCanceledAppts);
            
            //String xValuesCompleteJson = new Gson().toJson(xValuesCompleteAppts);
            String yValuesCompleteJson = new Gson().toJson(yValuesCompleteAppts);
// Set xValuesJson and yValuesJson as request attributes
            request.setAttribute("xValuesTotalJson", xValuesTotalJson);
            request.setAttribute("yValuesTotalJson", yValuesTotalJson);
            
            //request.setAttribute("xValuesCanceledJson", xValuesCanceledJson);
            request.setAttribute("yValuesCanceledJson", yValuesCanceledJson);
            
            //request.setAttribute("xValuesCompleteJson", xValuesCompleteJson);
            request.setAttribute("yValuesCompleteJson", yValuesCompleteJson);
            
            
            
            request.setAttribute("appts", appts);
            request.setAttribute("canceledAppts", canceledAppts);
            request.setAttribute("completedAppts", completedAppts);
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
