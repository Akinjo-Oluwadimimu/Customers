package GU.business;

import java.io.Serializable;
import java.util.ArrayList;

public class GPCalculator implements Serializable {

    private ArrayList<LineItem> items;

    public GPCalculator() {
        items = new ArrayList<>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }
    
    public LineItem getLineItem(String name) {
        LineItem item = new LineItem();
        for (LineItem item1 : items) {
            if (item1.getCalculator().getName().equals(name)) {
                item = item1;
            }
        }
        return item;
    }
    
    public void addRow(LineItem item) {
        items.add(item);
    }

    public void removeRow(LineItem item) {
        String name = item.getCalculator().getName();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getCalculator().getName().equals(name)) {
                items.remove(i);
                return;
            }
        }
    }
}
