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
import javax.servlet.http.Cookie;
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
                HttpSession session = request.getSession();
        if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/forgotpassword");
            }
            else{
                response.sendRedirect("/en/forgotpassword");
            }
            return;
        }
                String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        
        
        if (language.equals("en")) {
            getServletContext().getRequestDispatcher("/WEB-INF/en/forgotpassword.jsp").forward(request, response);
        }
        if (language.equals("kr")) {
            getServletContext().getRequestDispatcher("/WEB-INF/kr/forgotpassword.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        UserService us = new UserService();
        PasswordTokensService pws = new PasswordTokensService();
        String action = request.getParameter("action");
        if (action.equals("forgot")) {
            try {
                String message = us.verify(us.getByEmail(email), language);
                request.setAttribute("message", message);
                if (message.equals("Please Validate Account") || message.equals("계정을 확인하십시오")) {
                    request.setAttribute("message", message);
                    if (language.equals("en")) {
                        getServletContext().getRequestDispatcher("/WEB-INF/en/sendvalidation.jsp").forward(request, response);
                    }
                    if (language.equals("kr")) {
                        getServletContext().getRequestDispatcher("/WEB-INF/kr/sendvalidation.jsp").forward(request, response);
                    }

                } else if (message.equals("success") || message.equals("성공")) {
                    User user = us.getByEmail(email);
                    String templatePath = "";

                    if (language.equals("en")) {
                        templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/forgotPassword.jsp");
                    }
                    if (language.equals("kr")) {
                        templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/forgotPasswordKR.jsp");
                    }

                    pws.sendToken(user, templatePath, language);
                    if (language.equals("en")) {
                        request.setAttribute("message", "We sent the reset link to your email! Check it ");
                    }
                    if (language.equals("kr")) {
                        request.setAttribute("message", "귀하의 이메일로 재설정 링크를 보내드렸습니다! 확인해 봐");
                    }

                }
                if (language.equals("en")) {
                    getServletContext().getRequestDispatcher("/WEB-INF/en/forgotpassword.jsp").forward(request, response);
                }
                if (language.equals("kr")) {
                    getServletContext().getRequestDispatcher("/WEB-INF/kr/forgotpassword.jsp").forward(request, response);
                }

            } catch (Exception ex) {
                Logger.getLogger(ForgotPasswordServlets.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
