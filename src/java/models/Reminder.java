/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Hussein
 */
@Entity
@Table(name = "reminder")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reminder.findAll", query = "SELECT r FROM Reminder r")
    , @NamedQuery(name = "Reminder.findByReminderid", query = "SELECT r FROM Reminder r WHERE r.reminderid = :reminderid")
    , @NamedQuery(name = "Reminder.findByPassed", query = "SELECT r FROM Reminder r WHERE :currentTime>=r.sendTime")    
    , @NamedQuery(name = "Reminder.findBySendTime", query = "SELECT r FROM Reminder r WHERE r.sendTime = :sendTime")})
public class Reminder implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "reminderid")
    private Integer reminderid;
    @Basic(optional = false)
    @Column(name = "sendTime")
    @Temporal(TemporalType.DATE)
    private Date sendTime;
    @JoinColumn(name = "appointmentid", referencedColumnName = "appointmentid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Appointment appointmentid;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Reminder() {
    }

    public Reminder(Integer reminderid) {
        this.reminderid = reminderid;
    }

    public Reminder(Integer reminderid, Date sendTime) {
        this.reminderid = reminderid;
        this.sendTime = sendTime;
    }

    public Integer getReminderid() {
        return reminderid;
    }

    public void setReminderid(Integer reminderid) {
        this.reminderid = reminderid;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Appointment getAppointmentid() {
        return appointmentid;
    }

    public void setAppointmentid(Appointment appointmentid) {
        this.appointmentid = appointmentid;
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
        hash += (reminderid != null ? reminderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reminder)) {
            return false;
        }
        Reminder other = (Reminder) object;
        if ((this.reminderid == null && other.reminderid != null) || (this.reminderid != null && !this.reminderid.equals(other.reminderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.Reminder[ reminderid=" + reminderid + " ]";
    }
    
}
