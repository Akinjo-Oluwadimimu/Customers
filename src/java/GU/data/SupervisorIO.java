package GU.data;

import GU.business.Supervisor;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SupervisorIO {
    public static ArrayList<Supervisor> getSupervisorDB()
     {
        ArrayList<Supervisor> supervisor = new ArrayList<Supervisor>();
        try{
            
            String query="select * FROM instructor";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            int sn=1;
            while(prots.next())
            {
                Supervisor s = new Supervisor();
                s.setSn(sn);
                s.setId(prots.getString("id"));
                s.setName(prots.getString("name"));
                s.setDepartment(prots.getString("dept_name"));
                supervisor.add(s);
                sn++;
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }
        return supervisor;
     }
    
    public static void setSupervisorDB(Supervisor supervisor)
     {
            String query="insert into instructor values ('"+supervisor.getId()+"', '"+supervisor.getName()+"', '"
                    +supervisor.getDepartment()+"')";
            
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("successful");
        }
        else System.out.println("unsucessful");
     }
}
