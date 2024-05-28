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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Appointment;
import models.User;
import utilities.*;
import services.AppointmentService;

/**
 *
 * @author Hussein
 */
public class HomeServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true); 
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("loggedUser");
        }

        if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/home");
            }
            else{
                response.sendRedirect("/en/home");
            }
            
            return;
        }

        boolean fromValidation = Boolean.parseBoolean(request.getParameter("fromValidation"));

        if (fromValidation && session != null) {
            session.removeAttribute("loggedUser");
        }

        String logout = request.getParameter("logout");
        if (logout != null) {
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("home");
            return;
        }

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

        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        if (language == null) {
            session = request.getSession(false); // Create a new session
            session.setAttribute("language", language);
            // Set the cookie to new language
            Cookie languageCookie = new Cookie("language", language);
            languageCookie.setMaxAge(60 * 60 * 24 * 30); // Set the cookie to expire in 30 days
            languageCookie.setPath("/");
            response.addCookie(languageCookie);
            response.sendRedirect("/en/home");
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        } else {
            session = request.getSession(false); // Create a new session
            session.setAttribute("language", language);
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/home.jsp").forward(request, response);
            } else{
                getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
