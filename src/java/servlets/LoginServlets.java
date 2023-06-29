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
import services.*;

/**
 *
 * @author user
 */
public class LoginServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();     
//        User u = (User) session.getAttribute("loggedUser");
boolean fromValidation = Boolean.parseBoolean(request.getParameter("fromValidation"));
   // Remove the attribute if coming from the validate.jsp page
                 if (fromValidation) {
                    session.removeAttribute("loggedUser");
                }
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
//        if (u == null) { // if a user is logged in they shouldnt be able to reach this page
//            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
//        } 
//        else {
//            //getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
//            response.sendRedirect("/home");
//        }
        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action.equals("login")) {
            //get the email , password
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //can do authentication
            UserService us = new UserService();
            RoleService rs = new RoleService();
            request.setAttribute("email", email);
            try {
                String message = us.login(email, password);
                if (message.equals("Login")) {
                    User u = us.getByEmail(email);
                    int role = u.getRoleid().getRoleid();
                    int status = rs.get(role).getRoleid();
                    session.setAttribute("loggedUser", u);

                    //login as user -> home , login as admin -> admin jsp to manage 
                    if (status == 1) {
                        response.sendRedirect("/home");
                        //  getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("/admin");
                    }
                } else {
                    if (message.equals("User has not validated account. Please validate!")) {
                        request.setAttribute("message", message);
                        getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                    }else{
                        request.setAttribute("message", message);                   
                       getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                    }
                 }


            } catch (Exception ex) {
                Logger.getLogger(LoginServlets.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
}
