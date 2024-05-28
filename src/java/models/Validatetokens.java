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
@Table(name = "validatetokens")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Validatetokens.findAll", query = "SELECT v FROM Validatetokens v")
    , @NamedQuery(name = "Validatetokens.findById", query = "SELECT v FROM Validatetokens v WHERE v.id = :id")
    , @NamedQuery(name = "Validatetokens.findByUserId", query = "SELECT v FROM Validatetokens v WHERE v.userid = :userid")
    , @NamedQuery(name = "Validatetokens.findByToken", query = "SELECT v FROM Validatetokens v WHERE v.validatetoken = :validatetoken")
    , @NamedQuery(name = "Validatetokens.findByTokenAndExpiry", query = "SELECT v FROM Validatetokens v WHERE v.validatetoken = :validatetoken AND v.expiryDateTime > CURRENT_TIMESTAMP")
    , @NamedQuery(name = "Validatetokens.findByValidatetoken", query = "SELECT v FROM Validatetokens v WHERE v.validatetoken = :validatetoken")
    , @NamedQuery(name = "Validatetokens.findExpired", query = "SELECT v FROM Validatetokens v WHERE v.expiryDateTime < CURRENT_TIMESTAMP")    
    , @NamedQuery(name = "Validatetokens.findByExpiryDateTime", query = "SELECT v FROM Validatetokens v WHERE v.expiryDateTime = :expiryDateTime")})
public class Validatetokens implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "validatetoken")
    private String validatetoken;
    @Basic(optional = false)
    @Column(name = "expiryDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiryDateTime;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Validatetokens() {
    }

    public Validatetokens(Integer id) {
        this.id = id;
    }

    public Validatetokens(Integer id, String validatetoken, Date expiryDateTime) {
        this.id = id;
        this.validatetoken = validatetoken;
        this.expiryDateTime = expiryDateTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValidatetoken() {
        return validatetoken;
    }

    public void setValidatetoken(String validatetoken) {
        this.validatetoken = validatetoken;
    }

    public Date getExpiryDateTime() {
        return expiryDateTime;
    }

    public void setExpiryDateTime(Date expiryDateTime) {
        this.expiryDateTime = expiryDateTime;
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
        if (!(object instanceof Validatetokens)) {
            return false;
        }
        Validatetokens other = (Validatetokens) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Validatetokens[ id=" + id + " ]";
    }
    
}
