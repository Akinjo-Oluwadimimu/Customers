package GU.business;

import java.io.Serializable;

public class RetakeReceiptInformation implements Serializable {
    private int sn;
    private String engname;
    private String classid;
    private String cnname;
    private String id;
    private boolean approved;
    private String receipt;
    private String submissionDate;
    public RetakeReceiptInformation() {
        classid="";
        sn=0;
        engname="";
        cnname="";
        id="";
        approved=false;
        receipt="";
        submissionDate="";
    }
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getClassid() {
        return classid;
    }
    
    public String getEngname(){
        return engname;
    }
    
    public void setEngname(String engname){
        this.engname=engname;
    }
    
    public String getCnname(){
        return cnname;
    }
    
    public void setCnname(String cnname){
        this.cnname=cnname;
    }
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id=id;
    }
    
    public boolean getApproved(){
        return approved;
    }
    
    public void setApproved(boolean approved){
        this.approved=approved;
    }

    public String getSubmissionDate(){
        return submissionDate;
    }
    
    public void setSubmissionDate(String submissionDate){
        this.submissionDate=submissionDate;
    }
    
     public String getReceipt(){
        return receipt;
    }
    
    public void setReceipt(String receipt){
        this.receipt=receipt;
    }
}
