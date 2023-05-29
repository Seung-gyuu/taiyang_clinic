/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Hussein
 */
@Entity
@Table(name = "availabletime")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Availabletime.findAll", query = "SELECT a FROM Availabletime a")
    , @NamedQuery(name = "Availabletime.findByTimeid", query = "SELECT a FROM Availabletime a WHERE a.timeid = :timeid")
    , @NamedQuery(name = "Availabletime.findByStartTime", query = "SELECT a FROM Availabletime a WHERE a.startTime = :startTime")
    , @NamedQuery(name = "Availabletime.findByEndTime", query = "SELECT a FROM Availabletime a WHERE a.endTime = :endTime")
    , @NamedQuery(name = "Availabletime.findByIsBooked", query = "SELECT a FROM Availabletime a WHERE a.isBooked = :isBooked")})
public class Availabletime implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "timeid")
    private Integer timeid;
    @Basic(optional = false)
    @Column(name = "start_time")
    @Temporal(TemporalType.TIME)
    private Date startTime;
    @Basic(optional = false)
    @Column(name = "end_time")
    @Temporal(TemporalType.TIME)
    private Date endTime;
    @Column(name = "isBooked")
    private Integer isBooked;
    @JoinColumn(name = "fulldate", referencedColumnName = "fulldate")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Day fulldate;
    @OneToMany(mappedBy = "timeid", fetch = FetchType.EAGER)
    private List<Appointment> appointmentList;

    public Availabletime() {
    }

    public Availabletime(Integer timeid) {
        this.timeid = timeid;
    }

    public Availabletime(Integer timeid, Date startTime, Date endTime) {
        this.timeid = timeid;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Integer getTimeid() {
        return timeid;
    }

    public void setTimeid(Integer timeid) {
        this.timeid = timeid;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getIsBooked() {
        return isBooked;
    }

    public void setIsBooked(Integer isBooked) {
        this.isBooked = isBooked;
    }

    public Day getFulldate() {
        return fulldate;
    }

    public void setFulldate(Day fulldate) {
        this.fulldate = fulldate;
    }

    @XmlTransient
    public List<Appointment> getAppointmentList() {
        return appointmentList;
    }

    public void setAppointmentList(List<Appointment> appointmentList) {
        this.appointmentList = appointmentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (timeid != null ? timeid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Availabletime)) {
            return false;
        }
        Availabletime other = (Availabletime) object;
        if ((this.timeid == null && other.timeid != null) || (this.timeid != null && !this.timeid.equals(other.timeid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.Availabletime[ timeid=" + timeid + " ]";
    }
    
}
