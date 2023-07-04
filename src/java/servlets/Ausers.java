package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import models.Role;
import services.*;

/**
 *
 * @author rladm
 */
public class Ausers extends HttpServlet {

    private final String DEACT_SUCCESS = "User deActivated successfully";
    private final String DEACT_ERROR = "Unable to deActivate user";
    private final String SEARCH_ERROR = "Unable to search for user. Please try again.";
    private final String UPDATE_SUCCESS = "User updated successfully";
    private User updateUser;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            request.getSession().invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        }
        //get the user from the database
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        //int userId = Integer.parseInt(request.getParameter("userId"));  //GET method should only get the user list.  Thats all!
                                                                          // when the admin searches for a user, it should be a post method, or javascript to filter
                                                                          // the user table
        UserService us = new UserService();
        if (action!= null && action.equals("search")) {   //What if they just load the page?  It needs to have a default get method 
                                                          // When admin loads page, doGet should just get userlist, rest is javascript or doPost method
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
            getServletContext().getRequestDispatcher("/WEB-INF/en/ausers.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = "";
        //int userId = Integer.parseInt(request.getParameter("userId"));  //user ID is auto generated.  Admin should NOT set it as it will
                                                                            // error in the database
        int isactive = Integer.parseInt(request.getParameter("isactive"));
        UserService us = new UserService();
        RoleService rs = new RoleService();
        User u = new User();
        u.setFirstname(firstName);
        u.setLastname(lastName);
        u.setEmailAddress(email);
        u.setPhoneNumber(phone);
        u.setPassword(password);
        //u.setUserid(userId);
        //u.setRoleid(roleId); // in the admin page, get the role ID from a list, use a role service to get the role object
                               // using the role ID number, then set the ID for that
        u.setIsactive(1); //set it to the parameter you retrieved?
        switch (action) {
            case "edit":
                try {
                    //us.update(updateUser);
                    request.setAttribute("message", UPDATE_SUCCESS);
                } catch (Exception e) {
                    Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    request.setAttribute("message", "Unable to update user");
                }   break;
            case "add":
                try {
                    //us.insert(firstName, lastName, email, phone, password, userId, roleId, 1); make sure that is how insert works.  RoleID should be role object
                                                                                                // userID should not be set.  IsActive IsValid need revision
                    request.setAttribute("message", "User added successfully");
                } catch (Exception e) {
                    Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    request.setAttribute("message", "Unable to add user");
                }   break;
            case "deActivate":
                try {
                    //us.deActivate(userId);
                    request.setAttribute("message", DEACT_SUCCESS);
                } catch (Exception e) {
                    Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    request.setAttribute("message", DEACT_ERROR);
                }   break;
            default:
                break;
        }

    }
}

 


