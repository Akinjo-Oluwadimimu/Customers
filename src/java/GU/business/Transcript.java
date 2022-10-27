package GU.business;

import java.io.Serializable;
public class Transcript implements Serializable {
    
    private String courseCode;
    private String courseTitle;
    private String session;
    private String grade;
    private double unit;
    private double gp;
    private double total;
    private double gpa;

    public Transcript() {
        courseCode = "";
        courseTitle = "";
        session = "";
        grade = "";
        unit = 0;
        gp = 0;
        total = 0;
        gpa = 0;
    }
    
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseCode() {
        return courseCode;
    }
    
    public void setSession(String session) {
        this.session = session;
    }

    public String getSession() {
        return session;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }

    public void setUnit(double unit) {
        this.unit = unit;
    }

    public double getUnit() {
        return unit;
    }

    public void setGp(double gp) {
        this.gp = gp;
    }

    public double getGp() {
        return gp;
    }
   
    public void setTotal(double total) {
        this.total = total;
    }

    public double getTotal() {
        return total;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public double getGpa() {
        return gpa;
    }
}