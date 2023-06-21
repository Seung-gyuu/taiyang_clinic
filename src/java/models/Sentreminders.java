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
@Table(name = "sentreminders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sentreminders.findAll", query = "SELECT s FROM Sentreminders s")
    , @NamedQuery(name = "Sentreminders.findBySentreminderid", query = "SELECT s FROM Sentreminders s WHERE s.sentreminderid = :sentreminderid")
    , @NamedQuery(name = "Sentreminders.findBySentTime", query = "SELECT s FROM Sentreminders s WHERE s.sentTime = :sentTime")})
public class Sentreminders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sentreminderid")
    private Integer sentreminderid;
    @Basic(optional = false)
    @Column(name = "sentTime")
    @Temporal(TemporalType.DATE)
    private Date sentTime;
    @JoinColumn(name = "appointmentid", referencedColumnName = "appointmentid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Appointment appointmentid;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Sentreminders() {
    }

    public Sentreminders(Integer sentreminderid) {
        this.sentreminderid = sentreminderid;
    }

    public Sentreminders(Integer sentreminderid, Date sentTime) {
        this.sentreminderid = sentreminderid;
        this.sentTime = sentTime;
    }

    public Integer getSentreminderid() {
        return sentreminderid;
    }

    public void setSentreminderid(Integer sentreminderid) {
        this.sentreminderid = sentreminderid;
    }

    public Date getSentTime() {
        return sentTime;
    }

    public void setSentTime(Date sentTime) {
        this.sentTime = sentTime;
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
        hash += (sentreminderid != null ? sentreminderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sentreminders)) {
            return false;
        }
        Sentreminders other = (Sentreminders) object;
        if ((this.sentreminderid == null && other.sentreminderid != null) || (this.sentreminderid != null && !this.sentreminderid.equals(other.sentreminderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.Sentreminders[ sentreminderid=" + sentreminderid + " ]";
    }
    
}
