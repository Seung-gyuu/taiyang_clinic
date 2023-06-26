/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import models.*;
import services.*;

/**
 *
 * @author Hussein
 */
public class SendReminderEmail extends TimerTask {

    private ServletContext context;

    public SendReminderEmail(ServletContext context) {
        this.context = context;
    }

    @Override
    public void run() {
        ReminderService rs = new ReminderService();
        try {
            List<Reminder> reminders = rs.getPassed();
            for (Reminder r : reminders) {
                //send email here       
                String emailPath = context.getRealPath("/WEB-INF/emailTemplate/reminder.jsp");
                HashMap<String, String> tags = new HashMap<>();
                tags.put("name", r.getUserid().getFirstname());
                tags.put("appointmentDate", r.getAppointmentid().getTimeid().getFulldate().toString());
                tags.put("startTime", r.getAppointmentid().getTimeid().getTruncatedStartTime());
                tags.put("endTime", r.getAppointmentid().getTimeid().getTruncatedEndTime());
                tags.put("service", r.getAppointmentid().getServiceid().getServiceName());
                SendEmail.sendMail(r.getUserid().getEmailAddress(), "Taiyang clinic- Upcoming Appointment Reminder", emailPath, tags);
                rs.delete(r);   // rs.delete also inserts into sent reminder table.               
            }
        } catch (Exception ex) {
            Logger.getLogger(SendReminderEmail.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
