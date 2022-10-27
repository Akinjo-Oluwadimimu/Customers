package GU.business;

import java.io.Serializable;

public class RetakeInformation implements Serializable {
    private int sn;
    private String engname;
    private String cnname;
    private String id;
    private String courseTitle;
    private String courseId;
    private String classid;
    private String unit;
    private String amount;
    private String total;
    private String major;
    private String studentcategory;
    private String paymentstatus;
    private String comment;
    
    public RetakeInformation() {
        sn=0;
        engname="";
        cnname="";
        id = "";
        classid = "";
        unit = "";
        amount = "";
        total = "";
        major = "";
        studentcategory = "";
        paymentstatus = "";
        courseId = "";
        courseTitle = "";
        comment = "";
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setEngname(String engname) {
        this.engname = engname;
    }

    public String getEngname() {
        return engname;
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

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
    
    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getClassid() {
        return classid;
    }
    
    public void setCnname(String cnname) {
        this.cnname = cnname;
    }

    public String getCnname() {
        return cnname;
    }
    
    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getAmount() {
        return amount;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getTotal() {
        return total;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMajor() {
        return major;
    }
    
    public void setStudentcategory(String studentcategory) {
        this.studentcategory = studentcategory;
    }

    public String getStudentcategory() {
        return studentcategory;
    }

    public void setPaymentstatus(String paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    public String getPaymentstatus() {
        return paymentstatus;
    }
     
    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }
}
