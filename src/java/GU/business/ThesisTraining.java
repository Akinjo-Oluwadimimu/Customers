package GU.business;

import java.io.Serializable;

public class ThesisTraining implements Serializable {
    private int sn;
    private int batch;
    private String thesis;
    private String studentId;
    private String submissionDate;
 
    public ThesisTraining() {
        sn=0;
        thesis="";
        studentId="";
        submissionDate="";
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setBatch(int batch) {
        this.batch = batch;
    }

    public int getBatch() {
        return batch;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }
    
    public void setThesis(String thesis) {
        this.thesis = thesis;
    }

    public String getThesis() {
        return thesis;
    }
    
    public void setSubmissionDate(String submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getSubmissionDate() {
        return submissionDate;
    }
}
