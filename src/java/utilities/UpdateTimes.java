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
import services.*;
import models.*;

/**
 *
 * @author Hussein
 */
public class UpdateTimes extends TimerTask {

    @Override
    public void run(){
        try {
            AvailableTimeService avt = new AvailableTimeService();
            List<Availabletime> passedTimes= avt.findAllPassed();
            for(Availabletime t : passedTimes){
                t.setIsAvailable(2);
                avt.update(t);
            }
            passedTimes= avt.findAllPassedToday();
            for(Availabletime t : passedTimes){
                t.setIsAvailable(2);
                avt.update(t);
            }
            
            //List<Availabletime> bookedTimes;
            //List<Availabletime> bookedTimes1 = avt.findAllPassedBooked();
            List<Availabletime> bookedTimes2 = avt.findAllUpcomingBooked();
            //bookedTimes1.addAll(0, bookedTimes2);
            //bookedTimes=bookedTimes1;
            for(Availabletime t : bookedTimes2){
                t.setIsAvailable(2);
                avt.update(t);
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateTimes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
