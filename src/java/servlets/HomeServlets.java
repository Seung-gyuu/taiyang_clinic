/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class HomeServlets extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String loginStatus = request.getParameter("login");
        String bookStatus = request.getParameter("book");
        
        //login status -> main
        if (loginStatus != null) {
            response.sendRedirect("login");
        } else if (bookStatus != null) {
            response.sendRedirect("book");
        } else {
            //visitor status -> home
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }


}
