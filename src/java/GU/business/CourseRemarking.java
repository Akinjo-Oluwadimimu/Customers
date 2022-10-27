package GU.business;

import java.io.Serializable;
public class CourseRemarking implements Serializable {
    
    private String name;
    private String id;
    private String phone;
    private String currentResult;
    private String expectedResult;
    private String supportingEvidence;
    private String applicationReason;
    private String evidenceOne;
    private String evidenceTwo;
    private String evidenceThree;
    private String courseTitle;
    private String courseId;
    private String classid;
    private String lecturer;
    private String applicationDate;

    public CourseRemarking() {
        name = "";
        id = "";
        phone = "";
        currentResult = "";
        expectedResult = "";
        supportingEvidence = "";
        applicationReason = "";
        evidenceOne = "";
        evidenceTwo = "";
        evidenceThree = "";
        courseId = "";
        courseTitle = "";
        lecturer = "";
        applicationDate = "";
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    
    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseTitle() {
        return courseTitle;
    }
    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseId() {
        return courseId;
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
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }
    
    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }

    public String getLecturer() {
        return lecturer;
    }

    public void setCurrentResult(String currentResult) {
        this.currentResult = currentResult;
    }

    public String getCurrentResult() {
        return currentResult;
    }

    public void setExpectedResult(String expectedResult) {
        this.expectedResult = expectedResult;
    }

    public String getExpectedResult() {
        return expectedResult;
    }

    public void setSupportingEvidence(String supportingEvidence) {
        this.supportingEvidence = supportingEvidence;
    }

    public String getSupportingEvidence() {
        return supportingEvidence;
    }
    
    public void setApplicationReason(String applicationReason) {
        this.applicationReason = applicationReason;
    }

    public String getApplicationReason() {
        return applicationReason;
    }

    public void setEvidenceOne(String evidenceOne) {
        this.evidenceOne = evidenceOne;
    }

    public String getEvidenceOne() {
        return evidenceOne;
    }
     
    public void setEvidenceTwo(String evidenceTwo) {
        this.evidenceTwo = evidenceTwo;
    }

    public String getEvidenceTwo() {
        return evidenceTwo;
    }

    public void setEvidenceThree(String evidenceThree) {
        this.evidenceThree = evidenceThree;
    }

    public String getEvidenceThree() {
        return evidenceThree;
    }
    
    public void setApplicationDate(String applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getApplicationDate() {
        return applicationDate;
    }
}