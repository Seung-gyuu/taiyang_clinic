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
import services.UserService;

/**
 *
 * @author third
 */
public class ProfileServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("loggedUser");

         if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/profile");
            }
            else{
                response.sendRedirect("/en/profile");
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
                getServletContext().getRequestDispatcher("/WEB-INF/kr/profile.jsp").forward(request, response);
            } else if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/profile.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);

        User loggedUser = (User) session.getAttribute("loggedUser");
        UserService us = new UserService();
        String action = request.getParameter("action");
        if (action.equals("update")) {
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String validateMsg = us.updateValidate(email, phone, language, loggedUser);
            String message = "";

            if (validateMsg.equals("Valid")) {
                loggedUser.setEmailAddress(email);
                loggedUser.setPhoneNumber(phone);
                loggedUser.setPassword(password);

                try {
                    message = us.update(loggedUser, language);
                    if (message.equals("Update successful!") || message.equals("업데이트 성공!")) {
                        if (us.getByEmail(email).getIsValid() == 2) {
                            if (language.equals("kr")) {
                                request.setAttribute("message", "태양의원 서비스를 이용하기 위해서는 먼저 이메일 인증이 필요합니다.");
                                getServletContext().getRequestDispatcher("/WEB-INF/kr/sendvalidation.jsp").forward(request, response);
                                return;
                            } else if (language.equals("en")) {
                                request.setAttribute("message", "To use TaiYang clinic services, You need to validate the email first");
                                getServletContext().getRequestDispatcher("/WEB-INF/en/sendvalidation.jsp").forward(request, response);
                                return;
                            }
                        } else {
                            // Retrieve the updated user information from the database
                            User updatedUser = us.getByEmail(email);

                            // Update the loggedUser object with the new values
                            loggedUser.setEmailAddress(updatedUser.getEmailAddress());
                            loggedUser.setPhoneNumber(updatedUser.getPhoneNumber());

//                            request.setAttribute("updatedEmail", loggedUser.getEmailAddress());
//                            request.setAttribute("updatedPhone", loggedUser.getPhoneNumber());
                            request.setAttribute("updatedInfo", true);
                        }
                    }
                    request.setAttribute("message", message);
                } catch (Exception ex) {
                    Logger.getLogger(ProfileServlets.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                request.setAttribute("message", validateMsg);
            }
        }

        if (language.equals("en")) {
            getServletContext().getRequestDispatcher("/WEB-INF/en/profile.jsp").forward(request, response);
        }

        if (language.equals("kr")) {
            getServletContext().getRequestDispatcher("/WEB-INF/kr/profile.jsp").forward(request, response);
        }

    }
}
