package GU.business;

import java.io.Serializable;

public class RetakeApplication implements Serializable {
    private int sn;
    private String courseId;
    private String studentId;
    
    
    public RetakeApplication() {
        sn=0;
        courseId = "";
        studentId = "";
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }
    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseId() {
        return courseId;
    }

}
