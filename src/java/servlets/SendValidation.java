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
import services.*;
import models.*;
import utilities.*;

/**
 *
 * @author Hussein
 */
public class SendValidation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        if(user==null)
            getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
        else
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action.equals("send verification")){
            String email = request.getParameter("email");
            UserService us = new UserService();
            try {
                User u = us.getByEmail(email);
                if(u!=null){
                    ValidateTokensService vts = new ValidateTokensService();
                    String message = vts.sendToken(u);
                    request.setAttribute("message", message);
                    getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                }
                if(u==null){
                    request.setAttribute("message", "Can't find an account with that email! Please register instead!");
                    getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                Logger.getLogger(SendValidation.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}