package GU.data;

import GU.business.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class CourseIO {
    public static ArrayList<Course> getCourseListDB(String studentID)
     {
        ArrayList<Course> course = new ArrayList<Course>();
        try{
            String query="SELECT c.course_id, c.course_name, grade, t.class_id, name FROM student s, department d, course c, takes t, instructor i,"
                    + " teaches b where s.major=d.major and d.dept_name=c.dept_name and t.course_id=c.course_id and t.id=s.id and i.id=b.id"
                    + " and t.class_id=b.class_id and t.semester=b.semester and t.session=b.session and t.year=b.year and "
                    + "t.course_id=b.course_id and i.dept_name=c.dept_name and s.id='" + studentID +"'";
                    
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                Course c=new Course();
                c.setCourseTitle(prots.getString("course_name"));
                c.setCourseId(prots.getString("course_id"));
                c.setGrade(prots.getString("grade"));
                c.setClassid(prots.getString("class_id"));
                c.setLecturer(prots.getString("name"));
                course.add(c);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }return course;
     }
    
}
