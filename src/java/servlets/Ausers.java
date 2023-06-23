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
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        //get the user from the database
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserService us = new UserService();
        if (action.equals("search")) {
            try {
                User user = us.getByEmail(email);
                request.setAttribute("userId", userId);
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
            getServletContext().getRequestDispatcher("/WEB-INF/ausers.jsp").forward(request, response);
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
        int userId = Integer.parseInt(request.getParameter("userId"));
        int isactive = Integer.parseInt(request.getParameter("isactive"));
        UserService us = new UserService();
        RoleService rs = new RoleService();
        User u = new User();
        u.setFirstname(firstName);
        u.setLastname(lastName);
        u.setEmailAddress(email);
        u.setPhoneNumber(phone);
        u.setPassword(password);
        u.setUserid(userId);
        u.setRoleid(roleId);
        u.setIsactive(1);
        switch (action) {
            case "edit":
                try {
                    us.update(updateUser);
                    request.setAttribute("message", UPDATE_SUCCESS);
                } catch (Exception e) {
                    Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    request.setAttribute("message", "Unable to update user");
                }   break;
            case "add":
                try {
                    us.insert(firstName, lastName, email, phone, password, userId, roleId, 1);
                    request.setAttribute("message", "User added successfully");
                } catch (Exception e) {
                    Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    request.setAttribute("message", "Unable to add user");
                }   break;
            case "deActivate":
                try {
                    us.deActivate(userId);
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
