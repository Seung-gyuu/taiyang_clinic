/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import services.*;
import utilities.*;

/**
 *
 * @author Hussein
 */
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User u = (User) session.getAttribute("loggedUser");

         if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/register");
            }
            else{
                response.sendRedirect("/en/register");
            }
            return;
        }

        String logout = request.getParameter("logout");
        if (logout != null) {
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("home");
            return;
        }
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        if (language == null) {
            response.sendRedirect("/welcome");
        } else {
            session = request.getSession(true); // Create a new session
            session.setAttribute("language", language);
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/register.jsp").forward(request, response);
            } else if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/register.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        if (action.equals("register")) {
            String firstname = request.getParameter("first name");
            String lastname = request.getParameter("last name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            User u = new User();
            u.setFirstname(firstname);
            u.setLastname(lastname);
            u.setEmailAddress(email);
            u.setPhoneNumber(phone);
            u.setPassword(password);
            RoleService rs = new RoleService();
            u.setRoleid(rs.get(1));
            UserService us = new UserService();
            String message = "";
            try {
                message = us.insert(u, language);
            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (!message.equals("Account created!") && !message.equals("계정이 생성되었습니다!")) {
                request.setAttribute("firstname", firstname);
                request.setAttribute("lastname", lastname);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("message", message);
                if (language.equals("en")) {
                    getServletContext().getRequestDispatcher("/WEB-INF/en/register.jsp").forward(request, response);
                }
                if (language.equals("kr")) {
                    getServletContext().getRequestDispatcher("/WEB-INF/kr/register.jsp").forward(request, response);
                }

                return;
            }

            try {
                u = us.getByEmail(email);
                if (u.getIsValid() == 2) {
                    String templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/sendValidation.jsp");
                    if (language.equals("en")) {
                        request.setAttribute("validation", "We have sent a validation link to your email.  Please click on it to validate your account!  "
                                + "Please allow some time for it to arrive or check your spam!");
                        
                    }
                    if (language.equals("kr")) {
                        request.setAttribute("validation", "귀하의 이메일로 확인 링크를 보내드렸습니다. 계정을 확인하려면 클릭하세요!"
                                + "도착하거나 스팸을 확인하는 데 약간의 시간을 허용하십시오!");
                    }

                    ValidateTokensService vts = new ValidateTokensService();
                    vts.sendToken(u, templatePath, language);
                }
            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/register.jsp").forward(request, response);
            }
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/register.jsp").forward(request, response);
            }

        }
    }

}
