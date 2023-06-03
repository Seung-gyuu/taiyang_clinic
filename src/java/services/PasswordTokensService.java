/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.PasswordTokensDB;
import java.util.Date;
import java.util.List;
import models.Passwordtokens;

/**
 *
 * @author Hussein
 */
public class PasswordTokensService {
    
    private PasswordTokensDB pdb;
    
    public PasswordTokensService(){
        this.pdb=new PasswordTokensDB();
    }
    public Passwordtokens getByToken(String token) throws Exception {
        return pdb.getByToken(token);
    }
    public Passwordtokens get(int tokenId) throws Exception {
        return pdb.get(tokenId);
    }
    public List<Passwordtokens> getExpired() throws Exception {
        return pdb.getExpired();
    }
    public String delete(Passwordtokens passwordToken) throws Exception {
        Date now = new Date();
        Date expiryDate = passwordToken.getExpiryDateTime();
        if(expiryDate.after(now))
            return "Token hasn't expired yet!";
        pdb.delete(passwordToken);
        return "Token Deleted";
    }
    public String insert(Passwordtokens pwt) throws Exception {
        Passwordtokens token = pdb.getByToken(pwt.getToken());
        if(token!=null){
            return "Token exists already! That shouldnt be possible...";
        }
        pdb.insert(pwt);
        return "Token inserted";
    }
    
}
