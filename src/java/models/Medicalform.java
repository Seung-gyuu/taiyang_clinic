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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 00cap
 */
@Entity
@Table(name = "medicalform")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicalform.findAll", query = "SELECT m FROM Medicalform m")
    , @NamedQuery(name = "Medicalform.findById", query = "SELECT m FROM Medicalform m WHERE m.id = :id")
    , @NamedQuery(name = "Medicalform.findByUserid", query = "SELECT m FROM Medicalform m WHERE m.userid.userid = :userid")
    , @NamedQuery(name = "Medicalform.findByTimeAdded", query = "SELECT m FROM Medicalform m WHERE m.timeAdded = :timeAdded")})
public class Medicalform implements Serializable {

    @Basic(optional = false)
    @Lob
    @Column(name = "pdfFile")
    private byte[] pdfFile;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "timeAdded")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeAdded;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Medicalform() {
    }

    public Medicalform(Integer id) {
        this.id = id;
    }

    public Medicalform(Integer id, byte[] pdfFile, Date timeAdded) {
        this.id = id;
        this.pdfFile = pdfFile;
        this.timeAdded = timeAdded;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Date getTimeAdded() {
        return timeAdded;
    }

    public void setTimeAdded(Date timeAdded) {
        this.timeAdded = timeAdded;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicalform)) {
            return false;
        }
        Medicalform other = (Medicalform) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Medicalform[ id=" + id + " ]";
    }

    public byte[] getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(byte[] pdfFile) {
        this.pdfFile = pdfFile;
    }
    
}