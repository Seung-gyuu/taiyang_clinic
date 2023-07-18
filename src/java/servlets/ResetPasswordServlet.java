/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dataaccess.UserDB;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Passwordtokens;
import models.User;
import services.PasswordTokensService;
import services.UserService;

/**
 *
 * @author user
 */
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        String logout = request.getParameter("logout");
        if(request.getParameter("translate")!=null){
            response.sendRedirect("home");
            return;
        }
            
        
        String token = request.getParameter("token");
        PasswordTokensService ps = new PasswordTokensService();

        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            response.sendRedirect("home");
        }
        String message = ps.isTokenValid(token, language);
        try {
            if (message.equals("reset") || message.equals("초기화")) {
                session.setAttribute("user", ps.getByToken(token).getUserid());
                
                if (language.equals("en")) 
                    getServletContext().getRequestDispatcher("/WEB-INF/en/reset.jsp").forward(request, response);
                if (language.equals("kr")) 
                    getServletContext().getRequestDispatcher("/WEB-INF/kr/reset.jsp").forward(request, response);

            } else {
                // Handle the case where the token is expired or invalid
                request.setAttribute("message", message);
                if (language.equals("en")) 
                    getServletContext().getRequestDispatcher("/WEB-INF/en/noTokens.jsp").forward(request, response);
                if (language.equals("kr")) 
                    getServletContext().getRequestDispatcher("/WEB-INF/kr/noTokens.jsp").forward(request, response);
                
            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            if (language.equals("en")){
                request.setAttribute("message", "Error");
                getServletContext().getRequestDispatcher("/WEB-INF/en/login.jsp").forward(request, response);
            }
            if (language.equals("kr")){
                request.setAttribute("message", "오류");
                getServletContext().getRequestDispatcher("/WEB-INF/kr/login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        User user = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        String action = request.getParameter("action");
        UserService us = new UserService();
        try {
            if (action.equals("reset")) {
                String message = us.isValidPassword(password, language);
                if (message.equals("success") || message.equals("성공")) {
                    if (password.equals(confirm)) {
                        user.setPassword(password);
                        us.update(user, language);
                        session.setAttribute("passwordReset", true);
                        if(language.equals("en")){
                            request.setAttribute("message", "Password Updated.");
                            getServletContext().getRequestDispatcher("/WEB-INF/en/login.jsp").forward(request, response);
                        }
                             
                        if(language.equals("kr")){
                            request.setAttribute("message", "비밀번호가 업데이트되었습니다." );
                            getServletContext().getRequestDispatcher("/WEB-INF/kr/login.jsp").forward(request, response);
                        }
                             
                    } else {
                        if(language.equals("en")){
                            request.setAttribute("message", "passwords do not match");
                            getServletContext().getRequestDispatcher("/WEB-INF/en/reset.jsp").forward(request, response);
                        }
                             
                        if(language.equals("kr")){
                            request.setAttribute("message", "비밀번호가 일치하지 않습니다");
                            getServletContext().getRequestDispatcher("/WEB-INF/kr/reset.jsp").forward(request, response);
                        }
                        

                    }
                } else {
                    request.setAttribute("message", message);
                    if(language.equals("en"))
                             getServletContext().getRequestDispatcher("/WEB-INF/en/reset.jsp").forward(request, response);
                        if(language.equals("kr"))
                             getServletContext().getRequestDispatcher("/WEB-INF/kr/reset.jsp").forward(request, response);

                }
            }
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
