package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

/**
 *
 * @author rladm
 */
public class Areport extends HttpServlet {
    private final String SEARCH_ERROR = "Unable to search for user. Please try again.";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            request.getSession().invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        } //log out should be put in post, since get is best for just retrieval
        //get the user from the database
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        //int userId = Integer.parseInt(request.getParameter("userId"));  //GET method should only get the user list. 
                                                                          // when the admin searches for a user, it should be a post method, or javascript to filter
                                                                          // the user table
        UserService us = new UserService();
        if (action.equals("search")) { //move this to the post method
            try {
                User user = us.getByEmail(email);
                //request.setAttribute("userId", userId);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                request.setAttribute("message", SEARCH_ERROR);
            }
        }
        try {
            List<User> userList = us.getAll();
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to retrieve users");
            getServletContext().getRequestDispatcher("/WEB-INF/en/areport.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                //add, edit and delete reports
                //Date, decription

    }
}
