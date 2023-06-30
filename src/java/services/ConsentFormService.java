/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.ConsentformDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Consentform;

/**
 *
 * @author Hussein
 */
public class ConsentFormService {
    private ConsentformDB cfdb;
    
    public ConsentFormService(){
        this.cfdb=new ConsentformDB();
    }
    public List<Consentform> getByUserid(int userId) throws Exception {
        return cfdb.getByUserid(userId);
    }
    public Consentform get(int formId) throws Exception {
        return cfdb.get(formId);
    }
    public String insert(Consentform cf) throws Exception {
        cfdb.insert(cf);
        return "Form inserted";
    }
    
    public String delete(Consentform cf){
        try{
            cfdb.delete(cf);
            return "Form Deleted.";
            
        } catch (Exception ex) {
            Logger.getLogger(ConsentFormService.class.getName()).log(Level.SEVERE, null, ex);
            return "Error";
        }
    }
}
