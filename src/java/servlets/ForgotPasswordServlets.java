/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dataaccess.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import javax.mail.*;
import javax.naming.NamingException;
import services.PasswordTokensService;
import services.SendEmail;
import services.UserService;

/**
 *
 * @author user
 */
public class ForgotPasswordServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            getServletContext().getRequestDispatcher("/WEB-INF/forgotpassword.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        UserService us = new UserService();
        PasswordTokensService pws = new PasswordTokensService();
        String action = request.getParameter("action");
        if (action.equals("forgot")) {
            try {
                String message = us.verify(us.getByEmail(email));
                request.setAttribute("message", message);
                if (message.equals("Please Validate Account")) {
                    request.setAttribute("message", message);
                    getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                } else if (message.equals("success")) {
                    User user = us.getByEmail(email);
//                    session.setAttribute("loggedUser", user);

                    String templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/forgotPassword.jsp");
                    pws.sendToken(user, templatePath);
                    request.setAttribute("message", "We sent the reset link to your email! Check it ");
                }
                getServletContext().getRequestDispatcher("/WEB-INF/forgotpassword.jsp").forward(request, response);

            } catch (Exception ex) {
                Logger.getLogger(ForgotPasswordServlets.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
