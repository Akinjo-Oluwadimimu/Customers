package GU.business;

import java.io.Serializable;

public class Supervisor implements Serializable {
    private int sn;
private String name;
private String id;
private String department;
    public Supervisor() {
        sn=0;
        name="";
        id="";
        department="";
    }
public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDepartment() {
        return department;
    }
 
}
