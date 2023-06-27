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
import services.*;
import models.*;
/**
 *
 * @author Hussein
 */
public class Vform extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId=0;
        if(request.getParameter("userId")!=null){
            userId = Integer.parseInt(request.getParameter("userId"));
        
        UserService us = new UserService();
        try {
            User u = us.get(userId);
            MedicalFormService mfs = new MedicalFormService();
            ConsentFormService cfs = new ConsentFormService();
            List<Medicalform> medicalforms = mfs.getByUserid(u.getUserid());
            List<Consentform> consentforms = cfs.getByUserid(u.getUserid());
            request.setAttribute("medicalforms", medicalforms);
            request.setAttribute("consentforms", consentforms);
            request.setAttribute("userForm", u);
            getServletContext().getRequestDispatcher("/WEB-INF/vform.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Vform.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        else{
            UserService us = new UserService();
        try {
            List<User> userList = us.getAll();
            request.setAttribute("userList", userList);
            getServletContext().getRequestDispatcher("/WEB-INF/vform.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to retrieve users");
            getServletContext().getRequestDispatcher("/WEB-INF/vform.jsp").forward(request, response);
        }
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}