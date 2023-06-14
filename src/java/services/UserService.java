/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import models.User;
import utilities.HashAndSalt;

/**
 *
 * @author Hussein
 */
public class UserService {

    private UserDB udb;

    public UserService() {
        this.udb = new UserDB();
    }

    public List<User> getAll() throws Exception {
        return udb.getAll();
    }

    public List<User> getAllByFirstName(String firstname) throws Exception {
        return udb.getAllByFirstName(firstname);
    }

    public List<User> getAllByLastName(String lastname) throws Exception {
        return udb.getAllByLastName(lastname);
    }

    public User get(int userId) throws Exception {
        return udb.get(userId);
    }

    public User getByEmail(String email) throws Exception {
        return udb.getByEmail(email);
    }

    public User getByPhone(String phone) throws Exception {
        return udb.getByPhone(phone);
    }

    public String insert(User user) throws Exception {
        User us = udb.getByEmail(user.getEmailAddress());
        if (us != null) {
            return "Email Already Taken!";
        }
        us = udb.getByPhone(user.getPhoneNumber());
        if (us != null) {
            return "Phone Already Taken!";
        }
        if (!validate(user).equals("Valid")) {
            return validate(user);
        }

        String salt = HashAndSalt.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(user.getPassword(), salt);
//        user.setPassword(hashedPassword);

        user.setSalt(salt);
        user.setIsValid(2);
        user.setIsactive(1);
        user.setPassword(user.getPassword());
        udb.insert(user);
        return "Account created!";
    }

    public String update(User updateUser) throws Exception {
        try {
            int userid = udb.getByEmail(updateUser.getEmailAddress()).getUserid();
            User existingUser = udb.get(userid); // Retrieve the existing user using the userid
            if (existingUser == null) {
                return "User does not exist!";
            }

            // Check if the password is valid
            String message = isValidPassword(updateUser.getPassword());
            if (!message.equals("success")) {
                return message;
            }
//            if (updateUser.getEmailAddress().equals(existingUser.getEmailAddress())) {               
//                if(existingUser != null && !existingUser.getUserid().equals(updateUser.getUserid())){
//                    return "Email Already Taken!";
//                } 
//                existingUser.setEmailAddress(updateUser.getEmailAddress());
//            }

            // Check if the phone number has changed and if it is already taken
            if (!updateUser.getPhoneNumber().equals(existingUser.getPhoneNumber())) {
                User userWithPhoneNumber = udb.getByPhone(updateUser.getPhoneNumber());
                if (userWithPhoneNumber != null && !userWithPhoneNumber.getUserid().equals(updateUser.getUserid())) {
                    return "Phone number already taken!";
                }
                existingUser.setPhoneNumber(updateUser.getPhoneNumber());
            }
//            String salt = updateUser.getSalt();
//            String hashedPassword = HashAndSalt.hashAndSaltPassword(updateUser.getPassword(), salt);
//            user.setSalt(salt);
//            user.setPassword(hashedPassword);
            // Always update the password
            existingUser.setPassword(updateUser.getPassword());

            // Update the isValid status if needed
            if (updateUser.getIsValid() != null) {
                existingUser.setIsValid(1);
            }

            udb.update(existingUser);
            return "Update successful!";
        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            return "Error occurred during update!";
        }
    }

    public String delete(User user) throws Exception {
        User targetUser = udb.getByEmail(user.getEmailAddress());
        if (targetUser == null) {
            return "User not found!";
        }
        udb.delete(user);
        return "User deleted successfully!";
    }

    private String validate(User user) {
        String email = user.getEmailAddress();
        String firstName = user.getFirstname();
        String lastName = user.getLastname();
        String phone = user.getPhoneNumber();
        String password = user.getPassword();
        String message =" ";
        if (firstName.length() > 20) {
             message += "First Name is incorrect format  <br>";
        }
        if (lastName.length() > 20) {
             message +="Last Name is incorrect format";
        }
        if (containsSpecialCharacters(firstName) || containsSpecialCharacters(lastName)) {
            System.out.println("First Name contains special characters");
             message +="Only letters in first and last name!  <br>";
        }
        if ( phone.length() > 12) {
             message +="Phone number is incorrect format <br>";
        }
        if (email.length() > 40 || !email.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
             message += "Email is incorrect format  <br>";
        }        

        String msg = isValidPassword(password);
        if (!isValidPassword(password).equals("success")) {
            return message += msg + " <br>";
        }
        return "Valid";
    }

    public static boolean containsSpecialCharacters(String name) {
        // Regular expression to match special characters
        String regex = "[^a-zA-Z]";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(name);

        return matcher.find();
    }

    public String isValidPassword(String password) {
        if (password.length() > 15 || password.length() < 8) {
            return "Password must be less than 20 and more than 8 characters in length.";

        }
        String lowerCaseChars = "(.*[a-z].*)";
        if (!password.matches(lowerCaseChars)) {
            return "Password must have at least one lowercase character ";

        }
        String numbers = "(.*[0-9].*)";
        if (!password.matches(numbers)) {
            return "Password must have at least one number";
        }
        return "success";
    }

    public String login(String email, String password) throws Exception {
        // Retrieve the user by email
        User user = udb.getByEmail(email);
        String salt = user.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(user.getPassword(), salt);
        if (user == null) {
            return "Invalid!";
        }
        if (user.getIsactive() == 2) {
            return "This account has been deactivated";
        }
//        if (!user.getPassword().equals(hashedPassword)) {
//            return "Invalid!";
//        }
        if (!user.getPassword().equals(password)) {
            return "Invalid!";
        }
        if (user.getIsValid() == 2) {
            return "User has not validated account. Please validate!";
        }

        return "Login";
    }

//for validate email
    public String verify(User user) throws Exception {
        if (user == null) {
            return "We can't find your email!";
        } else {
            if (user.getIsValid() == 2) {
                return "Please Validate Account";
            }
            if (user.getIsactive() == 2) {
                return "User not active.  Please talk to an admin to activate!";
            }
            return "success";
        }

    }

    public void updatePW(User user, String password) {
        try {
            user.setPassword(password);
            String salt = user.getSalt();
            String hashedPassword = HashAndSalt.hashAndSaltPassword(user.getPassword(), salt);
//            user.setPassword(hashedPassword);
            user.setSalt(salt);

            udb.update(user);
        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
