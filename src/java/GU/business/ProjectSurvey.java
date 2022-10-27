package GU.business;

import java.io.Serializable;

public class ProjectSurvey implements Serializable {
    private int sn;
    private boolean startStatus;
    private String studentId;
    private boolean supervisorContact;
    private String comment;
  public ProjectSurvey() {
        sn=0;
        startStatus=false;
        studentId="";
        supervisorContact=false;
        comment="";
    }
    public void setStartStatus(boolean startStatus) {
        this.startStatus = startStatus;
    }

    public boolean getStartStatus() {
        return startStatus;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }
    
    public void setSupervisorContact(boolean supervisorContact) {
        this.supervisorContact = supervisorContact;
    }

    public boolean getSupervisorContact() {
        return supervisorContact;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }
    
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    
}
