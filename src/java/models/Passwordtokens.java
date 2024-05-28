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
 * @author 00cap
 */
@Entity
@Table(name = "passwordtokens")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Passwordtokens.findAll", query = "SELECT p FROM Passwordtokens p")
    , @NamedQuery(name = "Passwordtokens.findById", query = "SELECT p FROM Passwordtokens p WHERE p.id = :id")
    , @NamedQuery(name = "Passwordtokens.findByUserId", query = "SELECT p FROM Passwordtokens p WHERE p.userid = :userid")
    , @NamedQuery(name = "Passwordtokens.findByToken", query = "SELECT p FROM Passwordtokens p WHERE p.token = :token")
    , @NamedQuery(name = "Passwordtokens.findByTokenAndExpiry", query = "SELECT p FROM Passwordtokens p WHERE p.token = :token AND p.expiryDateTime > CURRENT_TIMESTAMP")
    , @NamedQuery(name = "Passwordtokens.findExpired", query = "SELECT p FROM Passwordtokens p WHERE p.expiryDateTime < CURRENT_TIMESTAMP")
    , @NamedQuery(name = "Passwordtokens.findByExpiryDateTime", query = "SELECT p FROM Passwordtokens p WHERE p.expiryDateTime = :expiryDateTime")})
public class Passwordtokens implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "token")
    private String token;
    @Basic(optional = false)
    @Column(name = "expiryDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiryDateTime;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userid;

    public Passwordtokens() {
    }

    public Passwordtokens(Integer id) {
        this.id = id;
    }

    public Passwordtokens(User userid, String token, Date expiryDateTime) {
        this.userid = userid;
        this.token = token;
        this.expiryDateTime = expiryDateTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
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
        if (!(object instanceof Passwordtokens)) {
            return false;
        }
        Passwordtokens other = (Passwordtokens) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Passwordtokens[ id=" + id + " ]";
    }
    
}
