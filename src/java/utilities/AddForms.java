/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;
import services.*;
import java.util.Date;

/**
 *
 * @author Hussein
 * Automatically adds the default forms to the database so any user can download it
 */
public class AddForms {

    public AddForms(String resFolderPath) {
        //first check if formID of 1 exist in either table
        MedicalFormService mfs = new MedicalFormService();
        ConsentFormService cfs = new ConsentFormService();
        try {
            if (mfs.get(1) != null && cfs.get(1) != null) {
                System.out.println("Forms Exist Already");
                return;
            }

        } catch (Exception ex) {
            System.out.println("Error Adding Forms");
            Logger.getLogger(AddForms.class.getName()).log(Level.SEVERE, null, ex);
        }

        UserService us = new UserService();
        try {
            if(mfs.get(1)!=null){
                System.out.println("Medical Form Exists Already");
            }
            else{
            User u = us.get(1);
            Medicalform mf = new Medicalform();
            mf.setUserid(u);
            mf.setTimeAdded(new Date());
            Path path = Paths.get(resFolderPath, "medical.pdf");
            //InputStream fileContent = AddForms.class.getClassLoader().getResourceAsStream(path.toString());
            InputStream fileContent = new FileInputStream(path.toFile());

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileBytes = outputStream.toByteArray();
            mf.setPdfFile(fileBytes);
            mfs.insert(mf);
            System.out.println("Added Medical Form");
            outputStream.close();
            fileContent.close();
            }
        } catch (Exception ex) {
            System.out.println("Error Adding Medical Form");
            Logger.getLogger(AddForms.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if(cfs.get(1)!=null){
                System.out.println("Consent Form Exists Already");
            }
            else{
            User u = us.get(1);
            Consentform cf = new Consentform();
            cf.setUserid(u);
            cf.setTimeAdded(new Date());
            Path path = Paths.get(resFolderPath, "consent.pdf");
            //InputStream fileContent = AddForms.class.getClassLoader().getResourceAsStream(path.toString());
            InputStream fileContent = new FileInputStream(path.toFile());
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileBytes = outputStream.toByteArray();
            cf.setPdfFile(fileBytes);
            cfs.insert(cf);
            System.out.println("Added Consent Form");
            outputStream.close();
            fileContent.close();
            }
        } catch (Exception ex) {
            System.out.println("Error Adding Consent Form");
            Logger.getLogger(AddForms.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
