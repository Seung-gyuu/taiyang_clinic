/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.PasswordTokensDB;
import dataaccess.UserDB;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Passwordtokens;
import models.User;
import utilities.HashAndSalt;

/**
 *
 * @author Hussein
 */
public class PasswordTokensService {

    private PasswordTokensDB pdb;

    public PasswordTokensService() {
        this.pdb = new PasswordTokensDB();
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

//    public boolean deleteExpiredTokens() {
//        // Delete the expired tokens from the database
//        Date currentDate = new Date();
//        return PasswordTokensDB.delete(currentDate); // Assuming you have a method to delete expired tokens from the database
//    }
//
    public String insert(User userid, String token, Date expiryDateTime) throws Exception {
        Passwordtokens passwordToken = new Passwordtokens(userid, token, expiryDateTime);
//        Passwordtokens existingtoken = pdb.getByToken(token)passwordToken.getUserid();
//can we create multiple tokens?
//        if (existingtoken != null) {
//            return "Token exists already! That shouldnt be possible...";
//        }
        passwordToken.setUserid(userid);
        passwordToken.setToken(token);
        passwordToken.setExpiryDateTime(expiryDateTime);

        pdb.insert(passwordToken);
        return "Token inserted";
    }

    public String generateToken() throws Exception {
        //generate the token
        //is it right way to create token?
        String token = HashAndSalt.getSalt();
        return token;
    }

    public Date calculateExpiryDateTime() {
        // Calculate the expiry date and time for the token
        // Set the expiration date 
//        long expirationTimeMillis = System.currentTimeMillis() + (24 * 60 * 60 * 1000); // 24 hours or 1 hour -- need to talk
        long expirationTimeMillis = System.currentTimeMillis() + (1 * 60 * 60 * 1000);
        Date expirationDateTime = new Date(expirationTimeMillis);
        return expirationDateTime;
    }

    public boolean isTokenValid(String token) {
        PasswordTokensDB pwdDB = new PasswordTokensDB();
        Date now = new Date();
        try {
            Passwordtokens resetToken = pwdDB.getByToken(token);
            if (token != null) {
                Date expiryDate = resetToken.getExpiryDateTime();
                if (expiryDate.after(now)) {
                    return true;
                } 
            }
        } catch (Exception ex) {
            Logger.getLogger(PasswordTokensService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
