package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import services.*;

/**
 *
 * @author rladm
 */
public class Ausers extends HttpServlet {

    private final String DEACT_SUCCESS = "User deactivated successfully";
    private final String DEACT_ERROR = "Unable to deactivate user";
    private final String SEARCH_ERROR = "Unable to search for user. Please try again.";
    private final String UPDATE_SUCCESS = "User updated successfully";
    private final String ERROR = "Unable to process request";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/en/home.jsp").forward(request, response);
        }
//        if (request.getParameter("cancel") != null) {
//            session.removeAttribute("viewUser");
//            response.sendRedirect("/ausers");
//        }
        //get the user from the database
        UserService us = new UserService();
        RoleService rs = new RoleService();
        int userId = 0;
        if (request.getParameter("userId") != null) {
            userId = Integer.parseInt(request.getParameter("userId"));
            try {
                User u = us.get(userId);
                request.setAttribute("userId", userId);
                request.setAttribute("viewUser", u);
                getServletContext().getRequestDispatcher("/WEB-INF/en/ausers.jsp").forward(request, response);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        } 
//        else if (request.getParameter("cancel") != null) {
//            session.removeAttribute("viewUser");
//            response.sendRedirect("/ausers");
//            return;
//        }
        try {
            List<User> userList = us.getAll();
            List<Role> roleList = rs.getAll();
            request.setAttribute("userList", userList);
            request.setAttribute("roleList", roleList);

        } catch (Exception e) {
            Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
        }
        request.removeAttribute("addmsg");
        getServletContext().getRequestDispatcher("/WEB-INF/en/ausers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService us = new UserService();
        RoleService rs = new RoleService();
        String action = request.getParameter("action");

        if (action.equals("add")) {
            String firstname = request.getParameter("firstName");
            String lastname = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            int role_id = Integer.parseInt(request.getParameter("role"));

            User u = new User();
            String message = "";

            u.setFirstname(firstname);
            u.setLastname(lastname);
            u.setEmailAddress(email);
            u.setPhoneNumber(phone);
            u.setPassword(password);
            u.setRoleid(rs.get(role_id));
            try {
                message = us.insert(u, "en");
                if (message.equals("Account created!")) {

                     request.setAttribute("addmsg", message);
                    request.setAttribute("addedInfo", true);

                    String templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/sendValidation.jsp");
                    ValidateTokensService vts = new ValidateTokensService();
                    vts.sendToken(u, templatePath, "en");
                } else {

                    request.setAttribute("firstName", firstname);
                    request.setAttribute("lastName", lastname);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);

                    request.setAttribute("addmsg", message);
                }
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        } else if (action.equals("update")) {
           
            int userId = Integer.parseInt(request.getParameter("userId"));

            try {
                User viewUser = us.get(userId);
                request.setAttribute("viewUser", viewUser);

//            User viewUser = (User) session.getAttribute("viewUser");
//            Role viewRole = (Role) session.getAttribute("viewRole");
                String firstname = request.getParameter("firstName");
                String lastname = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                int isactive = Integer.parseInt(request.getParameter("isactive"));
                int role = Integer.parseInt(request.getParameter("role"));

                String validateMsg = us.updateValidate(email, phone, "en", viewUser);
                String message = "";

                if (validateMsg.equals("Valid")) {
                    viewUser.setFirstname(firstname);
                    viewUser.setLastname(lastname);
                    viewUser.setEmailAddress(email);
                    viewUser.setPhoneNumber(phone);
                    viewUser.setIsactive(isactive);
                    viewUser.setRoleid(rs.get(role));
                    try {
                        message = us.update(viewUser, "en");
                        request.setAttribute("message", message);
                    } catch (Exception e) {
                        Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
                    }
                } else {
                    request.setAttribute("message", validateMsg);
                }
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        try {
            List<User> userList = us.getAll();
            List<Role> roleList = rs.getAll();
            request.setAttribute("userList", userList);
            request.setAttribute("roleList", roleList);

        } catch (Exception e) {
            Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/en/ausers.jsp").forward(request, response);
    }
}
