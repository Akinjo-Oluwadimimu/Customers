package GU.data;

import GU.business.GraduationProject;

public class GraduationProjectIO {
    public static void setGraduationProjectDB(GraduationProject graduationProject)
     {
        String query="insert into graduation_project values ('"+ graduationProject.getStudentId()+"', '"+graduationProject.getSupervisor()+
                    "', '"+graduationProject.getProjectTitle()+"', '"+graduationProject.getSubmissionDate()+"')";
            
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
        }
        else System.out.println("unsucessful");
     }
}
