/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.*;
/**
 *
 * @author Hussein
 */
public class GetAppointmentListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int monthNumber=Integer.parseInt(request.getParameter("monthNumber"))+1;//add 1 because localdate.of() counts from 1... jan=1 while others start from 0
        int year = Integer.parseInt(request.getParameter("year"));
        String daynumber = request.getParameter("dayNumber").substring(request.getParameter("dayNumber").indexOf(' ')+1);
        int dayNumber = Integer.parseInt(daynumber);
        AppointmentService as = new AppointmentService();
        LocalDate date = LocalDate.of(year, monthNumber, dayNumber);
        Date d = java.sql.Date.valueOf(date);
        try {
            List<Appointment> appts = as.getByDate(d);
            //Gson gson = new Gson();
        //String appointmentListJson = gson.toJson(appts);
        String appointmentListJson = toJson(appts);
        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Write the JSON data to the response
        PrintWriter out = response.getWriter();
        out.print(appointmentListJson);
        out.flush();
        } catch (Exception ex) {
            Logger.getLogger(GetAppointmentListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private String toJson(List<Appointment> appts) {
        String s = "[";
        for(Appointment a: appts){
            s+="{\n"
                    + "\"appointmentID\":"+a.getAppointmentid()+",\n"
                    + "\"Status\":\""+a.getStatus()+"\",\n"
                    + "\"FirstName\":\""+a.getUserid().getFirstname()+"\",\n"
                    + "\"LastName\":\""+a.getUserid().getLastname()+"\",\n"
                    + "\"ServiceName\":\""+a.getServiceid().getServiceName()+"\",\n"
                    + "\"Description\":"+getDesc(a)+"\n"
                    + "},\n";
        }
        s=s.substring(0,s.length()-2); //remove the last comma
        s+="]";
        return s;
    }

    private String getDesc(Appointment a) {
        if(a.getDescription()==null||a.getDescription()==""||a.getDescription().equals("Any description here"))
            return "\"No Description\"";
        else
            return "\""+a.getDescription()+"\"";
    }

}
