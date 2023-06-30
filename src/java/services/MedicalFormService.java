/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.MedicalformDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Consentform;
import models.Medicalform;

/**
 *
 * @author Hussein
 */
public class MedicalFormService {
    private MedicalformDB mfdb;
    
    public MedicalFormService(){
        this.mfdb=new MedicalformDB();
    }
    public List<Medicalform> getByUserid(int userId) throws Exception {
        return mfdb.getByUserid(userId);
    }
    public Medicalform get(int formId) throws Exception {
        return mfdb.get(formId);
    }
    public String insert(Medicalform md) throws Exception {
        mfdb.insert(md);
        return "Form inserted";
    }
    
    public String delete(Medicalform md){
        try{
            mfdb.delete(md);
            return "Form Deleted.";
            
        } catch (Exception ex) {
            Logger.getLogger(ConsentFormService.class.getName()).log(Level.SEVERE, null, ex);
            return "Error";
        }
    }
    
}
