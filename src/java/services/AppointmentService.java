/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.AppointmentDB;
import java.time.Instant;
import java.util.List;
import models.Appointment;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletContext;
import models.Day;
import models.User;

/**
 *
 * @author Hussein
 */
public class AppointmentService {

    private AppointmentDB adb;

    public AppointmentService() {
        this.adb = new AppointmentDB();
    }

    public List<Appointment> getAll() throws Exception {
        return adb.getAll();
    }

    public Appointment get(Integer appointmentId) {
        return adb.get(appointmentId);
    }

    public Appointment getByTimeId(Integer timeId) {
        return adb.getByTimeId(timeId);
    }

    public List<Appointment> getUpcoming() throws Exception {
        return adb.getUpcoming();
    }

    public List<Appointment> getTodayAppt() throws Exception {
        return adb.getTodayAppt();
    }

    public List<Appointment> getUserUpcoming(int userId) throws Exception {
        return adb.getUserUpcoming(userId);
    }

    public List<Appointment> getPassed() throws Exception {
        return adb.getPassed();
    }

    public List<Appointment> getUserPassed(int userId) throws Exception {
        return adb.getUserPassed(userId);
    }

    public List<Appointment> getPassedRange(int weeks) throws Exception {
        return adb.getPassedRange(weeks);
    }

    public List<Appointment> getUpcomingRange(int weeks) throws Exception {
        return adb.getUpcomingRange(weeks);
    }

    public List<Appointment> findByRange(Date start, Date end) throws Exception {
        return adb.findByRange(start, end);
    }

    public String insert(Appointment appt, String templatePath) throws Exception {
        List<Appointment> appts = this.getUserUpcoming(appt.getUserid().getUserid());
        if (appts.size() >= 3) {
            return "Cannot have more than 3 upcoming appointments at once!";
        }
        adb.insert(appt);
        AvailableTimeService avt = new AvailableTimeService();
        appt.getTimeid().setIsAvailable(2);
        appt.getTimeid().setIsBooked(2);
        avt.update(appt.getTimeid());

        HashMap<String, String> tags = new HashMap<>();
        tags.put("name", appt.getUserid().getFirstname());
        tags.put("appointmentDate", appt.getTimeid().getFulldate().toString());
        tags.put("startTime", appt.getTimeid().getTruncatedStartTime());
        tags.put("endTime", appt.getTimeid().getTruncatedEndTime());
        tags.put("service", appt.getServiceid().getServiceName());

        SendEmail.sendMail(appt.getUserid().getEmailAddress(), "Taiyang clinic- Appointment Confirmation", templatePath, tags);

        return "Appointment Created!";
    }

    public List<Appointment> getOutdated() throws Exception {
        return adb.getOutdated();
    }

    public String delete(Appointment appt, String templatePath) throws Exception {
        LocalDate tmrw = LocalDate.now().plusDays(1);
        Date appointmentDate = appt.getTimeid().getFulldate().getFulldate();
        LocalDate apptLocalDate = appointmentDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if (apptLocalDate.isBefore(tmrw) || apptLocalDate.isEqual(tmrw)) {
            return "Cannot delete an appointment";
        }

        HashMap<String, String> tags = new HashMap<>();
        tags.put("name", appt.getUserid().getFirstname());
        tags.put("appointmentDate", appt.getTimeid().getFulldate().toString());
        tags.put("startTime", appt.getTimeid().getTruncatedStartTime());
        tags.put("endTime", appt.getTimeid().getTruncatedEndTime());
        tags.put("service", appt.getServiceid().getServiceName());

        appt.setStatus("Canceled");
        AvailableTimeService avt = new AvailableTimeService();
        appt.getTimeid().setIsAvailable(1);
        appt.getTimeid().setIsBooked(1);
        avt.update(appt.getTimeid());
        adb.update(appt);

        SendEmail.sendMail(appt.getUserid().getEmailAddress(), "Taiyang clinic- Appointment Cancellation Confirmation", templatePath, tags);

        return "Appointment Deleted!";
    }

    public String update(Appointment a) throws Exception {
        adb.update(a);
        return "Updated";
    }

}
