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
import javax.servlet.http.Cookie;
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
        HttpSession session = request.getSession(false);
        boolean fromValidation = Boolean.parseBoolean(request.getParameter("fromValidation"));
        if (fromValidation) {
            session.removeAttribute("loggedUser");
        }

         if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/login");
            }
            else{
                response.sendRedirect("/en/login");
            }
            return;
        }

        String logout = request.getParameter("logout");
    if (logout != null) {
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login");
        return;
    }
        
        
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
    if (language == null) {
        response.sendRedirect("/welcome");
    } else {
        session = request.getSession(true); // Create a new session
        session.setAttribute("language", language);
        if (language.equals("kr")) {
            getServletContext().getRequestDispatcher("/WEB-INF/kr/login.jsp").forward(request, response);
        } else if (language.equals("en")) {
            getServletContext().getRequestDispatcher("/WEB-INF/en/login.jsp").forward(request, response);
        }
    }

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
                String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
                String message = us.login(email, password,language);
                if (message.equals("Login") || message.equals("로그인")) {
                    User u = us.getByEmail(email);
                    int role = u.getRoleid().getRoleid();
                    int status = rs.get(role).getRoleid();
                    session.setAttribute("loggedUser", u);

                    //login as user -> home , login as admin -> admin jsp to manage 
                    if (status == 1) {
                         if(language.equals("en"))
                            response.sendRedirect("/en/home");
                        if(language.equals("kr"))
                        response.sendRedirect("/kr/home");
                        //  getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("/admin");
                    }
                } else {
                    if (message.equals("User has not validated account. Please validate!")|| message.equals("사용자가 계정을 확인하지 않았습니다. 확인해주세요!")) {
                        request.setAttribute("message", message);
                        if(language.equals("en"))
                            getServletContext().getRequestDispatcher("/WEB-INF/en/sendvalidation.jsp").forward(request, response);
                        if(language.equals("kr"))
                            getServletContext().getRequestDispatcher("/WEB-INF/kr/sendvalidation.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", message);
                        if(language.equals("en"))
                            getServletContext().getRequestDispatcher("/WEB-INF/en/login.jsp").forward(request, response);
                        if(language.equals("kr"))
                            getServletContext().getRequestDispatcher("/WEB-INF/kr/login.jsp").forward(request, response);
                    }
                }

            } catch (Exception ex) {
                Logger.getLogger(LoginServlets.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
}
