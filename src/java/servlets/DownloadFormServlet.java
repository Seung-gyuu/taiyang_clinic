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
import services.*;

/**
 *
 * @author Hussein Servlet that downloads the form. Only get, no posting :P
 */
public class DownloadFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int formId = Integer.parseInt(request.getParameter("formId"));
        int form = Integer.parseInt(request.getParameter("form")); //form 1 = medical form 2 = consent.
        /*************************************************************************************************************//*************************************************************************************************************/
        // base case -- formId = 1 means that its the empty consent and medical form.  Anyone can download so skip the check
        if(formId==1){
            if(form==1){
                MedicalFormService mfs = new MedicalFormService();
                Medicalform mf=null;
                try {
                    mf = mfs.get(formId);
                    response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"TaiYangClinicMedicalForm.pdf\"");
                response.getOutputStream().write(mf.getPdfFile());
                response.getOutputStream().flush();
                return;
                //response.sendRedirect(request.getParameter("referer"));
                } catch (Exception ex) {
                    Logger.getLogger(DownloadFormServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            else if(form==2){
                ConsentFormService cfs = new ConsentFormService();
                Consentform cf=null;
                try {
                    cf = cfs.get(formId);
                    response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"TaiYangClinicConsentForm.pdf\"");
                response.getOutputStream().write(cf.getPdfFile());
                response.getOutputStream().flush();
                return;
                //response.sendRedirect(request.getParameter("referer"));
                } catch (Exception ex) {
                    Logger.getLogger(DownloadFormServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            
        }
        /*************************************************************************************************************//*************************************************************************************************************/
        Medicalform mftest;
        Consentform cftest;
        HttpSession session = request.getSession(false);
        User loggedUser = (User) session.getAttribute("loggedUser");
        if(loggedUser!=null && loggedUser.getRoleid().getRoleid()==1){  //if they are a regular user, they go through this check.  If they are admin, check is skipped
            if (form == 1) {
            MedicalFormService mfs = new MedicalFormService();
            try {
                mftest = mfs.get(formId);
                if(loggedUser.getUserid()!=mftest.getUserid().getUserid()){ //if the logged in person ID isnt matching the form ID they try to download
                    response.sendRedirect("userforms"); 
                }
            } catch (Exception ex) {

            }
        }
        
        else if (form == 2) {
            ConsentFormService cfs = new ConsentFormService();
            try {
                cftest = cfs.get(formId);
                if(loggedUser.getUserid()!=cftest.getUserid().getUserid()){ //if the logged in person ID isnt matching the form ID they try to download
                    response.sendRedirect("userforms"); 
                }
            } catch (Exception ex) {

            }
        }
        }
        //Admins are directly at this line, if the user passes the check, they are also here.
        if(loggedUser==null){
            response.sendRedirect("home");
        }
        if (form == 1) {
            MedicalFormService mfs = new MedicalFormService();
            try {
                Medicalform mf = mfs.get(formId);
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"MedicalForm-" + mf.getUserid().getEmailAddress() + "-FormID-" + mf.getId() + "Added-" + mf.getTimeAdded() + ".pdf\"");
                response.getOutputStream().write(mf.getPdfFile());
                response.getOutputStream().flush();
                response.sendRedirect(request.getParameter("referer"));
            } catch (Exception ex) {
                Logger.getLogger(DownloadFormServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (form == 2) {
            ConsentFormService cfs = new ConsentFormService();
            try {
                Consentform cf = cfs.get(formId);
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"ConsentForm-" + cf.getUserid().getEmailAddress() + "-FormID-" + cf.getId() + "Added-" + cf.getTimeAdded() + ".pdf\"");
                response.getOutputStream().write(cf.getPdfFile());
                response.getOutputStream().flush();
                response.sendRedirect(request.getParameter("referer"));
            } catch (Exception ex) {
                Logger.getLogger(DownloadFormServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
