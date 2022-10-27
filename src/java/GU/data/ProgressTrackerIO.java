package GU.data;

import GU.business.ProgressTracker;
import GU.business.ProjectSurvey;
import GU.business.ThesisTraining;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class ProgressTrackerIO {
    public static ArrayList<ProgressTracker> getProgressListDB(String studentID)
     {
        ArrayList<ProgressTracker> tracker = new ArrayList<ProgressTracker>();
        try{
            String query="SELECT * FROM progress_tracker s, student_progress d where s.id=d.task_id and d.student_id='"+studentID+"' and d.student_id='" + studentID +"'";
                    
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                ProgressTracker c=new ProgressTracker();
                c.setTaskId(prots.getInt("task_id"));
                c.setCategory(prots.getString("category"));
                c.setSubject(prots.getString("subject"));
                c.setStudentId(prots.getString("student_id"));
                c.setStatus(prots.getBoolean("status"));
                c.setPosition(prots.getInt("position"));
                Date start=prots.getDate("start");
                SimpleDateFormat ft = new SimpleDateFormat ("dd-MMM");
                String startDate = ft.format(start);
                c.setStart(startDate);
                Date due=prots.getDate("due");
                String dueDate = ft.format(due);
                c.setDue(dueDate);
                tracker.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return tracker;
     }
    public static void updateTaskDB(String studentID, int taskid, boolean status)
     {
            String query="update student_progress set status="+status+" where student_id='"+studentID+"' and task_id='" + taskid +"'";
            DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    public static void updateProgressDB(String studentID, int progress)
     {
            String query="update student set progress="+progress+" where id='"+studentID+"'";
            DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    public static void setRegistration(String studentID, String decision, String date)
     {
            String query="insert into registration values ('"+studentID+ "', '"+decision+ "', '"+date+ "')"; 
            DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    public static int getProgressDB(String studentID)
     {
        int progress = 0;
        try{
            String query="SELECT * FROM student where id='"+studentID+"'";
                    
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                progress=prots.getInt("progress");
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
        }return progress;
     }
    public static void setProjectSurvey(ProjectSurvey projectSurvey)
     {
            String query="insert into project_survey values ('"+projectSurvey.getStudentId()+ "', "+projectSurvey.getStartStatus()+ ", "+projectSurvey.getSupervisorContact()+ ", '"+projectSurvey.getComment()+"')"; 
            DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
    public static void setThesisTraining(ThesisTraining thesisTraining)
     {
            String query="insert into thesis_training values ('"+thesisTraining.getStudentId()+ "', '"+thesisTraining.getThesis()+ "', "+thesisTraining.getBatch()+ ", '"+thesisTraining.getSubmissionDate()+"')"; 
            DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
}
