/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.PasswordTokensDB;
import dataaccess.UserDB;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import models.Passwordtokens;
import models.User;
import models.Validatetokens;
import utilities.GenerateToken;
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
//    public String insert(User userid, String token, Date expiryDateTime) throws Exception {
//        Passwordtokens passwordToken = new Passwordtokens(userid, token, expiryDateTime);
////        Passwordtokens existingtoken = pdb.getByToken(token)passwordToken.getUserid();
////can we create multiple tokens?
////        if (existingtoken != null) {
////            return "Token exists already! That shouldnt be possible...";
////        }
//        passwordToken.setUserid(userid);
//        passwordToken.setToken(token);
//        passwordToken.setExpiryDateTime(expiryDateTime);
//
//        pdb.insert(passwordToken);
//        return "Token inserted";
//    }
    public String insert(Passwordtokens pwt) throws Exception {
        Passwordtokens token = pdb.getByToken(pwt.getToken());
        if (token != null) {
            return "Token exists already! That shouldnt be possible...";
        }
        pdb.insert(pwt);
        return "Token inserted";
    }

    public String sendToken(User user, String templatePath, String language) throws Exception {
        Passwordtokens passwordToken = new Passwordtokens();
//generate the token
        String tokenInsert = GenerateToken.generateToken();
        //the expiry date for the tokens is calculated to be 1 hour from the current date and time
        LocalDateTime expiryTime = LocalDateTime.now().plusHours(1);
        Date expiryDate = Date.from(expiryTime.atZone(ZoneId.systemDefault()).toInstant());

        passwordToken.setUserid(user);
        passwordToken.setToken(tokenInsert);
        passwordToken.setExpiryDateTime(expiryDate);
        this.insert(passwordToken);

        // Generate the reset link -> move to the service
        String resetLink = "reset?token=" + tokenInsert;

        HashMap<String, String> tags = new HashMap<>();
        tags.put("name", user.getFirstname());
        tags.put("action_url", resetLink);
        try {
            if(language.equals("en"))
                 SendEmail.sendMail(user.getEmailAddress(), "Taiyang clinic- Reset password Email", templatePath, tags);
            if(language.equals("kr"))
                 SendEmail.sendMail(user.getEmailAddress(), "Taiyang clinic- 비밀번호 재설정 이메일", templatePath, tags);
            System.out.println("Validation email sent successfully!");
            return "Email sent!";
        } catch (MessagingException e) {
            System.out.println("Failed to send validation email: " + e.getMessage());
            return "Failed to send validation email!";
        }
    }

//    public Date calculateExpiryDateTime() {
//        // Calculate the expiry date and time for the token
//        // Set the expiration date 
////        long expirationTimeMillis = System.currentTimeMillis() + (24 * 60 * 60 * 1000); // 24 hours or 1 hour -- need to talk
//        long expirationTimeMillis = System.currentTimeMillis() + (1 * 60 * 60 * 1000);
//        Date expirationDateTime = new Date(expirationTimeMillis);
//        return expirationDateTime;
//    }
    public String isTokenValid(String token, String language) {
        PasswordTokensDB pwdDB = new PasswordTokensDB();
//        Date now = new Date();

        try {
            Passwordtokens resetToken = pwdDB.getByToken(token);
            if (resetToken != null) {
                if (resetToken.getUserid().getIsValid() == 2) {
                    if (language.equals("en")) {
                        return "Your account is not validated";
                    }
                    if (language.equals("kr")) {
                        return "귀하의 계정이 확인되지 않았습니다";
                    }
                }
                if (resetToken.getUserid().getIsactive() == 2) {
                    if (language.equals("en")) {
                        return "Your account is inactive";
                    }
                    if (language.equals("kr")) {
                        return "계정이 비활성 상태입니다.";
                    }

                }
                LocalDateTime now = LocalDateTime.now();
                Date today = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
                if (resetToken.getExpiryDateTime().before(today)) {
                    if (language.equals("en")) {
                        return "The reset link is invalid or expired";
                    }
                    if (language.equals("kr")) {
                        return "재설정 링크가 유효하지 않거나 만료되었습니다";
                    }

                }
                if (language.equals("en")) 
                    return "reset";
                if (language.equals("kr")) 
                    return "초기화";

            }

        } catch (Exception ex) {
            Logger.getLogger(PasswordTokensService.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (language.equals("en")) {
            return "The reset link is invalid or expired";
        }
        if (language.equals("kr")) {
            return "재설정 링크가 유효하지 않거나 만료되었습니다.";
        }
        return "";
    }

}
