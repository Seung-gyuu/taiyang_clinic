/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
          try {
            User user = as.verify(email);
            if (user != null) {  
                request.setAttribute("res", "We send the link");
                request.setAttribute("res", "Failed authentication");
                // sending reset email
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);

			String to = email;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("your_email", "your_app_password");// Put your email
																									// id and

                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }else{
               
            }
          } catch (Exception ex) {
            Logger.getLogger(ForgotPassordServlets.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

}
