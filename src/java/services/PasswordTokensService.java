/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.PasswordTokensDB;
import dataaccess.UserDB;
import java.security.NoSuchAlgorithmException;
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

//    public Passwordtokens getByToken(String token) throws Exception {
//        return pdb.getByToken(token);
//    }
//
//    public Passwordtokens get(int tokenId) throws Exception {
//        return pdb.get(tokenId);
//    }
//
//    public List<Passwordtokens> getExpired() throws Exception {
//        return pdb.getExpired();
//    }
//
//    public String delete(Passwordtokens passwordToken) throws Exception {
//        Date now = new Date();
//        Date expiryDate = passwordToken.getExpiryDateTime();
//        if (expiryDate.after(now)) {
//            return "Token hasn't expired yet!";
//        }
//        pdb.delete(passwordToken);
//        return "Token Deleted";
//    }
//
    public String insert(User userid, String token, Date expiryDateTime) throws Exception {
        Passwordtokens passwordToken = new Passwordtokens(userid, token, expiryDateTime);
        UserDB userdb = new UserDB();
        String existingSalt = userdb.get(userid.getUserid()).getSalt();
//        Passwordtokens token = pdb.getByToken(pwt.getToken()); 
        if (existingSalt != null) {
            return "Token exists already! That shouldnt be possible...";
        }
        passwordToken.setUserid(userid);
        passwordToken.setToken(token);
        passwordToken.setExpiryDateTime(expiryDateTime);

        pdb.insert(passwordToken);
        return "Token inserted";
    }

    public String generateToken() throws Exception {
        //generate the token
        //can create token - check
        String token = HashAndSalt.getSalt();
        //            String hash = HashAndSalt.hashPassword(salt);
//            String token = HashAndSalt.hashAndSaltPassword(hash, salt);
        return token;
    }

    public Date calculateExpiryDateTime() {
        // Calculate the expiry date and time for the token
        // Set the expiration date 
        // can create the right data - check
        long expirationTimeMillis = System.currentTimeMillis() + (24 * 60 * 60 * 1000); // 24 hours
        Date expirationDateTime = new Date(expirationTimeMillis);
        return expirationDateTime;
    }

}
