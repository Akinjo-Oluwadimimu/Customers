package GU.data;

import GU.business.Student;
import GU.business.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentIO {
    public static Student getStudentDB(String studentID)
     {
        Student student = new Student();
        try{
            
            String query="select * FROM student s, department d where  d.dept_name=d.major "
                    + "and s.major=d.major and s.ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            String newGender = "";
            String cnGender = "";
            while(prots.next())
            {
                String gender = (prots.getString("gender"));
                if(gender.equals("M")){
                    newGender = "Male";
                    cnGender = "男";
                } else{
                    newGender = "Female";
                    cnGender = "女";
                }
                student.setEngName(prots.getString("eng_name"));
                student.setClassid(prots.getString("class_id"));
                student.setCnName(prots.getString("cn_name"));
                student.setDob(prots.getString("DOB"));
                student.setId(prots.getString("ID"));
                student.setMajor(prots.getString("major"));
                student.setCnmajor(prots.getString("cn_major"));
                student.setNationality(prots.getString("nationality"));
                student.setGender(newGender);
                student.setCngender(cnGender);
                student.setDegree(prots.getString("degree"));
                student.setCndegree(prots.getString("cn_degree"));
                student.setEmail(prots.getString("email"));
                student.setPhone(prots.getString("phone"));
                student.setPassportNo(prots.getString("passport_no"));
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }
        return student;
     }
    public static ArrayList<Student> getStudentListDB()
     {
        ArrayList<Student> student = new ArrayList<>();
        try{
            
            String query="select * FROM student s, department d where  d.dept_name=d.major "
                    + "and s.major=d.major";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            String newGender = "";
            String cnGender = "";
            int sn=1;
            while(prots.next())
            {
                Student s = new Student();
                String gender = (prots.getString("gender"));
                if(gender.equals("M")){
                    newGender = "Male";
                    cnGender = "男";
                } else{
                    newGender = "Female";
                    cnGender = "女";
                }
                s.setSn(sn);
                s.setEngName(prots.getString("eng_name"));
                s.setClassid(prots.getString("class_id"));
                s.setCnName(prots.getString("cn_name"));
                s.setDob(prots.getString("DOB"));
                s.setId(prots.getString("ID"));
                s.setMajor(prots.getString("major"));
                s.setCnmajor(prots.getString("cn_major"));
                s.setNationality(prots.getString("nationality"));
                s.setGender(newGender);
                s.setCngender(cnGender);
                s.setDegree(prots.getString("degree"));
                s.setCndegree(prots.getString("cn_degree"));
                s.setEmail(prots.getString("email"));
                s.setPhone(prots.getString("phone"));
                s.setPassportNo(prots.getString("passport_no"));
                sn++;
                student.add(s);
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }
        return student;
     }
    
    public static void setStudentDB(Student student)
     {
       String query="insert into student values ('"+ student.getId() + "', '" +
                 student.getEngName() + "', '" +student.getCnName() + "', '" +
                 student.getClassid() + "', '" + student.getGender() + "', '" +
                 student.getDob() + "', '" + student.getNationality() + "', '" +
                 student.getPassportNo() + "', '" + student.getMajor() +
                 "', null, '" + student.getEmail() + "', '" + student.getPhone() +
                 "', 0"+ ")";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("successful");
        }
        else System.out.println("unsucessful");
     }
    
    public static void setUserDB(User user)
     {
       String query="insert into user values ('"+ user.getUsername() + "', '" +
                 user.getPassword() + "', '" + user.getUsertype() + "', " +
                 user.getChangepassword() + ")";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("successful");
        }
        else System.out.println("unsucessful");
     }
    
    public static boolean ValidateEmailDB(String studentID, String email)
     {
        boolean status = false;
        try{
            
            String query="select * FROM student where ID='"+studentID+"' and email='"+email+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            if(prots.next())
            {
                status=true;
            } else{
                status=false;
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
        }
        return status;
     }
    
    public static void updateStudentDB(Student student, String studentID){
        String query="update student set eng_name = '" + student.getEngName() + "', " + "gender ='" + student.getGender()
                + "', " + "email ='" +student.getEmail() +"', " + "phone ='" +student.getPhone() +"', " + "dob ='" + 
                student.getDob() + "', " + "nationality ='" + student.getNationality() + "', " + "passport_no ='" + student.getPassportNo() + 
                "' where ID = '" + studentID + "'";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated!=0){
            System.out.println("update sucessful");
        }
        else System.out.println("update unsucessful");
    }
}
