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

    public String validate(String token, String language) throws Exception {
        if (token.length() != 50) {
            if (language.equals("en")) {
                return "No token found";
            }
            if (language.equals("kr")) {
                return "토큰을 찾을 수 없습니다.";
            }
        }
        Validatetokens vt = this.getByToken(token);
        if (vt == null) {
            if (language.equals("en")) {
                return "No token found";
            }
            if (language.equals("kr")) {
                return "토큰을 찾을 수 없습니다.";
            }
        }
        if (vt.getUserid().getIsValid() == 1) {
            if (language.equals("en")) {
                return "User already validated!";
            }
            if (language.equals("kr")) {
                return "사용자가 이미 인증되었습니다!";
            }

        }
        if (vt.getUserid().getIsactive() == 2) {
            if (language.equals("en")) {
                return "User is inactive!";
            }
            if (language.equals("kr")) {
                return "사용자가 비활성 상태입니다!";
            }

        }
        LocalDateTime now = LocalDateTime.now();
        Date today = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
        if (vt.getExpiryDateTime().before(today)) {
            System.out.println("Expiry Date: " + vt.getExpiryDateTime());
            System.out.println("Right now Date: " + today);
            if (language.equals("en")) {
                return "Token Expired! Please send a new one!";
            }
            if (language.equals("kr")) {
                return "토큰이 만료되었습니다! 새로 보내주세요!";
            }

        }
        UserService us = new UserService();
        vt.getUserid().setIsValid(1);
        us.updateStatus(vt.getUserid());
        if (language.equals("en")) {
            return "User Validated!";
        }
        if (language.equals("kr")) {
            return "사용자 인증!";
        }
        return "";

    }

    public String sendToken(User user, String templatePath, String language) throws Exception {
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
            if (language.equals("en")) {
                SendEmail.sendMail(recipientEmail, "Taiyang clinic- Account Validation Email", templatePath, tags);
            } else if (language.equals("kr")) {
                SendEmail.sendMail(recipientEmail, "Taiyang Clinic- 계정 확인 이메일", templatePath, tags);
            }

            System.out.println("Validation email sent successfully!");
            if (language.equals("en")) {
                return "Email sent!";
            }
            if (language.equals("kr")) {
                return "이메일을 보냈습니다!";
            }
            return "";
        } catch (MessagingException e) {
            System.out.println("Failed to send validation email: " + e.getMessage());

            if (language.equals("en")) {
                return "Failed to send validation email!";
            }
            if (language.equals("kr")) {
                return "확인 이메일을 보내지 못했습니다!";
            }
            return "";
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
