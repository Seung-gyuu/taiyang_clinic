/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

/**
 *
 * @author third
 */
public class ProfileServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = new User();
        UserService us = new UserService();
        String action = request.getParameter("action");
        if (action.equals("update")) {
            //need to validate again? can pk change? what about changing their info except for their email?
            String firstName = request.getParameter("Firstname");
            String lastName =request.getParameter("Lastname");                 
            String email = request.getParameter("email"); 
                  
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");           
            user.setEmailAddress(email);
            user.setFirstname(firstName);
            user.setLastname(lastName);
            user.setPhoneNumber(phone);
            user.setPassword(password);
            String message = "";
            try {
                message = us.update(user);
                
                if (message.equals("Update successful!")) {                  
                    session.setAttribute("updatedInfo", true);
                } 
                request.setAttribute("message", message);
            } catch (Exception ex) {
                Logger.getLogger(ProfileServlets.class.getName()).log(Level.SEVERE, null, ex);
            } 
           
            getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
    }

}
