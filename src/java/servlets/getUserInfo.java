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
import javax.servlet.http.HttpSession;
import models.*;
import models.User;
import org.json.JSONObject;
import services.*;

/**
 *
 * @author Hussein
 */
public class getUserInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");

    // Call your service class to retrieve the day name and month name based on the time ID
    UserService us = new UserService();
    User u =null;
        try {
            u = us.get(Integer.parseInt(userId));
            
        } catch (Exception ex) {
            Logger.getLogger(GetTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    // Create a JSON object to hold the day name and month name
    JSONObject jsonResponse = new JSONObject();
    jsonResponse.put("firstName", u.getFirstname());
    jsonResponse.put("lastName", u.getLastname());
    jsonResponse.put("email", u.getEmailAddress());
    jsonResponse.put("userId", u.getUserid());
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

}
