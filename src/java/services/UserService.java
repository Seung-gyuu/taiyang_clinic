/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDB;
import java.util.List;
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
        if (!validate(user)) {
            return "Invalid user data!";
        }

        String salt = HashAndSalt.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(user.getPassword(), salt);
        user.setPassword(hashedPassword);
        user.setSalt(salt);
        udb.insert(user);
        return "Account created!";
    }

    public String update(User updateUser) throws Exception {
        User existingUserByEmail = udb.getByEmail(updateUser.getEmailAddress());
        User existingUserByPhone = udb.getByPhone(updateUser.getPhoneNumber());

        // Check if the new email is already taken by another user
        if (existingUserByEmail != null && existingUserByEmail.getUserid() != updateUser.getUserid()) {
            return "Email Already Taken!";
        }

        // Check if the new phone number is already taken by another user
        if (existingUserByPhone != null && existingUserByPhone.getUserid() != updateUser.getUserid()) {
            return "Phone Already Taken!";
        }
        String salt = updateUser.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(updateUser.getPassword(), salt);
        updateUser.setPassword(hashedPassword);
        udb.update(updateUser);
        return "Update successful!";
    }

    public String delete(User user) throws Exception {
        User targetUser = udb.getByEmail(user.getEmailAddress());
        if (targetUser == null) {
            return "User not found!";
        }
        udb.delete(user);
        return "User deleted successfully!";
    }

    private boolean validate(User user) {
        String email = user.getEmailAddress();
        String firstName = user.getFirstname();
        String lastName = user.getLastname();
        String phone = user.getPhoneNumber();
        String password = user.getPassword();
        if (email == null || email.isEmpty() || email.length() > 40 || !email.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            return false;
        }
//        if(phone == null || phone.length()==0 || phone.length()!=12)
//            return false;
        if (firstName == null || firstName.isEmpty() || firstName.length() > 20) {
            return false;
        }
        if (lastName == null || lastName.isEmpty() || lastName.length() > 20) {
            return false;
        }
        if (password == null || password.isEmpty() || password.length() > 70) {
            return false;
        }
        return true;
    }

    public String login(String email, String password) throws Exception {
        // Retrieve the user by email
        User user = udb.getByEmail(email);
        if (user == null) {
            return "Invalid!";
        }
        if (user.getIsactive() == 2) {
            return "This account has been deactivated";
        }
        if(!user.getPassword().equals(password)){
            return "Invalid!";
        }
//        String salt = user.getSalt();
//        String checkPassword = HashAndSalt.hashAndSaltPassword(password, salt);
//        if (!checkPassword.equals(user.getPassword())) {
//            return "Invalid!";
//        }
        if (user.getIsValid() == 2) {
            return "User has not validated account. Please validate!";
        }

        return "Login";
    }

    public String verify(User user) throws Exception {
        if (user.getIsValid() == 2) {
            return "Please Validate Account";
        }
        if (user.getIsactive() == 2) {
            return "User not active.  Please talk to an admin to activate!";
        }
        return "";
    }
}
