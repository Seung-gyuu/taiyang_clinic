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
import javax.servlet.http.HttpSession;
import models.Appointment;
import models.Service;
import models.User;
import services.AppointmentService;
import services.ServiceService;
import services.UserService;

/**
 *
 * @author rladm
 */
public class Admin1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        }
        AppointmentService as = new AppointmentService();
        UserService us = new UserService();

        try {
            List<Appointment> today_appts = as.getTodayAppt();
            request.setAttribute("today_appts", today_appts);

            if (today_appts.isEmpty()) {
                request.setAttribute("message", "empty");
            }

        } catch (Exception ex) {
            Logger.getLogger(HistoryServlets.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");

        }
        getServletContext().getRequestDispatcher("/WEB-INF/en/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
