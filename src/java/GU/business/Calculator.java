package GU.business;

import java.io.Serializable;

public class Calculator implements Serializable {
    private int id;
    private String name;
    private String course;
    private String grade;
    private String usgrade;
    private double cngp;
    private double usgp;
    private String unit;

    public Calculator() {
        id=0;
        name = "";
        course = "";
        grade = "";
        usgrade = "";
        cngp = 0;
        usgp = 0;
        unit = "";
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    
    public void setCourse(String course) {
        this.course = course;
    }

    public String getCourse() {
        return course;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    
    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }
    
    public void setUsgrade(String usgrade) {
        this.usgrade = usgrade;
    }

    public String getUsgrade() {
        return usgrade;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setCngp(double cngp) {
        this.cngp = cngp;
    }

    public double getCngp() {
        return cngp;
    }
    
    public void setUsgp(double usgp) {
        this.usgp = usgp;
    }

    public double getUsgp() {
        return usgp;
    }
}

    

