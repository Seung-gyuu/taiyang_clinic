package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.*;
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
            request.getSession().invalidate();
            request.setAttribute("message", "You have successfully logged out.");
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        //get the user from the database
        UserService us = new UserService();
        int userId = 0;
        if (request.getParameter("userId") != null) {
            userId = Integer.parseInt(request.getParameter("userId"));
            try {
                User u = us.get(userId);
                List<User> userList = us.getAll();
                request.setAttribute("userList", userList);
                request.setAttribute("viewUser", u);
                getServletContext().getRequestDispatcher("/WEB-INF/ausers.jsp").forward(request, response);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        } else {
            try {
                List<User> userList = us.getAll();
                request.setAttribute("userList", userList);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        getServletContext().getRequestDispatcher("/WEB-INF/ausers.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action.equals("add")) {
            UserService us = new UserService();
            RoleService rs = new RoleService();
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = "";
            String role_name = request.getParameter("role_name");
            int userId = Integer.parseInt(request.getParameter("userId"));
            int isactive = Integer.parseInt(request.getParameter("isactive"));
            int isValid = Integer.parseInt(request.getParameter("isValid"));
            String message = "";
            User u = new User();
            u.setFirstname(firstname);
            u.setLastname(lastname);
            u.setEmailAddress(email);
            u.setPhoneNumber(phone);
            u.setPassword(password);
            u.setRoleid(rs.get(1));
            u.setIsactive(isactive);
            u.setIsValid(isValid);
            try {
                message = us.insert(u);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
            if (!message.equals("Account created!")) {
                request.setAttribute("firstname", firstname);
                request.setAttribute("lastname", lastname);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("message", message);
                getServletContext().getRequestDispatcher("/WEB-INF/ausers.jsp").forward(request, response);
                return;
            }
            try {
                u = us.getByEmail(email);
                if (u.getIsValid() == 2) {
                    request.setAttribute("validation", "We have sent a validation link to your email.  Please click on it to validate your account!  "
                            + "Please allow some time for it to arrive or check your spam!");
                    String templatePath = getServletContext().getRealPath("/WEB-INF/emailTemplate/sendValidation.jsp");
                    ValidateTokensService vts = new ValidateTokensService();
                    vts.sendToken(u, templatePath);
                }
            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            getServletContext().getRequestDispatcher("/WEB-INF/ausers.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            UserService us = new UserService();
            RoleService rs = new RoleService();
            User viewUser = (User) session.getAttribute("viewUser");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
//          String role_name = request.getParameter("role_name"); ---Not sure if I should put roleid or role name.
            int userId = Integer.parseInt(request.getParameter("userId"));
            int isactive = Integer.parseInt(request.getParameter("isactive"));
            int isValid = Integer.parseInt(request.getParameter("isValid"));
            String message = "";
            viewUser.setFirstname(firstname);
            viewUser.setLastname(lastname);
            viewUser.setEmailAddress(email);
            viewUser.setPhoneNumber(phone);
//          viewUser.setRole(role_name);
            viewUser.setIsactive(isactive);
            viewUser.setIsValid(isValid);
            try {
                message = us.update(viewUser);

                if (message.equals("Update successful!")) {
                    session.setAttribute("updatedEmail", email);
                    session.setAttribute("updatedPhone", phone);
                    session.setAttribute("updatedInfo", true);
                    if (us.getByEmail(email).getIsValid() == 2) {
                        session.setAttribute("message", "To use TaiYang clinic services, You need to validate the email first");
                        getServletContext().getRequestDispatcher("/WEB-INF/sendvalidation.jsp").forward(request, response);
                    }
                }
                request.setAttribute("message", message);
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
        } else if (action.equals("deactivate")) {
            UserService us = new UserService();
            int userId = Integer.parseInt(request.getParameter("userId"));
            String message = "";
            try {
                message = DEACT_SUCCESS;
            } catch (Exception e) {
                Logger.getLogger(Ausers.class.getName()).log(Level.SEVERE, null, e);
            }
            request.setAttribute("message", message);
        }
    }
}