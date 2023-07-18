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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Appointment;
import models.Service;
import models.User;
import services.AppointmentService;
import services.ServiceService;

/**
 *
 * @author third
 */
public class HistoryServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("loggedUser");
        int userid = 0;
        if (user != null) {
            userid = user.getUserid();
        }

         if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/history");
            }
            else{
                response.sendRedirect("/en/history");
            }
            
            return;
        }

        String logout = request.getParameter("logout");
        if (logout != null) {
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("register");
            return;
        }
        AppointmentService as = new AppointmentService();
        ServiceService ss = new ServiceService();

        try {
            List<Appointment> upcomings = as.getUserUpcoming(userid);
            List<Appointment> pasts = as.getUserPassed(userid);
            List<Service> services = ss.getAll();

            request.setAttribute("upcomings", upcomings);
            request.setAttribute("pasts", pasts);
            request.setAttribute("services", services);
            if (upcomings.isEmpty()) {
                request.setAttribute("upcoming_message", "empty");
            }
            if (pasts.isEmpty()) {
                request.setAttribute("past_message", "empty");
            }

        } catch (Exception ex) {
            Logger.getLogger(HistoryServlets.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");

        }

        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        if (language == null) {
            response.sendRedirect("/welcome");
        } else {
            session = request.getSession(true); // Create a new session
            session.setAttribute("language", language);
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/history.jsp").forward(request, response);
            } else if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/history.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        HttpSession session = request.getSession(false);
        AppointmentService as = new AppointmentService();
        ServiceService ss = new ServiceService();

        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            String appointmentId = request.getParameter("appointmentid");
            if (appointmentId != null && !appointmentId.isEmpty()) {
                try {
                    int id = Integer.parseInt(appointmentId);
                    String templatePath = "";
                    if (language.equals("kr")) {
                        templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/appointmentCancellation.jsp");
                    } else if (language.equals("en")) {
                        templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/appointmentCancellationKR.jsp");
                    }

                    String message = as.delete(as.get(id), templatePath);
                    if (message.equals("Appointment Deleted!")) {
                        session.setAttribute("deleteAppt", true);
                        List<Appointment> upcomingAppointments = as.getUserUpcoming(as.get(id).getUserid().getUserid());
                        session.setAttribute("upcomingAppointments", upcomingAppointments);
                        response.sendRedirect("/history");
                        return;
                    } else {
                        session.setAttribute("failCancelAppt", true);
                        response.sendRedirect("/history");
                        return;

                    }
                } catch (Exception ex) {
                    Logger.getLogger(HistoryServlets.class.getName()).log(Level.SEVERE, null, ex);
                    request.setAttribute("message", "error");
                }
            } else {
                // Handle invalid appointmentid parameter
                request.setAttribute("message", "invalid");
            }
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/history.jsp").forward(request, response);
            } else if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/history.jsp").forward(request, response);
            }

        }

    }
}
