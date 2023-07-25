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
import javax.servlet.http.HttpServletRequest;
import models.*;
import utilities.*;

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

    public String insert(Passwordtokens pwt) throws Exception {
        Passwordtokens token = pdb.getByToken(pwt.getToken());
        if (token != null) {
            return "Token exists already! That shouldnt be possible...";
        }
        pdb.insert(pwt);
        return "Token inserted";
    }

    public String sendToken(User user, String templatePath, String language, HttpServletRequest request) throws Exception {
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

        String baseUrl = "http://www.taiyangyyc.ca";

        // Append the language segment if present (e.g., /en or /kr)
        String languageSegment = language.equals("kr") ? "/kr" : "/en";
        baseUrl += languageSegment;

        // Add the reset path and token as before
        String resetLink = baseUrl + "/reset?token=" + tokenInsert;

        HashMap<String, String> tags = new HashMap<>();
        tags.put("name", user.getFirstname());
        tags.put("action_url", resetLink);
        try {
            SendEmail.sendMail(user.getEmailAddress(), "Taiyang clinic- Reset password Email", templatePath, tags);

            System.out.println("Validation email sent successfully!");
            return "Email sent!";
        } catch (MessagingException e) {
            System.out.println("Failed to send validation email: " + e.getMessage());
            return "Failed to send validation email!";
        }
    }

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
                if (language.equals("en")) {
                    return "reset";
                }
                if (language.equals("kr")) {
                    return "초기화";
                }

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
