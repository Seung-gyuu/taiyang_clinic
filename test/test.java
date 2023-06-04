
import dataaccess.AppointmentDB;
import java.util.List;
import models.Appointment;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class test {
         public static void main(String[] args) {

        try {
            AppointmentDB appointmentDAO = new AppointmentDB();

            // Test getPassedRange
            int passedWeeks = 2;
            List<Appointment> passedAppointments = appointmentDAO.getPassedRange(passedWeeks);
            System.out.println("Passed Appointments within the last " + passedWeeks + " weeks:");
            for (Appointment appointment : passedAppointments) {
                System.out.println(appointment.getAppointmentid() + " - " + appointment.getDescription());
            }

            // Test getUpcomingRange
            int upcomingWeeks = 3;
            List<Appointment> upcomingAppointments = appointmentDAO.getUpcomingRange(upcomingWeeks);
            System.out.println("Upcoming Appointments within the next " + upcomingWeeks + " weeks:");
            for (Appointment appointment : upcomingAppointments) {
                System.out.println(appointment.getAppointmentid() + " - " + appointment.getDescription());
            }
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
