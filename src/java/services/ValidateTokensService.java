/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.ValidateTokensDB;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.mail.MessagingException;
import models.User;
import models.Validatetokens;
import utilities.GenerateToken;
import utilities.SendValidationEmail;

/**
 *
 * @author Hussein
 */
public class ValidateTokensService {

    private ValidateTokensDB vdb;

    public ValidateTokensService() {
        this.vdb = new ValidateTokensDB();
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
        if (expiryDate.after(now)) {
            return "Token hasn't expired yet!";
        }
        vdb.delete(validatetoken);
        return "Token Deleted";
    }

    public String validate(String token) throws Exception {
        if (token.length() != 50) {
            return "No token found";
        }
        Validatetokens vt = this.getByToken(token);
        if (vt == null) {
            return "No token found";
        }
        if (vt.getUserid().getIsValid() == 1) {
            return "User already validated!";
        }
        if (vt.getUserid().getIsactive() == 2) {
            return "User is inactive!";
        }
        LocalDateTime now = LocalDateTime.now();
        Date today = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
        if (vt.getExpiryDateTime().before(today)) {
            System.out.println("Expiry Date: " + vt.getExpiryDateTime());
            System.out.println("Right now Date: " + today);

            return "Token Expired! Please send a new one!";
        }
        UserService us = new UserService();
        vt.getUserid().setIsValid(1);
        us.update(vt.getUserid());
        return "User Validated!";

    }

    public String sendToken(User user, String templatePath) throws Exception {
        Validatetokens token = new Validatetokens();
        String tokenInsert = GenerateToken.generateToken();
//        LocalDateTime expiryTime = LocalDateTime.now().plusDays(1);
        LocalDateTime expiryTime = LocalDateTime.now().plusHours(1);
        Date expiryDate = Date.from(expiryTime.atZone(ZoneId.systemDefault()).toInstant());

        token.setUserid(user);
        token.setValidatetoken(tokenInsert);
        token.setExpiryDateTime(expiryDate);
        String recipientEmail = user.getEmailAddress();
        this.insert(token);

        String validationLink = "validate?token=" + tokenInsert;
        HashMap<String, String> tags = new HashMap<>();
        tags.put("name", user.getFirstname());
        tags.put("action_url", validationLink);
        try {
//            SendValidationEmail.sendValidationEmail(recipientEmail, validationLink);
            SendEmail.sendMail(user.getEmailAddress(), "Taiyang clinic- Account Validation Email", templatePath, tags);

            System.out.println("Validation email sent successfully!");
            return "Email sent!";
        } catch (MessagingException e) {
            System.out.println("Failed to send validation email: " + e.getMessage());
            return "Failed to send validation email!";
        }
    }

    public String insert(Validatetokens vdt) throws Exception {
        Validatetokens token = vdb.getByToken(vdt.getValidatetoken());
        if (token != null) {
            return "Token exists already! That shouldnt be possible...";
        }
        vdb.insert(vdt);
        return "Token inserted";
    }
}
