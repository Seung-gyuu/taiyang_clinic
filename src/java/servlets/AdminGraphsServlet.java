/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
            List<Appointment> canceledAppts = aps.getByMonthYear(month, year);
            List<Appointment> completedAppts = aps.getByMonthYear(month, year);
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
