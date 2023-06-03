/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Role;
import models.User;
import services.UserService;
import utilities.HashAndSalt;

/**
 *
 * @author Hussein
 */
public class TestAddAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        UserService us = new UserService();
        User u = new User();
        u.setEmailAddress("bob@gmail.com");
        u.setPhoneNumber("4036569595");
        u.setFirstname("OBO");
        u.setLastname("ASDASD");
        u.setIsactive(1);
        Role role = new Role();
        role.setRoleid(1);
        u.setRoleid(role);
        u.setPassword("password");
        System.out.print("BEFORE TRY CATCH");
        try {
            System.out.print("HELLO I AM HERE NOW");
            String s = us.insert(u);
            System.out.print(s + " <--- S print");

        } catch (Exception ex) {
            Logger.getLogger(TestAddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/t.jsp").forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
