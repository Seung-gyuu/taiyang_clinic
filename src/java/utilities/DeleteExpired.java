package utilities;

import dataaccess.PasswordTokensDB;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.ForgotPassordServlets;

/**
 * 
 * @author user
 */
public class DeleteExpired extends TimerTask {

    //token part
    @Override
    public void run() {
        try {
            PasswordTokensDB passwordTokensDB = new PasswordTokensDB();
           passwordTokensDB.getExpired();
            System.out.println("Expired tokens deleted successfully.");
        } catch (Exception ex) {
             Logger.getLogger(DeleteExpired.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //maybe appointment?

}
