/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Hussein
 */
public class GetLanguageCookie {
    public static String getLanguageCookie(HttpServletRequest req){
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
        if(language==null)
            return "en";    //just default to english if they havent visited (which sets the language)
        return language;
        
    }
}
