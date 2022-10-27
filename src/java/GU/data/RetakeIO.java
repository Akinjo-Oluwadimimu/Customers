package GU.data;

import GU.business.Course;
import GU.business.RetakeApplication;
import GU.business.RetakeInformation;
import GU.business.RetakeReceiptInformation;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class RetakeIO {
    
    public static ArrayList<Course> getFailedcourses(String studentID)
     {
        ArrayList<Course> failedcourses = new ArrayList<Course>();
        try{
            String query="select * from student s, takes t, course c, section b where b.class_id=t.class_id and "
                    + "b.course_id=c.course_id and s.id=t.ID and c.course_id=t.course_id  and grade<60 and grade !='A'"
                    + " and grade != 'B' and grade != 'C' and grade != 'D' and s.id='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double unit;
            int amount;
            int sn=0;
            while(prots.next())
            {
                sn++;
                unit = prots.getDouble("unit");
                amount = (int) Math.round((unit) * 200);
                Course c=new Course();
                c.setCourseId(prots.getString("course_id"));
                c.setCourseTitle(prots.getString("course_name"));
                c.setGrade(prots.getString("grade"));
                c.setAmount(amount);
                c.setUnit(unit);
                c.setSn(sn);
                failedcourses.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return failedcourses;
     }
    
    public static ArrayList<Course> retakeInvoice(ArrayList<Course> course, String[] selected)
     {
         ArrayList<Course> retake = new ArrayList<Course>();
         int k=0;
         int total=0;
         for(int i=0;i<course.size();i++){
             for(int j=0; j<selected.length; j++){
                 if (course.get(i).getSn() == Integer.parseInt(selected[j])){
                     Course c = new Course();
                     k++;
                     c.setSn(k);
                     c.setCourseTitle(course.get(i).getCourseTitle());
                     c.setUnit(course.get(i).getUnit());
                     c.setAmount(course.get(i).getAmount());
                     retake.add(c);
                 }
             }
         } return retake;
     }
    
    public static int getTotal(ArrayList<Course> failedCoursesList, ArrayList<RetakeApplication> applications)
     {
         int total=0;
         for(int i=0;i<failedCoursesList.size();i++){
             for(int j=0;j<applications.size();j++){
                 if(failedCoursesList.get(i).getCourseId().equals(applications.get(j).getCourseId())){
                     total = total+=failedCoursesList.get(i).getAmount();
                 }
             }
         }
        return total;
     }
    
    public static ArrayList<RetakeInformation> getRetakeInformationListDB()
     {
        ArrayList<RetakeInformation> retakeInfo = new ArrayList<RetakeInformation>();
        try{
            String query="SELECT * FROM retake_info"; 
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            int sn=0;
            while(prots.next())
            {
                sn++;
                RetakeInformation c=new RetakeInformation();
                c.setClassid(prots.getString("class"));
                c.setCourseTitle(prots.getString("course_name"));
                c.setAmount(prots.getString("amount"));
                c.setTotal(prots.getString("total"));
                c.setUnit(prots.getString("course_unit"));
                c.setSn(sn);
                c.setCnname(prots.getString("cn_name"));
                c.setEngname(prots.getString("eng_name"));
                c.setId(prots.getString("id"));
                c.setCourseId(prots.getString("course_id"));
                c.setMajor(prots.getString("major"));
                c.setStudentcategory(prots.getString("student_category"));
                c.setPaymentstatus(prots.getString("payment_status"));
                c.setComment(prots.getString("comment"));
                retakeInfo.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return retakeInfo;
     }

    public static void setRetakeReceiptInformationDB(RetakeReceiptInformation retakeReceiptInformation)
     {
         String query="insert into retake_receipt values ('"+ retakeReceiptInformation.getId() + "', '" +
                 retakeReceiptInformation.getEngname() + "', '" +retakeReceiptInformation.getCnname() + "', '" +
                 retakeReceiptInformation.getClassid() + "', '" + retakeReceiptInformation.getReceipt() + "', '" + 
                 retakeReceiptInformation.getSubmissionDate() + "', " + retakeReceiptInformation.getApproved() + ")";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    
    public static ArrayList<RetakeReceiptInformation> getRetakeReceiptInformationListDB()
     {
        ArrayList<RetakeReceiptInformation> retakeReceiptInfo = new ArrayList<RetakeReceiptInformation>();
        try{
            String query="SELECT * FROM retake_receipt"; 
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            int sn=0;
            while(prots.next())
            {
                sn++;
                RetakeReceiptInformation c=new RetakeReceiptInformation();
                c.setClassid(prots.getString("class_id"));
                c.setSn(sn);
                c.setCnname(prots.getString("cn_name"));
                c.setEngname(prots.getString("eng_name"));
                c.setId(prots.getString("id"));
                Timestamp submissionDate=prots.getTimestamp("receipt_submission_date");
                SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
                String dateTime = ft.format(submissionDate);
                c.setSubmissionDate(dateTime);
                c.setApproved(prots.getBoolean("approved"));
                c.setReceipt(prots.getString("receipt"));
                retakeReceiptInfo.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return retakeReceiptInfo;
     }
    public static void setRetakeApplicationDB(ArrayList<Course> course, String[] selected, String studentId)
     {
         int k=0;
         int total=0;
         for(int i=0;i<course.size();i++){
             for(int j=0; j<selected.length; j++){
                 if (course.get(i).getSn() == Integer.parseInt(selected[j])){
         String query="insert into retake_application values ('"+ studentId + "', '" +
                 course.get(i).getCourseId() + "')";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
            }
         }
    }
}
    public static ArrayList<RetakeApplication> getRetakeApplicationDB(String studentId)
     {
        ArrayList<RetakeApplication> retakeApplication = new ArrayList<RetakeApplication>();
        try{
            String query="SELECT * FROM retake_application where student_id='"+studentId+"'"; 
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            int sn=0;
            while(prots.next())
            {
                sn++;
                RetakeApplication c=new RetakeApplication();
                c.setSn(sn);
                c.setStudentId(studentId);
                c.setCourseId(prots.getString("course_id"));
                retakeApplication.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return retakeApplication;
     }
    public static int retakeApplicationCount(String studentId){
        int sn=0;
        try{
            String query="SELECT * FROM retake_application where student_id='"+studentId+"'"; 
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                sn++;
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
        }return sn;
    }
    public static boolean retakeReceiptStatus(String studentId){
        boolean status=false;
        try{
            String query="SELECT * FROM retake_receipt where id='"+studentId+"'"; 
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            if(prots.next())
            {
                status = true;
            } else{
                status = false;
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
        }
        return status;
    }
}

