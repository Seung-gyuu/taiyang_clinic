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
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
//              if (user == null) { // if a user is not logged in they shouldnt be able to reach this page
//            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
//        }
//        else{
        getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
//        User user = new User();
        UserService us = new UserService();
        String action = request.getParameter("action");
        if (action.equals("update")) {
            int original = loggedUser.getUserid();
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            
            loggedUser.setEmailAddress(email);
//            user.setFirstname(firstName);
//            user.setLastname(lastName);
            loggedUser.setPhoneNumber(phone);
            loggedUser.setPassword(password);
            String message = "";
            try {

                message = us.update(loggedUser);

                if (message.equals("Update successful!")) {
                    session.setAttribute("updatedEmail", email);
                    session.setAttribute("updatedPhone", phone);
                    session.setAttribute("updatedInfo", true);
                    if (us.getByEmail(email).getIsValid() == 2) {
                        session.setAttribute("message", "To use TaiYang clinic services, You need to validate the email first");
                        getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                    }
                }
                request.setAttribute("message", message);
            } catch (Exception ex) {
                Logger.getLogger(ProfileServlets.class.getName()).log(Level.SEVERE, null, ex);
            }

            getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
    }

}
