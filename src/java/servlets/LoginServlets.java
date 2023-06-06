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
import services.*;

/**
 *
 * @author user
 */
public class LoginServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String logout = request.getParameter("logout");
        String signIn = request.getParameter("signIn");
        String reset = request.getParameter("reset");
        String home = request.getParameter("home");

        HttpSession session = request.getSession();
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            request.setAttribute("res", "You have successfully logged out");
        } else if (signIn != null) {
            request.setAttribute("message", "signIn");
            getServletContext().getRequestDispatcher("/WEB-INF/signIn.jsp").forward(request, response);
        } else if (reset != null) {
            request.setAttribute("message", "forget");
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        } else if (home != null) {
//            request.setAttribute("message", "forget");
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }else {
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //get the email , password
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //can do authentication
        AccountService as = new AccountService();
        RoleService rs = new RoleService();

        try {
            User user = as.login(email, password);
            if (user == null) {
                request.setAttribute("res", "Failed authentication");
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            } else if (as.get(email).getIsactive() == 2) {
                request.setAttribute("res", "This account has been deactivated");
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            } else {
                int r = as.get(email).getRoleid().getRoleid();
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                //for checking the status
                session.setAttribute("status", rs.get(r).getRoleName());
                int status = rs.get(r).getRoleid();
            //for homepage
                request.setAttribute("message", "main");
                session.setAttribute("firstName", user.getFirstname());
                session.setAttribute("lastName", user.getLastname());
                //login as user -> home , login as admin -> test jsp to manage 
                if(status == 1){ 
                getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
                }else{
                    response.sendRedirect("test");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlets.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
