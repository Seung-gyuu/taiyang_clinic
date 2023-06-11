/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dataaccess.UserDB;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.PasswordTokensService;
import services.UserService;

/**
 *
 * @author user
 */
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        PasswordTokensService ps = new PasswordTokensService();
        HttpSession session = request.getSession();

        try {
            User user = ps.getByToken(token).getUserid();
// Check if the token is valid and not expired
            String status = ps.isTokenValid(token);
            session.setAttribute("status", status);
            if (status.equals("reset")) {
                session.setAttribute("user", user);
            } else {
                // Token is invalid or expired, display an error message
                request.setAttribute("message", "The reset link is invalid or expired.");
            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        String action = request.getParameter("action");
        UserService us = new UserService();
        try {
            if (action.equals("reset")) {
                String message = us.isValidPassword(password);
                if (message.equals("success")) {
                    if (password.equals(confirm)) {
                        us.updatePW(user, password);
                        session.setAttribute("passwordReset", true);
                        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "passwords do not match");
                    }
                }else{
                       request.setAttribute("message", message);
                }            
                getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
