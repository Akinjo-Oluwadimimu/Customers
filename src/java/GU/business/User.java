package GU.business;

import java.io.Serializable;

public class User implements Serializable {
  
    private String username;
    private String password;
    private String usertype;
    private int changepassword;

    public User() {
        username = "";
        changepassword = 0;
        usertype = "";
    }

    public User(String username, String usertype, int changepassword) {
        this.username = username;
        this.usertype = usertype;
        this.changepassword = changepassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public int getChangepassword() {
        return changepassword;
    }

    public void setChangepassword(int changepassword) {
        this.changepassword = changepassword;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUsertype() {
        return usertype;
    }
    
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
}
