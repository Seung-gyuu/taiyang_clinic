/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import services.AvailableTimeService;

/**
 *
 * @author Hussein
 */
@Entity
@Table(name = "day")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Day.findAll", query = "SELECT d FROM Day d")
    , @NamedQuery(name = "Day.findCurrentWeek4Months", query = "SELECT d FROM Day d WHERE d.fulldate >= :startDate AND d.fulldate <= :endDate")
    , @NamedQuery(name = "Day.findByRange", query = "SELECT d FROM Day d WHERE d.fulldate >= :startDate AND d.fulldate <= :endDate")
    , @NamedQuery(name = "Day.find4Months", query = "SELECT d FROM Day d WHERE d.fulldate >= :currentDate AND d.fulldate <= :endDate")
    , @NamedQuery(name = "Day.findLast4Months", query = "SELECT d FROM Day d WHERE d.fulldate <= :currentDate AND d.fulldate >= :startDate")
    , @NamedQuery(name = "Day.findUpcomingByWeeks", query = "SELECT d FROM Day d WHERE d.fulldate >= :currentDate AND d.fulldate <= :endDate")
    , @NamedQuery(name = "Day.findPreviousByWeeks", query = "SELECT d FROM Day d WHERE d.fulldate <= :currentDate AND d.fulldate >= :startDate")
    , @NamedQuery(name = "Day.findByFulldate", query = "SELECT d FROM Day d WHERE d.fulldate = :fulldate")
    , @NamedQuery(name = "Day.findByYear", query = "SELECT d FROM Day d WHERE d.year = :year")
    , @NamedQuery(name = "Day.findByDayname", query = "SELECT d FROM Day d WHERE d.dayname = :dayname")
    , @NamedQuery(name = "Day.findByDaynumber", query = "SELECT d FROM Day d WHERE d.daynumber = :daynumber")
    , @NamedQuery(name = "Day.findByMonthName", query = "SELECT d FROM Day d WHERE d.monthName = :monthName")})
public class Day implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "fulldate")
    @Temporal(TemporalType.DATE)
    private Date fulldate;
    @Basic(optional = false)
    @Column(name = "year")
    private int year;
    @Basic(optional = false)
    @Column(name = "dayname")
    private String dayname;
    @Basic(optional = false)
    @Column(name = "daynumber")
    private int daynumber;
    @Basic(optional = false)
    @Column(name = "month_Name")
    private String monthName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fulldate", fetch = FetchType.EAGER)
    private List<Availabletime> availabletimeList;

    public Day() {
    }

    public Day(Date fulldate) {
        this.fulldate = fulldate;
    }

    public Day(Date fulldate, int year, String dayname, int daynumber, String monthName) {
        this.fulldate = fulldate;
        this.year = year;
        this.dayname = dayname;
        this.daynumber = daynumber;
        this.monthName = monthName;
    }

    public Date getFulldate() {
        return fulldate;
    }

    public void setFulldate(Date fulldate) {
        this.fulldate = fulldate;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getDayname() {
        return dayname;
    }

    public void setDayname(String dayname) {
        this.dayname = dayname;
    }

    public int getDaynumber() {
        return daynumber;
    }

    public void setDaynumber(int daynumber) {
        this.daynumber = daynumber;
    }

    public String getMonthName() {
        return monthName;
    }

    public void setMonthName(String monthName) {
        this.monthName = monthName;
    }

    @XmlTransient
    public List<Availabletime> getAvailabletimeList() throws Exception {
        AvailableTimeService as = new AvailableTimeService();
        this.availabletimeList=as.findByDate(this.fulldate);
        return availabletimeList;
    }

    public void setAvailabletimeList(List<Availabletime> availabletimeList) {
        this.availabletimeList = availabletimeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fulldate != null ? fulldate.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Day)) {
            return false;
        }
        Day other = (Day) object;
        if ((this.fulldate == null && other.fulldate != null) || (this.fulldate != null && !this.fulldate.equals(other.fulldate))) {
            return false;
        }
        return true;
    }
    
    public String getTruncatedDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd yyyy");
        return dateFormat.format(fulldate);
    }
    
    public static int getMonthNumber(String month){
        switch (month) {
        case "January":
            return 0;
        case "February":
            return 1;
        case "March":
            return 2;
        case "April":
            return 3;
        case "May":
            return 4;
        case "June":
            return 5;
        case "July":
            return 6;
        case "August":
            return 7;
        case "September":
            return 8;
        case "October":
            return 9;
        case "November":
            return 10;
        case "December":
            return 11;
        default:
            throw new IllegalArgumentException("Invalid month: " + month);
    }
    }
    

    @Override
    public String toString() {
         SimpleDateFormat outputFormat = new SimpleDateFormat("EEE, MMM dd yyyy");
        return outputFormat.format(fulldate);
//        return "test.Day[ fulldate=" +  + " ]";
    }
    
}
