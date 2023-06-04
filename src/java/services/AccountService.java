package services;

import dataaccess.UserDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

public class AccountService {
    private UserDB userDB;
    
      public AccountService(){
        this.userDB=new UserDB();
    }
    
    public User login(String email, String password) {
        try {
            // Retrieve the user by email
            User user = userDB.getByEmail(email);

            // Check if the user exists and the password matches
            if (user != null && user.getPassword().equals(password)) {
                return user; // Login successful
            } else {
                return null; // Invalid credentials
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // An error occurred
        }
    }
    
        public User verify(String email) {
        try {
            // Retrieve the user by email
            User user = userDB.getByEmail(email);

            // Check if the user exists and the password matches
            if (user != null) {
                return user; // Login successful
            } else {
                return null; // Invalid credentials
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // An error occurred
        }
    }
    public User get(String email) throws Exception {
        return userDB.getByEmail(email);
    }

    public List<User> getAll() throws Exception {
        //get all users
        return userDB.getAll();
    }

//    public void insert(Integer userid, String firstname, String lastname, String emailAddress, String phoneNumber, String password) throws Exception {
//        User user = new User(userid, firstname, lastname, emailAddress, phoneNumber, password);
//        UserDB userDB = new UserDB();
//        userDB.insert(user);
//    }

//    public void inserts(String email, String firstName, String lastName, String password, int role, int active) throws Exception {
//        User user = new User(email, firstName, lastName, password, role, active);
//        UserDB userDB = new UserDB();
//        userDB.inserts(user);
//    }

//    public void update(Integer userid, String firstname, String lastname, String emailAddress, String phoneNumber, String password) throws Exception {
//        User user = new User(userid, firstname, lastname, emailAddress, phoneNumber, password);
//        UserDB userDB = new UserDB();
//        userDB.update(user);
//    }

//    public void updates(String email, String firstName, String lastName, String password, int role, int active) throws Exception {
//        User user = new User(email, firstName, lastName, password, role, active);
//        UserDB userDB = new UserDB();
//        userDB.updates(user);
//    }

//    public void delete(String email) throws Exception {
//        User user = new User();
//        user.setEmailAddress(email);
//        UserDB userDB = new UserDB();
//        userDB.delete(user);
//    }

}

