package GU.business;

import java.io.Serializable;
public class FeeStatement implements Serializable {
    private int sn;
    private String id;
    private double accountBalance;
    private double debt;
    private String description;
    

    public FeeStatement() {
        sn = 0;
        id = "";
        accountBalance = 0;
        description = "";
        debt = 0;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
    
    public void setSn(int sn) {
        this.sn = sn;
    }

    public int getSn() {
        return sn;
    }
    
    public void setAccountBalance(double accountBalance) {
        this.accountBalance = accountBalance;
    }

    public double getAccountBalance() {
        return accountBalance;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

    public double getDebt() {
        return debt;
    }
}