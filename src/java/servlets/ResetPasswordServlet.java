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
import models.Passwordtokens;
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
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        String token = request.getParameter("token");
        PasswordTokensService ps = new PasswordTokensService();

        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        String message = ps.isTokenValid(token);
        try {
            if (message.equals("reset")) {
                session.setAttribute("user", ps.getByToken(token).getUserid());
                getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
            } else {
                // Handle the case where the token is expired or invalid
                request.setAttribute("message", message);
                getServletContext().getRequestDispatcher("/WEB-INF/noTokens.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
                        user.setPassword(password);
                        us.update(user);
                        session.setAttribute("passwordReset", true);
                        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "passwords do not match");
                        getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

                    }
                } else {
                    request.setAttribute("message", message);
                    getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

                }
            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
