/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hussein
 */
public class GetLanguageCookie {
    public static String getLanguageCookie(HttpServletRequest req, HttpServletResponse resp){
        Cookie[] cookies = req.getCookies();
        String language = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("language")) {
                    language = cookie.getValue();
                    break;
                }
            }
        }
        if((language.equals("kr") && language.equals("en")) || language==null){
            HttpSession session = req.getSession(true); // Create a new session
                session.setAttribute("language", "en");
                // Set the cookie to new language
                Cookie languageCookie = new Cookie("language", "en");
                languageCookie.setMaxAge(60 * 60 * 24 * 30); // Set the cookie to expire in 30 days
                languageCookie.setPath("/");
                resp.addCookie(languageCookie);
            return "en";    //just default to english if they havent visited (which sets the language)
        
            
        }
        return language;
        
    }
}
