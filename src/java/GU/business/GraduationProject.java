package GU.business;

import java.io.Serializable;

public class GraduationProject implements Serializable {
private String studentId;
private String supervisor;
private String projectTitle;
private String submissionDate;
    public GraduationProject() {
        studentId="";
        supervisor="";
        projectTitle="";
        submissionDate="";
    }
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }
    
    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSubmissionDate(String submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getSubmissionDate() {
        return submissionDate;
    }
    
    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getProjectTitle() {
        return projectTitle;
    }
    
}
