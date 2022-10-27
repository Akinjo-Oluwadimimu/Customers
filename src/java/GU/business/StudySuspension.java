package GU.business;

import java.io.Serializable;

public class StudySuspension implements Serializable {
    private int sn;
    private String engname;
    private String cnname;
    private String id;
    private String classid;
    private String suspensionreason;
    private String evidence;
    private String date;
    
    public StudySuspension() {
        sn=0;
        engname="";
        cnname="";
        id = "";
        classid = "";
        suspensionreason = "";
        evidence = "";
        date = "";
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
    
    public void setEvidence(String evidence) {
        this.evidence = evidence;
    }

    public String getEvidence() {
        return evidence;
    }
    
    public void setSuspensionreason(String suspensionreason) {
        this.suspensionreason = suspensionreason;
    }

    public String getSuspensionreason() {
        return suspensionreason;
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
    
    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }
}
