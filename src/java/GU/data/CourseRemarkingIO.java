/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.data;

import GU.business.CourseRemarking;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class CourseRemarkingIO {
    public static void setCourseRemarkingDB(CourseRemarking courseremarking)
     {
         String query="insert into course_rechecking values ('"+ courseremarking.getName() + "', '" +
                 courseremarking.getClassid() + "', '" +courseremarking.getId() + "', '" +
                 courseremarking.getPhone() + "', '" + courseremarking.getCourseId() + "', '" +
                 courseremarking.getCourseTitle() + "', '" + courseremarking.getLecturer() + "', '" +
                 courseremarking.getCurrentResult() + "', '" + courseremarking.getExpectedResult() +
                 "', '" + courseremarking.getSupportingEvidence() + "', '" + courseremarking.getApplicationReason() +
                 "', '" + courseremarking.getEvidenceOne() + "', '" + courseremarking.getEvidenceTwo() + "', '" + courseremarking.getEvidenceThree() +
                 "', '" + courseremarking.getApplicationDate() + "')";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("successful");
        }
        else System.out.println("unsucessful");
     }
    
    public static void updateCourseRemarkingDB(CourseRemarking courseremarking)
     {
         String query="update course_rechecking set evidence_1='"+courseremarking.getEvidenceOne()+ "', "+ 
                 "evidence_2='"+courseremarking.getEvidenceTwo()+"', evidence_3='"+courseremarking.getEvidenceThree()+
                 "' where name='"+ courseremarking.getName() + "' and class='" + courseremarking.getClassid() + 
                 "' and id='" +courseremarking.getId() + "' and phone='" + courseremarking.getPhone() + "' and course_id='" + 
                 courseremarking.getCourseId() + "' and course_name='" + courseremarking.getCourseTitle() + "' and lecturer='" 
                 + courseremarking.getLecturer() + "' and current_result='" + courseremarking.getCurrentResult() + 
                 "' and expected_result='" + courseremarking.getExpectedResult() + "' and supporting_evidence='" + 
                 courseremarking.getSupportingEvidence() + "' and application_reason='" + courseremarking.getApplicationReason()+"' and"
                 + " application_date='"+ courseremarking.getApplicationDate()+"'";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated!=0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    
    public static ArrayList<CourseRemarking> getRemarkingApplicationListDB()
     {
        ArrayList<CourseRemarking> courseRemarking = new ArrayList<CourseRemarking>();
        try{
            String query="select * from course_rechecking";
                    
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                CourseRemarking c=new CourseRemarking();
                c.setName(prots.getString("name"));
                c.setClassid(prots.getString("class"));
                c.setId(prots.getString("id"));
                c.setPhone(prots.getString("phone"));
                c.setCourseId(prots.getString("course_id"));
                c.setCourseTitle(prots.getString("course_name"));
                c.setLecturer(prots.getString("lecturer"));
                c.setCurrentResult(prots.getString("current_result"));
                c.setExpectedResult(prots.getString("expected_result"));
                c.setApplicationReason(prots.getString("application_reason"));
                c.setSupportingEvidence(prots.getString("supporting_evidence"));
                c.setEvidenceOne(prots.getString("evidence_1"));
                c.setEvidenceTwo(prots.getString("evidence_2"));
                c.setEvidenceThree(prots.getString("evidence_3"));
                c.setApplicationDate(prots.getString("application_date"));
               
                courseRemarking.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return courseRemarking;
     }
    
}
