package GU.business;

import java.io.Serializable;

public class LineItem implements Serializable {

    private Calculator gp;
    private int remove;

    public LineItem() {}

    public void setCalculator(Calculator p) {
        gp = p;
    }

    public Calculator getCalculator() {
        return gp;
    }
    
    public void setRemove(int remove) {
        this.remove = remove;
    }

    public int getRemove() {
        return remove;
    }

}