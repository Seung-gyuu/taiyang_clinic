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
import services.*;
import models.*;
import utilities.*;

public class Validate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        ValidateTokensService vts = new ValidateTokensService();
        try {
            String message = vts.validate(token);
            request.setAttribute("message", message);
            if (message.equals("No token found") || message.equals("Token Expired! Please send a new one!")) {
                request.setAttribute("resend", "resend");
            }
         getServletContext().getRequestDispatcher("/WEB-INF/validate.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Validate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
