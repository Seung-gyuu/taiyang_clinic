/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Availabletime;
import models.Role;
import models.User;
import services.AvailableTimeService;
import services.UserService;
import utilities.HashAndSalt;

/**
 *
 * @author Hussein
 */
public class TestAddAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        AvailableTimeService as = new AvailableTimeService();
        System.out.print("BEFORE TRY CATCH");
        try {
            List<Availabletime> times = as.findAllPassed();
            SimpleDateFormat timeFormat = new SimpleDateFormat("hh a");
            for (Availabletime t : times) {
                String startTimeStr = timeFormat.format(t.getStartTime());
                String endTimeStr = timeFormat.format(t.getEndTime());
                System.out.println("Start time: " + startTimeStr + " End time: " + endTimeStr);
            }
            System.out.print("Out of block");
        } catch (Exception ex) {
            Logger.getLogger(TestAddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/t.jsp").forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
