/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.ValidateTokensDB;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import models.Validatetokens;

/**
 *
 * @author Hussein
 */
public class ValidateTokensService {
    private ValidateTokensDB vdb;
    
    public ValidateTokensService(){
        this.vdb=new ValidateTokensDB();
    }
    public Validatetokens getByToken(String token) throws Exception {
        return vdb.getByToken(token);
    }
    public Validatetokens get(int tokenId) throws Exception {
        return vdb.get(tokenId);
    }
    public List<Validatetokens> getExpired() throws Exception {
        return vdb.getExpired();
    }
    public String delete(Validatetokens validatetoken) throws Exception {
        Date now = new Date();
        Date expiryDate = validatetoken.getExpiryDateTime();
        if(expiryDate.after(now))
            return "Token hasn't expired yet!";
        vdb.delete(validatetoken);
        return "Token Deleted";
    }
    public String insert(Validatetokens vdt) throws Exception {
        Validatetokens token = vdb.getByToken(vdt.getValidatetoken());
        if(token!=null){
            return "Token exists already! That shouldnt be possible...";
        }
        vdb.insert(vdt);
        return "Token inserted";
    }
}
