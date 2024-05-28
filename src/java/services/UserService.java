/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import models.Role;
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

    public String insert(User user, String language) throws Exception {
        User us = udb.getByEmail(user.getEmailAddress());
        if (us != null) {
            if (language.equals("en")) {
                return "Email Already Taken!";
            }
            if (language.equals("kr")) {
                return "이메일이 이미 사용되었습니다!";
            }

        }
        us = udb.getByPhone(user.getPhoneNumber());
        if (us != null) {
            if (language.equals("en")) {
                return "Phone Already Taken!";
            }
            if (language.equals("kr")) {
                return "전화가 이미 사용되었습니다!";
            }

        }
        String message2 = isValidPassword(user.getPassword(), language);
        if (!message2.equals("success") && !message2.equals("성공")) {
            return message2;
        }

        String salt = HashAndSalt.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(user.getPassword(), salt);
        user.setPassword(hashedPassword);

        user.setSalt(salt);
        user.setIsValid(2);
        user.setIsactive(1);
//        user.setPassword(user.getPassword());
        udb.insert(user);
        if (language.equals("en")) {
            return "Account created!";
        }
        if (language.equals("kr")) {
            return "계정이 생성되었습니다!";
        }
        return "";
    }

    public String update(User updateUser, String language) throws Exception {
        try {
            List<User> users = getAll();
            for (User user : users) {
                if (!updateUser.getEmailAddress().equals(user.getEmailAddress()) && user.getUserid().equals(updateUser.getUserid())) {
                    updateUser.setIsValid(2); // Set the isValid status to 2 if the email address has changed
                }

            }
            if(updateUser.getPassword().length() < 20 && updateUser.getPassword().length() > 8){
            String msg = isValidPassword(updateUser.getPassword(), language);
            if (!msg.equals("success") && !msg.equals("성공")) {
                return msg;
            } 
            String salt = HashAndSalt.getSalt();
            String hashedPassword = HashAndSalt.hashAndSaltPassword(updateUser.getPassword(), salt);
            updateUser.setSalt(salt);
            updateUser.setPassword(hashedPassword);
            }

            udb.update(updateUser);
            if (language.equals("en")) {
                return "Update successful!";
            }
            if (language.equals("kr")) {
                return "업데이트 성공!";
            }
            return "";

        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            if (language.equals("en")) {
                return "Error occurred during update!";
            }
            if (language.equals("kr")) {
                return "업데이트 중 오류가 발생했습니다!";
            }
            return "";

        }
    }

    //for validation
    public void updateStatus(User updateUser) {
        try {
            udb.update(updateUser);
        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
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

    public String updateValidate(String email, String phone, String language, User loggedUser) {
        try {
            List<User> users = getAll();
            for (User user : users) {
                if (!email.equals(loggedUser.getEmailAddress()) && email.equals(user.getEmailAddress())) {
                    if (language.equals("en")) {
                        return "Sorry, this email is already taken";
                    }
                    if (language.equals("kr")) {
                        return "이메일이 이미 사용되었습니다!";
                    }
                }

                if (!phone.equals(loggedUser.getPhoneNumber()) && phone.equals(user.getPhoneNumber())) {
                    if (language.equals("en")) {
                        return "Sorry, this phone number is already taken";
                    }
                    if (language.equals("kr")) {
                        return "전화번호가 이미 사용 중입니다!";
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            if (language.equals("en")) {
                return "Error occurred during update!";
            }
            if (language.equals("kr")) {
                return "업데이트 중 오류가 발생했습니다!";
            }
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

    public String isValidPassword(String password, String language) {
        if (password.length() > 15 || password.length() < 8) {
            if (language.equals("en")) {
                return "Password must be less than 20 and more than 8 characters in length.";
            }
            if (language.equals("kr")) {
                return "비밀번호는 20자 미만, 8자 이상이어야 합니다..";
            }

        }
        String lowerCaseChars = "(.*[a-z].*)";
        if (!password.matches(lowerCaseChars)) {
            if (language.equals("en")) {
                return "Password must have at least one lowercase character ";
            }
            if (language.equals("kr")) {
                return "암호에는 소문자가 하나 이상 있어야 합니다.";
            }

        }
        String numbers = "(.*[0-9].*)";
        if (!password.matches(numbers)) {
            if (language.equals("en")) {
                return "Password must have at least one number";
            }
            if (language.equals("kr")) {
                return "비밀번호는 하나 이상의 숫자를 포함해야 합니다.";
            }

        }
        if (language.equals("en")) {
            return "success";
        }
        if (language.equals("kr")) {
            return "성공";
        }
        return "";

    }

    public String login(String email, String password, String language) throws Exception {
        if (language == null) {
            language = "en";
        }
        // Retrieve the user by email
        User user = udb.getByEmail(email);
        if (user == null) {
            if (language.equals("en")) {
                return "Your email or password was entered incorrectly!";
            }
            if (language.equals("kr")) {
                return "이메일 또는 비밀번호가 잘못 입력되었습니다!";
            }
        }
//
        String salt = user.getSalt();
        String hashedPassword = HashAndSalt.hashAndSaltPassword(password, salt);
//
        if (user != null) {
            if (user.getIsactive() == 2) {
                if (language.equals("en")) {
                    return "This account has been deactivated";
                }
                if (language.equals("kr")) {
                    return "이 계정은 비활성화되었습니다";
                }
            }
            if (!user.getPassword().equals(hashedPassword)) {
                if (language.equals("en")) {
                    return "Your email or password was entered incorrectly!";
                }
                if (language.equals("kr")) {
                    return "이메일 또는 비밀번호가 잘못 입력되었습니다!";
                }
            }
            if (user.getIsValid() == 2) {
                if (language.equals("en")) {
                    return "User has not validated account. Please validate!";
                }
                if (language.equals("kr")) {
                    return "사용자가 계정을 확인하지 않았습니다. 확인해주세요!";
                }
            }
            if (language.equals("en")) {
                return "Login";
            }
            if (language.equals("kr")) {
                return "로그인";
            }

        }
        if (language.equals("en")) {
            return "Your email or password was entered incorrectly!";
        }
        if (language.equals("kr")) {
            return "이메일 또는 비밀번호가 잘못 입력되었습니다!";
        }

        return "";
    }

//for validate email
    public String verify(User user, String language) throws Exception {
        if (user == null) {
            if (language.equals("en")) {
                return "We can't find your email!";
            }
            if (language.equals("kr")) {
                return "이메일을 찾을 수 없습니다!";
            }
        } else {
            if (user.getIsValid() == 2) {
                if (language.equals("en")) {
                    return "Please Validate Account";
                }
                if (language.equals("kr")) {
                    return "계정을 확인하십시오";
                }

            }
            if (user.getIsactive() == 2) {
                if (language.equals("en")) {
                    return "User not active.  Please talk to an admin to activate!";
                }
                if (language.equals("kr")) {
                    return "사용자가 활동하지 않습니다. 활성화하려면 관리자에게 문의하세요!";
                }

            }
            if (language.equals("en")) {
                return "success";
            }
            if (language.equals("kr")) {
                return "성공";
            }
        }
        return "";
    }

    public void deActivate(int userId) {
        try {
            User user = udb.get(userId);
            user.setIsactive(2);
            udb.update(user);
        } catch (Exception ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void add(String firstName, String lastName, String email, String phone, String password, int userId, int roleid, int i) {
        User user = new User(firstName, lastName, email, phone);
        UserDB udb = new UserDB();
        RoleDB rdb = new RoleDB();
        Role role = rdb.getRoleid(roleid);
        user.setRoleid(role);
        udb.add(user);

    }
}
