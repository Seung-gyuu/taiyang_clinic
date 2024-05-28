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
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
    , @NamedQuery(name = "User.findByUserid", query = "SELECT u FROM User u WHERE u.userid = :userid")
    , @NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname")
    , @NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname")
    , @NamedQuery(name = "User.findByEmailAddress", query = "SELECT u FROM User u WHERE u.emailAddress = :emailAddress")
    , @NamedQuery(name = "User.findByPhoneNumber", query = "SELECT u FROM User u WHERE u.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")
    , @NamedQuery(name = "User.findByIsactive", query = "SELECT u FROM User u WHERE u.isactive = :isactive")})
public class User implements Serializable {

    @Basic(optional = false)
    @Column(name = "isValid")
    private int isValid;
    @Basic(optional = false)
    @Column(name = "isactive")
    private int isactive;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Validatetokens> validatetokensList;

    @Column(name = "salt")
    private String salt;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Medicalform> medicalformList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Passwordtokens> passwordtokensList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Consentform> consentformList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "userid")
    private Integer userid;
    @Basic(optional = false)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @Column(name = "email_address")
    private String emailAddress;
    @Basic(optional = false)
    @Column(name = "phone_number")
    private String phoneNumber;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Reminder> reminderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Sentreminders> sentremindersList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userid", fetch = FetchType.EAGER)
    private List<Appointment> appointmentList;
    @JoinColumn(name = "roleid", referencedColumnName = "roleid")
    @ManyToOne(fetch = FetchType.EAGER)
    private Role roleid;

    public User() {
    }

    public User(Integer userid) {
        this.userid = userid;
    }

    public User(Integer userid, String firstname, String lastname, String emailAddress, String phoneNumber, String password) {
        this.userid = userid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    public User(String firstName, String lastName, String email, String phone) {
        this.firstname = firstName;
        this.lastname = lastName;
        this.emailAddress = email;
        this.phoneNumber = phone;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    @XmlTransient
    public List<Appointment> getAppointmentList() {
        return appointmentList;
    }

    public void setAppointmentList(List<Appointment> appointmentList) {
        this.appointmentList = appointmentList;
    }

    public Role getRoleid() {
        return roleid;
    }

    public void setRoleid(Role roleid) {
        this.roleid = roleid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userid != null ? userid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userid == null && other.userid != null) || (this.userid != null && !this.userid.equals(other.userid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.User[ userid=" + userid + " ]";
    }

    @XmlTransient
    public List<Medicalform> getMedicalformList() {
        return medicalformList;
    }

    public void setMedicalformList(List<Medicalform> medicalformList) {
        this.medicalformList = medicalformList;
    }

    @XmlTransient
    public List<Passwordtokens> getPasswordtokensList() {
        return passwordtokensList;
    }

    public void setPasswordtokensList(List<Passwordtokens> passwordtokensList) {
        this.passwordtokensList = passwordtokensList;
    }

    @XmlTransient
    public List<Consentform> getConsentformList() {
        return consentformList;
    }

    public void setConsentformList(List<Consentform> consentformList) {
        this.consentformList = consentformList;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @XmlTransient
    public List<Validatetokens> getValidatetokensList() {
        return validatetokensList;
    }

    public void setValidatetokensList(List<Validatetokens> validatetokensList) {
        this.validatetokensList = validatetokensList;
    }

    public int getIsValid() {
        return isValid;
    }

    public void setIsValid(int isValid) {
        this.isValid = isValid;
    }

    public int getIsactive() {
        return isactive;
    }

    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }
    
}