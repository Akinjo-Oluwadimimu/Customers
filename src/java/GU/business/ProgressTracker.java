package GU.business;

import java.io.Serializable;

public class ProgressTracker implements Serializable {
    private int taskId;
    private String category;
    private String subject;
    private String studentId;
    private String start;
    private String due;
    private boolean status;
    private int position;

    public ProgressTracker() {
        taskId= 0;
        category = "";
        subject = "";
        studentId = "";
        start = "";
        due = "";
        position = 0;
        status = false;
    }
    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getTaskId() {
        return taskId;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSubject() {
        return subject;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }
    
    public void setStart(String start) {
        this.start = start;
    }

    public String getStart() {
        return start;
    }
    
    public void setDue(String due) {
        this.due = due;
    }

    public String getDue() {
        return due;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean getStatus() {
        return status;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getPosition() {
        return position;
    }
}