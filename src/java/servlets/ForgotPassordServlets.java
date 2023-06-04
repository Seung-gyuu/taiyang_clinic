/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.sun.xml.internal.ws.addressing.W3CAddressingConstants;
import dataaccess.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ForgotPassordServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);

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
                String baseURL = "http://localhost:8084/";
                // Generate the reset link
                String resetLink = baseURL + "reset?token=" + ps.createPasswordToken(user);

                HashMap<String, String> tags = new HashMap<>();
                tags.put("name", username);
                tags.put("action-url", resetLink);

                SendEmail.sendMail(email, "Taiyang clinic- Reset password Email", templatePath, tags);
                request.setAttribute("res", "We sent the reset link to your email! Check it ");
            } else {
                request.setAttribute("res", "We can't find your email ");
            }

            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ForgotPassordServlets.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
