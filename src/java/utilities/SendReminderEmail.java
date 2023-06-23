/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.util.List;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;
import services.*;

/**
 *
 * @author Hussein
 */
public class SendReminderEmail extends TimerTask{

    @Override
    public void run() {
        ReminderService rs = new ReminderService();
        try {
            List<Reminder> reminders = rs.getPassed();
            for(Reminder r : reminders){
                //send email here
                //rs.delete(r);   // rs.delete also inserts into sent reminder table.
                System.out.print("Hello");
            }
        } catch (Exception ex) {
            Logger.getLogger(SendReminderEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
