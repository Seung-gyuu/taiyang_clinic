/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.security.SecureRandom;

/**
 * class that generates a token to be used for email validation and for password token reset. 
 * @author Hussein
 * 
 */
public class GenerateToken {
    private static final String ALLOWED_CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int TOKEN_LENGTH = 50;
    
    public static String generateToken() {
        StringBuilder token = new StringBuilder(TOKEN_LENGTH);
        SecureRandom random = new SecureRandom();
        
        for (int i = 0; i < TOKEN_LENGTH; i++) {
            int randomIndex = random.nextInt(ALLOWED_CHARACTERS.length());
            char randomChar = ALLOWED_CHARACTERS.charAt(randomIndex);
            token.append(randomChar);
        }
        
        return token.toString();
    }
}