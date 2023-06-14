
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Day;
import services.DayService;

/**
 *
 * @author third
 */
public class BookServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
                String logout = request.getParameter("logout");
         if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        } 
                 DayService ds = new DayService();
        List<Day> days= ds.getCurrentWeek4Months();
        List<Day> unavailableDays;
        List<Day> availableDays;
        LocalDate currentDate=LocalDate.now();
        DayOfWeek currentDay = currentDate.getDayOfWeek();
        int currentDayNumber = currentDay.getValue();
        if(currentDayNumber==7)
            currentDayNumber=0;
        unavailableDays=days.subList(0, currentDayNumber);
        availableDays=days.subList(currentDayNumber,days.size());
        request.setAttribute("unavailableDays", unavailableDays);
        request.setAttribute("availableDays", availableDays);

 

        getServletContext().getRequestDispatcher("/WEB-INF/booktest.jsp").forward(request, response);
    }
//        getServletContext().getRequestDispatcher("/WEB-INF/book.jsp").forward(request, response);
    

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
