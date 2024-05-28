/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import dataaccess.*;
import java.util.List;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.*;
import models.*;

/**
 *
 * @author 00cap
 */
public class UpdateOldAppointments extends TimerTask {

    @Override
    public void run() {
        try {
            AppointmentService as = new AppointmentService();
            List<Appointment> apps = as.getOutdated();
            for (Appointment a : apps) {
                a.setIsupcoming(2);
                as.update(a);
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateOldAppointments.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
