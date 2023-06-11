package utilities;

import dataaccess.PasswordTokensDB;
import dataaccess.ValidateTokensDB;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.ForgotPasswordServlets;

/**
 * 
 * @author user
 */
public class DeleteExpired extends TimerTask {

    //token part- validationToken / passwordToken
    @Override
    public void run() {
        try {
            PasswordTokensDB passwordTokensDB = new PasswordTokensDB();
            ValidateTokensDB validateTokensDB = new ValidateTokensDB();
           passwordTokensDB.deleteExpired();
           validateTokensDB.deleteExpired();
            System.out.println("Expired tokens deleted successfully.");
        } catch (Exception ex) {
             Logger.getLogger(DeleteExpired.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
