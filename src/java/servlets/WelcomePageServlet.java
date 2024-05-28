/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hussein
 */
public class WelcomePageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the language preference cookie, if it exists
        Cookie[] cookies = request.getCookies();
        String language = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("language")) {
                    language = cookie.getValue();
                    break;
                }
            }
        }
        if(language==null){
            getServletContext().getRequestDispatcher("/WEB-INF/welcomepage.jsp").forward(request, response);
        }
        // Redirect the user to the appropriate homepage based on their language preference
        if (language != null && language.equals("kr")) {
            response.sendRedirect("/kr/home");
        } else {
            response.sendRedirect("/en/home");
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String language = request.getParameter("lan");

        // Create a cookie to store the language preference
        Cookie languageCookie = new Cookie("language", language);
        languageCookie.setMaxAge(60 * 60 * 24 * 30); // Set the cookie to expire in 30 days
        response.addCookie(languageCookie);
        HttpSession session = request.getSession();
        session.setAttribute("language", language);

        // Redirect the user to the appropriate homepage based on their language preference
        if (language.equals("kr")) {
            response.sendRedirect("/kr/home");
        } else {
            response.sendRedirect("/en/home");
        }
    }

}
