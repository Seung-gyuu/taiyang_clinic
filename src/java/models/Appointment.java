/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Hussein
 */
@Entity
@Table(name = "appointment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Appointment.findAll", query = "SELECT a FROM Appointment a")
    //passed by range.  Needs test
    , @NamedQuery(name = "Appointment.findPassedByRange", query = "SELECT a FROM Appointment a where a.timeid.fulldate.fulldate <=CURRENT_DATE and a.timeid.fulldate.fulldate<=:startDate and a.isupcoming=2")
    //needs test
    , @NamedQuery(name = "Appointment.findUpcomingByRange", query = "SELECT a FROM Appointment a where a.timeid.fulldate.fulldate >=CURRENT_DATE and a.timeid.fulldate.fulldate <=:endDate and a.isupcoming=1")
    , @NamedQuery(name = "Appointment.findByAppointmentid", query = "SELECT a FROM Appointment a WHERE a.appointmentid = :appointmentid")
    , @NamedQuery(name = "Appointment.findAppointmentsByDate", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.fulldate = :date")    
        , @NamedQuery(name = "Appointment.findByMonthYearTotal", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.monthName= :month and a.timeid.fulldate.year= :year order by a.timeid.fulldate.fulldate, a.status")
        , @NamedQuery(name = "Appointment.findByMonthYearConfirmed", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.monthName= :month and a.timeid.fulldate.year= :year and a.status='Confirmed' order by a.timeid.fulldate.fulldate")
        , @NamedQuery(name = "Appointment.findByMonthYearCanceled", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.monthName= :month and a.timeid.fulldate.year= :year and a.status='Canceled' order by a.timeid.fulldate.fulldate")
    , @NamedQuery(name = "Appointment.findByTimeId", query = "SELECT a FROM Appointment a WHERE a.timeid.timeid = :timeid AND a.status='Confirmed'")
    , @NamedQuery(name = "Appointment.findByDescription", query = "SELECT a FROM Appointment a WHERE a.description = :description")
    , @NamedQuery(name = "Appointment.findByUpcoming", query = "SELECT a FROM Appointment a WHERE a.isupcoming = 1")
    , @NamedQuery(name = "Appointment.findByTodayAppt", query = "SELECT a FROM Appointment a WHERE a.isupcoming = 1 AND a.status ='Confirmed' AND a.timeid.fulldate.fulldate = CURRENT_DATE AND a.timeid.startTime >= CURRENT_TIME")
    , @NamedQuery(name = "Appointment.findInRange", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.fulldate >=:startdate AND a.timeid.fulldate.fulldate<=:enddate")
    , @NamedQuery(name = "Appointment.findByPassed", query = "SELECT a FROM Appointment a WHERE a.isupcoming = 2")
    , @NamedQuery(name = "Appointment.findOutdated", query = "SELECT a FROM Appointment a WHERE a.timeid.fulldate.fulldate < CURRENT_DATE or ( a.timeid.fulldate.fulldate = CURRENT_DATE and a.timeid.startTime < CURRENT_TIMESTAMP)")
    , @NamedQuery(name = "Appointment.findUserUpcoming", query = "SELECT a FROM Appointment a WHERE a.isupcoming = 1 AND a.userid.userid = :userid AND a.status ='Confirmed'")
    , @NamedQuery(name = "Appointment.findUserPassed", query = "SELECT a FROM Appointment a WHERE a.isupcoming = 2 AND a.userid.userid = :userid AND a.status ='Confirmed'")
    , @NamedQuery(name = "Appointment.findByUserIdandUpcoming", query = "SELECT a FROM Appointment a WHERE a.isupcoming = :isupcoming")})
public class Appointment implements Serializable {

    @Basic(optional = false)
    @Column(name = "isupcoming")
    private int isupcoming;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "appointmentid")
    private Integer appointmentid;
    @Column(name = "description")
    private String description;
    @Column(name = "status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appointmentid", fetch = FetchType.EAGER)
    private List<Reminder> reminderList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typereminder", fetch = FetchType.EAGER)
//    private List<Reminder> reminderList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appointmentid", fetch = FetchType.EAGER)
    private List<Sentreminders> sentremindersList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typereminder", fetch = FetchType.EAGER)
//    private List<Sentreminders> sentremindersList1;
    @JoinColumn(name = "serviceid", referencedColumnName = "serviceid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Service serviceid;
    @JoinColumn(name = "timeid", referencedColumnName = "timeid")
    @ManyToOne(fetch = FetchType.EAGER)
    private Availabletime timeid;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Appointment() {
    }

    public Appointment(Integer appointmentid) {
        this.appointmentid = appointmentid;
    }

    public Integer getAppointmentid() {
        return appointmentid;
    }

    public void setAppointmentid(Integer appointmentid) {
        this.appointmentid = appointmentid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public List<Reminder> getReminderList() {
        return reminderList;
    }

    public void setReminderList(List<Reminder> reminderList) {
        this.reminderList = reminderList;
    }

    @XmlTransient
    public List<Sentreminders> getSentremindersList() {
        return sentremindersList;
    }

    public void setSentremindersList(List<Sentreminders> sentremindersList) {
        this.sentremindersList = sentremindersList;
    }

    public Service getServiceid() {
        return serviceid;
    }

    public void setServiceid(Service serviceid) {
        this.serviceid = serviceid;
    }

    public Availabletime getTimeid() {
        return timeid;
    }

    public void setTimeid(Availabletime timeid) {
        this.timeid = timeid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (appointmentid != null ? appointmentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Appointment)) {
            return false;
        }
        Appointment other = (Appointment) object;
        if ((this.appointmentid == null && other.appointmentid != null) || (this.appointmentid != null && !this.appointmentid.equals(other.appointmentid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.Appointment[ appointmentid=" + appointmentid + " ]";
    }

    public int getIsupcoming() {
        return isupcoming;
    }

    public void setIsupcoming(int isupcoming) {
        this.isupcoming = isupcoming;
    }

}
