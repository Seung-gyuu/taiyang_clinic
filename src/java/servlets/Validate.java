package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.*;
import models.*;
import utilities.*;

public class Validate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String language = utilities.GetLanguageCookie.getLanguageCookie(request,response);
        ValidateTokensService vts = new ValidateTokensService();
        try {
            String message = vts.validate(token, language);
            request.setAttribute("message", message);
            if (message.equals("No token found") || message.equals("토큰을 찾을 수 없습니다.") || message.equals("Token Expired! Please send a new one!") || message.equals("토큰이 만료되었습니다! 새로 보내주세요!")) {
                request.setAttribute("resend", "resend");
            }
         if(language.equals("en"))   
              getServletContext().getRequestDispatcher("/WEB-INF/en/validate.jsp").forward(request, response);
         if(language.equals("kr"))   
              getServletContext().getRequestDispatcher("/WEB-INF/kr/validate.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Validate.class.getName()).log(Level.SEVERE, null, ex);
            if(language.equals("en")){
                request.setAttribute("message", "Error.  Please try again");
                getServletContext().getRequestDispatcher("/WEB-INF/en/validate.jsp").forward(request, response);
            }   
              
         if(language.equals("kr")){
             request.setAttribute("message", "오류. 다시 시도해 주세요");
             getServletContext().getRequestDispatcher("/WEB-INF/kr/validate.jsp").forward(request, response);
         }   

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
