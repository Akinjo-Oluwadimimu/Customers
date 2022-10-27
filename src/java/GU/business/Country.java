package GU.business;

import java.io.Serializable;

public class Country implements Serializable {

    private String name;

    public Country() {
        name = "";
    }

    public Country(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}