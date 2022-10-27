package GU.business;

import java.io.Serializable;
public class Student implements Serializable {
    private int sn;
    private String engName;
    private String cnName;
    private String id;
    private String nationality;
    private String classid;
    private String major;
    private String cnmajor;
    private String gender;
    private String cngender;
    private String dob;
    private String degree;
    private String cndegree;
    private String phone;
    private String email;
    private String passportNo;

    public Student() {
        sn=0;
        engName = "";
        cnName = "";
        id = "";
        nationality = "";
        classid = "";
        major = "";
        cnmajor = "";
        cngender = "";
        cndegree = "";
        gender = "";
        dob = "";
        degree = "";
        phone = "";
        email = "";
        passportNo = "";
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setEngName(String engName) {
        this.engName = engName;
    }

    public String getEngName() {
        return engName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName;
    }

    public String getCnName() {
        return cnName;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getNationality() {
        return nationality;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMajor() {
        return major;
    }
    
    public void setCnmajor(String cnmajor) {
        this.cnmajor = cnmajor;
    }

    public String getCnmajor() {
        return cnmajor;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }
   
    public void setCngender(String cngender) {
        this.cngender = cngender;
    }

    public String getCngender() {
        return cngender;
    }
    
    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getDob() {
        return dob;
    }
    
    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getDegree() {
        return degree;
    }
    
    public void setCndegree(String cndegree) {
        this.cndegree = cndegree;
    }

    public String getCndegree() {
        return cndegree;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public void setPassportNo(String passportNo) {
        this.passportNo = passportNo;
    }

    public String getPassportNo() {
        return passportNo;
    }
    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getClassid() {
        return classid;
    }
}

