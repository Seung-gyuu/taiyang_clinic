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
public class Service5 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        HttpSession session = request.getSession(false);
        if (request.getParameter("translate") != null) {
            String language = request.getParameter("translate");
            //utility.setcookie(lan)
            utilities.GetLanguageCookie.setLanguageCookie(request,response,language);
            if(language.equals("kr")){
                response.sendRedirect("/kr/service5");
            }
            else{
                response.sendRedirect("/en/service5");
            }
            return;
        }
            
        String logout = request.getParameter("logout");
    if (logout != null) {
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("service5");
        return;
    }
        
        
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
    if (language == null) {
        response.sendRedirect("/welcome");
    } else {
        session = request.getSession(true); // Create a new session
        session.setAttribute("language", language);
        if (language.equals("kr")) {
            getServletContext().getRequestDispatcher("/WEB-INF/kr/s5_herbal.jsp").forward(request, response);
        } else if (language.equals("en")) {
            getServletContext().getRequestDispatcher("/WEB-INF/en/s5_herbal.jsp").forward(request, response);
        }
    }
        
        
            //getServletContext().getRequestDispatcher("/WEB-INF/s5_herbal.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   

}