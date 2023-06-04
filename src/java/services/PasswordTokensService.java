/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.PasswordTokensDB;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Passwordtokens;
import models.User;
import utilities.HashAndSalt;
import static utilities.HashAndSalt.hashAndSaltPassword;

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

    public String delete(Passwordtokens passwordToken) throws Exception {
        Date now = new Date();
        Date expiryDate = passwordToken.getExpiryDateTime();
        if (expiryDate.after(now)) {
            return "Token hasn't expired yet!";
        }
        pdb.delete(passwordToken);
        return "Token Deleted";
    }

    public String insert(Passwordtokens pwt) throws Exception {
        Passwordtokens token = pdb.getByToken(pwt.getToken());
        if (token != null) {
            return "Token exists already! That shouldnt be possible...";
        }
        pdb.insert(pwt);
        return "Token inserted";
    }

    public String createPasswordToken(User user) throws Exception {
        String token = generateToken();
        try {
            Date expiryDateTime = calculateExpiryDateTime();

            // Create a new Passwordtokens object
            Passwordtokens passwordToken = new Passwordtokens();
            passwordToken.setUserid(user);
            passwordToken.setToken(token);
            passwordToken.setExpiryDateTime(expiryDateTime);

            // Save the password token to the database
            PasswordTokensDB passwordTokensDB = new PasswordTokensDB();
            passwordTokensDB.insert(passwordToken);

        } catch (Exception ex) {
            Logger.getLogger(PasswordTokensService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return token;
    }

    private String generateToken() throws Exception {
        try {
            //generate the token
            //is it correct way to generate token? or just need getSalt method?
            String salt = HashAndSalt.getSalt();
            String hash = HashAndSalt.hashPassword(salt);
            String token = HashAndSalt.hashAndSaltPassword(hash, salt);

            return token;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordTokensService.class.getName()).log(Level.SEVERE, null, ex);
            throw new Exception("Failed to generate token.", ex);

        }
    }

    private Date calculateExpiryDateTime() {
        // Calculate the expiry date and time for the token
        // Set the expiration date 
        long expirationTimeMillis = System.currentTimeMillis() + (24 * 60 * 60 * 1000); // 24 hours
        Date expirationDateTime = new Date(expirationTimeMillis);
        return expirationDateTime;
    }

}
