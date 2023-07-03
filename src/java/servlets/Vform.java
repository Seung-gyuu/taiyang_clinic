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
            getServletContext().getRequestDispatcher("/WEB-INF/en/vform.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Vform.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        else{
            UserService us = new UserService();
        try {
            List<User> userList = us.getAll();
            request.setAttribute("userList", userList);
            getServletContext().getRequestDispatcher("/WEB-INF/en/vform.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to retrieve users");
            getServletContext().getRequestDispatcher("/WEB-INF/en/vform.jsp").forward(request, response);
        }
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User loggedUser = (User)session.getAttribute("loggedUser");
        int userToDeleteID;
//        if(loggedUser.getRoleid().getRoleid()==1){
//            request.setAttribute("message", "Only authorized users can access this page!");
//            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
//        } 
//uncomment eventually.  Left commented for testing and dont want to keep switching between admin and normal user account
        if(action.equals("deleteform")){
            String form = request.getParameter("form");
            int formId = Integer.parseInt(request.getParameter("formId"));
            if(form.equals("medical")){
                MedicalFormService mfs = new MedicalFormService();
                try {
                    Medicalform mf = mfs.get(formId);
                    userToDeleteID = mf.getUserid().getUserid();
                    mfs.delete(mf);
                    String message = mfs.delete(mf);
                    request.setAttribute("message", message);
                    //getServletContext().getRequestDispatcher("/WEB-INF/vform?userId="+userToDeleteID+".jsp").forward(request, response);
                    response.sendRedirect("/vform?userId="+userToDeleteID+"&message=Form Deleted.");
                } catch (Exception ex) {
                    Logger.getLogger(Vform.class.getName()).log(Level.SEVERE, null, ex);
                    request.setAttribute("message", "Error");
                    getServletContext().getRequestDispatcher("/WEB-INF/en/vform.jsp").forward(request, response);
                }
            }
            else if(form.equals("consent")){
                ConsentFormService cfs = new ConsentFormService();
                try {
                    Consentform cf = cfs.get(formId);
                    userToDeleteID = cf.getUserid().getUserid();
                    String message = cfs.delete(cf);
                    request.setAttribute("message", message);
                    //getServletContext().getRequestDispatcher("/WEB-INF/vform?userId="+userToDeleteID+".jsp").forward(request, response);
                    response.sendRedirect("/vform?userId="+userToDeleteID+"&message=Form Deleted.");
                } catch (Exception ex) {
                    Logger.getLogger(Vform.class.getName()).log(Level.SEVERE, null, ex);
                    request.setAttribute("message", "Error");
                    getServletContext().getRequestDispatcher("/WEB-INF/en/vform.jsp").forward(request, response);
                }
            }
        }
    }


}