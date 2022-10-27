package GU.data;

import GU.business.Transcript;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TranscriptIO {
    static boolean isInt(String s){
        try{ 
            int i = Integer.parseInt(s); 
            return true; 
        }catch(NumberFormatException er){ 
            return false; 
        }
    }
    
   public static double gpCalc(String grade) {
        double gp=0;
        if(isInt(grade)==true){
           int x = Integer.parseInt(grade);
            if (x<60){
                gp = 0.0;
            } else{
                gp = (double) (2 + ((x-60)*0.2));}
            }else if (grade.equals("A")){
                gp=9.0;
            } else if (grade.equals("B")){
                gp=7.0;
            } else if (grade.equals("C")){
                gp=5.0;
            } else if (grade.equals("D")){
                gp=3.0;
            } else {
                gp=0.0;
            }
       return gp;
   }
   
   public static double gpWSCalc(String grade) {
        double gp=0;
        if(isInt(grade)==true){
           int x = Integer.parseInt(grade);
            if (x<60){
                gp = 0.0;
            } else if (59<x && x<70){
                gp = 1.0;
              } else if (69<x && x<80){
                  gp = 2.0;
              } else if (79<x && x<90){
                  gp = 3.0;
              } else {
                  gp = 4.0;
              }
            }else if (grade.equals("A")){
                gp = 4.0;
            } else if (grade.equals("B")){
                gp = 3.0;
            } else if (grade.equals("C")){
                gp = 2.0;
            } else if (grade.equals("D")){
                gp = 1.0;
            } else {
                gp = 0.0;
            }
       return gp;
   }
   
   public static String UsGrade(String grade) {
        String usgrade = "";
        if(isInt(grade)==true){
           int x = Integer.parseInt(grade);
            if (x<60){
                usgrade = "F";
            } else if (59<x && x<70){
                usgrade = "D";
              } else if (69<x && x<80){
                  usgrade = "C";
              } else if (79<x && x<90){
                  usgrade = "B";
              } else {
                  usgrade = "A";
              }
            }else if (grade.equals("A")){
                usgrade = "A";
            } else if (grade.equals("B")){
                usgrade = "B";
            } else if (grade.equals("C")){
                usgrade = "C";
            } else if (grade.equals("D")){
                usgrade = "D";
            } else {
                usgrade = "F";
            }
       return usgrade;
   }
   
    public static double round (double value, int precision) {
    int scale = (int) Math.pow(10, precision);
    return (double) Math.round(value * scale) / scale;
    }
    
    public static ArrayList<Transcript> getTranscriptDB(String studentID, String Semester, int ordering)
     {
        ArrayList<Transcript> transcript = new ArrayList<Transcript>();
        try{
            String query="select * from class c, student s, takes t, course e, section b where s.id=c.student_id and s.id=t.ID "
                    + "and b.class_id=c.class_id and e.course_id=t.course_id and b.session=c.session and b.semester=c.semester "
                    + "and b.year=c.year and  b.course_id=e.course_id and b.session='"+Semester+"' and ordering="+ordering+" and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double sum=0;
            while(prots.next())
            {
                double Gp= round(gpCalc(prots.getString("grade")),1);
                sum+=Gp;
                Transcript t=new Transcript();
                t.setCourseCode(prots.getString("course_id"));
                t.setCourseTitle(prots.getString("course_name"));
                t.setGrade(prots.getString("grade"));
                t.setGp(Gp);
                t.setTotal(sum);
                t.setUnit(prots.getDouble("unit"));
                transcript.add(t);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return transcript;
     }
    
    public static ArrayList<Transcript> getCnTranscriptDB(String studentID, String Semester, int ordering)
     {
        ArrayList<Transcript> transcript = new ArrayList<Transcript>();
        try{
            String query="select * from class c, student s, takes t, course e, section b where s.id=c.student_id and s.id=t.ID "
                    + "and b.class_id=c.class_id and e.course_id=t.course_id and b.session=c.session and b.semester=c.semester "
                    + "and b.year=c.year and  b.course_id=e.course_id and b.session='"+Semester+"' and ordering="+ordering+" and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double sum=0;
            while(prots.next())
            {
                double Gp= round(gpCalc(prots.getString("grade")),1);
                sum+=Gp;
                Transcript t=new Transcript();
                t.setCourseCode(prots.getString("course_id"));
                t.setCourseTitle(prots.getString("cn_title"));
                t.setGrade(prots.getString("grade"));
                t.setGp(Gp);
                t.setTotal(sum);
                t.setUnit(prots.getDouble("unit"));
                transcript.add(t);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return transcript;
     }
    
    public static Transcript getTranscriptSummary(String studentID, String Semester, int ordering){
        Transcript transcript = new Transcript();
        try{
            String query="select * from class c, student s, takes t, course e, section b where s.id=c.student_id and s.id=t.ID "
                    + "and b.class_id=c.class_id and e.course_id=t.course_id and b.session=c.session and b.semester=c.semester "
                    + "and b.year=c.year and  b.course_id=e.course_id and b.session='"+Semester+"' and ordering="+ordering+" and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double sum=0;
            double step=0;
            double gpa=0;
            while(prots.next()) {
                double Gp= round(gpCalc(prots.getString("grade")),1);
                double unit = prots.getDouble("unit");
                sum+=unit;
                step=Gp*unit;
                gpa+=step;
            }
            gpa=round((gpa/sum),3);
            transcript.setTotal(sum);
            transcript.setGpa(gpa);
            db.Close();
        }
        catch(SQLException ex)   {
            System.err.println(ex);
            return null;
        }return transcript;
     }
    
    public static ArrayList<Transcript> getWesternStyleTranscript(String studentID, String Semester, int ordering){
        ArrayList<Transcript> transcript = new ArrayList<Transcript>();
        try{
            String query="select * from class c, student s, takes t, course e, section b where s.id=c.student_id and s.id=t.ID "
                    + "and b.class_id=c.class_id and e.course_id=t.course_id and b.session=c.session and b.semester=c.semester "
                    + "and b.year=c.year and  b.course_id=e.course_id and b.session='"+Semester+"' and ordering="+ordering+" and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double sum=0;
            while(prots.next())
            {
                double Gp= round(gpWSCalc(prots.getString("grade")),1);
                sum+=Gp;
                Transcript t=new Transcript();
                t.setCourseCode(prots.getString("course_id"));
                t.setCourseTitle(prots.getString("course_name"));
                t.setGrade(prots.getString("grade"));
                t.setGp(Gp);
                t.setTotal(sum);
                t.setUnit(prots.getDouble("unit"));
                transcript.add(t);
            }
            db.Close();
        }
        catch(SQLException ex)   {
            System.err.println(ex);
            return null;
        }return transcript;
     }
    
    public static Transcript getWSTranscriptSummary(String studentID, String Semester, int ordering){
        Transcript transcript = new Transcript();
        try{
            String query="select * from class c, student s, takes t, course e, section b where s.id=c.student_id and s.id=t.ID "
                    + "and b.class_id=c.class_id and e.course_id=t.course_id and b.session=c.session and b.semester=c.semester "
                    + "and b.year=c.year and  b.course_id=e.course_id and b.session='"+Semester+"' and ordering="+ordering+" and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            double sum=0;
            double step=0;
            double gpa=0;
            while(prots.next()) {
                double Gp= round(gpWSCalc(prots.getString("grade")),1);
                double unit = prots.getDouble("unit");
                sum+=unit;
                step=Gp*unit;
                gpa+=step;
            }
            gpa=round((gpa/sum),3);
            transcript.setTotal(sum);
            transcript.setGpa(gpa);
            db.Close();
        }
        catch(SQLException ex)   {
            System.err.println(ex);
            return null;
        }return transcript;
     }
    public static ArrayList<Transcript> getResultDB(String studentID)
     {
        ArrayList<Transcript> transcript = new ArrayList<Transcript>();
        try{
            String query="select * from student s, course c, section d, takes t where s.id = t.id and c.course_id=t.course_id "
                    + "and d.class_id=t.class_id and d.course_id=t.course_id and d.session=t.session and d.semester=t.semester and d.year=t.year and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                double Gp= round(gpCalc(prots.getString("grade")),1);
                Transcript t=new Transcript();
                t.setCourseCode(prots.getString("course_id"));
                t.setCourseTitle(prots.getString("course_name"));
                t.setGrade(prots.getString("grade"));
                t.setSession(prots.getString("session"));
                t.setGp(Gp);
                t.setUnit(prots.getDouble("unit"));
                transcript.add(t);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return transcript;
     }
}

