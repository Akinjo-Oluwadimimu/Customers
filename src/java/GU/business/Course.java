package GU.business;

import java.io.Serializable;
public class Course implements Serializable {
    
    private int sn;
    private String courseTitle;
    private String courseId;
    private String classid;
    private String lecturer;
    private double unit;
    private String grade;
    private String examcomment;
    private int amount;
    private double total;
    

    public Course() {
        sn = 0;
        courseId = "";
        courseTitle = "";
        grade = "";
        lecturer = "";
        unit = 0;
        examcomment = "";
        total = 0;
        amount = 0;
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseTitle() {
        return courseTitle;
    }
    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }
    
    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getClassid() {
        return classid;
    }
    
    public void setExamComment(String examcomment) {
        this.examcomment = examcomment;
    }

    public String getExamComment() {
        return examcomment;
    }
    
    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }

    public String getLecturer() {
        return lecturer;
    }

    public void setUnit(double unit) {
        this.unit = unit;
    }

    public double getUnit() {
        return unit;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getTotal() {
        return total;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }
}