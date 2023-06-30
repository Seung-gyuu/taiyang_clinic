/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import services.*;

/**
 *
 * @author Hussein
 */
public class UserFormsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        
        MedicalFormService mfs = new MedicalFormService();
        ConsentFormService cfs = new ConsentFormService();
        
        try {
            List<Consentform> consentforms = cfs.getByUserid(loggedUser.getUserid());
            List<Medicalform> medicalforms = mfs.getByUserid(loggedUser.getUserid());
            if(consentforms.size()==0 && medicalforms.size()==0){
                request.setAttribute("userForms", null);
                getServletContext().getRequestDispatcher("/WEB-INF/userforms.jsp").forward(request, response);
            }
            else{
                request.setAttribute("userForms", "true");
                request.setAttribute("medicalforms", medicalforms);
                request.setAttribute("consentforms", consentforms);
                getServletContext().getRequestDispatcher("/WEB-INF/userforms.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserFormsServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "Processing Error...");
            getServletContext().getRequestDispatcher("/WEB-INF/userforms.jsp").forward(request, response);
        }
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
