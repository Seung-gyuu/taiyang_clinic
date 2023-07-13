/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import org.json.JSONObject;
import services.*;

/**
 *
 * @author 00cap
 */
public class GetAppointmentDetailsServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String timeId = request.getParameter("timeId");

    // Call your service class to retrieve the day name and month name based on the time ID
    AppointmentService as = new AppointmentService();
    Appointment a =null;
        try {
            a = as.getByTimeId(Integer.parseInt(timeId));
            
        } catch (Exception ex) {
            Logger.getLogger(GetTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    // Create a JSON object to hold the day name and month name
    JSONObject jsonResponse = new JSONObject();
    jsonResponse.put("firstName", a.getUserid().getFirstname());
    jsonResponse.put("lastName", a.getUserid().getLastname());
    jsonResponse.put("serviceName", a.getServiceid().getServiceName());
    jsonResponse.put("apptDesc", a.getDescription());
    jsonResponse.put("userId", a.getUserid().getUserid());
    // Set the content type of the response to application/json
    response.setContentType("application/json");

    // Write the JSON response to the response body
    PrintWriter out = response.getWriter();
    out.print(jsonResponse.toString());
    out.flush();
        
        
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
