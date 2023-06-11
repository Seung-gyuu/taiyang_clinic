/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Appointment;
import models.User;
import services.AppointmentService;

/**
 *
 * @author user
 */
public class HomeServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");
        if (user != null) {
            List<Appointment> upcomingAppointments;
            AppointmentService as = new AppointmentService();
            try {
                upcomingAppointments = as.getUserUpcoming(user.getUserid());
                session.setAttribute("upcomingAppointments", upcomingAppointments);
            } catch (Exception ex) {
                Logger.getLogger(HomeServlets.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
