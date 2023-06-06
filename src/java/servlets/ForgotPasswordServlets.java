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
import services.AccountService;
import javax.mail.*;
import javax.naming.NamingException;
import services.PasswordTokensService;
import services.SendEmail;

/**
 *
 * @author user
 */
public class ForgotPasswordServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        PasswordTokensService ps = new PasswordTokensService();
        HttpSession session = request.getSession();

        String username = "";
        try {
            username = ps.getByToken(token).getUserid().getFirstname();
        } catch (Exception ex) {
            Logger.getLogger(ForgotPasswordServlets.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Check if the token is valid and not expired
        if (ps.isTokenValid(token)) {
            // Store the token in the session for further processing   
            session.setAttribute("resetToken", token);
            session.setAttribute("firstname", username);
            request.setAttribute("message", "reset");
            // Forward the request to the reset.jsp page
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        } else {
            // Token is invalid or expired, display an error message
            request.setAttribute("res", "The reset link is invalid or expired.");
            request.setAttribute("message", "invalid");
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get the email 
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        AccountService as = new AccountService();
        PasswordTokensService ps = new PasswordTokensService();
        try {
            User user = as.verify(email);
            if (user != null) {
                String username = as.verify(email).getFirstname();
                String templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/forgotPassword.jsp");

                String token = ps.generateToken();
                Date expiryDateTime = ps.calculateExpiryDateTime();

                // Generate the reset link 
                String resetLink = "reset?token=" + token;

                ps.insert(user, token, expiryDateTime);

                HashMap<String, String> tags = new HashMap<>();
                tags.put("name", username);
                tags.put("action_url", resetLink);

                SendEmail.sendMail(email, "Taiyang clinic- Reset password Email", templatePath, tags);
                request.setAttribute("res", "We sent the reset link to your email! Check it ");
            } else {
                request.setAttribute("res", "We can't find your email ");               
            }
            request.setAttribute("message", "forget");
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(ForgotPasswordServlets.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
